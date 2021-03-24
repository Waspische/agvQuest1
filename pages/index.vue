<template>
  <v-row justify="center" align="center">
    <v-col cols="12" sm="10" md="4">
      <div class="text-center">
        <v-img
          :src="require('@/assets/pink_rabbit.jpeg')"
          max-height="300"
          contain
        />
      </div>
    </v-col>
    <v-col cols="12" sm="12" md="8">
      <v-card>
        <v-card-title class="headline">
          How to escape your nightmare?
        </v-card-title>
        <v-card-text>
          <p class="justify">
            <code>It's time! It's time! Easter is here and I want my eggs.</code>
          </p>
          <p class="justify">
            Your walk in the forest just turned into your worst nightmare, the Big Pink Bunny... What happened? You don't know. But he seems to be hungry. You may want to do what he wants.
          </p>
          <p class="justify">
            <code>Oh dear! Oh dear! You shall be too late! Tell me more and jump.</code>
          </p>
          <v-divider />
          <v-row>
            <v-col
              cols="12"
              md="4"
            >
              <v-form
                ref="form"
                v-model="valid"
                lazy-validation
              >
                <v-text-field
                  v-model="discordName"
                  :rules="[rules.required]"
                  label="Discord name"
                  placeholder="eg. Wasp#1975"
                />
              </v-form>
            </v-col>
            <v-col
              cols="12"
              md="4"
            >
              <v-btn
                class="ma-2 primary"
                large
                @click="onStart"
              >
                Talk and enter the Pink Rabbit Hole
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
  components: {
  },
  data () {
    return {
      valid: true,
      discordName: '',
      rules: {
        required: value => !!value || 'Required.'
      }
    }
  },
  methods: {
    async onStart (e) {
      // send request to join the game

      if (this.$refs.form.validate()) {
        try {
          const data = await this.$axios.$post('https://earth-2-biomes.herokuapp.com/api/quest/rabbit',
            {
              name: this.getUsername(),
              response: this.discordName
            })
          this.$router.push(data.next)
          console.log(this.discordName)
          this.setUsername(this.discordName)
        } catch (e) {
          this.discordName = ''
        }
      }
    },
    getUsername () {
      const username = JSON.parse(localStorage.getItem('username')) || this.discordName
      return username
    },
    setUsername (username) {
      localStorage.setItem('username', JSON.stringify(username))
    }
  }
}
</script>
