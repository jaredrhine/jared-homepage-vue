<template>
  <div id="jared-container">
    <div id="jared-sidebar">
      <header id="jared-sidebar--top">
        <a href="/">
          <img width="90" src="@/assets/jared-profile-crater-lake-headshot.png" />
        </a>
      </header>

      <nav id="jared-sidebar--toc">
        <sidebar @change-route="helpRaise()" />
      </nav>

      <footer id="jared-sidebar--bottom">
        <router-link to="/colophon">Colophon</router-link> <br />
        <router-link to="/copyright">Copyright</router-link>
      </footer>
    </div>

    <article id="jared-content">
      <main id="jared-content--main">
        <router-view />
      </main>
    </article>
  </div>
</template>

<script>
import Sidebar from "./components/sidebar.vue"

export default {
  name: "app",
  components: { Sidebar },
}
</script>

<style lang="scss">
/* prettier-ignore */
:root {
  --jared--font-jared-temp: "Avenir", Helvetica, Arial, sans-serif;
  // --jared--font-markdown: -apple-system,BlinkMacSystemFont,Segoe UI,Helvetica,Arial,sans-serif,Apple Color Emoji,Segoe UI Emoji,Segoe UI Symbol;
  --jared--font-markdown: Helvetica,Arial,sans-serif;
  --jared--font-mono: Consolas, "Andale Mono WT", "Andale Mono", "Lucida Console", "Lucida Sans Typewriter", "DejaVu Sans Mono", "Bitstream Vera Sans Mono", "Liberation Mono", "Nimbus Mono L", Menlo, Monaco, "Courier New", Courier, monospace;
  --jared--font-base: var(--jared--font-markdown);
  --jared--color-alpha-h: 140;
  --jared--color-alpha-s: 60%;
  --jared--color-alpha-l: 25%;
  --jared--color-alpha: hsl(var(--jared--color-alpha-h), var(--jared--color-alpha-s), var(--jared--color-alpha-l));
  --jared--color-alpha--light10: hsl(var(--jared--color-alpha-h), var(--jared--color-alpha-s), calc(var(--jared--color-alpha-l) + 10%));
  --jared--color-alpha--light15: hsl(var(--jared--color-alpha-h), var(--jared--color-alpha-s), calc(var(--jared--color-alpha-l) + 15%));
  --jared--color-beta-h: 60;
  --jared--color-beta-s: 85%;
  --jared--color-beta-l: 80%;
  --jared--color-beta: hsl(var(--jared--color-beta-h), var(--jared--color-beta-s), var(--jared--color-beta-l));
  --jared--color-beta--light10: hsl(var(--jared--color-beta-h), var(--jared--color-beta-s), calc(var(--jared--color-beta-l) + 10%));
  --jared--color-beta--dark45: hsl(var(--jared--color-beta-h), var(--jared--color-beta-s), calc(var(--jared--color-beta-l) - 45%));
  --jared--color-grey--50: hsl(0,0%,50%);
  --jared--color-grey--80: hsl(0,0%,73.4%); /* #bbb */
  --jared--text-color: var(--jared--color-beta);
  --jared--link-underline-color: var(--jared--color-beta--dark45);
}

body {
  // font-family: var(--jared--font-base);
  background-color: var(--jared--color-alpha);
  color: var(--jared--text-color);
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
}

a {
  text-decoration: underline;
  text-decoration-color: var(--jared--link-underline-color);
}

h1,
h2,
h3 {
  margin-block-start: 0;
  margin-block-end: 0;
  line-height: 1.3rem;
}

h1 {
  font-size: 1.85em;
  line-height: 2rem;
}

h2,
h3 {
  margin-bottom: 0.5rem;
}

table,
th,
td {
  border: 1px solid var(--jared--color-beta);
  border-collapse: collapse;
  padding: 0 0.4rem;
  vertical-align: top;
}

table {
  margin-bottom: 1rem;
}

thead {
  vertical-align: bottom;
}

#jared-container {
  --jared-sidebar-width: 9.5rem;
  line-height: 1.3rem;

  display: grid;
  grid-template-rows: auto 1fr;
  grid-template-areas: "sidebar" "content";
}

#jared-content,
#jared-sidebar {
  padding: 0.6rem;
}

#jared-content {
  grid-area: content;
  line-height: 1.45rem;
}

#jared-sidebar {
  grid-area: sidebar;

  display: grid;
  grid-template-columns: none;
  grid-template-rows: auto 1fr auto;
  grid-template-areas: "sidebar-top" "sidebar-toc" "sidebar-bottom";

  background-color: var(--jared--color-alpha--light10);
  font-size: 0.85rem;

  & a {
    text-decoration: none;
    padding-left: 0.5rem;

    &:hover {
      text-decoration: underline;
    }

    &.router-link-exact-active {
      background-color: var(--jared--color-alpha);
      padding: 0.2rem 0.5rem 0.2rem 0.5rem;
    }
  }
}

// revisit breakpoints

@media screen and (max-width: 768px) {
  #jared-container {
    font-size: 0.93rem;
  }
}

@media screen and (min-width: 568px) {
  #jared-container {
    grid-template-rows: none;
    grid-template-columns: var(--jared-sidebar-width) minmax(300px, 1100px); // 1fr; // minmax(1fr, 1200px); // auto 1fr; // can't auto in col 1?
    grid-template-areas: "sidebar content";
  }

  #jared-sidebar {
    width: var(--jared-sidebar-width);
    height: 100vh;
    position: fixed;
    grid-template-rows: auto 1fr auto;
    grid-template-columns: auto;
  }
}

#jared-sidebar--top {
  grid-area: sidebar-top;
}

#jared-sidebar--toc {
  grid-area: sidebar-toc;
  overflow: auto;
  min-height: 5rem;
}

#jared-sidebar--bottom {
  grid-area: sidebar-bottom;
  margin-top: 1rem;
}

/*
#header {
  grid-area: header;
  padding: 1rem;
  // float: right;
  font-family: var(--jared--font-mono);
}

#footer {
  grid-area: footer;
  padding: 1rem;
  display: none;
}

.markdown-body {
  font-family: var(--jared--font-base) !important;
  color: var(--jared--text-color) !important;
}

.markdown-body a {
  color: var(--jared--text-color) !important;
  text-decoration: underline !important;
}

.markdown-body pre,
.markdown-body.highlight pre {
  color: var(--jared--text-color) !important;
  background-color: var(--jared--color-alpha) !important;
}

.markdown-body table tr {
  background-color: var(--jared--color-alpha) !important;
  border: 1px solid black;
}

.markdown-body h1,
.markdown-body h2 {
  border-bottom: 0 !important;
}

.markdown-body h2 {
  padding-bottom: 0.2rem !important;
}

.markdown-body blockquote {
  color: var(--jared--text-color) !important;
}

// wat
.hljs {
  color: var(--jared--text-color) !important;
}

.markdownIt-TOC {
  list-style: none;
}
*/
</style>
