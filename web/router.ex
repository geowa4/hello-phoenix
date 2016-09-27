defmodule HelloPhoenix.Router do
  use HelloPhoenix.Web, :router

  forward "/api", Absinthe.Plug, schema: HelloPhoenix.Schema
  if Mix.env == :dev do
    get "/graphiql", Absinthe.Plug.GraphiQL, schema: HelloPhoenix.Schema
    post "/graphiql", Absinthe.Plug.GraphiQL, schema: HelloPhoenix.Schema
  end

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  scope "/", HelloPhoenix do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    get "/hello", HelloController, :index
    get "/hello/:messenger", HelloController, :show
    resources "/people", PersonController
  end
end
