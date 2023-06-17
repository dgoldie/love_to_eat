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

    // this.pushEvent("unavailable-dates", {}, (reply, ref) => {
    //   this.pickr.set("disable", reply.dates)
    // })


    this.handleEvent("add-selected-trucks", ({trucks}) => {
      console.log('add trucks......')
      console.log('trucks')
      console.log(trucks[0])
      const lat = parseFloat(trucks[0].latitude)
      const lng = parseFloat(trucks[0].longitude)

      const contentString = '<div id="content">' +
        '<div id="siteNotice">' +
        "</div>" +
        '<h1 id="firstHeading" class="firstHeading">Uluru</h1>' +
        '<div id="bodyContent">' +
        "<p><b>Uluru</b>, also referred to as <b>Ayers Rock</b>, is a large " +
        "sandstone rock formation in the southern part of the " +
        "Northern Territory, central Australia. It lies 335&#160;km (208&#160;mi) " +
        "south west of the nearest large town, Alice Springs; 450&#160;km " +
        "(280&#160;mi) by road. Kata Tjuta and Uluru are the two major " +
        "features of the Uluru - Kata Tjuta National Park. Uluru is " +
        "sacred to the Pitjantjatjara and Yankunytjatjara, the " +
        "Aboriginal people of the area. It has many springs, waterholes, " +
        "rock caves and ancient paintings. Uluru is listed as a World " +
        "Heritage Site.</p>" +
        '<p>Attribution: Uluru, <a href="https://en.wikipedia.org/w/index.php?title=Uluru&oldid=297882194">' +
        "https://en.wikipedia.org/w/index.php?title=Uluru</a> " +
        "(last visited June 22, 2009).</p>" +
        "</div>" +
        "</div>"

      console.log('contentString')
      console.log(contentString)

      const infowindow = new google.maps.InfoWindow({
        content: contentString,
        ariaLabel: "San Francisco",
      })

      console.log(contentString)
      const position = { lat, lng }
      console.log(position)

      const marker = new google.maps.Marker({
        position: position,
        animation: google.maps.Animation.DROP,
        map: map,
        title: trucks[0].applicant
      })

      console.log('marker before listener')
      console.log(marker)

      marker.addListener("click", () => {
        infowindow.open({
          anchor: marker,
          map,
        })
      })

      console.log(marker)
      console.log('marker position in hook')
      console.log(map)

      var latLng = marker.getPosition() // returns LatLng object
      map.setCenter(latLng) // setCenter takes a LatLng object

      console.log('center on')
      console.log(latLng)
      map.setZoom(15)
      // To add the marker to the map, call setMap();
      // marker.setMap(map)
    })

    // handle new sightings as they show up
    // this.handleEvent("new_sighting", handleNewSightingFunction)
    console.log('-----------------------------------')
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

window.addEventListener(`phx:new_sighting`, (e) => {
  let el = document.getElementById(e.detail.id)
  if(el) {
    // logic for highlighting
    console.log('el')
    console.log(el)
    console.log(e)
  }
})


// expose liveSocket on window for web console debug logs and latency simulation:
// >> liveSocket.enableDebug()
// >> liveSocket.enableLatencySim(1000)  // enabled for duration of browser session
// >> liveSocket.disableLatencySim()
window.liveSocket = liveSocket

