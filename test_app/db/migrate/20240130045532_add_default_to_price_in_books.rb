class AddDefaultToPriceInBooks < ActiveRecord::Migration[7.0]
  def change
    change_column :books, :price, :float, default: 0.0
  end
end
