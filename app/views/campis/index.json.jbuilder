json.array!(@campis) do |campi|
  json.extract! campi, :id, :nomecampo, :tipocampo
  json.url campi_url(campi, format: :json)
end
