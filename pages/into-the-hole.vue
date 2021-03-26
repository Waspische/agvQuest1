<template>
  <v-row justify="center" align="center">
    <v-col cols="12" sm="10" md="4">
      <div class="text-center">
        <v-img
          :src="require('@/assets/eyes.jpeg')"
          max-height="300"
          contain
        />
      </div>
    </v-col>
    <v-col cols="12" sm="12" md="8">
      <v-card>
        <v-card-title class="headline">
          Outch it hurts !
        </v-card-title>
        <v-card-text>
          <p>
            Your head is spinning horribly. You put your hands on the ground and feel a warm liquid sliding over your fingers.  Your teammates are no longer with you. You are ALONE.
          </p>
          <p>
            You begin to get up on your feet when suddenly you hear a noise in the distance.
          </p>
          <p>
            "Tic, tic, tic."
          </p>
          <p>
            The noise gets closer and you start to see a figure in the shadows, with glowing eyes.
          </p>
          <p>
            "TIC, TIC, TIC, TIC"
          </p>
          <p>
            The shadow is standing here, in front of you, staring at you in the eyes. You recognize the "Catisperer", this fellow animal always here to either support you or complicate your life. Then he leans toward you and whispers in such a strange language that you only get the half of it
          </p>
          <p><code>You are alone here my friend ... I' tell you my secret, keep it for you.</code></p>
          <p><code class="code">{{ code }}</code></p>
          <p>
            SWOOOOOOOSH! He disappeared.
          </p>
          <v-divider />
          <v-row>
            <v-col
              cols="12"
              md="4"
              offset-md="3"
            >
              <v-btn
                class="ma-2 primary"
                large
                @click="step2"
              >
                Take good note and continue on your way
              </v-btn>
            </v-col>
          </v-row>
        </v-card-text>
      </v-card>
    </v-col>
  </v-row>
</template>

<script>
export default {
  name: 'IntoTheHole',
  data () {
    return {
      code: ''
    }
  },
  async mounted () {
    try {
      const data = await this.$axios.$post('https://earth-2-biomes.herokuapp.com/api/quest/thehole1',
        { name: JSON.parse(localStorage.getItem('username')) })
      this.code = data.next
    } catch (e) {
    }
  },
  methods: {
    async step2 () {
      try {
        const data = await this.$axios.$post('https://earth-2-biomes.herokuapp.com/api/quest/thehole2',
          { name: JSON.parse(localStorage.getItem('username')) })
        this.$router.push(data.next)
      } catch (e) {
      }
    }
  }
}
</script>

<style scoped>
.code{
  white-space: pre-wrap;
}
</style>
