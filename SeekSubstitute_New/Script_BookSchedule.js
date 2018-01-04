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

function writeData() {
    firebase.auth().onAuthStateChanged(function (user) {
        if (user) {
            var currentdate = new Date();
            var tstamp = Date.parse(currentdate);//firebase.database.ServerValue.TIMESTAMP;
            var schedDate = document.getElementById("txtDate").value;
            schedDate = schedDate.toString("YYYY-MM-DD");
            var ISODate = new Date(schedDate).toISOString().split('T')[0];
            var newDate = new Date(schedDate).toISOString();
            var oTstamp = Date.parse(newDate) * (-1);

            var userId = user.uid;
            var country_school = document.getElementById('txtCountry').value + '_' + document.getElementById('txtSchool').value;
            var country_school_subject = document.getElementById('txtCountry').value + '_' + document.getElementById('txtSchool').value + '_' + document.getElementById('txtSubject').value;
            var country_subject = document.getElementById('txtCountry').value + '_' + document.getElementById('txtSubject').value;
            var school_subject = document.getElementById('txtSchool').value + '_' + document.getElementById('txtSubject').value;

            var myRef = firebase.database().ref('seeksubstitute/schedule').push();
            var key = myRef.key;

            var newData = {
                [userId]: oTstamp,
                [country_school]: tstamp,
                [country_school_subject]: tstamp,
                [country_subject]: tstamp,
                [school_subject]: tstamp,
                country: document.getElementById('txtCountry').value,
                date: ISODate,
                lectureId: key,
                schoolName: document.getElementById('txtSchool').value,
                sirId: userId,
                subject: document.getElementById('txtSubject').value,
                time: document.getElementById('txtTime').value,
                timestamp: oTstamp
            }
            myRef.set(newData).then(function (user) {
                document.location.href = "frmMyProfile.aspx";
            });

            //if (confirm("Are You Sure to Book a Schedule?") == true) {
            //    myRef.set(newData);
            //    document.getElementById('txtCountry').value = "";
            //    document.getElementById('txtSchool').value = "";
            //    document.getElementById('txtSubject').value = "";
            //    document.getElementById('txtTime').value = "";
            //    document.getElementById("txtDate").value = "";
            //}
        }
    });
}

function initApp() {
    firebase.auth().onAuthStateChanged(function (user) {
        if (user) {
            ////console.log(user.email);
            //// User is signed in.
            //document.getElementById('CurrentUser').textContent = user.email;
            //var uemail = user.email.toUpperCase();
            //document.getElementById('LetterName').textContent = uemail.charAt(0);
        } else {
            // User is signed out.
            document.location.href = "frmLogin.aspx";
            // [END_EXCLUDE]
        }

    });
    document.getElementById('btnSave').addEventListener('click', writeData, false);
}

window.onload = function () {
    initApp();
};