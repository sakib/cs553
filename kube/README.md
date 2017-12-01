// setup kubernetes cluster with kops (aws) or minikube (local, single-node)
// google it

// if deployment/service yaml files don't exist...
kompose convert -f docker-stack-k8s.yml

// deploy the service
kubectl create -f .
kubectl get svc vote result // see vote-port, result-port
// go to <any-aws-node-external-addr>:<vote-port>
// go to <any-aws-node-external-addr>:<result-port>

// update the service brutally
kubectl delete services --all
kubectl delete deployments --all
kubectl delete pods --all
kubectl create -f .

// gentle rolling updates
kubectl get deployments // see name-of-deployment
kubectl edit deployment/<name-of-deployment>
