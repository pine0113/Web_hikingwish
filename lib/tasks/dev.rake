namespace :dev do

  task all: [:fake_wishes]


  task fake_wishes: :environment do
    Wish.destroy_all
    12.times do
      endday = Faker::Date.forward(100)
      Wish.create!(
        name:  FFaker::Name.first_name,
        start_date: Faker::Date.between(10.days.ago, endday),
        end_date: endday,
        user_id: User.all.sample.id,
        level: rand(5)
      )
    end
    puts 'have created fake wishes'
    puts "now you have #{Wish.count} wishes data"
  end

end