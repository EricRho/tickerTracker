class CreateStocks < ActiveRecord::Migration
  def change
    create_table :stocks do |t|
      t.string :symbol
      t.string :name
      t.decimal :ask
      t.decimal :bid
      t.decimal :change
      t.decimal :change_in_percent

      t.timestamps
    end
  end
end
