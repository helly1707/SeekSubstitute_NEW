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

function updateData()
{
    firebase.auth().onAuthStateChanged(function (user) {
        if (user) {
            var newData = {
                fullname: document.getElementById('name').value,
                subject: document.getElementById('subject').value,
                qualification: document.getElementById('qualification').value,
                country: document.getElementById('country').value,
                bio: document.getElementById('txtaboutme').value
            }
            console.log(document.getElementById('email').value);
            console.log(newData);
            firebase.database().ref('UsersData/' + user.uid).update(newData).then(function (user) {
                document.location.href = "frmMyProfile.aspx";
            });
        }
    });
}

function readData() {
    firebase.auth().onAuthStateChanged(function (user) {
        if (user) {
            var data = "";
            var id = user.uid;
            var leadsRef = firebase.database().ref('UsersData/'+id);
            leadsRef.on('value', function (snapshot) {
                snapshot.forEach(function (childSnapshot) {
                    switch(childSnapshot.key)
                    {
                        case 'bio':
                            document.getElementById('txtaboutme').value = childSnapshot.val();
                            break;

                        case 'country':
                            document.getElementById('country').value = childSnapshot.val();
                            break;

                        case 'email':
                            document.getElementById('email').value = childSnapshot.val();
                            break;

                        case 'fullname':
                            document.getElementById('name').value = childSnapshot.val();
                            document.getElementById('lblUser').textContent = 'Welcome! '+ childSnapshot.val();
                            break;

                        case 'qualification':
                            document.getElementById('qualification').value = childSnapshot.val();
                            break;

                        case 'subject':
                            document.getElementById('subject').value = childSnapshot.val();
                            break;
                    }
                });
            });

        } else {
            // User is signed out.
            document.location.href = "frmLogin.aspx";
            console.log("Hello");
            // [END_EXCLUDE]
        }
    });
}

function initApp() {
    // Listening for auth state changes.
    // [START authstatelistener]
   
    firebase.auth().onAuthStateChanged(function (user) {
        if (user) {
            readData();
        } else {
            // User is signed out.
            // [START_EXCLUDE]

            // [END_EXCLUDE]
        }
    });
}
window.onload = function () {
    initApp();
};