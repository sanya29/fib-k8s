docker build -t sanya29/multi-client -f ./client/Dockerfile ./client 
docker build -t sanya29/multi-server -f ./server/Dockerfile ./server 
docker build -t sanya29/multi-worker -f ./worker/Dockerfile ./worker
docker push sanya29/multi-client 
docker push sanya29/multi-server 
docker push sanya29/multi-worker 
kubectl apply -f k8s 
kubectl rollout restart deployment/server-deployment
kubectl rollout restart deployment/client-deployment
kubectl rollout restart deployment/worker-deployment