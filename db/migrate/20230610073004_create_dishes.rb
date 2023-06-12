class CreateDishes < ActiveRecord::Migration[6.1]
  def change
    create_table :dishes do |t|
      t.string :dish_name, null: true, default: ""
      t.timestamps
    end
  end
end
