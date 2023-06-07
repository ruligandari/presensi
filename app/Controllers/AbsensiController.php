<?php

namespace App\Controllers;

use App\Controllers\BaseController;
use App\Models\PresensiDataModel;
use App\Models\MahasiswaModel;

class AbsensiController extends BaseController
{
    public function index()
    {
        
    }

    public function create()
    {
        $status = '';
        $id_waktu_presensi = '';
        date_default_timezone_set('Asia/Jakarta');
        $namaMhs = $this->request->getVar('absen');
        $parts = explode(" ", $namaMhs);
        $nim = $parts[0];

        $time = strtotime(date('H:i:s'));
        $date = date('Y-m-d');
        $presensiData = new PresensiDataModel();
        $dataMahasiswa = $presensiData->byNama($nim);

        foreach ($dataMahasiswa as $mahasiswa) {
            $jam_masuk = strtotime($mahasiswa['jam_masuk']);
            $jam_keluar = strtotime($mahasiswa['jam_keluar']);
            if ($time >= $jam_masuk && $time <= $jam_keluar && $mahasiswa['status'] == 'tidak hadir') {
            $status = 'hadir';
            $id_waktu_presensi = $mahasiswa['id'];
            //return redirect()->to('/')->with('msg', 'Presensi Mata Kuliah '.$mahasiswa['nama_mk'].'Berhasil');
            } else {
            $status = 'tidak hadir';
            //return redirect()->to('/')->with('err', 'Presensi Gagal Anda Sudah Melakukan Presensi');
            }
        }

        if ($status == 'hadir'){
            $presensiData->updateStatusByIdWaktuPresensi($id_waktu_presensi);
            return redirect()->to('/')->with('msg', 'Presensi Mata Kuliah '.$mahasiswa['nama_mk'].' Berhasil');
        } else {
            return redirect()->to('/')->with('err', 'Presensi Gagal Anda Sudah Melakukan Presensi');
        }
    }
}
