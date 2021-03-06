# Apply command separately to keep data in secure way
kubectl delete secret database-secret
kubectl create secret generic database-secret --from-literal SA_PASSWORD="P@ssw0rd" --from-literal USERS_DB="Server=database-cluster-ip-service;DataBase=Users;User Id=sa;Password=P@ssw0rd;Connection Timeout=30;" --from-literal MEETINGS_DB="Server=database-cluster-ip-service;DataBase=Meetings;User Id=sa;Password=P@ssw0rd;Connection Timeout=30;"

# Added logging namespace
kubectl delete ns logging
kubectl create ns logging

# Apply workloads and services
kubectl apply -f 5_kubernetes
kubectl set image deployments/client-deployment       client=ddydeveloper/make-a-meet-client:$SHA
kubectl set image deployments/users-api-deployment    users=ddydeveloper/make-a-meet-users-api:$SHA
kubectl set image deployments/meetings-api-deployment meetings=ddydeveloper/make-a-meet-meetings-api:$SHA

# Is used for setting up of the database workload
# kubectl set image deployments/database-deployment  database=ddydeveloper/make-a-meet-database:$SHA