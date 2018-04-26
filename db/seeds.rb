# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
if Food.count==0
  Food.new( :id => 1, :name => "Jumbo_Chicken_Wrap").save!
  Food.new( :id => 2, :name => "Vegetarian_Lasagne").save!
  Food.new( :id => 3, :name => "Chicken_Rice_Feast").save!
  Food.new( :id => 4, :name => "Grilled_Chicken_Breast").save!
end
