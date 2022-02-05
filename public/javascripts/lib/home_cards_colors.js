var homeCards = document.querySelectorAll('.lesson-card')
homeCards.forEach(card => {
  let status = document.getElementById('status').innerText;
  if (status.includes("Sith")) {
    card.classList.add("sith")
  } else {
    card.classList.add("jedi");
  };
});
