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
                            <h4 class="card-title card-title-dash">Kelola Data Dosen</h4>
                          </div>
                          <div>
                            <a href="#" type="button" class="btn btn-success">Tambah Data</a>
                          </div>
                        </div>
                        <div class="table-responsive">
                          <table class="table table-hover">
                            <thead>
                              <tr>
                                <th>No</th>
                                <th>ID MK</th>
                                <th>Nama Mata Kuliah</th>
                                <th>Jam Masuk</th>
                                <th>Jam Keluar</th>
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
                              <td><?=$mk['jam_masuk']?></td>
                              <td><?=$mk['jam_keluar']?></td>
                              <td><?=$mk['id_dosen']?></td>
                              <td>
                                <a href="<?= base_url('admin/mahasiswa/form-edit/'). $mahasiswa['nim']?>"
                                  class="btn btn-primary">Edit</a>
                                <button data-target="#hapusModal<?=$mahasiswa['nim']?>" data-toggle="modal"
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

<?= $this->endSection()?>