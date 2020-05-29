# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


news = Topic.create(name:"News", view_count: 0)

user = User.create(name:"test user", email: "ztest@s.com", 
                password_digest: User.digest('password'), 
                phone_number: "1234567890" )