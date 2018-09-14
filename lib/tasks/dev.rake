namespace :dev do

  task all: [:fake_wishes]


  task fake_wishes: :environment do
    Wish.destroy_all
    hiking_sample = ["武陵二秀", "嘉明湖", "合歡東峰"]
    12.times do
      endday = Faker::Date.forward(100)
      Wish.create!(
        name:  FFaker::Name.first_name,
        start_date: Faker::Date.between(10.days.ago, endday),
        end_date: endday,
        user_id: User.all.sample.id,
        level: rand(1...5),
        day: rand(5),
        hiking: hiking_sample.sample,
        budget_bottom: rand(5000),
        budget_top: rand(5000...10000)
      )
    end
    puts 'have created fake wishes'
    puts "now you have #{Wish.count} wishes data"
  end

end