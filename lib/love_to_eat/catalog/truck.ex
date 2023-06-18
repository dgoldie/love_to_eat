defmodule LoveToEat.Catalog.Truck do
  use Ecto.Schema

  @derive {Jason.Encoder, only: [:applicant, :location_description, :address, :dayshours,
                                 :food_items, :latitude, :longitude, :location]}
  schema "trucks" do
    field(:location_id, :string)
    field(:applicant, :string)
    field(:facility_type, :string)
    field(:cnn, :string)
    field(:location_description, :string)
    field(:address, :string)
    field(:blocklot, :string)
    field(:block, :string)
    field(:lot, :string)
    field(:permit, :string)
    field(:status, :string)
    field(:food_items, :string)
    field(:x, :string)
    field(:y, :string)
    field(:latitude, :string)
    field(:longitude, :string)
    field(:schedule, :string)
    field(:dayshours, :string)
    field(:noi_sent, :string)
    field(:approved, :string)
    field(:received, :string)
    field(:prior_permit, :string)
    field(:expiration_date, :string)
    field(:location, :string)
    field(:fire_prevention_districts, :string)
    field(:police_districts, :string)
    field(:supervisor_districts, :string)
    field(:zipcodes, :string)
    field(:neighborhoods_old, :string)
  end
end

# def update_list(list) do
#   list
#   |> Enum.map(fn x ->
#     Enum.map(x, fn {k, v} ->
#       new_key = key_to_struct(k)
#       %{new_key => v}
#     end)
#   end)
# end
