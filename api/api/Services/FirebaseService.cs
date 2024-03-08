using Firebase.Database;
using Firebase.Database.Query;

class FirebaseService
{
    FirebaseClient firebase;

    public FirebaseService(string baseUrl, string apiKey)
    {
        firebase = new FirebaseClient(baseUrl, new FirebaseOptions
        {
            AuthTokenAsyncFactory = () => Task.FromResult(apiKey)
        });
    }

    public async Task<List<T>> GetData<T>(string path)
    {
        return (await firebase.Child(path).OnceAsync<T>()).Select(item => item.Object).ToList();
    }

    public async Task PostData<T>(string path, T data)
    {
        await firebase.Child(path).PostAsync(data);
    }
}
