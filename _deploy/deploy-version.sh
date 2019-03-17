# Build and tag images
docker build -t ddydeveloper/make-a-meet-client:$SHA       -f ../3_docker/client-app/Dockerfile ../3_docker/client-app
docker build -t ddydeveloper/make-a-meet-users-api:$SHA    -f ../3_docker/users/Dockerfile      ../3_docker/users
docker build -t ddydeveloper/make-a-meet-meetings-api:$SHA -f ../3_docker/meetings/Dockerfile   ../3_docker/meetings
docker build -t ddydeveloper/make-a-meet-database:$SHA     -f ../3_docker/database/Dockerfile   ../3_docker/database

# Push images to registry
docker push ddydeveloper/make-a-meet-client:$SHA
docker push ddydeveloper/make-a-meet-users-api:$SHA
docker push ddydeveloper/make-a-meet-meetings-api:$SHA
docker push ddydeveloper/make-a-meet-database:$SHA