class AddPreviousCloseToStocks < ActiveRecord::Migration
  def change
    add_column :stocks, :previous_close, :decimal
  end
end
