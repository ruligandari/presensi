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
                            <h4 class="card-title card-title-dash">Kelola Data Mahasiswa</h4>
                          </div>
                          <div>
                            <a href="<?=base_url('admin/mahasiswa/create')?>" type="button"
                              class="btn btn-success">Tambah Data</a>
                          </div>
                        </div>
                        <div class="table-responsive">
                          <table class="table table-hover">
                            <thead>
                              <tr>
                                <th>No</th>
                                <th>NIM</th>
                                <th>Nama Mahasiswa</th>
                                <th>Kelas</th>
                                <th>Jurusan</th>
                                <th>Jenis Kelamin</th>
                                <th>TTL</th>
                                <th>Agama</th>
                                <th>Alamat</th>
                                <th>Aksi</th>
                              </tr>
                            </thead>
                            <?php $no = 1?>
                            <?php foreach ($mahasiswa as $mahasiswa): ?>
                            <tbody>
                              <td><?=$no++?></td>
                              <td><?=$mahasiswa['nim']?></td>
                              <td><?=$mahasiswa['nama']?></td>
                              <td><?=$mahasiswa['kelas']?></td>
                              <td><?=$mahasiswa['jurusan']?></td>
                              <td><?=$mahasiswa['jenis_kelamin']?></td>
                              <td><?=$mahasiswa['ttl']?></td>
                              <td><?=$mahasiswa['agama']?></td>
                              <td><?=$mahasiswa['alamat']?></td>
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