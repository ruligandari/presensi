<?= $this->extend('layout/auth-login-admin')?>

<?= $this->section('header');?>
<style>
    video{
        position: absolute;
    }

    canvas {
        position: relative;
    }
</style>
<?= $this->endSection();?>

<?= $this->section('content')?>

<div class="content-wrapper d-flex align-items-center auth px-0">
    <div class="row w-100 mx-0">
        <div class="col-lg-5 mx-auto">
            <?php
            if (session()->getFlashdata('msg')) {
              echo '<div class="alert alert-success" role="alert">';
              echo session()->getFlashdata('msg');
              echo '</div>';
            } else if (session()->getFlashdata('err')){
                echo '<div class="alert alert-danger" role="alert">';
              echo session()->getFlashdata('err');
              echo '</div>';
            }
            ?>
            <h2 class="text-center mb-3">Sistem Presensi Face Recognition</h2>
            <!-- <video autoplay="true" id="webcam-video"></video> -->
            
                <div id="video" class="video"></div>
            
            <div class="label text-center" id="label"></div>
            <center>
                <form action="<?= base_url('absen/')?>" method="POST">
                <input type="text" id="absen" name="absen" hidden>
                <input type="time" id="jam_sekarang" value="<?=date('H:i:s')?>" name="jam_sekarang" hidden> 
                <button type="submit" id="submit" class="btn btn-success mt-3">Presensi</button>
                </form>
            </center>
        </div>
    </div>
</div>


<?= $this->endSection()?>

<?= $this->section('script')?>
<script src="<?= base_url('js/face-api.min.js')?>"></script>
<script>
  // Fetch model from server
  fetch('<?=base_url('model')?>')
    .then(response => response.json())
    .then(data => {
      console.log(data);
      // Load the face recognition model
      Promise.all([
        faceapi.nets.tinyFaceDetector.loadFromUri('http://localhost:8080/models'),
        faceapi.nets.faceLandmark68Net.loadFromUri('http://localhost:8080/models'),
        faceapi.nets.faceRecognitionNet.loadFromUri('http://localhost:8080/models')
      ]).then(startFaceRecognition);

      function startFaceRecognition() {
        // Start webcam stream
        navigator.mediaDevices.getUserMedia({ video: true })
          .then(stream => {
            const video = document.createElement('video');
            video.id = 'video';
            video.width = 640;
            video.height = 480;
            video.autoplay = true;
            video.srcObject = stream;
            document.getElementById('video').appendChild(video);

            video.onloadedmetadata = () => {
              video.play();
              // Create canvas for drawing face landmarks
              const canvas = document.createElement('canvas');
              canvas.id = 'canvas';
              canvas.width = 640;
              canvas.height = 480;
              document.getElementById('video').appendChild(canvas);
              const displaySize = { width: video.width, height: video.height };
              faceapi.matchDimensions(canvas, displaySize);

              // Perform face recognition on each video frame
              setInterval(async () => {
                const detections = await faceapi.detectAllFaces(video, new faceapi.TinyFaceDetectorOptions())
                  .withFaceLandmarks()
                  .withFaceDescriptors();
                 const labeledDescriptors = data.labels.map((label, index) => {
                    const descriptors = Float32Array.from(data.descriptors[index]);
                    return new faceapi.LabeledFaceDescriptors(label, [descriptors]);
                    });
                
                const faceMatcher = new faceapi.FaceMatcher(labeledDescriptors);
                const results = detections.map(detection => faceMatcher.findBestMatch(detection.descriptor));
                console.log(results);
                // Draw bounding boxes and labels on canvas
                canvas.getContext('2d').clearRect(0, 0, canvas.width, canvas.height);
                results.forEach((result, i) => {
                  const box = detections[i].detection.box;
                  const label = result.toString();
                  const drawBox = new faceapi.draw.DrawBox(box, { label });
                  drawBox.draw(canvas);

                  // Update label text
                  const labelElement = document.getElementById('label');
                  labelElement.innerHTML = label;
                  console.log(label);

                  // Update hidden input value
                  const absenInput = document.getElementById('absen');
                  absenInput.value = label;
                });
              }, 100);
            };
          })
          .catch(error => {
            console.log('Error accessing webcam:', error);
          });
      }
    })
    .catch(error => {
      console.log('Error fetching model:', error);
    });
</script>
<?= $this->endSection()?>
