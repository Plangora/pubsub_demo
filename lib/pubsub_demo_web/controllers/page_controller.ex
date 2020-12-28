defmodule PubsubDemoWeb.PageController do
  use PubsubDemoWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
