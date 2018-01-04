importScripts('https://www.gstatic.com/firebasejs/3.9.0/firebase-app.js');
importScripts('https://www.gstatic.com/firebasejs/3.9.0/firebase-messaging.js');

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

const messaging = firebase.messaging();

messaging.setBackgroundMessageHandler(function (payload) {
    console.log('[firebase-messaging-sw.js] Received background message ', payload);
    const title = "Hello World";
    const options = {
        body: payload.data.status
    };
    return self.registration.showNotification(title,options);
});

