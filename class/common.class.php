<?php 
require_once $_SERVER['CONTEXT_DOCUMENT_ROOT'] . '/rbac/config.php';

class common {
    
    private $uid;
    private $rid;
    private $pid;
    private $permissionReuslts;
    
    public function __construct() {
        $this->permissionSave();
    }
    
    /**
     * 将登陆用户的所有权限保存到$_SESSION['permission']中
     */
    private function permissionSave () {
        if (!empty($_SESSION) && empty($_SESSION['permission'])){
            $this->uid = $_SESSION['uid'];
            $mysql = C('mysql');
            //获取当前user 所拥有的角色(id) 一个用户可以有多个角色 所以角色的id 是多个
            $rid_array = $mysql->fetchAll('rid', 'user_assignment', "uid={$this->uid}");
            //遍历角色数组，通过角色的id 获取权限
            // $rid_array[
            //         0=>["rid"=>1]
            //         1=>["rid"=2]
            // ]
            foreach ($rid_array as $value) {
                $this->rid = $value;
                foreach ($value as $val) {
                    //获取权限id，是个数组
                    $pid_array = $mysql->fetchAll('pid', 'permission_assignment', "rid={$val}");
                    //便利权限数组 将每个权限对应的选项放入reault
                    //权限id
                    //$pid_array=[
                    //      0=>[
                    //          "pid"=>1
                    //          "pid"=2
                    //      ]
                    //]
                    //result=[
                    //      0=>[
                    //          "id"=>"",
                    //          "pid"=>"",
                    //          "fname"=>""
                    //      ],
                    //      1=>[
                    //          "id"=>"",
                    //          "pid"=>"",
                    //          "fname"=>""
                    //      ]    
                    //]
                    foreach ($pid_array as $value) {
                        foreach ($value as $val) {
                            $result[] = $mysql->fetchAll('id,pid,name,fname', 'permission', "id={$val}");
                        }
                    }
                }
            }
            //遍历 result
            foreach ($result as $value){
                foreach ($value as $val) {
                    $permissionReuslts[] = $val;
                }
            }
            $_SESSION['permission'] = $permissionReuslts;
           
        }
    }
    
    /**
     * 验证用户是否有权限
     * @param string $name
     * @return string
     */
    public function check_permission ($name) {
        if (!empty($_SESSION)){
            foreach ($_SESSION['permission'] as $value) {
                $check_array[] = $value['fname'];
            }
            if (!in_array($name, $check_array)) {
                jump('您没有这样的操作权限', "pages/404.php",'',0);
                die;
            } else {
                return $name;
            }
        }
    }
    
    
    public function arrayUnqie($array){
        $result = $array;
        $max_offset = count($array);
        for ($offset = 0; $offset < $max_offset; $offset ++) {
            for ($offset_in = 1; $offset_in < $max_offset; $offset_in ++) {
                if (empty(array_diff($array[$offset], $array[$offset_in])) && $offset != $offset_in && $offset < $offset_in) {
                    unset($result[$offset_in]);
                }
            }
        }
        return $result;
    }
}
?>