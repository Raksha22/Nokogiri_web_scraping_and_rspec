class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :title
      t.string :price
      t.json :images

      t.timestamps
    end
  end
end
