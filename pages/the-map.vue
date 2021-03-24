<template>
  <v-row
    fluid
  >
    <v-col
      cols="12"
      xs="12"
      md="12"
    >
      <v-card>
        <v-card-title class="headline">
          The whole world
        </v-card-title>
        <v-card-text>
          <p>
            You arrive in a large room with a small
          </p>
        </v-card-text>
      </v-card>
    </v-col>
    <v-col
      cols="12"
      xs="12"
      md="12"
    >
      <v-card id="map" style="height: 500px" />
    </v-col>
  </v-row>
</template>

<script>
import mapboxgl from 'mapbox-gl'
export default {
  name: 'TheMap',
  data () {
    return {
      accessToken: 'pk.eyJ1Ijoid2FzcGlzY2hlIiwiYSI6ImNrazBidGRsNzBmdmIyeHJyYThjZG0wYzYifQ.qZQp-6ddFiyakTvvyCv8Gw', // your access token. Needed if you using Mapbox maps
      mapStyle: 'mapbox://styles/mapbox/dark-v10'
    }
  },
  mounted () {
    mapboxgl.accessToken = this.accessToken

    // create a new mapbox instance
    this.map = new mapboxgl.Map({
      container: 'map',
      style: this.mapStyle,
      zoom: 2, // starting zoom
      sprite: 'mapbox://sprites/mapbox/bright-v8',
      center: [-27.09651646859643, -109.3505228697389]
    })
  }

}
</script>

<style>
</style>
