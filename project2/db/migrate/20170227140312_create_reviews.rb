class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.string :author
      t.text :content
      t.integer :rating
      t.references :movie, null: false, index:true

      t.timestamps

    end
  end
end
