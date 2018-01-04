// JavaScript source code
// Initialize Firebase
var config = {
    apiKey: "AIzaSyDysgQBCrTceps92JRwVdwi4dyaYwditkM",
    authDomain: "seeksubstitute.firebaseapp.com",
    databaseURL: "https://seeksubstitute.firebaseio.com",
    projectId: "seeksubstitute",
    storageBucket: "seeksubstitute.appspot.com",
    messagingSenderId: "832085666752"
};
firebase.initializeApp(config);

/**
 * Handles the sign up button press.
 */
function handleSignUp() {
    var email = document.getElementById('email').value;
    var password = document.getElementById('password').value;
    //if (email.length < 4) {
    //    alert('Please enter an email address.');
    //    return;
    //}
    //if (password.length < 4) {
    //    alert('Please enter a password.');
    //    return;
    //}
    // Sign in with email and pass.
    // [START createwithemail]
    firebase.auth().createUserWithEmailAndPassword(email, password).then(function (user) {
        
        var email = document.getElementById('email').value;
        var id = user.uid;
        console.log(id);

        firebase.database().ref('Users/' + id).set(email).then(function (user) {
            //var myRef = firebase.database().ref('UsersData/' + user.uid).set();

            var newData = {
                email: email,
                fullname: document.getElementById('name').value + ' ' + document.getElementById('lastname').value,
                subject: document.getElementById('subject').value,
                qualification: document.getElementById('qualification').value,
                country: document.getElementById('country').value,
                bio: document.getElementById('txtaboutme').value
            }
            firebase.database().ref('UsersData/' + id).set(newData).then(function (user) {
                document.location.href = "frmMyProfile.aspx";
            });
        });


        
        
    }).catch(function (error) {
        // Handle Errors here.
        var errorCode = error.code;
        var errorMessage = error.message;
        // [START_EXCLUDE]
        if (errorCode == 'auth/weak-password') {
            alert('The password is too weak.');
        } else {
            alert(errorMessage);
        }
    });
}


function initApp() {
    // Listening for auth state changes.
    // [START authstatelistener]

    firebase.auth().onAuthStateChanged(function (user) {
        if (user) {
            //document.location.href = "home.aspx";
        } else {
            // User is signed out.
            // [START_EXCLUDE]

            // [END_EXCLUDE]
        }
    });
    // [END authstatelistener]
    document.getElementById('btnSave').addEventListener('click', handleSignUp, false);
}
window.onload = function () {
    initApp();
};