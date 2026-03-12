<!--       AIzaSyABaUN7eZB1JWUxgL3a_PxhmlrlHITV_5A      -->


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Google Map Location</title>
  <style>
    #map { height: 400px; width: 100%; }
  </style>
</head>
<body>

<%
  String latParam = request.getParameter("latitude");
  String longParam = request.getParameter("longitude");

  double lati = 40.7128;
  double longi = -74.0060;

  try {
    if (latParam != null && !latParam.trim().isEmpty()) lati = Double.parseDouble(latParam);
    if (longParam != null && !longParam.trim().isEmpty()) longi = Double.parseDouble(longParam);
  } catch (Exception e) {
    // If user enters wrong value, keep default
  }
%>

<h3>Google Maps Location</h3>
<div id="map"></div>

<script>
  function initMap() {
    var location = { lat: <%= lati %>, lng: <%= longi %> };

    var map = new google.maps.Map(document.getElementById('map'), {
      zoom: 5,
      center: location
    });

    new google.maps.Marker({
      position: location,
      map: map
    });
  }

  // make it global for callback
  window.initMap = initMap;
</script>

<script defer
  src="https://maps.googleapis.com/maps/api/js?key=AIzaSyABTK27HXDDT6Q0K9xCd1-Em5HB1_53wXM&callback=initMap">
</script>

</body>
</html>
