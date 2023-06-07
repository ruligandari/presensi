<?= $this->extend('layout/dashboard-admin')?>

<?= $this->section('content')?>
<div class="content-wrapper">
  <div class="row">
    <div class="col-sm-12">
      <div class="home-tab">
        <div class="tab-content tab-content-basic">
          <div class="tab-pane fade show active" id="overview" role="tabpanel" aria-labelledby="overview">
            <div class="row">
              <div class="col-lg-17 d-flex flex-column">
                <div class="row ">
                  <div class="col-17 grid-margin stretch-card">
                    <div class="card card-rounded">
                      <div class="card-body">
                        <div class="d-sm-flex justify-content-center align-items-start">
                          <div>
                            <h4 class="card-title card-title-dash">Generate Data Wajah Mahasiswa</h4>
                          </div>
                        </div>
                        <form action="<?=base_url();?>" method="post">
                        <?=csrf_field()?>
                        <div class="row">
                          <div class="form-group">
                            <label for="foto">Pas Foto</label>
                            <input name="foto" type="file" class="form-control" id="foto"></input>
                        </div>
                        <span class="text-muted">Pastikan foto wajah memiliki pencahayaan yang baik</span>
                        </div>
                        <div class="row">
                          <div class="form-group">
                            <img src="" id="showFoto" alt="" style="height: 300px; width: 200px; display: none;">
                          </div>
                        </div>
                        <div class="row">
                          <div class="form-group">
                            <button type="submit" class="btn btn-primary text-white">Simpan</button> &nbsp;
                          </div>
                        </div>
                        </form>
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

<?= $this->section('script')?>
<script>
   // Ambil elemen input file dan elemen gambar
    var uploadInput = document.getElementById('foto');
    var previewImage = document.getElementById('showFoto');
    
    // Tambahkan event listener untuk perubahan pada input file
    uploadInput.addEventListener('change', function(e) {
      // Cek apakah ada file yang diunggah
      if (uploadInput.files && uploadInput.files[0]) {
        // Ambil file yang diunggah
        var file = e.target.files[0];
        
        // Buat objek FileReader
        var reader = new FileReader();
        
        // Setelah file selesai dibaca, tampilkan gambar pada elemen img
        reader.onload = function(e) {
          previewImage.src = e.target.result;
          previewImage.style.display = 'block';
        };
        
        // Baca file sebagai URL data gambar
        reader.readAsDataURL(file);
      } else {
        // Jika tidak ada file yang dipilih, sembunyikan elemen img
        previewImage.style.display = 'none';
      }
    });
</script>
<?= $this->endSection()?>