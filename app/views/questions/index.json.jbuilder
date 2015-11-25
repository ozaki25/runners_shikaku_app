json.array!(@questions) do |question|
  json.extract! question, :id, :num_of_exam, :question_path, :description_path, :exam
  json.url question_url(question, format: :json)
end
