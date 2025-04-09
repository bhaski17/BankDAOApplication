const container = document.querySelector('.container');
const updatePage = document.querySelector('.updatePage');
const namePage = document.querySelector('.NamePage');
const phonePage = document.querySelector('.PhonePage');
const emailPage = document.querySelector('.EmailPage');
const passwordPage = document.querySelector('.PasswordPage');


const nameBtn = document.getElementById('nameBtn');
const phoneBtn = document.getElementById('phoneBtn');
const emailBtn = document.getElementById('emailBtn');
const passwordBtn = document.getElementById('passwordBtn');
const nameForm = document.getElementById('nameForm');
const phoneForm = document.getElementById('phoneForm');
const emailForm = document.getElementById('emailForm');
const passwordForm = document.getElementById('passwordForm');

// Navigate to Name Update Page
nameBtn.addEventListener('click', () => {
    updatePage.style.display = 'none';
    namePage.style.display = 'block';
});

// Navigate to Phone Update Page
phoneBtn.addEventListener('click', () => {
    updatePage.style.display = 'none';
    phonePage.style.display = 'block';
});

// Navigate to Email Update Page
emailBtn.addEventListener('click', () => {
    updatePage.style.display = 'none';
    emailPage.style.display = 'block';
});

// Navigate to Password Update Page
passwordBtn.addEventListener('click', () => {
    updatePage.style.display = 'none';
    passwordPage.style.display = 'block';
});

// Handle Name Form Submission
nameForm.addEventListener('submit', (e) => {
    e.preventDefault();
    const newName = document.querySelector('.NamePage input[name="name"]').value;
    //alert(`Name updated to ${newName} successfully!`);
    namePage.style.display = 'none';
    updatePage.style.display = 'block';
});

// Handle Phone Form Submission
phoneForm.addEventListener('submit', (e) => {
    e.preventDefault();
    const newPhone = document.querySelector('.PhonePage input[name="phone"]').value;
   // alert(`Phone number updated to ${newPhone} successfully!`);
    phonePage.style.display = 'none';
    updatePage.style.display = 'block';
});

// Handle Email Form Submission
emailForm.addEventListener('submit', (e) => {
    e.preventDefault();
    const newEmail = document.querySelector('.EmailPage input[name="email"]').value;
    //alert(`Email updated to ${newEmail} successfully!`);
    emailPage.style.display = 'none';
    updatePage.style.display = 'block';
});


// Handle Password Form Submission
passwordForm.addEventListener('submit', (e) => {
    e.preventDefault();
    const newPassword = document.querySelector('.PasswordPage input[name="pin"]').value;
    const confirmPassword = document.querySelector('.PasswordPage input[name="confirmpassword"]').value;

    if (newPassword === confirmPassword) {
        //alert(`Password updated successfully!`);
        passwordPage.style.display = 'none';
        updatePage.style.display = 'block';
    } else {
        //alert("Passwords do not match. Please try again.");
    }
});
