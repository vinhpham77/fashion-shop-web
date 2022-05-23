let enterableElements = document.querySelectorAll('.register input, .register textarea');
const USERNAME_FORMAT = /^\w{5,20}$/;
const PASSWORD_FORMAT = USERNAME_FORMAT;
const PHONE_NUMBER_FORMAT = /^0\d{9}$/;
const EMAIL_FORMAT = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
const USERNAME_MESSAGE = 'Bao gồm 5-20 kí tự và chỉ chứa A-Z, a-z, 0-9';
const PASSWORD_MESSAGE = USERNAME_MESSAGE;
const REPASSWORD_MESSAGE = 'Không khớp với mật khẩu ở trên';
const PHONE_NUMBER_MESSAGE = 'Bao gồm 10 chữ số và bắt đầu bằng số 0';
const EMAIL_MESSAGE = 'Không đúng định dạng email';

enterableElements.forEach(function(item) {
    item.onblur = function() {
        return validateElement(item, getFormat(item));
    }
})

function getFormat(element) {
    switch (element.id) {
        case 'username':
            return USERNAME_FORMAT;
        case 'password':
            return PASSWORD_FORMAT;
        case 'phone-number':
            return PHONE_NUMBER_FORMAT;
        case 'email':
            return EMAIL_FORMAT;
        default:
            return '';
    }
}

function getMessage(element) {
    switch (element.id) {
        case 'username':
            return USERNAME_MESSAGE;
        case 'password':
            return PASSWORD_MESSAGE;
        case 'phone-number':
            return PHONE_NUMBER_MESSAGE;
        case 'email':
            return EMAIL_MESSAGE;
        default:
            return '';
    }
}

function getFormMessage(element) {
    let formGroup = element.parentElement;
    return formGroup.querySelector('.form-message');
}

function showMessage(element, message) {
    let formMessage = getFormMessage(element);
    formMessage.innerHTML = message;
    element.classList.add('invalid');
}

function hideMessage(element) {
    let formMessage = getFormMessage(element);
    formMessage.innerHTML = '';
    element.classList.remove('invalid');
}

function isEmpty(element) {
    return element.value ? false : true;
}

function validateElement(element, format) {
    element.value = element.value.trim();
    if (isEmpty(element)) {
        showMessage(element, "Vui lòng không để trống ô này");
        return false;
    }

    if (element.id === 're-password') {
        let password = document.querySelector('#password');
        if (password.value !== element.value) {
            showMessage(element, REPASSWORD_MESSAGE);
            return false;
        } else {
            hideMessage(element);
            return true;
        }
    } else {
        let format = getFormat(element);
        let value = element.value;

        if (format && !format.test(value)) {
            showMessage(element, getMessage(element));
            return false;
        } else {
            hideMessage(element);
            return true;
        }
    }
}

function validateForm() {
    let isValid = true;
    enterableElements.forEach(function(item) {
        if (!validateElement(item, getFormat(item))) {
            isValid = false;
        }
    });

    return isValid;
}
