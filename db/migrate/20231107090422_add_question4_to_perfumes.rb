class AddQuestion4ToPerfumes < ActiveRecord::Migration[6.1]
  def change
    add_column :perfumes, :question4, :string
  end
end
