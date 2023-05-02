<?php

namespace App\Controllers\Admin;

use App\Controllers\BaseController;

class PresensiController extends BaseController
{
    public function index()
    {
        $data = [
            'title' => 'Data Presensi'
        ];

        return view('Admin/presensi/index', $data);
    }
}
