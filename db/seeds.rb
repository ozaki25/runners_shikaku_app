# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

category_list = %w(Security Cloud Mobility Strage CDIA)
category_list.each do |name|
  category = Category.create(name: name)
  (1..2).each do |i|
    exam = category.exams.create(time_of_category: i)
  end
end
