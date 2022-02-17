let b7Validator = {
  handleSubmit:(event)=>{
    event.preventDefault();
    let send = true;

    let inputs = form.querySelectorAll('input');

    // b7Validator.clearErrors();

    for(let i=0;i<inputs.length;i++) {
      let input = inputs[i];
      let check = b7Validator.checkInput(input);
      if(check !== true) {
        send = false;
        b7Validator.showError(input, check);
      }
    }

    if(send) {
      form.submit();
    }
  }
}

let form = document.querySelector('.b7validator');
form.addEventListener('submit', B7Validator.handleSubmit);