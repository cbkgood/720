<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>panoramic picture</title>
</head>
<body>
<div id="vrview">

</div>
<script src="http://storage.googleapis.com/vrview/2.0/build/vrview.min.js"></script>
<script>
    window.addEventListener('load', onVrViewLoad)
    function onVrViewLoad() {
        var vrView = new VRView.Player('#vrview', {
            image: "assets/image.jpg",
            is_stereo: false
        });
    }
</script>
</body>
</html>