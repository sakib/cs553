Comparing Deployment Infrastructures
====================================

Author: Sakib Jalal
Course: CS 553, Internet Services
Professor: Richard Martin
Semester: Fall 2017
Partners: Tanya Balaraju, Wael Ayadi, Aditya Geria

This project compares container deployment infrastructures. We use a voting app that has persistent storage on a data volume.

The app will be running at [http://localhost:5000](http://localhost:5000), and the results will be at [http://localhost:5001](http://localhost:5001).

<subdirectory> contains instructions for deploying this app, composed of 5 microservices, to <container-deployment-infrastructure>:
  - `swarm` -> Docker Swarm
  - `kube` -> Kubernetes
  - `mesos` -> Mesos/Marathon

All of these have been successfully run on small clusters AWS EC2 instances.

Architecture
-----

![Architecture diagram](architecture.png)

* A Python webapp which lets you vote between two options
* A Redis queue which collects new votes
* A .NET worker which consumes votes and stores them in…
* A Postgres database backed by a Docker volume
* A Node.js webapp which shows the results of the voting in real time

