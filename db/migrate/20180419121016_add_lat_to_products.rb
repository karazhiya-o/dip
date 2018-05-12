class AddLatToProducts < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :lat, :float
  end
end
