defmodule Techevents.Fetchers.Meetup do
  @moduledoc """
    This module sends requests to meetup
  """
  use Tesla
  import Tesla.Mock
  plug(Tesla.Middleware.BaseUrl, "https://api.meetup.com")

  plug Tesla.Middleware.Headers, [
    {"authorization", "Bearer #{Application.get_env(:techevents, :meetup_token)}"}
  ]
  plug Tesla.Middleware.JSON

  def find_events do
    #Todo: use the proper api, currently we are trying to mock the api,
    #since the meetup api key is provided in a span of 3 to 5 days
    get("/find/upcoming_events")
  end
end
