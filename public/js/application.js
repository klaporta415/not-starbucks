$(document).ready(function() {
  // This is called after the document has loaded in its entirety
  // This guarantees that any elements we bind to will exist on the page
  // when we try to bind to them

  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()



var map;

function initialize(){
	var myHouse = new google.maps.LatLng(41.973497,-87.6601661);
	map = new google.maps.Map(document.getElementById('map'), {
		center: myHouse,
		zoom: 15,
		scrollwheel: false
	});



	var request = {
		location: myHouse,
		radius: 3220,
		types: ['cafe']
	};

	// Create PlaceService, send request
	// Handle callback with anonymous function
	var service = new google.maps.places.PlacesService(map);
	service.nearbySearch(request, function(results, status){
		if (status == google.maps.places.PlaceServiceStatus.OK) {
			for (var i = 0; i < results.length; i++) {
				var place = results[i];
				// if successful request, place marker at that location
				// register an event to handle click on marker
				var marker = new google.maps.Marker({
					map: map,
					position: place.geometry.location
				});
			}
		}
	});
google.maps.event.addDomListener(window, 'load', initialize);
}
});