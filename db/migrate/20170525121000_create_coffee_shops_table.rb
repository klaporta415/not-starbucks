class CreateCoffeeShopsTable < ActiveRecord::Migration
  def change
  	create_table :coffee_shops do |t|
  		t.string :name
  		t.string :city
  		t.string :state
  		t.string :street_address
  		t.string :website

  		t.timestamps null: false
  	end
  end
end
