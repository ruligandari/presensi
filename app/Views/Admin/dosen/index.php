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
                            <h4 class="card-title card-title-dash">Kelola Data Dosen</h4>
                          </div>
                          <div>
                            <a href="<?=base_url('admin/dosen/create')?>" type="button" class="btn btn-success">Tambah Data</a>
                          </div>
                        </div>
                        <div class="table-responsive">
                          <table class="table table-hover">
                            <thead>
                              <tr>
                                <th>No</th>
                                <th>NIP</th>
                                <th>Nama</th>
                                <th>Email</th>
                                <th>Password</th>
                                <th>Aksi</th>
                              </tr>
                            </thead>
                            <?php $no = 1?>
                            <?php foreach ($dosen as $d): ?>
                            <tbody>
                              <td><?=$no++?></td>
                              <td><?=$d['nip']?></td>
                              <td><?=$d['nama']?></td>
                              <td><?=$d['email']?></td>
                              <td><?=$d['password']?></td>
                              <td>
                                <a href="<?= base_url('admin/dosen/form_edit/'). $d['id_dosen']?>"
                                  class="btn btn-primary">Edit</a>
                                <button data-target="#hapusModal<?=$d['id_dosen']?>" data-toggle="modal"
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