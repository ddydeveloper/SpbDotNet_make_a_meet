FROM microsoft/dotnet:2.1-sdk AS build
WORKDIR /app/MeetingsApi

COPY *.sln .
COPY MeetingsApi/. ./MeetingsApi/

RUN dotnet restore
RUN dotnet publish -o out

# Build runtime image
FROM microsoft/dotnet:2.1-aspnetcore-runtime AS runtime
WORKDIR /app
COPY --from=build /app/MeetingsApi/out ./

EXPOSE 8002
CMD ASPNETCORE_URLS=http://*:8002  dotnet MeetingsApi.dll