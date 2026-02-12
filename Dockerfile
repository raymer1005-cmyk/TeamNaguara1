# =========================
# Stage 1: Build (compila tu app)
# =========================
FROM mcr.microsoft.com/dotnet/sdk:9.0 AS build
WORKDIR /app

# Copia todos los archivos del proyecto
COPY . .

# Publica la app en la carpeta "out"
RUN dotnet publish TeamNaGuara.csproj -c Release -o out

# =========================
# Stage 2: Runtime (ejecuta la app)
# =========================
FROM mcr.microsoft.com/dotnet/aspnet:9.0
WORKDIR /app

# Copia los archivos compilados del stage build
COPY --from=build /app/out .

# Comando para iniciar la app
ENTRYPOINT ["dotnet", "TeamNaGuara.dll"]
