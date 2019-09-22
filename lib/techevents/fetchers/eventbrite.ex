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
    {:ok, %Tesla.Env{body: body}} = get("/events/search/?expand=venue&location.address=kenya")
    body["events"] |> get_details()
  end

  def get_details(events) when is_list(events) do
    Enum.map(events, fn event -> get_details(event) end)
  end

  def get_details(event) do
    %{
      description: event["description"]["text"],
      url: event["url"],
      venue: event["venue"]["address"]["localized_address_display"],
      name: event["name"]["text"],
      start: event["start"]["utc"],
      end_date: event["end"]["utc"]
    }
  end
end
