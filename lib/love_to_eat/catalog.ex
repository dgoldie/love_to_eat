defmodule LoveToEat.Catalog do
  @moduledoc """
  The Catalog's context.
  """

  import Ecto.Query, warn: false
  alias LoveToEat.Repo
  alias LoveToEat.Catalog.Truck
  # alias LoveToEat.Catalog.Transformer

  def list_trucks do
    Repo.all(Truck)
  end

  # def list_products_by_food(food) do
  #   Truck.Query.by_food(food)
  #   |> Repo.all()
  # end

end
