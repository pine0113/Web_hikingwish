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

  Plan.create(name: "嘉明湖新手上路團", image: "1", start_date: "2018-11-10", end_date: "2018-11-12", budget_final:7200, level:3, day: 72, miles: 20,intro: "",join_count: 0,owner_id: User.first.id)
  Plan.create(name: "玉山新手團", image: "2", start_date: "2018-11-06", end_date: "2018-11-07", budget_final:7200, level:3, day: 48, miles: 20,intro: "",join_count: 0,owner_id: User.first.id)

puts "Default Plan created!"

Cate.destroy_all
  Cate.create( id: 1, name: "郊山" )
  Cate.create( id: 2, name: "中級山")
  Cate.create( id: 3, name: "百岳路線" )

puts "Default Cates created!"

Hiking.destroy_all
  Hiking.create( name:"武稜一秀", level: 1, day: 72, miles: 1,  intro:"this is really wierld", cate_id: 1)
  Hiking.create( name:"武稜二秀", level: 2, day: 72, miles: 2,  intro:"this is really wierld", cate_id: 2)
  Hiking.create( name:"武稜三秀", level: 3, day: 72, miles: 3,  intro:"this is really wierld", cate_id: 3)
  Hiking.create( name:"武稜四秀", level: 4, day: 72, miles: 4,  intro:"this is really wierld", cate_id: 1)
  Hiking.create( name:"武稜五秀", level: 5, day: 72, miles: 5,  intro:"this is really wierld", cate_id: 2)
  Hiking.create( name:"其他路線", level: 3, day: 72, miles: 6,  intro:"this is really wierld", cate_id: 3)

puts "Default Hiking created!"


PlanMemberApply.destroy_all
PlanOwnerInvite.destroy_all
PlanMember.destroy_all