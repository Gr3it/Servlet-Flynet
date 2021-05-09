const company = document.querySelector(".deactive");
const button = document.querySelector(".company-button");

button.addEventListener("click", () => {
  company.classList.toggle("deactive");
  company.classList.toggle("company-container");
});
