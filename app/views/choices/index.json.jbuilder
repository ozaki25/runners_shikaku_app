json.array!(@choices) do |choice|
  json.extract! choice, :id, :content, :collect, :question
  json.url choice_url(choice, format: :json)
end
