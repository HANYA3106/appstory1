class CreateStories < ActiveRecord::Migration[6.0]
  def change
    create_table :stories do |t|
      t.integer   :subject_id,      null: false
      t.integer   :purpose_id,      null: false
      t.integer   :tale_id,         null: false
      t.integer   :category_id,     null: false
      t.text      :text,            null: false
      t.integer   :user_id,            null: false
      t.timestamps
    end
  end
end
