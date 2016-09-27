# HelloPhoenix

When I start using a new tool or technology, I like to build a small sample application from which I can fork future projects.
I also try to learn new things and apply emerging practices.
That is the purpose of this project.
With this application, I aimed to learn my way around the [Phoenix framework](http://www.phoenixframework.org/),
[Prometheus](https://prometheus.io/), [GraphQL](http://graphql.org/), and [Docker](https://www.docker.com).

To start this application, you'll first have to spin up the PostgreSQL and Prometheus containers.
Export an environment variable stating the private IP of your dev machine.
Then, spin up the containers.

```
docker-compose down
export PRIVATE_IP=$(ifconfig | ack '\b(10|192)\.[\d]+\.[\d]+\.[\d]+\b' | awk '{print $2}')
docker-compose up --build -d
docker-compose logs -f
```

With those running, the database will need to be created and seeded.

```
mix ecto.create
mix ecto.migrate
mix run priv/repo/seeds.exs
```

Now, the application itself can be started.

```
iex -S mix phoenix.server
```

You can connect to your database if you'd like.
The username and password are both `postgres`.

```
pgcli -U postgres -W -d hello_phoenix_dev -h localhost -p 5432
```

With everything running, it's time to open your browser to the application and the Prometheus interface.

```
open http://localhost:9090/
open http://localhost:4000/
```
