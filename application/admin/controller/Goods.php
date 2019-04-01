<?php

namespace app\admin\controller;

\think\Loader::import('controller/Controller', \think\Config::get('traits_path') , EXT);
use think\Controller;
use think\Request;
use think\Db;

class Goods extends Controller
{
    use \app\admin\traits\controller\Controller;
    /**
     * 显示资源列表
     *
     * @return \think\Response
     */
    public function index()
    {
        $where = [];
        if ($this -> request -> isPost()){
            $data = $this -> request -> post();
            if (!empty($data['title'])){
                $where['title'] = $data['title'];
            }
        }
        $where['isdelete'] = '0';
        $list = Db::name('goods') -> where($where) -> order('id desc') -> paginate(10);
        $page = $list -> render();
        $list = $list -> toArray()['data'];
        $count = Db::name('goods') -> where($where) -> count();

        return view('goods/index',['list' => $list, 'page' => $page, 'count' => $count]);
    }

    public function add(){
        if ($this -> request -> isPost()){
            $data = $this -> request -> post();
            $pic = explode(',', $data['imgs']);
            $data['detail'] = $data['editorValue'];
            unset($data['imgs']);
            unset($data['editorValue']);
            $time = time();
            $data['create_time'] = $data['update_time'] = $time;
            Db::startTrans();
            try{
                $id = Db::name('goods') -> insertGetId($data);
                $pics = [];
                foreach ($pic as $k => $v){
                    $pics[] = [
                        'gid' => $id,
                        'src' => $v,
                        'create_time' => $time,
                        'update_time' => $time
                    ];
                }
                Db::name('goods_pic') -> insertAll($pics);
                unset($data);
                unset($pic);
                unset($pics);
                Db::commit();
                return ajax_return([], "添加成功");
            }catch (\Exception $e){
                Db::rollback();
                return ajax_return_error("添加失败");
            }

        }
        return view('goods/edit');
    }

    public function edit(){
        if ($this -> request -> isPost()){
            $data = $this -> request -> post();
            echo '<pre/>';
            var_dump($data);exit;
        }
        return view('goods/edit');
    }
}
