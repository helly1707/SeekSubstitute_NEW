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

function toggleSignIn() {
    
    //if (firebase.auth().currentUser) {
    //    // [START signout]
    //    console.log("Signout");
    //    firebase.auth().signOut();
    //    // [END signout]
    //} else {
        console.log("Signin");
        var email = document.getElementById('email').value;
        var password = document.getElementById('password').value;
        if (email.length < 4) {
            alert('Please enter an email address.');
            return;
        }
        if (password.length < 4) {
            alert('Please enter a password.');
            return;
        }
        // Sign in with email and pass.
        // [START authwithemail]
        firebase.auth().signInWithEmailAndPassword(email, password).then(function (user) {
            document.location.href = "frmMyProfile.aspx";
        })
            .catch(function (error) {
            // Handle Errors here.
            var errorCode = error.code;
            var errorMessage = error.message;
            // [START_EXCLUDE]
            if (errorCode === 'auth/wrong-password') {
                alert('Wrong password.');
            } else {
                alert(errorMessage);
            }
            console.log(error);
            document.getElementById('SignIn').disabled = false;
            // [END_EXCLUDE]
        });
        // [END authwithemail]
    //}
    document.getElementById('SignIn').disabled = true;
}

function sendPasswordReset() {
    var email = document.getElementById('email').value;
    // [START sendpasswordemail]
    firebase.auth().sendPasswordResetEmail(email).then(function () {
        // Password Reset Email Sent!
        // [START_EXCLUDE]
        alert('Password Reset Email Sent!');
        // [END_EXCLUDE]
    }).catch(function (error) {
        // Handle Errors here.
        var errorCode = error.code;
        var errorMessage = error.message;
        // [START_EXCLUDE]
        if (errorCode == 'auth/invalid-email') {
            alert(errorMessage);
        } else if (errorCode == 'auth/user-not-found') {
            alert(errorMessage);
        }
        console.log(error);
        // [END_EXCLUDE]
    });
    // [END sendpasswordemail];
}

/**
 * initApp handles setting up UI event listeners and registering Firebase auth listeners:
 *  - firebase.auth().onAuthStateChanged: This listener is called when the user is signed in or
 *    out, and that is where we update the UI.
 */
function initApp() {
    // Listening for auth state changes.
    // [START authstatelistener]
    firebase.auth().onAuthStateChanged(function (user) {       
        if (user) {
            // User is signed in.
            document.getElementById('SignIn').textContent = 'Sign out';
          
        } else {
            // User is signed out.
            // [START_EXCLUDE]
            //document.getElementById('SignInStatus').textContent = 'Signed out';
            document.getElementById('SignIn').textContent = 'Sign in';
            //document.getElementById('AccDetails').textContent = 'null';
            // [END_EXCLUDE]
        }
        // [START_EXCLUDE silent]
        document.getElementById('SignIn').disabled = false;
        // [END_EXCLUDE]
    });
    // [END authstatelistener]

    document.getElementById('SignIn').addEventListener('click', toggleSignIn, false);
    document.getElementById('PasswordReset').addEventListener('click', sendPasswordReset, false);
}

window.onload = function () {
    initApp();
};