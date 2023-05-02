<?= $this->extend('layout/auth-login-admin')?>

<?= $this->section('content')?>

<div class="content-wrapper d-flex align-items-center auth px-0">
    <div class="row w-100 mx-0">
        <div class="col-lg-5 mx-auto">
            <h2 class="text-center mb-3">Sistem Presensi Face Recognition</h2>
            <video autoplay="true" id="webcam-video"></video>
            <button class="btn btn-success mt-3">Presensi</button>
        </div>
    </div>
</div>


<?= $this->endSection()?>

<?= $this->section('script')?>
<script>
    const video = document.getElementById('webcam-video');
    const constraints = {
        video: true
    };

    navigator.mediaDevices.getUserMedia(constraints)
        .then((stream) => {
            video.srcObject = stream;
        })
        .catch((err) => {
            console.log(err);
        });
</script>
<?= $this->endSection()?>