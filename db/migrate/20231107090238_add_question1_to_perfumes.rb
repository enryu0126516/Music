class AddQuestion1ToPerfumes < ActiveRecord::Migration[6.1]
  def change
    add_column :perfumes, :question1, :string
  end
end
