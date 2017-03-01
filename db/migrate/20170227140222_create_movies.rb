class CreateMovies < ActiveRecord::Migration[5.0]
  def change
    create_table :movies do |t|
      t.string :title
      t.string :director
      t.text :summary
      t.string :written_by
      t.string :poster_url
      t.string :release_date

      t.timestamps
    end
  end
end
