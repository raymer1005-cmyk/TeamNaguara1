using Microsoft.AspNetCore.Builder;
using Microsoft.Extensions.DependencyInjection;

var builder = WebApplication.CreateBuilder(args);

// Registrar servicios necesarios
builder.Services.AddControllers();

// Construir la app
var app = builder.Build();

// Mapear rutas
app.MapControllers(); // Mapea todos los controladores
app.MapGet("/", () => "Hello World!"); // Ruta de prueba

// Ejecutar la aplicación
app.Run();
