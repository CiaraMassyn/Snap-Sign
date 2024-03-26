using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.Hosting;
using FirebaseAdmin;
using Google.Apis.Auth;
using Google.Apis.Auth.OAuth2;

public class Program
{
    public static void Main(string[] args)
    {
        FirebaseApp.Create(new AppOptions()
        {
            Credential = GoogleCredential.FromJson(@"{
                'type': 'service_account',
                'project_id': 'snapsign-6d108',
                'private_key_id': '0211f289d4c62293a0ddc48b3b0b4feca2582031',
                'private_key': '-----BEGIN PRIVATE KEY-----\nMIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQDtJ8gRZFaij9AN\n/bV7d/Rl0uyOUnXpUt86EHGiZfIr08QAV6Tp/Rk9UnddxAZweu+QMTqTAzDmXg6r\n1WdFBCdeRjWACTSONfCrdNgivvLQR2hx9xgJqKorVTUXCitn2DBCdha7M8BAiG+Y\nnTIi9BsSsAYV9GMrg8B+PCujaHSRLpK66aBmObe1/eTbIWN91dOwr90zZSHjkPR2\n92C28ZWZRGp3yTBqKegwsEjyN7wE1ikZl6TcfqmHhoMKK5S+jKt9qD588l5/GATp\nUTWcUJ7rIu9g3BBJPGKXpRIWDCyGqQQ9Xaus5Jw8yRwhy24A7Udn8Ps7lt0SGdHr\nFYVRg3szAgMBAAECggEAJDdOhLq+G4jQZ3U7+TUfg/XlfR3XoYAv1GX9dyTlX3mx\nNVzXs4nyCEd8hhEGQLgYDHzlaoedY0Na2d/hgOHPrJnBLXfPvaXmxnA2BNGvMqJX\nr2EMxoYqJ9WVIXBtTNLwGmjT3iuwK3VfwWkZZnVrtaYJj+G9y+qMrgUR+ZwygkGq\nCSV5Y6XA8uVwdVGVClF1s2YcpFfjub3m4XSZF/8+yv6RYPSkyhoekSaNu/S1GyTb\n2zzpt3/BuHVcSfUXLYPTdh1cvYiPgsF9cUdSLRIyGc8pGDJmU8Madblm8sPcGwLX\nPTSOv+7/7JCKqAr6l+2tv12E8Eig57y7rqWnZM9fDQKBgQD+CY87KNrNw8KJvXok\ndtLACOxKq1jkZ6Y+AtI3SUNVCwlh5rKkRjUZWh1I2CzeGVj7WuD2NCawUHcUl1gT\n2/T7zvReiaEO2TQUT80bJxeDb4uwXkcU41kH03SH/94iggkGK0FxlPrmCq4sx/9k\nQKCTXsyzwuE2DWAncQRLCtdTrwKBgQDu/NUhtBjIMNTA2IvJT4QY6lr9vBD/Agq6\n+NiK6HKNN/SwnMTE3Ud+DFWLlrDh2rXBYpeSGLRvtYV1vS3hKG6SnQCMMb+fyazw\njwavlSYqd740oOziTyz2F2XQ92Ib1TydkFgXexgEjkE9AKVm0IonD0Cn29BqhvzT\ncMlJDIY9vQKBgDxTctL+qa8RXMIu37GHEhcOR2aX+B0NTBoPu3HrkPTCETFRgnym\nO3fQwYGJ7GW1qT7PXvq4ebOG+DBInF7i7fNaOwe0MS4AgHCOXsui5d+NfqOcT87z\nCjJkkZi2Nz8EmDYB0aGyWj6ErMXvnINnIXq9mWjaz3ZxiLL1EKrtYSL7AoGAfuXz\niczmZ849+hRBzWgSfWRbYmWtJKsB5Zvi54db5A51OB5WAS56Gr0T42XlkFegsQnX\n77R8guCA+C62oNrmM6V4N/jmhkMBOE7JvwvUUzJ35dwZTGW8OwPbhWUGTD8iy4ts\nqzMqYqjijTC9ouVSpkDcFQWMGjSJJQC7cLVcxoUCgYEAlt5cKzAOV3bbmgM7pUuV\nM4bfjVKfG7E5jRbYwYCm8FU1oQy0AwSPyN9JPVBg8AgCCIvN+c14K6qXPV40L/xN\nhpCmy3BhjB38aBgknGE779DL6GiGQgU4Gohc3DaedDY1GHbMQqY13aPPP1ZRUTF8\n8XaugWSRWsGhavSR02XQvTg=\n-----END PRIVATE KEY-----\n',
                'client_email': 'firebase-adminsdk-1v7nu@snapsign-6d108.iam.gserviceaccount.com',
                'client_id': '108572072145719066076',
                'auth_uri': 'https://accounts.google.com/o/oauth2/auth',
                'token_uri': 'https://oauth2.googleapis.com/token',
                'auth_provider_x509_cert_url': 'https://www.googleapis.com/oauth2/v1/certs',
                'client_x509_cert_url': 'https://www.googleapis.com/robot/v1/metadata/x509/firebase-adminsdk-1v7nu%40snapsign-6d108.iam.gserviceaccount.com'
            }")
        });

        var builder = WebApplication.CreateBuilder(args);

        // Add services to the container.
        builder.Services.AddControllers();
        // Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
        builder.Services.AddEndpointsApiExplorer();
        builder.Services.AddSwaggerGen();

        var app = builder.Build();

        if (app.Environment.IsDevelopment())
        {
            app.UseSwagger();
            app.UseSwaggerUI();
        }

        app.UseHttpsRedirection();

        app.UseAuthorization();

        app.MapControllers();

        app.Run();
    }
}


/*var builder = WebApplication.CreateBuilder(args);

// Add services to the container.

builder.Services.AddControllers();
// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();

var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.UseHttpsRedirection();

app.UseAuthorization();

app.MapControllers();

app.Run();*/