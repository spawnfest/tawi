defmodule TecheventsWeb.PageController do
  use TecheventsWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
