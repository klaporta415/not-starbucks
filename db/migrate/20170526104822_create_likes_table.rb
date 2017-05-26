class CreateLikesTable < ActiveRecord::Migration
  def change
  	create_table :likes do |t|
  		t.integer :coffee_shop_id, foreign_key: true
  		t.integer :liker_id, foreign_key: true

  		t.timestamps null:false
  	end
  end
end
