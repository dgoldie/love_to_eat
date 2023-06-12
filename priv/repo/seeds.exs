# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     LoveToEat.Repo.insert!(%LoveToEat.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

# Load initial data

alias LoveToEat.{Reader, Transformer}
data = Reader.read()

data
|> Transformer.translate()
|> Transformer.load_into_db()

count = Enum.count(data)
IO.puts("data read with #{count} records.")
