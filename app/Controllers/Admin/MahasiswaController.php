<?php

namespace App\Controllers\Admin;

use App\Controllers\BaseController;

class MahasiswaController extends BaseController
{
    public function index()
    {
        $data = [
            'title' => 'Data Mahasiswa'
        ];

        return view('Admin/mahasiswa/index', $data);
    }
}
