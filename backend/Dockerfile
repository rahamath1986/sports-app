# Stage 1: Build the application
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /src

# Copy project files and restore dependencies
# Using backend/ prefix assuming the build context is the repository root
COPY ["backend/WebAPI/WebAPI.csproj", "backend/WebAPI/"]
COPY ["backend/Application/Application.csproj", "backend/Application/"]
COPY ["backend/Infrastructure/Infrastructure.csproj", "backend/Infrastructure/"]
COPY ["backend/Domain/Domain.csproj", "backend/Domain/"]

RUN dotnet restore "backend/WebAPI/WebAPI.csproj"

# Copy the rest of the code
COPY . .

# Build the WebAPI project
WORKDIR "/src/backend/WebAPI"
RUN dotnet build "WebAPI.csproj" -c Release -o /app/build

# Stage 2: Publish the application
FROM build AS publish
RUN dotnet publish "WebAPI.csproj" -c Release -o /app/publish /p:UseAppHost=false

# Stage 3: Final Runtime Image
FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS final
WORKDIR /app
COPY --from=publish /app/publish .

# Render requires the app to listen on port 10000 by default or via PORT env var
ENV ASPNETCORE_URLS=http://+:10000
EXPOSE 10000

ENTRYPOINT ["dotnet", "WebAPI.dll"]
