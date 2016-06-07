# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'faker'

Mission.destroy_all
# Creating 100 fake restaurants
5.times do
  mission = Mission.new({
    title: Faker::Name.title,
    user: User.find(1)
      })
  mission.save
end
