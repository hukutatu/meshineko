class CreateRecipes < ActiveRecord::Migration[6.1]
  def change
    create_table :recipes do |t|
      t.integer :user_id
      t.text :capion,   null: false
      t.string :title,  null: false, default: ""
      t.timestamps
    end
  end
end
