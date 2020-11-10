class CreateCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :categories do |t|
      t.string  :genre,   null: false
      t.text    :image
    end
  end
end
