<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>videojs-panorama in Iframe Demo</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <style>
        body{
            margin: 0;
        }
        body.vjs-full-window .player_wrapper{
            position: static!important;
        }
        body.vjs-full-window .player_container{
            padding-top: initial!important;
        }
        body.vjs-full-window #player{
            position: fixed!important;
        }
        .player_wrapper{
            position: relative;
            max-width: 960px;
            width: 90%;
        }
        .player_container{
            padding-top: 56.25%;
        }
        #player{
            position: absolute;
            width: 100%;
            height: 100%;
            top: 0;
            left: 0;
        }
    </style>
    <link href="//fonts.googleapis.com/css?family=Lora|Open+Sans" rel="stylesheet" type="text/css">
    <link href="styles/style.css"/>
</head>
<body>
<iframe
        frameborder="0"
        width="100%"
        height="600px"
        scrolling="no"
        allowfullscreen
        src="../vrview/index.html?image=/assets/image.jpg&is_stereo=false">
</iframe>
<div class="player_wrapper">
    <div class="player_container">
        <iframe id="player" src="iframe-video.jsp" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>
    </div>
</div>

<script>
    (function () {
        var player = document.getElementById("player");
        var playerWidth = player.width;
        var playerHeight = player.height;
        window.addEventListener('devicemotion', function (event) {
            var obj = {
                rotationRate: {
                    alpha: event.rotationRate.alpha,
                    beta:  event.rotationRate.beta,
                    gamma: event.rotationRate.gamma
                },
                portrait:  window.matchMedia("(orientation: portrait)").matches,
                landscape: window.matchMedia("(orientation: landscape)").matches,
                orientation: window.orientation
            };
            player.contentWindow.postMessage({type: "device-motion", events: obj}, "*");
        });

        window.addEventListener("message", function (event) {
            if(event.data == "enterFullWindow"){
                document.getElementsByTagName("body")[0].classList.add("vjs-full-window");
                player.width = window.outerWidth;
                player.height = window.outerHeight;
            }else if(event.data == "exitFullWindow"){
                player.width = playerWidth;
                player.height = playerHeight;
                document.getElementsByTagName("body")[0].classList.remove("vjs-full-window");
            }
        }, false);
    })();
</script>
</body>
</html>