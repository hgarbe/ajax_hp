namespace :populate do
  desc "Populates HP"
  task hp: :environment do
    7.times do
      hp = Hp.create(
        book: Faker::Movies::HarryPotter.book, 
        house: Faker::Movies::HarryPotter.house
      )
      
      5.times { 
        Character.create(
          name: Faker::Movies::HarryPotter.character, 
          quote: Faker::Movies::HarryPotter.quote, 
          hp_id: hp.id
        ) 
      }
    end
  end

end
