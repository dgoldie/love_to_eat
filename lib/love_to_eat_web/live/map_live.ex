defmodule LoveToEatWeb.MapLive do
  use LoveToEatWeb, :live_view

  alias LoveToEat.Repo
  alias LoveToEat.Catalog.Truck.Query

  @impl true
  def mount(_params, _session, socket) do
    IO.puts "mount map live *******************"

    {:ok,
      assign(socket,
        trucks: [],
        foods_types: ~w(italian mexican chinese burgers pizza japanese korean sandwiches sushi thai vietnamese),
        selected_trucks: nil
    )}
  end

  @impl true
  def handle_event("find-trucks-by-food", params, socket) do
    IO.puts "find-trucks-by-food---------------------------------------"
    food_type = params["food_filter"]
    IO.inspect(food_type)

    selected_trucks =
      Query.by_food(food_type)
      |> Repo.all()

    socket =
      socket
      |> assign(:selected_trucks, selected_trucks)
      |> assign(:food_type, food_type)
      |> push_event("add-selected-trucks", %{trucks: selected_trucks})

    {:noreply, socket}
    # {:noreply,  %{new_trucks: selected_trucks}, socket}
    # {:noreply, push_event(socket, "new_trucks", %{new_trucks: selected_trucks} )}
  end

  # defp food_types() do
  #   ~w(italian mexican chinese burgers pizza japanese, korean sandwiches sushi thai vietnamese)
  # end
end
