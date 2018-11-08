class CreateBikes < ActiveRecord::Migration[5.2]
  def change
    create_table :bikes do |t|
      t.string :category
      t.integer :price
      t.string :brand
      t.integer :engine_size
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
