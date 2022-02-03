const initLessonCardStyle = () => {
  const status = document.getElementById('status').innerText;
  if(status.includes('Sith')) {
    document.querySelector('.lesson-card').classList.add('sith')
  } else {
    console.log("jedi")
  //   document.querySelector('.lesson-card').classList.add('.jedi')
  }
}

export {initLessonCardStyle};
