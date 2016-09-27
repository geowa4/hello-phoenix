defmodule HelloPhoenix.PageController do
  use HelloPhoenix.Web, :controller

  def index(conn, _params) do
    conn
    |> put_flash(:info, "Information flass message")
    |> put_flash(:error, "Oh no!")
    |> render("index.html")
  end
end
