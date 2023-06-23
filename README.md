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
## Start defining struct for Trucks in a Trucks model
use data from input file supplied

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

### Query use select for food types
    Using food types in the Yelp iphone app.

## Future features
--------------------------------------------

### track real-time changes with endpoints
    broadcast to all browsers by food type.

### styling

### customize markers perhaps.

### get current position of browser(i.e mobile app)
for now hardcoding center of map as haight ashbury.
allows different features like:
-- show trucks within 2 blocks of your position.

### incorporate dayshours provided
Allows filtering markers based on "Open Now"

### Mimic Yelp app features perhaps

## Main Features

### #1 Search by food type...
demo in SF data

### #2 Search by location
User's current position (mobile)
Or user enters an address
Or user enters a location on the map (click)

### #3 Combine search features
location and food_type

### #4 Broadcast data changes in features
Call APIs regularly to see changes
Do a diff on current data to get changes
Broadcast changes





