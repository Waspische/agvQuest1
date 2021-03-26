<template>
  <v-container>
    <p
      class="text-h4 text-center"
    >
      You fall into a giant
    </p><p class="text-h4 text-center">
      h<span class="hole">O</span>le !
    </p>
  </v-container>
</template>

<script>
export default {
  name: 'TheHole',
  mounted () {
    setTimeout(() => { this.$router.replace('/into-the-hole') }, 4000)
  }
}
</script>

<style scoped>
.hole{
  font-size: 25.125rem !important;
  font-weight: 400;
  line-height: 26rem;
  letter-spacing: 0.0073529412em !important;
  font-family: "Roboto", sans-serif !important;
}
</style>
