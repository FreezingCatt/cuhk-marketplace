class CreateBooks < ActiveRecord::Migration[7.1]
  def change
    create_table :books do |t|
      t.references :user, null: false, foreign_key: true
      t.string :title
      t.string :author
      t.string :isbn
      t.decimal :price
      t.string :condition
      t.string :location
      t.integer :status

      t.timestamps
    end
  end
end
