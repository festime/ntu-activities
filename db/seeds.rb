# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

file_path = Rails.root.join("db/nights.dat")
activities = File.readlines(file_path).map(&:strip)

activities.each do |activity|
  month_day_name = activity.split(" ")
  month, day, name = month_day_name[0], month_day_name[1], month_day_name[2]
  Activity.create(name: name, date: Date.strptime("2015-#{month}-#{day}", "%Y-%m-%d"))
end
