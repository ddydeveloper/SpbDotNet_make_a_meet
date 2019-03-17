FROM microsoft/dotnet:2.1-sdk AS build
WORKDIR /app

# copy csproj and restore as distinct layers
COPY *.sln .
COPY MeetingsApi/*.csproj ./MeetingsApi/

# copy everything else and build app
COPY MeetingsApi/. ./MeetingsApi/
WORKDIR /app/MeetingsApi
RUN dotnet restore
RUN dotnet publish -o out

# Build runtime image
FROM microsoft/dotnet:2.1-aspnetcore-runtime AS runtime
WORKDIR /app
COPY --from=build /app/MeetingsApi/out ./

EXPOSE 8002
CMD ASPNETCORE_URLS=http://*:8002  dotnet MeetingsApi.dll