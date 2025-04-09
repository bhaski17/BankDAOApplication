

const container = document.querySelector('.container');
const delPage1 = document.querySelector('.delPage1');
const delPage2 = document.querySelector('.delPage2');
const delPage3 = document.querySelector('.delPage3');
const started = document.querySelector('.started');
const deleteForm = document.getElementById('deleteForm');
const nomineeBtn = document.getElementById('nomineeBtn');
const adminBtn = document.getElementById('adminBtn');
const nomineeForm = document.getElementById('nomineeForm');

// Navigate from Page 1 to Page 2
deleteForm.addEventListener('submit', (e) => {
    e.preventDefault();
    delPage1.style.display = 'none';
    delPage2.style.display = 'block';
});

// Navigate from Page 2 to Page 3 (Nominee)
nomineeBtn.addEventListener('click', () => {
    delPage2.style.display = 'none';
    delPage3.style.display = 'block';
});

// Handle Admin button click
adminBtn.addEventListener('click', () => {
    // Transfer amount to Admin
    const confirmTransfer = confirm("Are you sure you want to transfer the amount to the Admin?");
    if (confirmTransfer) {
        alert("Amount transferred to Admin successfully!");
        // Return to Home Page (delPage1)
        delPage2.style.display = 'none';
        delPage1.style.display = 'block';
    }
});

// Handle Nominee Form Submission
nomineeForm.addEventListener('submit', (e) => {
    e.preventDefault();
    const accountNumber = document.querySelector('.delPage3 input[name="account"]').value;
    if (accountNumber) {
        alert(`Amount transferred to nominee account ${accountNumber} successfully!`);
        // Return to Home Page (delPage1)
        delPage3.style.display = 'none';
        delPage1.style.display = 'block';
    } else {
        alert("Please enter a valid account number.");
    }
});


