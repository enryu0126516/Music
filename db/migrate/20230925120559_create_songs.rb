class CreateSongs < ActiveRecord::Migration[6.1]
  def change
    create_table :songs do |t|
      t.string :name
      t.string :title
      t.string :genre
      t.text :comment
      t.date :day

      t.timestamps
    end
  end
end
