# Build and tag images
docker build -t ddydeveloper/make-a-meet-client:latest       -f ./4_docker/client-app/Dockerfile ./4_docker/client-app
docker build -t ddydeveloper/make-a-meet-users-api:latest    -f ./4_docker/users/Dockerfile      ./4_docker/users
docker build -t ddydeveloper/make-a-meet-meetings-api:latest -f ./4_docker/meetings/Dockerfile   ./4_docker/meetings
docker build -t ddydeveloper/make-a-meet-database:latest     -f ./4_docker/database/Dockerfile   ./4_docker/database

# Push images to registry
docker push ddydeveloper/make-a-meet-client:latest
docker push ddydeveloper/make-a-meet-users-api:latest
docker push ddydeveloper/make-a-meet-meetings-api:latest
docker push ddydeveloper/make-a-meet-database:latest

# kubectl delete secret database-secret
# kubectl create secret generic database-secret --from-literal SA_PASSWORD="P@ssw0rd" --from-literal USERS_DB="Server=database-cluster-ip-service;DataBase=Users;User Id=sa;Password=P@ssw0rd;Connection Timeout=30;" --from-literal MEETINGS_DB="Server=database-cluster-ip-service;DataBase=Meetings;User Id=sa;Password=P@ssw0rd;Connection Timeout=30;"
