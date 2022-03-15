<template>
  <!-- TODO: this id-based CSS is silly, fix it -->
  <div
    id="jared-container"
    :class="{ 'jared-container--with-nav': showNav, 'jared-container--without-nav': !showNav }"
    :style="jaredStyle"
  >
    <div v-if="showNav" id="jared-sidebar">
      <header id="jared-sidebar--top">
        <div>
          <a class="jared-headshot--link" href="/"><img
              src="@/assets/jared-profile-crater-lake-headshot.png"
              class="jared-headshot--image"
              width="90"
          /></a>
        </div>
      </header>

      <nav id="jared-sidebar--toc">
        <sidebar @change-route="helpRaise()" />
      </nav>

      <footer id="jared-sidebar--bottom">
        <router-link to="/colophon">Colophon</router-link> <br />
        <router-link to="/copyright">Copyright</router-link>
      </footer>

      <div v-if="showNav">
        <button v-if="showNav" @click="toggleNav()" class="jared-nav-trigger--button--inline">
          <svg id="jared-nav--toggle" viewBox="0 0 32 32">
            <path class="jared-svg--border" d="M 0,0 H 32 V 32 H 0 Z" />
            <path class="jared-svg--menu-bar" d="M 4,4 L 28,28" />
            <path class="jared-svg--menu-bar" d="M 4,28 L 28,4" />
          </svg>
          <span class="jared-nav-trigger--label">close nav</span>
        </button>
      </div>
    </div>

    <article id="jared-content">
      <main id="jared-content--main">
        <router-view />
      </main>
    </article>

    <button v-if="!showNav" @click="toggleNav()" class="jared-nav-trigger--button--floating">
      <span class="jared-nav-trigger--label">show nav</span>
      <svg id="jared-nav--toggle" viewBox="0 0 32 32">
        <path class="jared-svg--border" d="M 0,0 H 32 V 32 H 0 Z" />
        <path class="jared-svg--menu-bar" d="M 3,7 H 29" />
        <path class="jared-svg--menu-bar" d="M 3,16 H 29" />
        <path class="jared-svg--menu-bar" d="M 3,25 H 29" />
      </svg>
    </button>
  </div>
</template>

<script>
import Sidebar from "./components/sidebar.vue"

// TODO: move to export, this is easier to dev right now
const themesOp = () => {
  const baseTheme = {
    "font-base--size--smallphone": "12pt",
    "font-base--size--tablet": "13pt",
    "font-base--size--smalldesk": "13.5pt",
    "font-base--size--widedesk": "14pt",

    "color-grey--500": "#9e9e9e",
    "color-grey--800": "#424242",
    "color-grey--900": "#212121",

    "color-alpha-h": "140",
    "color-alpha-s": "60%",
    "color-alpha-l": "25%",
    "color-beta-h": "60",
    "color-beta-s": "85%",
    "color-beta-l": "80%",

    "color-alpha--light10":
      "hsl(var(--jared--color-alpha-h), var(--jared--color-alpha-s), calc(var(--jared--color-alpha-l) + 10%))",
    "color-alpha--light15":
      "hsl(var(--jared--color-alpha-h), var(--jared--color-alpha-s), calc(var(--jared--color-alpha-l) + 15%))",
    "color-alpha--dark5":
      "hsl(var(--jared--color-alpha-h), var(--jared--color-alpha-s), calc(var(--jared--color-alpha-l) - 5%))",
    "color-alpha--dark10":
      "hsl(var(--jared--color-alpha-h), var(--jared--color-alpha-s), calc(var(--jared--color-alpha-l) - 10%))",
    "color-alpha--dark15":
      "hsl(var(--jared--color-alpha-h), var(--jared--color-alpha-s), calc(var(--jared--color-alpha-l) - 15%))",
    "color-beta--light10":
      "hsl(var(--jared--color-beta-h), var(--jared--color-beta-s), calc(var(--jared--color-beta-l) + 10%))",
    "color-beta--dark45":
      "hsl(var(--jared--color-beta-h), var(--jared--color-beta-s), calc(var(--jared--color-beta-l) - 45%))",

    "color-alpha":
      "hsl(var(--jared--color-alpha-h), var(--jared--color-alpha-s), var(--jared--color-alpha-l))",
    "color-beta":
      "hsl(var(--jared--color-beta-h), var(--jared--color-beta-s), var(--jared--color-beta-l))",

    "link-underline-color": "var(--jared--color-beta--dark45)",

    "text-color": "var(--jared--color-beta)",
  }

  return {
    jaredGreen: {
      ...baseTheme,
    },
    corporate: {
      ...baseTheme,
      "color-alpha-h": "208",
      "color-alpha-s": "85%",
      "color-alpha-l": "7%",
      "color-beta-h": "34",
      "color-beta-s": "78%",
      "color-beta-l": "84%",
    },
  }
}

