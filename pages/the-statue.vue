<template>
  <div>
    <v-row justify="center" align="center">
      <v-col cols="12" sm="10" md="4">
        <div class="text-center">
          <v-img
            :src="require('@/assets/cat-statue.png')"
            max-height="400"
            contain
          />
        </div>
      </v-col>
      <v-col cols="12" sm="12" md="8">
        <v-card>
          <v-card-title class="headline">
            Clac!
          </v-card-title>
          <v-card-text>
            <p>
              The hatch is now open! You jump directly in the hole. While falling, you feel your body returning to his normal form. Then ... blackout.
            </p>
            <p>
              You wake up in a light room surrounded by torches on the walls. Taking a quick look around, you see that your teammates are all over the place, as lost as you are. No exit are visible.
            </p>
            <p> A big rock statue is in front of you. A clock is at its feet, but without clock hand.</p>
            <p> Is there any timeline here?</p>
          </v-card-text>
        </v-card>
      </v-col>
    </v-row>
  </div>
</template>

<script>
export default {
  name: 'TheStatue'
}
</script>

<style scoped>

</style>
