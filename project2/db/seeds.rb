# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Movie.destroy_all
Review.destroy_all
Comment.destroy_all


#movies
casino = Movie.create(title: "Casino", director: "Martin Scorsese", summary: "Greed, deception, money, power, and murder occur between two best friends, a mafia underboss and a casino owner, for a trophy wife over a gambling empire.", written_by: "Nicholas Pileggi", poster_url: "https://images-na.ssl-images-amazon.com/images/M/MV5BMTcxOWYzNDYtYmM4YS00N2NkLTk0NTAtNjg1ODgwZjAxYzI3XkEyXkFqcGdeQXVyNTA4NzY1MzY@._V1_SY1000_CR0,0,666,1000_AL_.jpg", release_date: "11/22/1995")
gladiator = Movie.create(title: "Gladiator", director: "Ridley Scott", summary: "When a Roman general is betrayed and his family murdered by an emperor's corrupt son, he comes to Rome as a gladiator to seek revenge.", written_by: "David Franzoni", poster_url: "https://images-na.ssl-images-amazon.com/images/M/MV5BMTgwMzQzNTQ1Ml5BMl5BanBnXkFtZTgwMDY2NTYxMTE@._V1_SY1000_CR0,0,675,1000_AL_.jpg", release_date: "05/05/2000")

#reviews
review1 = Review.create(author: "Bedig Galladian", content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. In volutpat tempor maximus. Praesent sem massa, pretium quis molestie molestie, consectetur in turpis. Duis magna tellus, sagittis congue ornare sed, lacinia tempus sem. Praesent elementum nulla sit amet nibh facilisis consequat. Aliquam lobortis varius posuere. Suspendisse potenti. Sed eget bibendum dolor, rhoncus posuere ligula. Aenean quis sodales magna.  Ut ullamcorper feugiat luctus. Ut commodo lacus orci, et vestibulum lectus sagittis mollis. Curabitur malesuada, tortor a imperdiet rutrum, erat dui facilisis turpis, nec ornare leo odio vitae magna. Fusce ut quam metus. Morbi efficitur eleifend magna vel tristique. Nulla eu tristique tellus. Sed a risus felis. Nulla facilisis dolor a neque euismod iaculis. Praesent facilisis interdum nisl nec consectetur.", rating: 5, movie: casino)
review2 = Review.create(author: "Carol Akinmade", content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. In volutpat tempor maximus. Praesent sem massa, pretium quis molestie molestie, consectetur in turpis. Duis magna tellus, sagittis congue ornare sed, lacinia tempus sem. Praesent elementum nulla sit amet nibh facilisis consequat. Aliquam lobortis varius posuere. Suspendisse potenti. Sed eget bibendum dolor, rhoncus posuere ligula. Aenean quis sodales magna.  Ut ullamcorper feugiat luctus. Ut commodo lacus orci, et vestibulum lectus sagittis mollis. Curabitur malesuada, tortor a imperdiet rutrum, erat dui facilisis turpis, nec ornare leo odio vitae magna. Fusce ut quam metus. Morbi efficitur eleifend magna vel tristique. Nulla eu tristique tellus. Sed a risus felis. Nulla facilisis dolor a neque euismod iaculis. Praesent facilisis interdum nisl nec consectetur.", rating: 5, movie: gladiator)

#comments
comment1 = Comment.create(author: "Sandy Galladian", comments: "Great review Bed", review: review1)
comment2 = Comment.create(author: "Sevaun Galladian", comments: "Great review Bed", review: review2)
