# Stage 1: Build (opcional si ya compilaste)
# Si ya compilaste en Visual Studio, esta etapa se puede omitir
FROM mcr.microsoft.com/dotnet/sdk:9.0 AS build
WORKDIR /app
COPY . .
RUN dotnet publish -c Release -o out

# Stage 2: Runtime
FROM mcr.microsoft.com/dotnet/aspnet:9.0
WORKDIR /app
COPY bin/Release/net9.0/publish/ .  # <-- asegúrate de que esta sea la carpeta con tu DLL
ENTRYPOINT ["dotnet", "TeamNaGuara.dll"]