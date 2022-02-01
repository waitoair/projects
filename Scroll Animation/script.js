const boxes = document.querySelectorAll('.box');

checkBoxes();

function checkBoxes() {
  const triggerBotton = window.innerHeight / 5 * 4
  
  boxes.forEach(box => {
    const boxTop = box.getBoundingClientRect().top
    
    if(boxTop < triggerBotton) {
      box.classList.add('show')
    } else {
      box.classList.remove('show')
    }
  })
}

window.addEventListener('scroll', checkBoxes)