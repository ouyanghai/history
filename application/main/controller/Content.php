<?php

namespace app\main\controller;

use library\Controller;
use library\tools\Data;
use think\Db;
use app\main\model\Incident;

/**
 * 事件管理
 * Class Goods
 * @package app\store\controller
 */
class Content extends Controller
{
    /**
     * 指定数据表
     * @var string
     */
    protected $table = 'his_incident';

    /**
     * 事件列表
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
        $this->title = '事件管理';
        $query = $this->_query($this->table)->equal('status')->like('title');
        $query->order('sort desc,id desc')->page();
    }

    /**
     * 事件列表处理
     * @param array $data
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    protected function _index_page_filter(&$data)
    {
        $this->list = $data;
    }

    /**
     * 添加事件信息
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
     * 编辑事件信息
     * @auth true
     * @throws \think\Exception
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     * @throws \think\exception\PDOException
     */
    public function edit()
    {
        $this->title = '编辑事件信息';
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
            //$this->cates = Db::name('his_theme')->where(['status' => '1'])->order('id asc,sort desc')->select();
        } elseif ($this->request->isPost()) {
            if (empty($data['title'])) $this->error('事件标题不能为空');
            if (empty($data['logo'])) $this->error('事件LOGO不能为空，请上传图片');
            if (empty($data['start_at'])) $this->error('发生时间不能为空');
            if (empty($data['content'])) $this->error('事件内容不能为空');

            $labels = empty($data['label']) ? $data['title'] : $data['label'];
            $data['label'] = str_replace(["\n","\r\n","\r","，",";","；"],[',',',',',',',',',',','],$labels);

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
     * 禁用事件信息
     * @auth true
     * @throws \think\Exception
     * @throws \think\exception\PDOException
     */
    public function forbid()
    {
        $this->_save($this->table, ['status' => '0']);
    }

    /**
     * 启用事件信息
     * @auth true
     * @throws \think\Exception
     * @throws \think\exception\PDOException
     */
    public function resume()
    {
        $this->_save($this->table, ['status' => '1']);
    }

    /**
     * 删除事件信息
     * @auth true
     * @throws \think\Exception
     * @throws \think\exception\PDOException
     */
    public function remove()
    {
        $this->_delete($this->table);
    }

}
