
      function initMap() {
 
        var directionsDisplay = new google.maps.DirectionsRenderer;
        var directionsService = new google.maps.DirectionsService;
        var Lat = (<%= @product.lat%>);
        var Lng = (<%= @product.lng%>); 
        var map = new google.maps.Map(document.getElementById('map'), {
          zoom: 11,
          center: new google.maps.LatLng(Lat,Lng),
        });
        directionsDisplay.setMap(map);
        directionsDisplay.setPanel(document.getElementById('right-panel'));

//users position
        var infoWindow = new google.maps.InfoWindow({map: map});
 // Try HTML5 geolocation.
        if (navigator.geolocation) {
          navigator.geolocation.getCurrentPosition(function(position) {
            var pos = {
              lat: position.coords.latitude,
              lng: position.coords.longitude
            };
            var pos2 = {
              lat: (<%= @product.lat%>),
              lng: (<%= @product.lng%>)
            };

            infoWindow.setPosition(pos);
            
            infoWindow.setContent('Location found.this');
            map.setCenter(pos);
            

          }, function() {
            handleLocationError(true, infoWindow, map.getCenter());
          });
        } else {
          // Browser doesn't support Geolocation
          handleLocationError(false, infoWindow, map.getCenter());
        }
      

              function handleLocationError(browserHasGeolocation, infoWindow, pos) {
                infoWindow.setPosition(pos);

                infoWindow.setContent(browserHasGeolocation ?
                                      'Error: The Geolocation service failed.' :
                                      'Error: Your browser doesn\'t support geolocation.');
              }



  var onChangeHandler = function() {
          calculateAndDisplayRoute(directionsService, directionsDisplay);
        };
        document.getElementById('pos').addEventListener(onChangeHandler);
        document.getElementById('pos2').addEventListener(onChangeHandler);
      }

      function calculateAndDisplayRoute(directionsService, directionsDisplay) {

        var start = document.getElementById('pos').value;
        var end = document.getElementById('pos2').value;
        directionsService.route({
          origin: start,
          destination: end,
          travelMode: 'DRIVING'
        }, function(response, status) {
          if (status === 'OK') {
            directionsDisplay.setDirections(response);
          } else {
            window.alert('Directions request failed due to ' + status);
          }
        });
      }


    <script async defer
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCz7uaBaPFkRM6TV6EPlajVqfPvmsCzjZw&callback=initMap">
