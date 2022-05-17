var username = document.querySelector('username')
var password = document.querySelector('password')
var name = document.querySelector('name')
var current = document.querySelector('current')
var phone = document.querySelector('phone')

// function Validator(options){
//    var formElement = document.querySelector(options.form);
//       console.log(options.rule);
//    if(formElement){
//        options.rule.forEach(function(rule){
//            var inputElement = formElement.querySelector(rule.selector);
//            if(inputElement){
//                inputElement.onblur = function(){
//                 var errorMessage=rule.test(in);
//                }
//            }
//        });
//    }
// }
// // Validator.isrequired = function(){

// // }

function getValue(input){
    return document.getElementById(input).value.trim();
}


function showError(input, mess){
    document.getElementById(input + '_error').innerHTML = mess;
}


 
function validate()
{
    var flag = true;
    
   
    var username = getValue('username');
    if (username == '' || username.length < 20 || !/^[a-zA-Z0-9]+$/.test(username)){
        flag = false;
        showError('username', 'Vui lòng kiểm tra lại Username');
    }
    
    
   
    var phone = getValue('phone');
    if (phone != '' &&  !/^[0-9]{10}$/.test(phone)){
        flag = false;
        showError('phone', 'Vui lòng kiểm tra lại Phone');
    }
    
    var email = getValue('email');
    var mailformat = /^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:.[a-zA-Z0-9-]+)*$/;
    if (!mailformat.test(email)){
        flag = false;
        
        showError('phone', 'Vui lòng kiểm tra lại Email');
    }
    
    return flag;
}
