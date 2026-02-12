# =========================
# Stage 1: Build
# =========================
FROM mcr.microsoft.com/dotnet/sdk:9.0 AS build
WORKDIR /app

# Copia todos los archivos del proyecto
COPY . .

# Compila y publica la app en la carpeta "out"
RUN dotnet publish TeamNaGuara.csproj -c Release -o out

# =========================
# Stage 2: Runtime
# =========================
FROM mcr.microsoft.com/dotnet/aspnet:9.0
WORKDIR /app

# Copia la app compilada desde la etapa de build
COPY --from=build /app/out .

# Comando para ejecutar la app
ENTRYPOINT ["dotnet", "TeamNaGuara.dll"]
