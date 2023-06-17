# LoveToEat

To start your Phoenix server:

  * Run `mix setup` to install and setup dependencies
  * Start Phoenix endpoint with `mix phx.server` or inside IEx with `iex -S mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Learn more

  * Official website: https://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Forum: https://elixirforum.com/c/phoenix-forum
  * Source: https://github.com/phoenixframework/phoenix

#----------------
## Querys

### Query by Food
value = "italian"
italian = Repo.all(from t in Truck, where: ilike(t.food_items, ^"%#{value}%"))

zoom in on first

### ContentString
convert the truck struct

applicant:
location_description:
address:
food_items:
dayshours:
location ......lat lon



["4","11","lv:phx-F2j5MAFWrQSiCQCH","phx_reply",{"status":"ok","response":{"diff":{"1":{"0":""},"e":[["add-unavailable-dates",{"to":"2023-06-15","from":"2023-06-12"}]]}}}]

["4","8","lv:phx-F2kNpd1gQAREqxSB","phx_reply",{"status":"ok","response":{"diff":{"e":[["new_trucks",{"new_trucks":


[{"applicant":"The New York Frankfurter Co. of CA, Inc. DBA: Annie's Hot Dogs","location_description":"STOCKTON ST: 04TH ST \\ ELLIS ST \\ MARKET ST intersection","dayshours":"","food_items":"Soft pretzels: hot dogs: sausages: chips: popcorn: sodea: coffee: espresso: cappucino: pastries: ice cream: Italian sausages: shish-ka-bob: churros: juice: water: various drinks.","latitude":"37.785469746489916","longitude":"-122.40661576107294","location":"(37.785469746489916, -122.40661576107294)"},{"applicant":"The New York Frankfurter Co. of CA, Inc. DBA: Annie's Hot Dogs","location_description":"STOCKTON ST: OFARRELL ST to GEARY ST (100 - 199)","dayshours":"","food_items":"Soft Pretzels: hot dogs: sausage: chips: popcorn: soda: espresso: cappucino: pastries: ice cream: italian sausages: shish-ka-bob: churros: juice: water: various drinks","latitude":"37.786856111883054","longitude":"-122.40689189299718","location":"(37.786856111883054, -122.40689189299718)"},{"applicant":"Subs on Hubs","location_description":"","dayshours":"Sa-Su:11AM-10PM;Mo-Fr:6PM-8PM","food_items":"Italian subs: Cuban sandwich: Gyro","latitude":"37.7714019465879","longitude":"-122.3917716468468","location":"(37.7714019465879, -122.3917716468468)"},{"applicant":"The New York Frankfurter Co. of CA, Inc. DBA: Annie's Hot Dogs","location_description":"MARKET ST: 04TH ST \\ ELLIS ST \\ STOCKTON ST to POWELL ST (800 - 890) -- NORTH --","dayshours":"","food_items":"Soft pretzels: hot dogs: sausages: chips: popcorn: soda: espresso: cappucino: pastry: ica cream: ices: italian sausage: shish-ka-bob: churros: juice: water: various drinks","latitude":"37.78511092044776","longitude":"-122.40742266827704","location":"(37.78511092044776, -122.40742266827704)"},{"applicant":"Subs on Hubs","location_description":"08TH ST: FOLSOM ST to RINGOLD ST (300 - 341)","dayshours":"Th/Fr:12AM-2AM;We/Th:11PM-12AM","food_items":"Italian subs: Cuban sandwich: Gyro","latitude":"37.77497549982167","longitude":"-122.40938582319421","location":"(37.77497549982167, -122.40938582319421)"},{"applicant":"Subs on Hubs","location_description":"BRANNAN ST: 08TH ST to 09TH ST (900 - 999)","dayshours":"Mo/Tu/We/Th:11AM-6PM","food_items":"Italian subs: Cuban sandwich: Gyro","latitude":"37.7711790005481","longitude":"-122.40657367342877","location":"(37.7711790005481, -122.40657367342877)"},{"applicant":"Subs on Hubs","location_description":"05TH ST: HARRISON ST \\ I-80 W OFF RAMP to PERRY ST (400 - 449)","dayshours":"Sa-Su:12AM-2AM;Fr/Sa:11PM-12AM","food_items":"Italian subs: Cuban sandwich: Gyro","latitude":"37.77871039190089","longitude":"-122.4018393503297","location":"(37.77871039190089, -122.4018393503297)"}]}]]}}}]
