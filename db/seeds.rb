# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

User.create!(email: 'admin@example.com',
             password: 'admin123',
             password_confirmation: 'admin123',
             name: Faker::Name.name,
             role: 'admin')

User.create!(email: Faker::Internet.email,
             password: 'password',
             password_confirmation: 'password',
             name: Faker::Book.author,
             role: 'regular_user')

Post.create!(title: Faker::Book.title,
             excerpt: Faker::Lorem.sentence,
             content: Faker::Lorem.paragraph,
             published: true,
             published_at: Time.zone.now,
             meta_keywords: Faker::Lorem.words.join(', '),
             meta_description: Faker::Lorem.paragraph(sentence_count: 2),
             author: User.regular_user.first)
