class AddQuestion2ToPerfumes < ActiveRecord::Migration[6.1]
  def change
    add_column :perfumes, :question2, :string
  end
end
