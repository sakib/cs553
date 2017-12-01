// initialize cluster
docker swarm init

// deploy the app
docker stack deploy -c docker-stack.yml voteswarm

// to update any part, edit docker-stack.yml and run deploy again.
