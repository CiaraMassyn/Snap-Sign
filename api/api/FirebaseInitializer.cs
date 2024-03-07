using FirebaseAdmin;
using Google.Apis.Auth.OAuth2;
using Microsoft.Extensions.DependencyInjection;

public static class FirebaseInitializer
{
    public static void InitializeFirebase(this WebApplicationBuilder builder)
    {
        // Import the functions you need from the SDKs you need
        import { initializeApp }
        from "firebase/app";
        import { getAnalytics }
        from "firebase/analytics";
        // TODO: Add SDKs for Firebase products that you want to use
        // https://firebase.google.com/docs/web/setup#available-libraries

        // Your web app's Firebase configuration
        // For Firebase JS SDK v7.20.0 and later, measurementId is optional
        const firebaseConfig = {
  apiKey: "AIzaSyDNdRri1IrKHHHVqmX_ldTsz4FaTZkd9ec",
  authDomain: "snapsign-6d108.firebaseapp.com",
  projectId: "snapsign-6d108",
  storageBucket: "snapsign-6d108.appspot.com",
  messagingSenderId: "10815159984",
  appId: "1:10815159984:web:362ca68c85cc269864c575",
  measurementId: "G-9TTB3DYYW6"
};

    // Initialize Firebase
    const app = initializeApp(firebaseConfig);
    const analytics = getAnalytics(app);
}
}
