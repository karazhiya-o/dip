class AddLngToProducts < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :lng, :float
  end
end
