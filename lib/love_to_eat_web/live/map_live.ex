defmodule LoveToEatWeb.MapLive do
  use LoveToEatWeb, :live_view

  alias LoveToEat.Repo
  alias LoveToEat.Catalog.Truck.Query

  @impl true
  def mount(_params, _session, socket) do
    IO.puts "mount map live *******************"
    {:ok, socket}
  end

  @impl true
  def handle_event("add_truck_data", params, socket) do
    IO.puts "add_truck_data"
    IO.inspect(params)
    italian =
      Query.by_food("italian")
      |> Repo.all()

    IO.puts "new_sighting returns.........."
    IO.inspect(italian)
    assign(
      socket, %{
        trucks: italian
      }
    )

    {:noreply, push_event(socket, "new-markers", %{trucks: italian})}
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
