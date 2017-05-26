get '/coffee_shops/:id' do 
	@shop = CoffeeShop.find(params[:id])
	@lat = @shop.latitude
	@long = @shop.longitude
	erb :"/coffee_shops/other_map"
end