<?php

namespace app\main\controller;

use library\Controller;
use library\tools\Data;
use think\Db;

/**
 * 人物信息管理
 * Class Goods
 * @package app\store\controller
 */
class Figures extends Controller
{
    /**
     * 指定数据表
     * @var string
     */
    protected $table = 'his_figures';

    /**
     * 人物信息管理
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
        $this->title = '人物管理';
        $query = $this->_query($this->table)->equal('status');
        $query->order('sort desc,id desc')->page();
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
     * 添加人物信息
     * @auth true
     * @throws \think\Exception
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     * @throws \think\exception\PDOException
     */
    public function add()
    {
        $this->title = '添加事件';
        $this->isAddMode = '1';
        $this->_form($this->table, 'form');

    }

    /**
     * 编辑人物信息
     * @auth true
     * @throws \think\Exception
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     * @throws \think\exception\PDOException
     */
    public function edit()
    {
        $this->title = '编辑人物信息';
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
        $gender = [1=>'男',2=>'女',3=>'男变女',4=>'女变男'];
        $this->gender = $gender;
        if ($this->request->isGet()) {
            //$this->cates = Db::name('his_theme')->where(['status' => '1'])->order('id asc,sort desc')->select();
        } elseif ($this->request->isPost()) {
            $data['name'] = $data['surname'].$data['given_name'];
            //if (empty($data['pic'])) $this->error('人物图片不能为空，请上传图片');
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
     * 禁用人物信息
     * @auth true
     * @throws \think\Exception
     * @throws \think\exception\PDOException
     */
    public function forbid()
    {
        $this->_save($this->table, ['status' => '0']);
    }

    /**
     * 启用人物信息
     * @auth true
     * @throws \think\Exception
     * @throws \think\exception\PDOException
     */
    public function resume()
    {
        $this->_save($this->table, ['status' => '1']);
    }

    /**
     * 删除人物信息
     * @auth true
     * @throws \think\Exception
     * @throws \think\exception\PDOException
     */
    public function remove()
    {
        $this->_delete($this->table);
    }

}
