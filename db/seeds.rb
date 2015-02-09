# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
categories = ["Furniture","Books","CellPhones","Appliances","Cars","MotorBikes","health&Beauty","baby+kid","clothes"]
categories.each do |i|
    Category.create(name: i)
end

50.times do |n|
    email = "example-#{n}@gmail.com"
    title = Faker::Lorem.sentence(1)
    price = rand(10..100)
    description = Faker::Lorem.sentence(2)
    category_id = rand(1..9)
    picture_url = Faker::Avatar.image
    @item = Item.create!(email: email,title: title,price: price,description: description,category_id: category_id)
    image = @item.item_images.new
    image.remote_picture_url = picture_url
    image.save
    
end
