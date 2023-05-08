<?php

namespace App\Controllers\Admin;

use App\Controllers\BaseController;
use App\Models\MataKuliahModel;
use App\Models\DosenModel;

class MataKuliahController extends BaseController
{
    public function index()
    {
        $dosenModel = new DosenModel();
        $mkModel = new MataKuliahModel();
        $data = [
            'title' => 'Data Mata Kuliah',
            'mk' => $mkModel->innerTable()
        ];

        return view('Admin/matakuliah/index', $data);
    }
    public function create(){

        $dosenMK = new DosenModel();
        $dosen = $dosenMK->findAll();
        $data = [
            'title' => 'create',
            'dosen' => $dosen
        ];
        return view('Admin/matakuliah/create',$data);
    }
    public function save(){

        $mkModel = new MataKuliahModel();

        $id_mk = $this->request->getPost('id_mk');
        $nama_mk = $this->request->getPost('nama_mk');
        $id_dosen = $this->request->getPost('id_dosen');

        $data = [
            'id_mk' => $id_mk,
            'nama_mk' => $nama_mk,
            'id_dosen' => $id_dosen,
        ];

        $mkModel->insert($data);
        session()->setFlashdata('success', 'Data berhasil ditambahkan');
        return redirect()->to(base_url('admin/data-matakuliah'));
    }
}
