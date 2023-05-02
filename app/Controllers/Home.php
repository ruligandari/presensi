<?php

namespace App\Controllers;

class Home extends BaseController
{
    public function index()
    {
        $data = [
            'title' => 'Presensi'
        ];
        return view('presensi', $data);
    }
}
