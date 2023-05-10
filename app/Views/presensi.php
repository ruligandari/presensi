<?= $this->extend('layout/auth-login-admin')?>

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
            <div id="video" class="text-center"></div>
            <div class="label text-center" id="label"></div>
            <center>
                <form action="<?= base_url('absen/')?>" method="POST">
                <input type="text" id="absen" name="absen" hidden>
                <input type="time" id="jam_sekarang" value="<?=date('H:i:s')?>" name="jam_sekarang" hidden> 
                <button type="submit" class="btn btn-success mt-3">Presensi</button>
                </form>
            </center>
        </div>
    </div>
</div>


<?= $this->endSection()?>

<?= $this->section('script')?>
<script src="https://cdn.jsdelivr.net/npm/@tensorflow/tfjs@latest/dist/tf.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@teachablemachine/image@latest/dist/teachablemachine-image.min.js"></script>
<script>
    // More API functions here:
    // https://github.com/googlecreativelab/teachablemachine-community/tree/master/libraries/image

    // the link to your model provided by Teachable Machine export panel
    const URL = "https://teachablemachine.withgoogle.com/models/79CjIWAOL/";

    let model, webcam, labelContainer, maxPredictions;

    // Load the image model and setup the webcam
    async function init() {
        const modelURL = URL + "model.json";
        const metadataURL = URL + "metadata.json";

        // load the model and metadata
        // Refer to tmImage.loadFromFiles() in the API to support files from a file picker
        // or files from your local hard drive
        // Note: the pose library adds "tmImage" object to your window (window.tmImage)
        model = await tmImage.load(modelURL, metadataURL);
        maxPredictions = model.getTotalClasses();

        // Convenience function to setup a webcam
        const flip = true; // whether to flip the webcam
        webcam = new tmImage.Webcam(400, 400, flip); // width, height, flip
        await webcam.setup(); // request access to the webcam
        await webcam.play();
        window.requestAnimationFrame(loop);

        // append elements to the DOM
        document.getElementById("video").appendChild(webcam.canvas);
        labelContainer = document.getElementById("label");
        for (let i = 0; i < maxPredictions; i++) { // and class labels
            labelContainer.appendChild(document.createElement("div"));
        }
    }

    async function loop() {
        webcam.update(); // update the webcam frame
        await predict();
        window.requestAnimationFrame(loop);
    }

    // run the webcam image through the image model
    async function predict() {
        // predict can take in an image, video or canvas html element
        const prediction = await model.predict(webcam.canvas);
        console.log(prediction)
        for (let i = 0; i < maxPredictions; i++) {
                if (prediction[i].probability > 0.7) { // check if probability > 0.7
            const classPrediction =
                prediction[i].className + ": " + prediction[i].probability.toFixed(2);
            labelContainer.childNodes[i].innerHTML = classPrediction;
            const getNama = prediction[i].className;
            document.getElementById('absen').value = getNama;
            console.log(getNama);
        } else {
            labelContainer.childNodes[i].innerHTML = ""; // set to empty string if probability < 0.7
        }
    
        }
    }

    init(); // call init() to start the webcam
</script>
<?= $this->endSection()?>