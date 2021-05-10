<%-- Document : index Created on : 25-apr-2021, 18.20.26 Author : Emanuele --%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>Flynet</title>
    <link rel="stylesheet" href="./style.css" />
    <link rel="icon" type="image/png" href="./favicon.png" />
    <link
      rel="stylesheet"
      href="https://fonts.googleapis.com/css?family=Shrikhand"
    />
    <link
      rel="stylesheet"
      href="https://fonts.googleapis.com/css?family=Cabin"
    />
  </head>
  <body>
    <section class="container">
      <nav class="menu-container">
        <a href="Partenze">Partenze</a>
        <a href="Arrivi">Arrivi</a>
        <a href="Gestione_Voli">Gestione Voli</a>
        <%if(session.getAttribute("username")!=null){%>
        <a href="jsp/Pannello_Modifiche.jsp">Pannello Modifiche</a>
        <a class="login" href="jsp/logout.jsp">Logout</a>
        <%}else{%>
        <a class="login" href="jsp/login.jsp">Login</a>
        <%}%>
      </nav>
      <div class="title-container">
        <h2 class="main-title">Flynet</h2>
        <svg viewBox="0 0 320 512" class="fa-angle-double-down">
          <g class="fa-group">
            <path
              fill="#181d2677"
              d="M143 256L7.05 120.37a23.78 23.78 0 0 1 0-33.8L29.64 64a23.94 23.94 0 0 1 33.89 0l96.37 96.13L256.27 64a23.94 23.94 0 0 1 33.89 0L313 86.47a23.78 23.78 0 0 1 0 33.8L177 255.88a23.94 23.94 0 0 1-34 .1z"
              class="fa-secondary"
            ></path>
            <path
              fill="#181d26"
              d="M143 447.89L7.05 312.34a23.77 23.77 0 0 1 0-33.79L29.74 256a23.94 23.94 0 0 1 33.89 0L160 352.11l96.47-96a23.94 23.94 0 0 1 33.89 0L313 278.65a23.77 23.77 0 0 1 0 33.79L177 448a24 24 0 0 1-34-.11z"
              class="fa-primary"
            ></path>
          </g>
        </svg>
        <img
          src="image/Background.png"
          alt="Background"
          class="background-img"
        />
        <img src="image/Cloud.png" alt="Cloud" class="cloud-img" />
        <img src="image/Airplane.png" alt="Airplane" class="airplane-img" />
      </div>
      <div class="content">
        <div class="weather-container">
          <h4 class="content-title">Meteo</h4>
          <script src="https://apps.elfsight.com/p/platform.js"></script>
          <div
            class="elfsight-app-c5814081-1c80-48c9-9a07-31611f7ef1d0 weather"
          ></div>
        </div>
        <div class="map-container">
          <h4 class="content-title">Indicazioni Aereoporto</h4>
          <div class="location-map">
            <iframe
              src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d12358.55360382416!2d9.0556777!3d39.2510794!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0x10ef502c8f5e21f1!2sAeroporto%20di%20Cagliari-Elmas!5e0!3m2!1sit!2sit!4v1619982503538!5m2!1sit!2sit"
              width="500"
              height="610"
              style="border: 0"
              allowfullscreen=""
              loading="lazy"
            ></iframe>
          </div>
        </div>
        <div class="planimetry-container">
          <h4 class="content-title">Planimetria Aereoporto</h4>
          <img
            src="image/Planimetria.png"
            alt="Planimetria"
            class="planimetry"
          />
        </div>

        <svg viewBox="0 0 320 512" class="fa-angle-double-up">
          <g class="fa-group">
            <path
              fill="#ffffff55"
              d="M177 256l136 135.63a23.78 23.78 0 0 1 0 33.8L290.36 448a23.94 23.94 0 0 1-33.89 0l-96.37-96.16L63.73 448a23.94 23.94 0 0 1-33.89 0L7.05 425.53a23.78 23.78 0 0 1 0-33.8L143 256.12a23.94 23.94 0 0 1 34-.1z"
              class="fa-secondary"
            ></path>
            <path
              fill="#ffffff"
              d="M177 64.11l136 135.55a23.77 23.77 0 0 1 0 33.79L290.26 256a23.94 23.94 0 0 1-33.89 0L160 159.89l-96.47 96a23.94 23.94 0 0 1-33.89 0L7.05 233.35a23.77 23.77 0 0 1 0-33.79L143 64a24 24 0 0 1 34 .11z"
              class="fa-primary"
            ></path>
          </g>
        </svg>
      </div>
    </section>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.6.1/gsap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/ScrollMagic/2.0.6/ScrollMagic.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/ScrollMagic/2.0.6/plugins/animation.gsap.js"></script>
    <script src="./script.js"></script>
  </body>
</html>
