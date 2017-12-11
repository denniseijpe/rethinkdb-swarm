# rethinkdb-swarm

Automatically creates a RethinkDB cluster using Docker Swarm.
You can use the supplied docker-compose.yml file as an example to deploy
this project as a Docker Stack.
The `deploy.sh` script uses the compose file to deploy a stack.

## Healthcheck

Healthcheck is performed by `probe.go`, which is based on
https://github.com/rosskukulinski/rethinkdb-kubernetes.

The probe connects to the server and executes a basic command.
