<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Homepage</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins&display=swap" rel="stylesheet">

    <link rel="stylesheet" href="css/style.css">
    <link rel="icon" type="image/x-icon" href="img/website_icon.ico">

    <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>

    <nav>
        <div class="toggle">
            <a><i class="fa-solid fa-bars-staggered"></i></a>
        </div>
        <div class="menu">
            <!-- Sotto certe dimensioni, il carrello e l'account si spostano qui dentro -->
            <ul class = "nav-menu">
                <li>
                    <form>
                        <input type="text" placeholder="Cerca...">
                        <input type="submit" value="C">
                    </form>
                </li>
                <li class="small-screen-option"><a href="#"><b>Login</b></a></li>
                <li class="small-screen-option"><a href="#"><b>Carrello (0)</b></a></li>
                <li><a href="#"><b>Tastiere</b></a></li>
                <li><a href="#"><b>Switch</b></a></li>
                <li><a href="#"><b>Keycaps</b></a></li>
                <li><a href="#"><b>About us</b></a></li>
                <li><a href="#"><b>Contattaci</b></a></li>
            </ul>
        </div>
        <div class="container-logo">

            <a href="./">
                <img id="imgLogo" src="img/shop_icon.svg" alt="shop logo">
                <h3 id="shop_title">Qwerty Shop</h3>
            </a>
        </div>
        <div class="shop-buttons">
            <img src="img/keycap_icon.svg" alt="account">
            <img src="img/keycap_icon.svg" alt="carrello">
        </div>
        <div class="shop-buttons">
            <a href="#"><i class="fa-solid fa-user"></i></a>
            <a href="#"><i class="fa-solid fa-cart-shopping"></i></a>
        </div>
        <div class="shop-buttons-overlay">
            <span id="cart-count">0</span>
        </div>
    </nav>
    <!-- ~~~~~~~~~~~ -->

    <!-- CAROUSEL -->

    <div class="container">
        <div id="carousel">
            <div class="slide-image" id="slide1">
                ciao1
            </div>
            <div class="slide-image" id="slide2">
                ciao2
            </div>
            <div class="slide-image" id="slide3">
                ciao3
            </div>
            <div class="slide-image" id="slide4">
                ciao4
            </div>
            <div class="slide-image" id="slide5">
                ciao5
            </div>
        </div>
    </div>

    <!-- ~~~~~~~~~~~ -->
    <br>
    <footer>
        <p id="credits">© Della Rocca & Brandi. Tutti i diritti riservati.</p>
    </footer>

    <!-- SCRIPT -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://kit.fontawesome.com/b2ea133689.js" crossorigin="anonymous"></script>
    <script src="js/script.js"></script>
</body>
</html>