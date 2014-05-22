json.array!(@prenotaziones) do |prenotazione|
  json.extract! prenotazione, :id, :nome, :Pdata, :Pgiorno, :Pora
  json.url prenotazione_url(prenotazione, format: :json)
end
