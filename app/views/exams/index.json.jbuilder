json.array!(@exams) do |exam|
  json.extract! exam, :id, :time_of_category, :category
  json.url exam_url(exam, format: :json)
end
