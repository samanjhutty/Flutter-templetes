importScripts("https://www.gstatic.com/firebasejs/8.10.0/firebase-app.js");
importScripts("https://www.gstatic.com/firebasejs/8.10.0/firebase-messaging.js");

firebase.initializeApp(firebaseConfig);
const messaging = firebase.messaging();

const firebaseConfig = {
  apiKey: "AIzaSyCBZH9OAgtFqhQt1fOetFxa9VAFY5tE174",
  authDomain: "fb-push-notifications-aa7b6.firebaseapp.com",
  projectId: "fb-push-notifications-aa7b6",
  storageBucket: "fb-push-notifications-aa7b6.appspot.com",
  messagingSenderId: "71327912960",
  appId: "1:71327912960:web:2f7a8ba1848c6c8401f4e5",
  measurementId: "G-JNZYY804JJ"
};

messaging.setBackgroundMessageHandler(function (payload) {
  const promiseChain = clients
      .matchAll({
          type: "window",
          includeUncontrolled: true
      })
      .then(windowClients => {
          for (let i = 0; i < windowClients.length; i++) {
              const windowClient = windowClients[i];
              windowClient.postMessage(payload);
          }
      })
      .then(() => {
          return registration.showNotification("New Message");
      });
  return promiseChain;
});
self.addEventListener('notificationclick', function (event) {
  console.log('notification received: ', event)
});