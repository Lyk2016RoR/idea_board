# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Creating seed data..."

u = User.create(email: "admin@admin.com", password: 123456)

c1 = Category.create(title: "Genel", desc: 'Genel kategorimiz burasıdır.', color: 'red')
c2 = Category.create(title: "RoR", desc: 'Ruby on Rails ile ilgili fikirlerin bulunduğu kategorimiz.', color: 'green')

Idea.create(title: 'Züper Fikir', description: 'Über Züper Fikir', category: c1, user: u)
Idea.create(title: 'Süper Fikir!', description: 'Bence bilişim terimleri tekrar düzenlensin.', category_id: c1.id, user: u)
Idea.create(title: 'Deneme Fikir', description: 'Test descriptionım.', category: c2, user: u)

puts "Seed data created"
