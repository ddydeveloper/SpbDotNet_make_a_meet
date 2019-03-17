FROM microsoft/dotnet:2.1-sdk AS build
WORKDIR /app

# copy csproj and restore as distinct layers
COPY *.sln .
COPY UsersApi/*.csproj ./UsersApi/

# copy everything else and build app
COPY UsersApi/. ./UsersApi/
WORKDIR /app/UsersApi
RUN dotnet restore
RUN dotnet publish -o out

# Build runtime image
FROM microsoft/dotnet:2.1-aspnetcore-runtime AS runtime
WORKDIR /app
COPY --from=build /app/UsersApi/out ./

EXPOSE 8001
CMD ASPNETCORE_URLS=http://*:8001  dotnet UsersApi.dll