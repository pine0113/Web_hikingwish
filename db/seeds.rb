# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


#Users
User.destroy_all
  User.create(name:"pine0113",email: "pine0113@gmail.com", password: "12345678", role: "admin")
  User.create(name:"admin",email: "admin@example.com", password: "12345678", role: "admin")
  User.create(name:"user",email: "user@example.com", password: "12345678", role: "user")
  
puts "Default users created!"


Plan.destroy_all

  #Plan.create(name: "嘉明湖", image: "1", start_date: Date.today, end_date: Date.today, budget_final:0,  budget_bottom: 7000, budget_top: 10000,level:3,day: 72,miles: 20,intro: "",join_count: 0,owner_id: 1)

puts "Default Plan created!"


Hiking.destroy_all
  Hiking.create( name:"武稜一秀", level: 1, day: 72, miles: 1,  intro:"this is really wierld")
  Hiking.create( name:"武稜二秀", level: 2, day: 72, miles: 2,  intro:"this is really wierld")
  Hiking.create( name:"武稜三秀", level: 3, day: 72, miles: 3,  intro:"this is really wierld")
  Hiking.create( name:"武稜四秀", level: 4, day: 72, miles: 4,  intro:"this is really wierld")
  Hiking.create( name:"武稜五秀", level: 5, day: 72, miles: 5,  intro:"this is really wierld")
  Hiking.create( name:"其他路線", level: 3, day: 72, miles: 6,  intro:"this is really wierld")

puts "Default Hiking created!"