// function Validator(options){
//    let formElement = document.querySelector(options.form);
//       console.log(options.rule);
//    if(formElement){
//        options.rule.forEach(function(rule){
//            let inputElement = formElement.querySelector(rule.selector);
//            if(inputElement){
//                inputElement.onblur = function(){
//                 let errorMessage=rule.test(in);
//                }
//            }
//        });
//    }
// }
// // Validator.isrequired = function(){

// // }

function getValue(id){
    return document.getElementById(input).value.trim();
}


function showError(id, message){
    document.getElementById(input + '_error').innerHTML = message;
}


 
function validate()
{
    let isValid = true;

    let username = getValue('username');
    let usernameFormat = /^\w{5,20}$/;
    if (!usernameFormat.test(username)){
        isValid = false;
        showError('username', 'Bao gồm 5-20 kí tự và chỉ chứa A-Z, a-z, 0-9');
    }

    let password = getValue('password');
    let passwordFormat = usernameFormat;
    if (!passwordFormat.test(username)){
        isValid = false;
        showError('password', 'Bao gồm 5-20 kí tự và chỉ chứa A-Z, a-z, 0-9');
    }

    let rePassword = getValue('re-password');
    if (rePassword !== password) {
        isValid = false;
        showError('re-password', 'Không khớp với mật khẩu ở trên');
    }

    let phoneNumber = getValue('phone-number');
    let phoneNumberFormat = /^0\d{9}$/;
    if (!phoneNumberFormat.test(phone)){
        isValid = false;
        showError('phone-number', 'Bao gồm 10 chữ số và bắt đầu bằng số 0');
    }
    
    let email = getValue('email');
    let mailFormat = /^[\w.!#$%&'*+/=?^_`{|}~-]+@[\w-]+(?:\.[\w-]+)+$/;
    if (!mailFormat.test(email)){
        isValid = false;
        showError('email', 'Không đúng định dạng email');
    }

    return isValid;
}
