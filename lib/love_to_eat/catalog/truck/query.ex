defmodule LoveToEat.Catalog.Truck.Query do
  import Ecto.Query
  alias LoveToEat.Catalog.Truck

  def base, do: Truck

  def by_food(food) do
    from truck in Truck,
      where: ilike(truck.food_items, ^"%#{food}%")
  end



end
