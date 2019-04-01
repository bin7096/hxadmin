<?php

namespace app\admin\controller;

use think\Controller;
use think\Request;

class Common extends Controller
{
    public function uploadGoodsPic(){
        // 获取表单上传文件 例如上传了001.jpg
        $file = request()->file('image');

        // 移动到框架应用根目录/public/uploads/ 目录下
        if($file){
            $info = $file->move(ROOT_PATH . 'public' . DS . 'uploads/goodsPic');
            if($info){
                return ajax_return(['src' =>'/uploads/goodsPic/' . str_replace('\\','/',$info->getSaveName())],'上传成功');
            }else{
                return ajax_return_error('上传失败');
            }
        }else{
            return ajax_return_error('上传失败');
        }
    }
}
