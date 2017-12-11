# rethinkdb-swarm

Automatically creates a RethinkDB cluster using Docker Swarm.
You can use the supplied `docker-compose.yml` file as an example to deploy
this project as a Docker Stack.
The `deploy.sh` script uses the compose file to deploy a stack.

## Deploying

When deploying your cluster, first add the stack to your swarm:

```sh
  $ ./deploy.sh
```

Then update one of your nodes to indicate it as a production node for rethinkdb:

```sh
  $ docker node update --label-add rethinkdb=production <NODE>
```

When the RethinkDB admin is accessible, add the label to your other nodes.

## Healthcheck

Healthcheck is performed by `probe.go`, which is based on
https://github.com/rosskukulinski/rethinkdb-kubernetes.

The probe connects to the server and executes a basic command.
