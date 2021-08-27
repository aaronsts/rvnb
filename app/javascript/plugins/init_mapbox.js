import mapboxgl from "mapbox-gl";
import "mapbox-gl/dist/mapbox-gl.css";
import MapboxGeocoder from "@mapbox/mapbox-gl-geocoder";

const initMapbox = () => {
  const mapElement = document.getElementById("map");

  const fitMapToMarkers = (map, markers) => {
    const bounds = new mapboxgl.LngLatBounds();
    markers.forEach((marker) => bounds.extend([marker.lng, marker.lat]));
    map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 });
  };

  if (mapElement) {
    // only build a map if there's a div#map to inject into
    mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
    const map = new mapboxgl.Map({
      container: "map",
      style: "mapbox://styles/merarslan/cksu5ldq04sst18quykzftvyp",
    });

    map.addControl(
      new MapboxGeocoder({
        accessToken: mapboxgl.accessToken,
        mapboxgl: mapboxgl,
      })
    );

    const markers = JSON.parse(mapElement.dataset.markers);
    markers.forEach((marker) => {
      const popup = new mapboxgl.Popup().setHTML(marker.info_window);

      const element = document.createElement('div');
      element.className = 'marker';
      element.style.backgroundImage = `url('${marker.image_url}')`;
      element.style.backgroundSize = 'contain';
      element.style.width = '25px';
      element.style.height = '25px';

      let marker_mbg = new mapboxgl.Marker(element).setLngLat([marker.lng, marker.lat]).setPopup(popup).addTo(map);
      // const color = "#191919";
      // let markerElement = marker_mbg.getElement();
      // markerElement
      //   .querySelectorAll('svg g[fill="' + marker_mbg._color + '"]')[0]
      //   .setAttribute("fill", color);
      // marker_mbg._color = color;
    });

    fitMapToMarkers(map, markers);
  }
};

export { initMapbox };
