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

function toggleLogOut() {
    if (firebase.auth().currentUser) {
        // [START signout]
        firebase.auth().signOut();
        document.location.href = "frmLogin.aspx";
        // [END signout]
    }
}

function rejectJob(lectureId)
{
    var txt;

    if (confirm("Are You Sure to Reject a Job?") == true) {
        txt = "You pressed OK!";
    } else {
        txt = "You pressed Cancel!";
    }

    if(txt == "You pressed OK!")
    {
        firebase.database().ref('seeksubstitute/schedule/'+lectureId).once('value', function (snapshot) {
            firebase.database().ref('seeksubstitute/NotGoingSchedule/' + lectureId).set(snapshot.val(), function (error) {
                if (!error) {
                    // Delete the original item, so that the list stays small
                    firebase.database().ref('seeksubstitute/schedule/' + lectureId).remove();
                }
            });

        });
    }
}

function acceptJob(lectureId) {
    var txt;
    if (confirm("Are You Sure to Accept a Job?") == true) {
        txt = "You pressed OK!";
    } else {
        txt = "You pressed Cancel!";
    }

    if (txt == "You pressed OK!") {
        firebase.database().ref('seeksubstitute/NotGoingSchedule/' + lectureId).once('value', function (snapshot) {
            firebase.database().ref('seeksubstitute/schedule/' + lectureId).set(snapshot.val(), function (error) {
                if (!error) {
                    firebase.database().ref('seeksubstitute/NotGoingSchedule/' + lectureId).remove();
                }
            });

        });
    }
}

function readData() {
    firebase.auth().onAuthStateChanged(function (user) {
        if (user) {
            // User is signed in.
            //document.getElementById('CurrentUser').textContent = user.email;
            var sirId = user.uid;
            var data = "";
            var leadsRef = firebase.database().ref('seeksubstitute/schedule').orderByChild('sirId').equalTo(sirId);
            leadsRef.on('value', function (snapshot) {
                snapshot.forEach(function (childSnapshot) {
                    //console.log(childSnapshot.val());
                    if (data === '') {
                        data = "[" + JSON.stringify(childSnapshot.val());
                    }
                    else {
                        data += "," + JSON.stringify(childSnapshot.val());
                    }
                });
                document.getElementById('demo').textContent = data + "]";
                //console.log(data);
                //window.opener.location.reload();
            });

        } else {
            // User is signed out.
            document.location.href = "frmLogin.aspx";
            console.log("Hello");
            // [END_EXCLUDE]
        }
    });
}

function readRejectedData() {
    firebase.auth().onAuthStateChanged(function (user) {
        if (user) {
            console.log("Rejected Data");
            var sirId = user.uid;
            var data = "";
            var leadsRef = firebase.database().ref('seeksubstitute/NotGoingSchedule').orderByChild('sirId').equalTo(sirId);
            leadsRef.on('value', function (snapshot) {
                snapshot.forEach(function (childSnapshot) {
                    //console.log(childSnapshot.val());
                    if (data === '') {
                        data = "[" + JSON.stringify(childSnapshot.val());
                    }
                    else {
                        data += "," + JSON.stringify(childSnapshot.val());
                    }
                });
                document.getElementById('demoReject').textContent = data + "]";
                //console.log(data);
                //window.opener.location.reload();
            });

        } else {
            // User is signed out.
            document.location.href = "frmLogin.aspx";
            // [END_EXCLUDE]
        }
    });
}

function initApp() {
    firebase.auth().onAuthStateChanged(function (user) {
        if (user) {
            var data = "";
            firebase.database().ref('Users').once('value', function (snapshot) {
                snapshot.forEach(function (childSnapshot) {
                    if (data === '') {
                        data = "[" + JSON.stringify(childSnapshot.val());
                    }
                    else {
                        data += "," + JSON.stringify(childSnapshot.val());
                    }
                });
                console.log("Dfdf " + data);
                document.getElementById('emailid').textContent = data + "]";
            });
        } else {
            // User is signed out.
            document.location.href = "frmLogin.aspx";
            // [END_EXCLUDE]
        }

    });
    //document.getElementById('lnkFeed').addEventListener('click', readData, false);
}

window.onload = function () {
    initApp();
};