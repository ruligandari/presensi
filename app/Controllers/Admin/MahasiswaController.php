<?php

namespace App\Controllers\Admin;

use App\Controllers\BaseController;
use App\Models\KelasModel;
use App\Models\MahasiswaModel;

class MahasiswaController extends BaseController
{
    public function index()
    {
        $mahasiswaModel = new MahasiswaModel();
        $data = [
            'title' => 'Data Mahasiswa',
            'mahasiswa' => $mahasiswaModel->innerTable()
        ];

        return view('Admin/mahasiswa/index', $data);
    }
    public function create(){
        $kelasModel = new KelasModel();
        $kelas = $kelasModel->findAll();
        $data = [
            'title' => 'create',
            'kelas' => $kelas,
        ];
        return view('Admin/mahasiswa/create',$data);
    }
    public function save(){

        $mahasiswaModel = new MahasiswaModel();

        $nim = $this->request->getPost('nim');
        $nama = $this->request->getPost('nama');
        $id_kelas = $this->request->getPost('id_kelas');
        $jurusan = $this->request->getVar('jurusan');
        $jenis_kelamin = $this->request->getPost('jenis_kelamin');
        $ttl = $this->request->getPost('ttl');
        $agama = $this->request->getPost('agama');
        $alamat = $this->request->getPost('alamat');

        $data = [
            'nim' => $nim,
            'nama' => $nama,
            'id_kelas' => $id_kelas,
            'jurusan' => $jurusan,
            'jenis_kelamin' => $jenis_kelamin,
            'ttl' => $ttl,
            'agama' => $agama,
            'alamat' => $alamat
        ];

        $mahasiswaModel->insert($data);
        session()->setFlashdata('success', 'Data berhasil ditambahkan');
        return redirect()->to(base_url('admin/data-mahasiswa'));
    }
}
;