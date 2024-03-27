<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>File Upload Example</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script>
    function showProgressBar() {
        document.getElementById("progressBar").style.display = "block";
        updateProgress();
    }

    function updateProgress() {
        var progressBar = document.getElementById("progress");
        var status = document.getElementById("status");
        var currentValue = 0;

        function progress() {
            currentValue += 10;
            if (currentValue <= 100) {
                progressBar.value = currentValue;
                status.textContent = "Yükleniyor... %" + currentValue;
                setTimeout(progress, 0); // İlerleme hızı (ms cinsinden)
            } else {
                status.textContent = "Yükleme Tamamlandı!";
            }
        }

        progress();
    }
</script>
<style>
body {
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
    margin: 0;
    padding: 0;
    background-color: #f0f0f0;
    font-family: Arial, sans-serif;
}
.dosyaYukleme {
    background-color: #fafafa;
    margin-top: 50px;
    box-shadow: 5px 5px 8px #aaaaaa;
    padding: 10px;
    width: 300px;
    height: 150px;
    display: grid;
    position: relative;
	border-radius: 20px/20px;
}
input[type="submit"],
input[type="file"] {
    width: 93%;
    padding: 8px;
    margin-top: 10px;
    border-radius: 7px;
    background-color: #4c98af;
    color: white;
    border: none;
    cursor: pointer;
}
</style>
</head>
<body>
<div class="col-xl-3 col-md-3 col-sm-12 dosyaYukleme">

    <form action="FileUploadServlet" method="post" enctype="multipart/form-data" onsubmit="showProgressBar()">
        <input type="file" name="files" multiple>
        <br>
        <input type="submit" value="Dosya(lar)nızı Yükleyin">
    </form>
    
    <div id="progressBar" style="display:none">
        <progress id="progress" value="0" max="100"></progress>
        <span id="status">Yükleniyor...</span>
    </div>
</div>
</body>
</html>
