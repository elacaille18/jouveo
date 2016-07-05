# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# require 'faker'

# Mission.destroy_all

# 5.times do
#   mission = Mission.new({
#     title: Faker::Name.title,
#     user: User.find(1)
#       })
#   mission.save
# end

require 'csv'

#Company.destroy_all

csv_text = File.read(Rails.root.join('lib', 'seeds', 'companies1.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
  # Here, row is an array of columns
  company_name = row[0]
  company = Company.new({name: company_name})
  company.save
end
