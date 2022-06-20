class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :name
      t.decimal :price
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
