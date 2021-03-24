<template>
  <div>
    <v-row justify="center" align="center">
      <v-col cols="12" sm="10" md="4">
        <div class="text-center">
          <v-img
            :src="require('@/assets/ground_hatch.png')"
            max-height="300"
            contain
          />
        </div>
      </v-col>
      <v-col cols="12" sm="12" md="8">
        <v-card>
          <v-card-title class="headline">
            SH*T
          </v-card-title>
          <v-card-text>
            <p>
              You took your small legs to run as fast as you could to reach the egg. You took it and moved forward to the hole.
            </p>
            <p>
              Your eyes fooled you! The hole is closed by a big hatch.
            </p>
            <p> There is a kind of code written right next to it, which looks familiar to you.</p>
            <p> At this moment, the dragon starts to roar upon you head. The egg is close to you. The pressure is unbearable. </p>
            <p><code>Say it ! 8 44 33 0 3 777 2 4 666 66 0 444 7777 0 2 0 555 444 33</code></p>
            <v-divider />
            <v-row>
              <v-col
                cols="12"
                md="4"
              >
                <v-text-field
                  v-model="phrase"
                  label="Phrase"
                />
              </v-col>
              <v-col
                cols="12"
                md="4"
              >
                <v-btn
                  class="ma-2 primary"
                  large
                  @click="phraseIt"
                >
                  Pronounce the unlocking phrase
                </v-btn>
              </v-col>
            </v-row>
          </v-card-text>
        </v-card>
      </v-col>
    </v-row>

    <v-snackbar
      v-model="snackbar"
      :timeout="timeout"
      color="red darken-3"
    >
      {{ text }}

      <template #action="{ attrs }">
        <v-btn
          text
          v-bind="attrs"
          @click="snackbar = false"
        >
          Close
        </v-btn>
      </template>
    </v-snackbar>
  </div>
</template>

<script>
export default {
  name: 'TheEntrance',
  data () {
    return {
      phrase: '',
      snackbar: false,
      text: 'Wrong! Quick the dragon will eat you shoon!',
      timeout: 3000
    }
  },
  methods: {
    async phraseIt () {
      try {
        const data = await this.$axios.$post('https://earth-2-biomes.herokuapp.com/api/quest/theentrance',
          {
            name: JSON.parse(localStorage.getItem('username')),
            response: this.phrase
          })
        this.$router.push(data.next)
      } catch (e) {
        this.phrase = ''
        this.snackbar = true
      }
    }
  }
}
</script>

<style scoped>

</style>
