defmodule LoveToEat.Transformer do
  alias LoveToEat.{Reader, Truck, Repo}

  def import(filename) do
    Reader.read(filename)
    |> translate()
    |> load_into_db()
  end

  def translate(original_list) do
    original_list
    |> Enum.map(fn x ->
      Enum.reduce(x, %Truck{}, fn {key, value}, acc ->
        Map.put(acc, key_to_struct(key), value)
      end)
    end)
  end

  def load_into_db(data) do
    data
    |> Enum.each(fn x -> Repo.insert!(x) end)
  end

  defp key_to_struct(str) do
    to_struct_atom = %{
      "locationid" => :locationid,
      "Applicant" => :applicant,
      "FacilityType" => :facility_type,
      "cnn" => :cnn,
      "LocationDescription" => :location_description,
      "Address" => :address,
      "blocklot" => :blocklot,
      "block" => :block,
      "lot" => :lot,
      "permit" => :permit,
      "Status" => :status,
      "FoodItems" => :food_items,
      "X" => :x,
      "Y" => :y,
      "Latitude" => :latitude,
      "Longitude" => :longitude,
      "Schedule" => :schedule,
      "dayshours" => :dayshours,
      "NOISent" => :noi_sent,
      "Approved" => :approved,
      "Received" => :received,
      "PriorPermit" => :prior_permit,
      "ExpirationDate" => :expiration_date,
      "Location" => :location,
      "Fire Prevention Districts" => :fire_prevention_districts,
      "Police Districts" => :police_districts,
      "Supervisor Districts" => :supervisor_districts,
      "Zip Codes" => :zip_codes,
      "Neighborhoods (old)" => :neighborhoods_old
    }

    new_key =
      to_struct_atom
      |> Map.get(str)

    new_key
  end
end
