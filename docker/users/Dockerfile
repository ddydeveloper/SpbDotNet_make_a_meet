FROM microsoft/dotnet:2.1-sdk AS build
WORKDIR /app

# copy csproj and restore as distinct layers
COPY UsersApi/*.sln .
COPY UsersApi/UsersApi/*.csproj ./MeetingsApi/

# copy everything else and build app
COPY UsersApi/UsersApi/. ./UsersApi/
WORKDIR /app/UsersApi
RUN dotnet restore
RUN dotnet publish -o out

# Build runtime image
FROM microsoft/dotnet:2.1-aspnetcore-runtime AS runtime
WORKDIR /app
COPY --from=build /app/UsersApi/out ./

EXPOSE 5001
CMD ASPNETCORE_URLS=http://*:5001  dotnet UsersApi.dll