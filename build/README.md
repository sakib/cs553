// This folder stores the source code for the voting app.

// build your images or pull them from docker hub
docker-compose up

// tag and push your images to docker hub
docker login // with your-username and pass
docker images // see image names
docker tag <old-name> <your-username>/<repo-name>:<any-tag>
docker push <your-username>/<repo-name>:<any-tag>