const themes = themesOp()

export default {
  components: { Sidebar },
  data() {
    return {
      currentThemeName: "corporate",
      showNav: true,
    }
  },
  computed: {
    jaredStyle: function () {
      let style = {}
      let theme = this.currentTheme
      const props = Object.getOwnPropertyNames(theme)
      props.forEach((prop) => {
        const styleAttr = "--jared--" + prop
        const val = theme[prop]
        style[styleAttr] = val
      })
      return style
    },
    currentTheme: function () {
      return themes[this.currentThemeName] || {}
    },
  },
  methods: {
    toggleNav: function () {
      this.showNav = !this.showNav
    },
  },
}
</script>

<style lang="scss">
/* prettier-ignore */
:root {
  --jared--font-modernize-default: system-ui,-apple-system,'Segoe UI',Roboto,Helvetica,Arial,sans-serif,'Apple Color Emoji','Segoe UI Emoji';
  --jared--font-jared-temp: "Avenir", Helvetica, Arial, sans-serif;
  --jared--font-markdown: Helvetica,Arial,sans-serif;
  --jared--font-mono: Consolas, "Andale Mono WT", "Andale Mono", "Lucida Console", "Lucida Sans Typewriter", "DejaVu Sans Mono", "Bitstream Vera Sans Mono", "Liberation Mono", "Nimbus Mono L", Menlo, Monaco, "Courier New", Courier, monospace;
  --jared--font-base: var(--jared--font-modernize-default);

  --jared--spacing--2xs: 0.125rem;
  --jared--spacing--xs: 0.20rem;
  --jared--spacing--sm: 0.250rem;
  --jared--spacing--md: 0.500rem;
  --jared--spacing--lg: 0.750rem;
  --jared--spacing--xl: 0.875rem;
  --jared--spacing--2xl: 1.00rem;
  --jared--spacing--3xl: 1.50rem;
  --jared--spacing--4xl: 2.00rem;
  --jared--spacing--gap-md: calc(var(--jared--spacing--4xl) * 2.5);
  --jared--spacing--gap-lg: calc(var(--jared--spacing--gap-md) * 2);

  --jared--text--sm: 0.875rem;
  --jared--text--md: 1.00rem;
  --jared--text--2xl: 2.00rem;
  --jared--text--3xl: 2.75rem;

  --jared--text-line-height--lg: calc(var(--jared--spacing--xl) * 2);
}

body {
  font-family: var(--jared--font-base);
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  background-color: hsl(208, 85%, 7%); // TODO: rework to be theme-supporting
}

@media screen {
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
    font-size: var(--jared--text--3xl);
    line-height: var(--jared--text--3xl);
    margin-top: var(--jared--spacing--xl);
    margin-bottom: var(--jared--spacing--xl);
  }

  h1:first-of-type {
    margin-top: 0;
  }

  h2,
  h3 {
    margin-top: var(--jared--spacing--xl);
  }

  table,
  th,
  td {
    border: 1px solid var(--jared--color-beta);
    border-collapse: collapse;
    vertical-align: top;
  }

  table {
    margin-top: var(--jared--spacing--xl);
    margin-bottom: var(--jared--spacing--4xl);
  }

  thead {
    vertical-align: bottom;
  }

  th,
  td {
    padding: var(--jared--spacing--md) var(--jared--spacing--md);
  }

  p,
  ul,
  ol {
    margin-top: var(--jared--spacing--lg);
    margin-bottom: 0;
    line-height: var(--jared--text-line-height--lg);
  }

  li {
    margin: var(--jared--spacing--sm);
    line-height: var(--jared--text-line-height--lg);
  }

  li ul {
    margin-top: var(--jared--spacing--sm);
  }

  p > code,
  li > code,
  dd > code,
  td > code {
    background-color: var(--jared--color-alpha--dark5);
    border-radius: 0.2rem;
    padding: 0.05rem 0.15rem;
  }
}

