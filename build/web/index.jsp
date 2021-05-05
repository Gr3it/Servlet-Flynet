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
        <a href="">Gestione Voli</a>
      </nav>
      <div class="title-container">
        <h2 class="main-title">Flynet</h2>
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
          <!-- <script src="https://apps.elfsight.com/p/platform.js"></script> -->
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
      </div>
    </section>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.6.1/gsap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/ScrollMagic/2.0.6/ScrollMagic.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/ScrollMagic/2.0.6/plugins/animation.gsap.js"></script>
    <script src="./script.js"></script>
  </body>
</html>
