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

