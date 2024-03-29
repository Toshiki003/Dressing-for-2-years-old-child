# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

30.times do |index|
  Post.create(
    user: User.offset(rand(User.count)).first,
    category: Category.first,
    title: "タイトル#{index}",
    content: "本文#{index}"
  )
end
