<template>
  <v-container>
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
              You arrive in a large room with a table in the center. You come closer and distinguishes a drawn map. Around you, some weird faces on the walls. You look at them one by one and a detail come to your eyes. It looks like the 1 043rd is messing with you!
            </p>
            <p>It comes with a small text <code>The first egg is here, 'In STYLE'. WHAT?! No! On the map obviously.</code></p>
            <p>There is a pink button right above the map but you do not know what it does. </p>
          </v-card-text>
          <v-card-actions>
            <v-btn
              class="ma-2 primary"
              large
              @click="zoom"
            >
              Show me
            </v-btn>
          </v-card-actions>
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
  </v-container>
</template>

<script>
import mapboxgl from 'mapbox-gl'
import egg from '../assets/silver_egg.png'

export default {
  name: 'TheRealMap',
  data () {
    return {
      accessToken: 'pk.eyJ1Ijoid2FzcGlzY2hlIiwiYSI6ImNrazBidGRsNzBmdmIyeHJyYThjZG0wYzYifQ.qZQp-6ddFiyakTvvyCv8Gw', // your access token. Needed if you using Mapbox maps
      mapStyle: 'mapbox://styles/mapbox/dark-v10'
    }
  },
  mounted () {
    mapboxgl.accessToken = this.accessToken

    // create a new mapbox instance
    const map = new mapboxgl.Map({
      container: 'map',
      style: this.mapStyle,
      zoom: 1, // starting zoom
      sprite: 'mapbox://sprites/mapbox/bright-v8'
    })
    map.on('load', function () {
      map.loadImage(egg,
        function (error, image) {
          if (error) { throw error }
          map.addImage('cat', image)
          map.addSource('point', {
            type: 'geojson',
            data: {
              type: 'FeatureCollection',
              features: [
                {
                  type: 'Feature',
                  geometry: {
                    type: 'Point',
                    coordinates: [0, 0]
                  }
                }
              ]
            }
          })
          map.addLayer({
            id: 'points',
            type: 'symbol',
            source: 'point',
            layout: {
              'icon-image': 'cat',
              'icon-size': 0.25
            },
            maxzoom: 0.000001
          })
        }
      )
    })

    map.on('click', 'points', this.onEggClick)

    this.map = map
  },
  methods: {
    async onEggClick () {
      try {
        const data = await this.$axios.$post('http://localhost:8080/api/quest/themap',
          { name: JSON.parse(localStorage.getItem('username')) })
        this.$router.push(data.next)
      } catch (e) {
      }
    },
    zoom () {
      this.map.flyTo({
        center: [-109.349149, -27.097126],
        zoom: 10.5
      })
    }
  }

}
</script>

<style scoped>

</style>
