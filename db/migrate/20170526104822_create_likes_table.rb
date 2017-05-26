class CreateLikesTable < ActiveRecord::Migration
  def change
  	create_table :likes do |t|
  		t.references :coffee_shop
  		t.references :liker

  		t.timestamps null:false
  	end
  end
end
