puts "Creating Articles..."
50.times do
  Article.create!({
    title: Faker::Book.title,
    body: Faker::Lorem.sentence
   })
end
puts "Articles created!"
