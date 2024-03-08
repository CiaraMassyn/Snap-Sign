using FirebaseAdmin;
using Google.Apis.Auth.OAuth2;
using Microsoft.Extensions.DependencyInjection;

public static class FirebaseInitializer
{
    public static void InitializeFirebase(this WebApplicationBuilder builder)
    {
        /*var firebaseCredentials = GoogleCredential.FromJson("your-firebase-config-json");

        var firebaseApp = FirebaseApp.Create(new AppOptions
        {
            Credential = firebaseCredentials,
        });

        builder.Services.AddSingleton<FirebaseApp>(firebaseApp);*/
    }
}
