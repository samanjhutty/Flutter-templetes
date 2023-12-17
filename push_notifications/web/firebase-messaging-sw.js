// Import the functions you need from the SDKs you need
import { initializeApp } from "firebase/app";
import { getMessaging } from "firebase/messaging/sw";
// TODO: Add SDKs for Firebase products that you want to use
// https://firebase.google.com/docs/web/setup#available-libraries

// Your web app's Firebase configuration
// For Firebase JS SDK v7.20.0 and later, measurementId is optional
const firebaseConfig = {
  apiKey: "AIzaSyCBZH9OAgtFqhQt1fOetFxa9VAFY5tE174",
  authDomain: "fb-push-notifications-aa7b6.firebaseapp.com",
  projectId: "fb-push-notifications-aa7b6",
  storageBucket: "fb-push-notifications-aa7b6.appspot.com",
  messagingSenderId: "71327912960",
  appId: "1:71327912960:web:2f7a8ba1848c6c8401f4e5",
  measurementId: "G-JNZYY804JJ"
};

// Initialize Firebase
const app = initializeApp(firebaseConfig);
const messaging = getMessaging(firebaseConfig);
