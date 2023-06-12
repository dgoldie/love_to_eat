defmodule LoveToEat.Reader do
  @files_path Path.expand("../../priv/data", __DIR__)
  @import_file "Mobile_Food_Facility_Permit"

  def read(filename \\ @import_file) do
    read_file(filename)
    |> decode_stream()
    |> Keyword.values()
  end

  defp read_file(filename) do
    @files_path
    |> Path.join(filename <> ".csv")
    |> File.stream!([read_ahead: 100_000], 1000)
  end

  defp decode_stream(stream) do
    stream
    |> CSV.decode(headers: true)
    |> Enum.to_list()
  end
end

# /Users/doug/code/2023/estee_lauder/engineering-assessment/Mobile_Food_Facility_Permit.csv
