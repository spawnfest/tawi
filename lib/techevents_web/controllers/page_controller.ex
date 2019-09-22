defmodule TecheventsWeb.PageController do
  use TecheventsWeb, :controller

  alias Techevents.Fetchers.Eventbrite

  def index(conn, _params) do
    events = Eventbrite.search_events()
    render(conn, "index.html", events: events)
  end
end
