// If you want to use Phoenix channels, run `mix help phx.gen.channel`
// to get started and then uncomment the line below.
// import "./user_socket.js"

// You can include dependencies in two ways.
//
// The simplest option is to put them in assets/vendor and
// import them using relative paths:
//
//     import "../vendor/some-package.js"
//
// Alternatively, you can `npm install some-package --prefix assets` and import
// them using a path starting with the package name:
//
//     import "some-package"
//

// Include phoenix_html to handle method=PUT/DELETE in forms and buttons.
import "phoenix_html"
// Establish Phoenix Socket and LiveView configuration.
import {Socket} from "phoenix"
import {LiveSocket} from "phoenix_live_view"
import topbar from "../vendor/topbar"

let Hooks = {}

Hooks.MapSightingsHandler = {
  mounted() {

    console.log('mounted in hooks')

    let markers = []
    this.handleEvent("add-selected-trucks", ({trucks}) => {
      console.log('trucks')
      hideMarkers()

      for (var i = 0, len = trucks.length; i < len; i++) {
        const truck = trucks[i]

        const contentString = '<div id="content">' +
          '<div id="siteNotice">' +
          "</div>" +
          '<h1 id="firstHeading" class="firstHeading">' +
          '<b><dt>Applicant:&nbsp;&nbsp;</b>' + truck.applicant + '</h1>' +
          '<div id="bodyContent"><br>' +
          "<p><b>Location Description:&nbsp;&nbsp;</b>" + truck.location_description  + '</p><br>' +
          "<p><b>Address:&nbsp;&nbsp;</b>" + truck.address  + '</p><br>' +
          "<p><b>Days / Hours:&nbsp;&nbsp;</b>" + truck.dayshours  + '</p><br>' +
          "<p><b>Location:&nbsp;&nbsp;</b>" + truck.location  + '</p><br>' +
          "<p><b>Latitude:&nbsp;&nbsp;</b>" + truck.latitude  + '</p><br>' +
          "<p><b>Longitude:&nbsp;&nbsp;</b>" + truck.longitude  + '</p><br>' +
          '</div>' +
          '</div>'

        // console.log(contentString)

        const lat = parseFloat(truck.latitude)
        const lng = parseFloat(truck.longitude)

        const infowindow = new google.maps.InfoWindow({
          content: contentString,
          ariaLabel: "San Francisco",
        })


        const position = { lat, lng }
        // console.log('position **********************')
        // console.log(position)
        // console.log('label')
        const label = (i + 1).toString()
        // console.log(label)

        const marker = new google.maps.Marker({
          position: position,
          animation: google.maps.Animation.DROP,
          map: map,
          title: truck.applicant,
          label: label
        })

        // console.log('marker before listener')
        // console.log(marker)

        marker.addListener("click", () => {
          infowindow.open({
            anchor: marker,
            map,
          })
        })

        // console.log(marker)
        // console.log('marker position in hook')
        // console.log(map)

        var latLng = marker.getPosition() // returns LatLng object
        map.setCenter(latLng) // setCenter takes a LatLng object

        // console.log('center on')
        // console.log(latLng)
        map.setZoom(15)
        // To add the marker to the map, call setMap();
        // marker.setMap(map)


        markers << marker
        // handle new sightings as they show up
        // this.handleEvent("new_sighting", handleNewSightingFunction)
        console.log('-----------------------------------')




      }
    })

    // Removes the markers from the map, but keeps them in the array.
    function hideMarkers() {
      console.log('hide ***************************************')
      setMapOnAll(null);
    }

    // Shows any markers currently in the array.
    function showMarkers() {
      console.log('show *************************************')
      setMapOnAll(map);
    }

    // Deletes all markers in the array by removing references to them.
    function deleteMarkers() {
      console.log('delete **************************************')
      hideMarkers();
      markers = [];
    }

    // Sets the map on all markers in the array.
    function setMapOnAll(map) {
      console.log('setMaponall ---------------------------------')
      for (let i = 0; i < markers.length; i++) {
        markers[i].setMap(map);
      }
    }
  }
}


let csrfToken = document.querySelector("meta[name='csrf-token']").getAttribute("content")
let liveSocket = new LiveSocket("/live", Socket, {
    params: {_csrf_token: csrfToken},
    hooks: Hooks
})

// Show progress bar on live navigation and form submits
topbar.config({barColors: {0: "#29d"}, shadowColor: "rgba(0, 0, 0, .3)"})
window.addEventListener("phx:page-loading-start", _info => topbar.show(300))
window.addEventListener("phx:page-loading-stop", _info => topbar.hide())

// connect if there are any LiveViews on the page
liveSocket.connect()


window.liveSocket = liveSocket

