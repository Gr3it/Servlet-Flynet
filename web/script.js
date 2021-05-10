let controller = new ScrollMagic.Controller();
let timeline = new TimelineMax();
let timeline2 = new TimelineMax({
  repeat: -1,
  yoyo: true,
});
let timeline3 = new TimelineMax({
  repeat: -1,
  yoyo: true,
});

timeline2.fromTo(
  ".fa-angle-double-down",
  { y: -30 },
  { y: -10, duration: 1.5 }
);
timeline3.fromTo(".fa-angle-double-up", { y: -30 }, { y: -10, duration: 1.5 });

timeline
  .fromTo(
    ".airplane-img",
    { y: -50, x: 0 },
    { y: -750, x: -800, scale: 0.5, duration: 10 }
  )
  .fromTo(".cloud-img", { y: -75 }, { y: -350, duration: 10 }, "-=10")
  .fromTo(
    ".fa-angle-double-down",
    { opacity: 1 },
    { opacity: 0, duration: 0.5 },
    "-=10"
  )
  .fromTo(
    ".main-title",
    { y: 0, x: 0 },
    { y: -350, x: 400, duration: 10 },
    "-=10"
  )
  .fromTo(".background-img", { y: -50 }, { y: -0, duration: 10 }, "-=10")
  .to(".content", 10, { top: "0%" }, "-=10")
  .fromTo(".menu-container", { opacity: 1 }, { opacity: 0, duration: 3 }, "-=7")
  .fromTo(
    ".weather-container",
    { opacity: 0 },
    { opacity: 1, duration: 5 },
    "-=7"
  )
  .fromTo(".map-container", { opacity: 0 }, { opacity: 1, duration: 5 }, "-=7")
  .fromTo(
    ".planimetry-container",
    { opacity: 0 },
    { opacity: 1, duration: 5 },
    "-=7"
  )
  .to(".background-img", 0, { y: -200 });

let scene = new ScrollMagic.Scene({
  triggerElement: "section",
  duration: "300%",
  triggerHook: 0,
})
  .setTween(timeline)
  .setPin(".container")
  .addTo(controller);

document
  .querySelector(".fa-angle-double-down")
  .addEventListener("click", function () {
    var i = 10;
    var int = setInterval(function () {
      window.scrollTo(0, i);
      i += 25;
      if (i >= 3000) clearInterval(int);
    }, 20);
  });

document
  .querySelector(".fa-angle-double-up")
  .addEventListener("click", function () {
    var i = 3000;
    var int = setInterval(function () {
      i -= 25;
      window.scrollTo(0, i);
      if (i <= 0) clearInterval(int);
    }, 20);
  });
