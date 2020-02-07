<template>
  <div class="home">
    <h1 v-if="pageTitle" v-html="pageTitle" />
    <div class="markdown-body" ref="markdown-container" />
  </div>
</template>

<script>
import content from "../assets/content.json"

import MarkdownIt from "markdown-it"

export default {
  name: "home",
  mounted() {
    this.path = this.$route.path
  },
  computed: {
    pageId: function() {
      let page = content.default_page
      const indexNavPage = content.routes[this.path]
      if (indexNavPage && content.pages[indexNavPage]) page = indexNavPage
      return page
    },
    pageSource: function() {
      const body = this.page?.body
      return body ? body : ""
    },
    pageTitle: function() {
      if (this.page?.no_title) return
      const title = this.page?.title || this.page?.frontmatter?.title || this.page?.name
      return title
    },
    page: function() {
      return content.pages[this.pageId]
    },
  },
  watch: {
    pageSource: {
      immediate: true,
      handler(val) {
        const options = {}
        let md = new MarkdownIt(options)
        this.$nextTick(() => {
          this.$refs['markdown-container'].innerHTML = md.render(val)
        })
      }
    },
  },
  data() {
    return {
      path: "/",
    }
  },
  beforeRouteUpdate(to, from, next) {
    next()
    this.path = this.$route.path
  },
}
</script>
