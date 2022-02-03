let homeCards = document.querySelectorAll('.lesson-card')
let status = document.getElementById('status').innerText;
homeCards.forEach(card => {
  if (status.includes("Sith")) {
    card.classList.add("sith")
  } else {
    card.classList.add("jedi");
  };
});
