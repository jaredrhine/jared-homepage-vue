<template>
  <div>
    <div v-for="(link, index) in links" v-bind:key="index">
      <router-link :to="link.route">{{ link.text }}</router-link> <br />
    </div>
  </div>
</template>

<script>
import content from "../assets/content.json";

export default {
  computed: {
    links: function() {
      const list = content.navigation
      const output = []
      list.forEach(link => {
        const page = content.routes[link];
        const name = content.pages[page]?.name;
        output.push({ route: link, text: name })
      })
      return output;
    }
  }
}
</script>

<style lang="scss">
a {
  color: var(--jared--text-color);
  text-decoration: none;

  &:hover {
    color: var(--jared--text-color);
    text-decoration: underline;
  }

  &:visited {
    color: var(--jared--text-color);
  }
}
</style>
