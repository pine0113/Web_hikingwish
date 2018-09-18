namespace :dev do

  task all: [:fake_wishes]


  task fake_wishes: :environment do
    Wish.destroy_all
    hiking_sample = ["武陵二秀", "嘉明湖", "合歡東峰"]
    40.times do
      endday = Faker::Date.forward(100)
      Wish.create!(
        name:  FFaker::Name.first_name,
        start_date: Faker::Date.between(10.days.ago, endday),
        end_date: endday,
        user_id: User.all.sample.id,
        level: rand(1...5),
        day: rand(5),
        budget_bottom: rand(5000),
        budget_top: rand(5000...10000),
        hiking_id: Hiking.all.sample.id,
      )
    end

    4.times do
      wish=Wish.all.sample
      wish.car_list.add("car")
      wish.food_list.add("food1")
    end

    puts 'have created fake wishes'
    puts "now you have #{Wish.count} wishes data"
  end

  task fake_plans: :environment do
    Plan.destroy_all
    20.times do
      endday = Faker::Date.forward(100)
      Plan.create!(
        name:  FFaker::Name.first_name,
        start_date: Faker::Date.between(10.days.ago, endday),
        end_date: endday,
        owner_id: User.all.sample.id,
        level: rand(1...5),
        day: rand(1...120),
        hiking_id: Hiking.all.sample.id,
        budget_bottom: rand(5000),
        budget_top: rand(5000...10000)
      )
    end

    puts 'have created fake plans'
    puts "now you have #{Plan.count} plans data"
  end

end