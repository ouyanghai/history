<?php

namespace app\main\controller;

use library\Controller;
use library\tools\Data;
use think\Db;

/**
 * 职业信息管理
 * Class Goods
 * @package app\store\controller
 */
class Profession extends Controller
{
    /**
     * 指定数据表
     * @var string
     */
    protected $table = 'his_profession';

    /**
     * 职业信息管理
     * @auth true
     * @menu true
     * @throws \think\Exception
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     * @throws \think\exception\PDOException
     */
    public function index()
    {
        $this->title = '职业管理';
        $query = $this->_query($this->table)->equal('status')->like('title');
        $query->order('id desc')->page();
    }

    /**
     * 数据列表处理
     * @param array $data
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    protected function _index_page_filter(&$data)
    {
        $this->list = $data;
        /*
        $this->clist = Db::name('his_theme')->where(['is_deleted' => '0', 'status' => '1'])->select();
        foreach ($data as &$vo) {
            list( $vo['cate']) = [[]];
            foreach ($this->clist as $cate) if ($cate['id'] === $vo['cate_id']) $vo['cate'] = $cate;
        }
        */
    }

    /**
     * 添加职业信息
     * @auth true
     * @throws \think\Exception
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     * @throws \think\exception\PDOException
     */
    public function add()
    {
        $this->title = '添加职业';
        $this->isAddMode = '1';
        $this->_form($this->table, 'form');

    }

    /**
     * 编辑职业信息
     * @auth true
     * @throws \think\Exception
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     * @throws \think\exception\PDOException
     */
    public function edit()
    {
        $this->title = '编辑职业信息';
        $this->isAddMode = '0';
        $this->_form($this->table, 'form');
    }

    /**
     * 表单数据处理
     * @param array $data
     * @throws \think\Exception
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     * @throws \think\exception\PDOException
     */
    protected function _form_filter(&$data)
    {
        if ($this->request->isGet()) {
            $res = $this->cates = Db::name($this->table)->where(['status' => '1','pid'=>0])->order('id asc,sort desc')->select();
            $cates = [];
            if( !empty($res) ){
                foreach ($res as $cat){
                    if( empty($cat['pid']) ){
                        $cates[]=$cat;
                    }
                }
            }
            $this->cates = $cates;

        } elseif ($this->request->isPost()) {
            //if (empty($data['logo'])) $this->error('职业LOGO不能为空，请上传图片');
        }
    }

    /**
     * 表单结果处理
     * @param boolean $result
     */
    protected function _form_result($result)
    {
        if ($result && $this->request->isPost()) {
            $this->success('编辑成功！', 'javascript:history.back()');
        }
    }

    /**
     * 禁用职业信息
     * @auth true
     * @throws \think\Exception
     * @throws \think\exception\PDOException
     */
    public function forbid()
    {
        $this->_save($this->table, ['status' => '0']);
    }

    /**
     * 启用职业信息
     * @auth true
     * @throws \think\Exception
     * @throws \think\exception\PDOException
     */
    public function resume()
    {
        $this->_save($this->table, ['status' => '1']);
    }

    /**
     * 删除职业信息
     * @auth true
     * @throws \think\Exception
     * @throws \think\exception\PDOException
     */
    public function remove()
    {
        $this->_delete($this->table);
    }

}
