<template>
  <div>
    <v-row justify="center" align="center">
      <v-col cols="12" sm="10" md="5">
        <div class="text-center">
          <v-img
            :src="require('@/assets/pink_dragon.jpeg')"
            max-height="500"
            contain
          />
        </div>
      </v-col>
      <v-col cols="12" sm="12" md="7">
        <v-card>
          <v-card-title class="headline">
            RAAAAAAAAAAAA
          </v-card-title>
          <v-card-text>
            <p>After finding the first egg, stairs appeared under the map. You go down for like 10 long minutes, and open the doors in front of you.</p>
            <p class="text-h6">
              <code>THIS F*CKING RABBIT TURNED ME PINK !!! I CAN'T BEAR IT ...</code>
            </p>
            <p>The dragon is furious. In his rage, he transforms you into a tiny mouse. You are now as little as a hand.</p>
            <p>You start to climb on the rocks, on the side of the cave to observe the situation</p>
            <p>The dragon is gigantic and standing in the middle of the cave. A bright glow comes to your eye. You fill your eyes, and right under his left foot, you can see, shining, the last golden egg next to a h<span class="font-weight-medium" @click="nextStep">o</span>le.</p>
            <p><code>You are like those rabbits, digging and hiding in those holes. If I see you, i will burn you !</code></p>
          </v-card-text>
        </v-card>
        <v-card>
          <v-card-title class="headline mt-2 mb-1">
            What do you do ?
          </v-card-title>
        </v-card>
        <v-row no-gutters>
          <v-col cols="12" md="12">
            <v-btn block class="ma-1" @click="attack">
              Attack the dragon with my sharpened teeth
            </v-btn>
            <v-btn block class="ma-1" @click="run">
              Run away
            </v-btn>
            <v-btn block class="ma-1" @click="dragon">
              Let the dragon attack and see what happen
            </v-btn>
            <v-btn block class="ma-1" @click="dice">
              Roll a dice, I can get a critical
            </v-btn>
          </v-col>
        </v-row>
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
  name: 'TheDragon',
  data () {
    return {
      snackbar: false,
      text: '',
      timeout: 3000
    }
  },
  methods: {
    async nextStep () {
      try {
        const data = await this.$axios.$post('http://localhost:8080/api/quest/thedragon',
          { name: JSON.parse(localStorage.getItem('username')) })
        this.$router.push(data.next)
      } catch (e) {
      }
    },
    run () {
      this.snackbar = true
      this.text = 'But where? There is no issue.'
    },
    dice () {
      this.snackbar = true
      this.text = 'You don\'t have a dice, only some paper.'
    },
    attack () {
      this.snackbar = true
      this.text = 'You really think that you\'re gonna win?'
    },
    dragon () {
      this.snackbar = true
      this.text = 'He does nothing. Just sitting on his egg.'
    }
  }
}
</script>

<style scoped>

</style>
