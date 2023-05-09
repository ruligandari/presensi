<?= $this->extend('layout/dashboard-admin')?>

<?= $this->section('content')?>
        <div class="content-wrapper">
          <div class="row">
            <div class="col-sm-12">
              <div class="home-tab">
                <div class="tab-content tab-content-basic">
                  <div class="tab-pane fade show active" id="overview" role="tabpanel" aria-labelledby="overview">  
                    <div class="row">
                      <div class="col-lg-12 d-flex flex-column">
                        <div class="row ">
                          <div class="col-12 grid-margin stretch-card">
                            <div class="card card-rounded">
                              <div class="card-body">
                                <div class="d-sm-flex justify-content-between align-items-start">
                                <?php 
                                if (session()->getFlashdata('success')) {
                                    echo '<div class="alert alert-success" role="alert">'.session()->getFlashdata('success').'</div>';
                                } else if (session()->getFlashdata('error')){
                                    echo '<div class="alert alert-danger" role="alert">'.session()->getFlashdata('error').'</div>';
                                }
                                ?>
                                  <div>
                                    <h4 class="card-title card-title-dash">Kelola Data Presensi</h4>
                                  </div>
                                  <div>
                                    <a href="<?=base_url('admin/waktupresensi/create')?>"  type="button" class="btn btn-success">Tambah Data</a>
                                  </div>
                                </div>
                                <div class="table-responsive">
                                    <table class="table table-hover">
                                        <thead>
                                            <tr>
                                                <th>No</th>
                                                <th>ID</th>
                                                <th>Kelas</th>
                                                <th>Mata Kuliah</th>
                                                <th>Jam Masuk</th>
                                                <th>Jam Keluar</th>
                                                <th>Dosen</th>
                                                <th>Tanggal</th>
                                                <th>Aksi</th>
                                            </tr>
                                        </thead>
                                        <?php $no = 1?>
                                        <?php foreach ($presensi as $row): ?>
                                        <tbody>
                                            <td><?=$no++?></td>
                                            <td><?=$row['id']?></td>
                                            <td><?=$row['kelas']?></td>
                                            <td><?=$row['nama_mk']?></td>
                                            <td><?=$row['jam_masuk']?></td>
                                            <td><?=$row['jam_keluar']?></td>
                                            <td><?=$row['nama']?></td>
                                            <td><?=$row['tanggal']?></td>
                                            <td>
                                                <a href="<?=base_url('admin/waktupresensi/form_edit/').$row['id']?>" class="btn btn-primary">Edit</a>
                                                <button data-bs-target="#hapusModal<?=$row['id']?>" data-bs-toggle="modal"
                                  class="btn btn-danger">Hapus</button>  
                                                <a href="<?= base_url('admin/waktupresensi/rincian/'). $row['id']?>"
                                  class="btn btn-success">Rincian</a>  
                                            </td>
                                        </tbody>
                                        <?php endforeach?>
                                    </table>
                                </div>
                              </div>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
<?php foreach ($presensi as $row) :?>
<div class="modal fade" id="hapusModal<?=$row['id']?>" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Hapus?</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <form action="<?= base_url('admin/waktupresensi/delete/').$row['id']?>" method="POST">
      <?= csrf_field()?>
      <div class="modal-body">
        Apakah anda yakin ingin menghapus user <?=$row['id']?> ?
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="submit" class="btn btn-danger">Delete</button>
      </div>
      </form>
    </div>
  </div>
</div>
<?php endforeach?>
<?= $this->endSection()?>