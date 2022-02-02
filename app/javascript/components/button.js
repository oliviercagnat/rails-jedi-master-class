const initSoundOnClick = () => {
  const button = document.querySelector('.btn-booking');
  if (button) {
    button.addEventListener('click', (event) => {
      event.preventDefault()

      button.classList.add('neon')
      document.querySelector('.sound').play()
      setTimeout(() => {
        document.querySelector('.actual-link').click()
      }, 2000);
    })
  }
}

export { initSoundOnClick };
