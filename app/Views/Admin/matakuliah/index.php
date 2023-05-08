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
                          <div>
                            <h4 class="card-title card-title-dash">Kelola Data Mahasiswa</h4>
                          </div>
                          <div>
                            <a href="<?=base_url('admin/matakuliah/create')?>" type="button" class="btn btn-success">Tambah Data</a>
                          </div>
                        </div>
                        <div class="table-responsive">
                          <table class="table table-hover">
                            <thead>
                              <tr>
                                <th>No</th>
                                <th>ID MK</th>
                                <th>Nama Mata Kuliah</th>
                                <th>Dosen Pengampu</th>
                                <th>Aksi</th>
                              </tr>
                            </thead>
                            <?php $no = 1?>
                            <?php foreach ($mk as $mk): ?>
                            <tbody>
                              <td><?=$no++?></td>
                              <td><?=$mk['id_mk']?></td>
                              <td><?=$mk['nama_mk']?></td>
                              <td><?=$mk['id_dosen']?></td>
                              <td>
                                <a href="<?= base_url('admin/matakuliah/form-edit/'). $mk['id_mk']?>"
                                  class="btn btn-primary">Edit</a>
                                <button data-target="#hapusModal<?=$mk['id_mk']?>" data-toggle="modal"
                                  class="btn btn-danger">Hapus</button>
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
<?php foreach ($mk as $mk) :?>
        <div class="modal fade" id="hapusModal<?=$mk['id_mk']?>" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
          <div class="modal-dialog" role="document">
            <div class="modal-content">
              <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Hapus?</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
                </button>
              </div>
              <form action="<?= base_url('admin/mahasiswa/delete/').$mk['id_mk']?>" method="POST">
              <?= csrf_field()?>
              <div class="modal-body">
                Apakah anda yakin ingin menghapus Mahasiswa <?=$mk['id_mk']?> ?
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