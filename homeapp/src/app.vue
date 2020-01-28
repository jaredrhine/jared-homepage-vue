<template>
  <article id="jared">
    <header id="header">
      jared.wordzoo.com
    </header>

    <nav id="sidebar">
      <sidebar @change-route="helpRaise()"/>
    </nav>

    <main id="main">
      <router-view />
    </main>

    <footer id="footer">Path={{ $route.path }}</footer>
  </article>
</template>

<script>
import Sidebar from "./components/sidebar.vue";

export default {
  name: "app",
  components: { Sidebar }
}
</script>

<style lang="scss">
:root {
  --jared--font-family: "Avenir", Helvetica, Arial, sans-serif;
  --jared--color-alpha-h: 140;
  --jared--color-alpha-s: 60%;
  --jared--color-alpha-l: 25%;
  --jared--color-alpha: hsl(
    var(--jared--color-alpha-h),
    var(--jared--color-alpha-s),
    var(--jared--color-alpha-l)
  );
  --jared--color-alpha--light15: hsl(
    var(--jared--color-alpha-h),
    var(--jared--color-alpha-s),
    calc(var(--jared--color-alpha-l) + 15%)
  );
  --jared--text-color: hsl(60, 85%, 80%);
}

html,
body {
  width: 100%;
  height: 100%;
}

body {
  background-color: var(--jared--color-alpha);
  color: var(--jared--text-color);
  font-family: var(--jared-font-family);
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: left;
}

#jared {
  min-height: 97vh;
  display: grid;
  grid-template-columns: 12rem 1fr;
  grid-template-rows: auto 1fr auto;
  grid-template-areas: "header header" "sidebar main" "footer footer";
}

#main {
  grid-area: main;
  height: 100%;
  padding: 1rem;
}

#sidebar {
  grid-area: sidebar;
  background-color: var(--jared--color-alpha--light15);

  padding: 1rem;

  a {
    // font-weight: bold;
    // color: #2c3e50;

    // &.router-link-exact-active {
      // color: #42b983;
    // }
  }
}

#header {
  grid-area: header;
  padding: 1rem;
  // float: right;
}

#footer {
  grid-area: footer;
  padding: 1rem;
}

.markdown-body {
  color: var(--jared--text-color) !important;
}

.markdown-body a {
  color: var(--jared--text-color) !important;
  text-decoration: underline !important;
}

.markdown-body pre, .markdown-body.highlight pre {
  color: var(--jared--text-color) !important;
  background-color: var(--jared--color-alpha) !important;
}

.markdown-body table tr {
  background-color: var(--jared--color-alpha) !important;
}

/* wat */
.hljs {
  color: var(--jared--text-color) !important;
}
</style>
