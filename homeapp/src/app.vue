<template>
  <div id="jared--container">
    <div id="sidebar">
      <header id="sidebar-top">
        <router-link to="/">
          <img width="90" src="@/assets/jared-profile-crater-lake-headshot.png" />
        </router-link>
      </header>

      <nav id="sidebar-toc">
        <sidebar @change-route="helpRaise()" />
      </nav>

      <footer id="sidebar-bottom">
        <router-link to="/colophon">Colophon</router-link> <br />
        <router-link to="/copyright">Copyright</router-link>
      </footer>
    </div>

    <article id="jared--content">
      <main id="main">
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
  --jared--font-markdown: -apple-system,BlinkMacSystemFont,Segoe UI,Helvetica,Arial,sans-serif,Apple Color Emoji,Segoe UI Emoji,Segoe UI Symbol;
  --jared--font-mono: Consolas, "Andale Mono WT", "Andale Mono", "Lucida Console", "Lucida Sans Typewriter", "DejaVu Sans Mono", "Bitstream Vera Sans Mono", "Liberation Mono", "Nimbus Mono L", Menlo, Monaco, "Courier New", Courier, monospace;
  --jared--font-base: var(--jared--font-markdown);
  --jared--color-alpha-h: 140;
  --jared--color-alpha-s: 60%;
  --jared--color-alpha-l: 25%;
  --jared--color-alpha: hsl(var(--jared--color-alpha-h), var(--jared--color-alpha-s), var(--jared--color-alpha-l));
  --jared--color-alpha--light10: hsl(var(--jared--color-alpha-h), var(--jared--color-alpha-s), calc(var(--jared--color-alpha-l) + 10%));
  --jared--color-alpha--light15: hsl(var(--jared--color-alpha-h), var(--jared--color-alpha-s), calc(var(--jared--color-alpha-l) + 15%));
  --jared--text-color: hsl(60, 85%, 80%);
  --jared--color-grey--50: hsl(0,0%,50%);
  --jared--color-grey--80: hsl(0,0%,73.4%); /* #bbb */
}

html,
body {
  width: 100vh;
  height: 100vh;
}

body {
  background-color: var(--jared--color-alpha);
  color: var(--jared--text-color);
  font-family: var(--jared--font-base);
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: left;
}

h1,
h2 {
  margin-block-start: 0;
}

h1 {
  font-size: 2em;
  margin-block-end: 0.6rem;
}

h2 {
  margin-block-end: 0.5rem;
}

#jared--container {
  width: 100vw;
}

#jared--content {
  display: block;

  @media (min-width: 980px) {
    display: grid;
    grid-template-columns: 14rem auto;
    grid-template-areas: "main";
  }
}

#main {
  grid-area: main;

  @media (min-width: 980px) {
    grid-column-start: 2;
  }

  // width: inherit;
  // height: 100vh;
  padding: 1rem;
}

#sidebar {
  height: 12rem;
  overflow: auto;

  @media (min-width: 980px) {
    display: grid;
    position: fixed;
    width: 14rem;
    height: 100vh;
    grid-template-areas: "sidebar-top" "sidebar-toc" "sidebar-bottom";
    grid-template-columns: auto;
    grid-template-rows: auto 1fr auto;
  }
}

#sidebar-toc {
  grid-area: sidebar-toc;
  height: auto;

  @media (min-width: 980px) {
    overflow: auto;
  }

  background-color: var(--jared--color-alpha--light10);

  line-height: 1.5rem;

  padding: 1rem;
  padding-left: 0.5rem;
  padding-top: 0;

  a {
    // font-weight: bold;
    // color: #2c3e50;
    padding-left: 0.5rem;

    &.router-link-exact-active {
      // margin-top: 1rem;
      font-size: 1.2rem;
      background-color: var(--jared--color-alpha);
      padding: 0.2rem 0.5rem 0.2rem 0.5rem;
    }
  }
}

#sidebar-top {
  float: right;

  @media (min-width: 980px) {
    float: none;
  }

  grid-area: sidebar-top;
  background-color: var(--jared--color-alpha--light10);
  padding: 1rem;
}

#sidebar-bottom {
  grid-area: sidebar-bottom;
  background-color: var(--jared--color-alpha--light10);
  padding: 1rem;
}

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
  // font-family: var(--jared--font-base) !important;
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
}

.markdown-body h1,
.markdown-body h2 {
  border-bottom: 0 !important;
}

.markdown-body blockquote {
  color: var(--jared--text-color) !important;
}

/* wat */
.hljs {
  color: var(--jared--text-color) !important;
}
</style>
