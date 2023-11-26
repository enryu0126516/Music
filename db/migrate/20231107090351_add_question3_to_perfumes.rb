class AddQuestion3ToPerfumes < ActiveRecord::Migration[6.1]
  def change
    add_column :perfumes, :question3, :string
  end
end
