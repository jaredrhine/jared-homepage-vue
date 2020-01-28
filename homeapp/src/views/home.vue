<template>
  <div class="home">
    <markdown-it-vue :content="pageContent" /> <!-- TODO: maybe add class attr -->
  </div>
</template>

<script>
import MarkdownItVue from "markdown-it-vue";
import content from "../assets/content.json";

export default {
  name: "home",
  components: {
    MarkdownItVue
  },
  mounted() {
    this.path = this.$route.path;
  },
  computed: {
    pageId: function() {
      let page = content.default_page;
      const indexNavPage = content.routes[this.path];
      if (indexNavPage && content.pages[indexNavPage]) page = indexNavPage;
      return page;
    },
    pageContent: function() {
      const body = content.pages[this.pageId]?.body;
      return body ? body : "";
    }
  },
  data() {
    return {
      path: "/"
    };
  },
  beforeRouteUpdate(to, from, next) {
    next();
    this.path = this.$route.path;
  }
};
</script>
