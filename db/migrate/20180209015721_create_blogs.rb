class CreateBlogs < ActiveRecord::Migration[5.1]
  def change
    create_table :blogs do |t|
      t.date :date
      t.string :title
      t.string :content
      t.integer :user_id

      t.timestamps
    end
  end
end
