defmodule LoveToEat.Repo.Migrations.CreateTrucks do
  use Ecto.Migration

  def change do
    create table(:trucks) do
      add(:location_id, :string)
      add(:applicant, :string)
      add(:facility_type, :string)
      add(:cnn, :string)
      add(:location_description, :string)
      add(:address, :string)
      add(:blocklot, :string)
      add(:block, :string)
      add(:lot, :string)
      add(:permit, :string)
      add(:status, :string)
      add(:food_items, :text)
      add(:x, :string)
      add(:y, :string)
      add(:latitude, :string)
      add(:longitude, :string)
      add(:schedule, :string)
      add(:dayshours, :string)
      add(:noi_sent, :string)
      add(:approved, :string)
      add(:received, :string)
      add(:prior_permit, :string)
      add(:expiration_date, :string)
      add(:location, :string)
      add(:fire_prevention_districts, :string)
      add(:police_districts, :string)
      add(:supervisor_districts, :string)
      add(:zipcodes, :string)
      add(:neighborhoods_old, :string)
    end
  end
end

# defstruct locationid: "",
#           applicant: "",
#           facility_type: "",
#           cnn: "",
#           location_description: "",
#           address: "",
#           blocklot: "",
#           block: "",
#           lot: "",
#           permit: "",
#           status: "",
#           food_items: "",
#           x: "",
#           y: "",
#           latitude: "",
#           Longitude: "",
#           schedule: "",
#           dayshours: "",
#           noi_sent: "",
#           approved: "",
#           received: "",
#           prior_permit: "",
#           expiration_date: "",
#           location: "",
#           fire_prevention_districts: "",
#           police_districts: "",
#           supervisor_districts: "",
#           zip_codes: "",
#           neighborhoods_old: "
