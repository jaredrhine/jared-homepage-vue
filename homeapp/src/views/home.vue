<template>
  <div class="home">
    <h1 v-if="pageTitle" v-html="pageTitle" />
    <div ref="markdown-container" />
  </div>
</template>

<script>
import content from "../assets/content.json"

import MarkdownIt from "markdown-it"
import markdownItGithubToc from "markdown-it-github-toc"
import markdownItAttrs from "markdown-it-attrs"

export default {
  name: "home",
  mounted() {
    this.path = this.$route.path
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
  watch: {
    pageSource: {
      immediate: true,
      handler(val) {
        const options = { typographer: true, html: true }
        const tocOptions = { anchorLink: false }
        let md = new MarkdownIt(options)
          .use(markdownItGithubToc, tocOptions)
          .use(markdownItAttrs)
        this.$nextTick(() => {
          this.$refs["markdown-container"].innerHTML = md.render(val)
        })
      },
    },
  },
  computed: {
    pageId: function () {
      let page = content.default_page
      const indexNavPage = content.routes[this.path]
      if (indexNavPage && content.pages[indexNavPage]) page = indexNavPage
      return page
    },
    pageSource: function () {
      const body = this.page?.body
      return body ? body : ""
    },
    pageTitle: function () {
      if (this.page?.no_title) return
      const title = this.page?.title || this.page?.frontmatter?.title || this.page?.name
      return title
    },
    page: function () {
      return content.pages[this.pageId]
    },
  },
}
</script>
