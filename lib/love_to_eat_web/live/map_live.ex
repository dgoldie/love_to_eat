defmodule LoveToEatWeb.MapLive do
  use LoveToEatWeb, :live_view

  @impl true
  def mount(_params, _session, socket) do
    IO.puts "mount map live *******************"
    {:ok, socket}
  end

  @impl true
  def handle_event("add_random_sighting", _params, socket) do
    # chinatown = %{latitude: 37.7945, longitude: 122.4048}
    # presidio = %{latitude: 37.7924, longitude: 122.4810}
    # # random_sighting =  generate_random_sighting()
    # haightashbury = %{latitude: 37.77024, longitude: 122.4454 }

    # IO.inspect(presidio)


    # inform the browser / client that there is a new sighting
    sighting = %{
      title: "Presidio",
      label: "P",
      lat: 37.7924,
      lng:  -122.4810
    }

    IO.inspect(sighting)

    {:noreply, push_event(socket, "new_sighting", %{sighting: sighting})}
  end

  # defp generate_random_sighting() do
  #   # https://developers.google.com/maps/documentation/javascript/reference/coordinates
  #   # Latitude ranges between -90 and 90 degrees, inclusive.
  #   # Longitude ranges between -180 and 180 degrees, inclusive
  #   %{
  #     latitude: Enum.random(-90..90),
  #     longitude: Enum.random(-180..180)
  #   }
  # end
end
