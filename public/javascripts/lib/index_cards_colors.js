var indexCards = document.querySelectorAll('.lesson-card')
indexCards.forEach(card => {
  let status = card.children[1].children[1].innerText;
  if (status.includes("Sith")) {
    card.classList.add("sith")
  } else {
    card.classList.add("jedi");
  }
});
