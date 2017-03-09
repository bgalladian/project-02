class AddUsersToMovies < ActiveRecord::Migration[5.0]
  def change
    add_reference :movies, :user, foreign_key: true
  end
end
# Good idea setting up main models first and then adding in references to users after
