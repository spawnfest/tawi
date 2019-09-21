defmodule Techevents.Fetchers.Eventbrite do
  @moduledoc """
  Send requests out to eventbrite
  """
  use Tesla
  plug Tesla.Middleware.BaseUrl, "https://www.eventbriteapi.com/v3"

  plug Tesla.Middleware.Headers, [
    {"authorization", "Bearer #{Application.get_env(:techevents, :eventbrite_token)}"}
  ]

  plug Tesla.Middleware.JSON

  def search_events do
    get("/events/search/")
  end
end
