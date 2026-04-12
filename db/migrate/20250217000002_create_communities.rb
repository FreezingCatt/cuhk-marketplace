class CreateCommunities < ActiveRecord::Migration[7.1]
  def change
    create_table :communities do |t|
      t.string :name, null: false
      t.text :description
      t.text :rules
      t.boolean :is_public, default: true
      t.boolean :active, default: true
      t.references :owner, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end

    add_index :communities, :name, unique: true
  end
end