/* TODO: my my, this DOM/CSS structure has gotten ugly, hasn't it... */

@media screen {
  #jared-container {
    --jared-sidebar-width: 9.5rem;

    display: grid;
    grid-template-areas: "content";
    grid-template-columns: 100%;
    grid-template-rows: auto;
    min-height: 100vh;

    font-size: var(--jared--font-base--size--smallphone);
    background-color: var(--jared--color-alpha);
    color: var(--jared--text-color);
    line-height: 1.3rem;
  }

  #jared-container.jared-container--with-nav {
    grid-template-areas: "sidebar" "content";
    grid-template-rows: auto 1fr;
  }

  #jared-content,
  #jared-sidebar {
    padding: var(--jared--spacing--lg);
  }

  #jared-content {
    grid-area: content;
  }

  #jared-sidebar {
    height: 100%;
    grid-area: sidebar;

    display: grid;
    grid-template-areas: "sidebar-top" "sidebar-toc" "sidebar-bottom";
    grid-template-columns: none;
    grid-template-rows: auto 1fr auto;

    background-color: var(--jared--color-alpha--light10);
    font-size: var(--jared--text--sm);

    & a {
      text-decoration: none;
      padding-left: var(--jared--spacing--md);

      &:hover {
        text-decoration: underline;
      }

      &.router-link-exact-active {
        background-color: var(--jared--color-alpha);
        padding: var(--jared--spacing--2xs) var(--jared--spacing--md);
      }
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
    margin-top: var(--jared--spacing--2xl);
  }

  #jared-homepage--opener {
    margin-top: var(--jared--spacing--gap-lg);
  }

  #jared-homepage--middle {
    margin: var(--jared--spacing--gap-md) 0;
  }
}

@media screen and (min-width: 600px) {
  #jared-container.jared-container--with-nav {
    grid-template-areas: "sidebar content";
    grid-template-rows: auto;
    grid-template-columns: var(--jared-sidebar-width) minmax(300px, 900px);
  }

  #jared-container.jared-container--without-nav {
    grid-template-areas: "content";
    grid-template-rows: auto;
    grid-template-columns: auto;
  }

  #jared-sidebar {
    width: var(--jared-sidebar-width);
    position: fixed;
    grid-template-rows: auto 1fr auto;
    grid-template-columns: auto;
  }

  #jared-content {
    height: 100%;
    min-height: 100vh;
  }
}

@media screen and (min-width: 768px) {
  #jared-container {
    font-size: var(--jared--font-base--size--tablet);
  }
}

@media screen and (min-width: 1024px) {
  #jared-container {
    font-size: var(--jared--font-base--size--smalldesk);
  }
}

@media screen and (min-width: 1280px) {
  #jared-container {
    font-size: var(--jared--font-base--size--widedesk);
  }
}

.jared-nav-trigger--button--floating {
  border-radius: var(--jared--spacing--lg);
  position: fixed;
  bottom: var(--jared--spacing--md);
  right: var(--jared--spacing--md);
}

.jared-nav-trigger--button--inline {
  margin-top: var(--jared--spacing--lg);
  border-radius: var(--jared--spacing--lg);
}

.jared-nav-trigger--label {
  padding: var(--jared--spacing--sm);
  position: relative; // TODO: vertically center probably, flexbox
  bottom: calc(var(--jared--spacing--sm) * 1.5;
}

.jared-headshot--image {
  border-radius: 50%;
  display: block;
}

#jared-sidebar .jared-headshot--link {
  padding-left: 0;
}

#jared-nav--toggle {
  height: 24px;
  position: relative;
  top: 1px; // TODO: improve
}

.jared-svg--border {
  stroke: var(--jared--color-beta);
  stroke-width: 1px;
}

.jared-svg--menu-bar {
  stroke: var(--jared--color-beta);
  stroke-width: 4px;
}

.jared-img--markdown-wrapper > img {
  width: 100%;
}

@media print {
  #jared-sidebar {
    display: none;
  }

  body {
    color: black;
  }

  a {
    color: black;
    text-decoration-color: black;
  }

  a:visited {
    color: black;
    text-decoration-color: black;
  }

  /* doesn't work, hmmm */
  td,
  th {
    border-collapse: collapse;
    border: 1px solid black;
  }
}
</style>
