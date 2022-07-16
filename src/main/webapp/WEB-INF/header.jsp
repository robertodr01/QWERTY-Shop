<%@ page import="Model.Utente" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="Model.Carrello" %>
<%@ page import="Model.CarrelloDAO" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="it">
<head>
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
            <li><a href="./"><b>Home</b></a></li>

            <li class="small-screen-option"><a href="account.jsp"><b>
                <%
                    Utente u = null;
                    if(session.getAttribute("utente") != null){
                        u = (Utente) session.getAttribute("utente");
                %>
                    <%= u.getNome() %>
                <%}
                    else {%>
                        Login
                    <%}%>
            </b></a></li>
            <%
                int cont = 0;
                ArrayList<Carrello> cart_list = null;
                if(u != null)
                   cart_list = new CarrelloDAO().doRetrieveAllByEmail(u.getEmail());
                else
                if(session.getAttribute("carrello_guest") != null)
                    cart_list = (ArrayList<Carrello>) session.getAttribute("carrello_guest");

                if(cart_list != null)
                    for (Carrello cart_item : cart_list) {
                        cont += cart_item.getQuantita();
                    }

            %>
            <li class="small-screen-option"><a href="shopping_cart.jsp"><b>Carrello (<%= cont %>)</b></a></li>
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
    <div class="shop-button">
        <img src="img/keycap_icon.svg" alt="account">
        <img src="img/keycap_icon.svg" alt="carrello">
    </div>
    <div class="shop-button">
        <a href="account.jsp">
            <%
                if(u != null){
            %>
                <b><%=u.getNome().charAt(0)%></b>
                <%}
                else {%>
                <i class="fa-solid fa-user"></i>
                <%}%>
        </a>
        <a href="shopping_cart.jsp"><i class="fa-solid fa-cart-shopping"></i></a>
    </div>
    <div class="shop-button-overlay">
        <span id="cart-count">
            <%= cont %>
        </span>
    </div>

</nav>

</body>
</html>
