class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.string :author
      t.text :comments
      t.references :review, null: false, index:true

      t.timestamps
    end
  end
end
