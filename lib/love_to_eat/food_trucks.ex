# defmodule LoveTo_Eat.FoodTrucks do
#   defstruct locationid: "",
#             applicant: "",
#             facility_type: "",
#             cnn: "",
#             location_description: "",
#             address: "",
#             blocklot: "",
#             block: "",
#             lot: "",
#             permit: "",
#             status: "",
#             food_items: "",
#             x: "",
#             y: "",
#             latitude: "",
#             Longitude: "",
#             schedule: "",
#             dayshours: "",
#             noi_sent: "",
#             approved: "",
#             received: "",
#             prior_permit: "",
#             expiration_date: "",
#             location: "",
#             fire_prevention_districts: "",
#             police_districts: "",
#             supervisor_districts: "",
#             zip_codes: "",
#             neighborhoods_old: ""
# end

# def map_truck(key, value) do
#   struct_key = to_struct_atom(key)
#   %{struct_key => value}
# end

# to_struct_atom = %{
#   "locationid" => :locationid,
#   "Applicant" => :applicant,
#   "FacilityType" => :facility_type,
#   "cnn" => :cnn,
#   "LocationDescription" => :location_description,
#   "Address" => :address,
#   "blocklot" => :blocklot,
#   "block" => :block,
#   "lot" => :lot,
#   "permit" => :permit,
#   "Status" => :status,
#   "FoodItems" => :food_items,
#   "X" => :x,
#   "Y" => :y,
#   "Latitude" => :latitude,
#   "Longitude" => :longitude,
#   "Schedule" => :schedule,
#   "dayshours" => :dayshours,
#   "NOISent" => :noi_sent,
#   "Approved" => :approved,
#   "Received" => :received,
#   "PriorPermit" => :prior_permit,
#   "ExpirationDate" => :expiration_date,
#   "Location" => :location,
#   "Fire Prevention Districts" => :fire_prevention_districts,
#   "Police Districts" => :police_districts,
#   "Supervisor Districts" => :supervisor_districts,
#   "Zip Codes" => :zip_codes,
#   "Neighborhoods (old)" => :neighborhoods_old
# }

# # locationid,Applicant,FacilityType,cnn,LocationDescription,Address,blocklot,block,lot,permit,Status,FoodItems,X,Y,Latitude,Longitude,
# # Schedule,dayshours,NOISent,Approved,Received,PriorPermit,ExpirationDate,Location,
# # Fire Prevention Districts,Police Districts,Supervisor Districts,Zip Codes,Neighborhoods (old)
