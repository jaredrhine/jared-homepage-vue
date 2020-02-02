<template>
  <div class="home">
    <h1 v-if="pageTitle" v-html="pageTitle" />
    <markdown-it-vue :content="pageContent" />
    <!-- TODO: maybe add class attr -->
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
      const body = this.page?.body;
      return body ? body : "";
    },
    pageTitle: function() {
      if (this.page?.no_title) return;
      const title = this.page?.title || this.page?.frontmatter?.title || this.page?.name;
      return title;
    },
    page: function() {
      return content.pages[this.pageId];
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
