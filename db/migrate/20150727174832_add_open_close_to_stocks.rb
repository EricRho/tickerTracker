class AddOpenCloseToStocks < ActiveRecord::Migration
  def change
    add_column :stocks, :open, :decimal
    add_column :stocks, :close, :decimal
  end
end
