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
    const handleNewSightingFunction = ({ sighting }) => {
      // const { LatLng } = await google.maps.importLibrary("core")

      console.log('handleNewSightingFunction')
      console.log('sighting')
      console.log(sighting)

      const contentString =
        '<div id="content">' +
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
        "</div>";

      console.log('contentString')
      console.log(contentString)

      const infowindow = new google.maps.InfoWindow({
        content: contentString,
        ariaLabel: "Uluru",
      });

      console.log(contentString);
      console.log(sighting)

      const marker = new google.maps.Marker({
        position: sighting,
        animation: google.maps.Animation.DROP,
        map: map,
        title: sighting.title,
        label: sighting.label,
      })

      console.log('marker before listener')
      console.log(marker)

      marker.addListener("click", () => {
        infowindow.open({
          anchor: marker,
          map,
        });
      });

      console.log(marker)
      // const marker = new google.maps.Marker({
      //   position: sighting,
      //   animation: google.maps.Animation.DROP,
      //   map: map,
      //   title: "text for presidio",
      //   label: "P",
      // })

      console.log('marker position in hook')
      console.log(map)

      var latLng = marker.getPosition(); // returns LatLng object
      map.setCenter(latLng); // setCenter takes a LatLng object

      console.log('center on')
      console.log(latLng)
      map.setZoom(15);
      // To add the marker to the map, call setMap();
      // marker.setMap(map)

    };

    // handle new sightings as they show up
    this.handleEvent("new_sighting", handleNewSightingFunction)
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

// expose liveSocket on window for web console debug logs and latency simulation:
// >> liveSocket.enableDebug()
// >> liveSocket.enableLatencySim(1000)  // enabled for duration of browser session
// >> liveSocket.disableLatencySim()
window.liveSocket = liveSocket

