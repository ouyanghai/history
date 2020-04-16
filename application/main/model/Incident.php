<?php
namespace app\main\model;

use think\Model;

class Incident extends Model{
    protected $table = 'his_incident';
    private $db;
    public function __construct(){
        parent::__construct();
        $this->db = $this->db(false);
    }

    public function updateIncident($data){
        $labels = empty($data['label']) ? $data['title'] : $data['label'];
        $labels = str_replace(["\n","\r\n","\r","，",";","；"],[',',',',',',',',',',','],$labels);
        $labels = explode(',',$labels);

        $id = $data['id'];

        unset($data['label']);
        unset($data['id']);

        try {
            $this->db->startTrans();
            $this->db->table($this->table)->where(['id'=>$id])->update($data);

            $this->db->commit();
        }catch ( \Exception $e ){

        }
    }

}