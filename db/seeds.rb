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
casino = Movie.create(title: "Casino", director: "Martin Scorcese", summary: "Greed, deception, money, power, and murder occur between two best friends, a mafia underboss and a casino owner, for a trophy wife over a gambling empire.", written_by: "Nicholas Pileggi", release_date: "11/22/1995", poster_url: "https://images-na.ssl-images-amazon.com/images/M/MV5BMTcxOWYzNDYtYmM4YS00N2NkLTk0NTAtNjg1ODgwZjAxYzI3XkEyXkFqcGdeQXVyNTA4NzY1MzY@._V1_SY1000_CR0,0,666,1000_AL_.jpg" )
