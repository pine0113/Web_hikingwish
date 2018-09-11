namespace :dev do

  task all: [:fake_wishes]


  task fake_wishes: :environment do
    10.times do
      start = Faker::Date.forward(rand(100))
      Wish.create!(
        name:  FFaker::Name.first_name,
        start_date: start,
        end_date: Faker::Date.between(rand(10).days.ago, start),
        user_id: User.all.sample.id,
        level: rand(5)
      )
    end
    puts 'have created fake wishes'
    puts "now you have #{Wish.count} wishes data"
  end

end