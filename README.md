# Jared Rhine vue+markdown homepage

Repository URL: https://github.com/jaredrhine/jared-homepage-vue

Author: Jared Rhine <<jared@wordzoo.com>>

Keywords: Jared Rhine, home page, vue.js, markdown

## Purpose

The code in this repository runs the [jared.wordzoo.com](https://jared.wordzoo.com/) home page.

The code, like the web site, is simple. It is not expected that this code can be used as-is by others. The approach and configuration is specific to the author's situation and offered for educational purposes. Please note that the code is not optimized or polished, and implements the minimum of what the author needed.

The actual content (text copy) of the site is not contained within this repo. The content is maintained in various private repositories and a build script is used to compile the source files into the web application.

## Procedures

### Project setup

```shell
git clone https://github.com/jaredrhine/jared-homepage-vue
cd jared-homepage-vue
npm install
```

### Compiles and hot-reloads for development

```shell
npm run serve
```

### Watches for content changes and recooks content.json

```shell
fswatch -m poll_monitor -r bin/cook-content-index.rb ~/projects/wordzoo.com/jared-content/ | xargs -t -n1 sh -c bin/cook-content-index.rb
```

### Run your unit tests

```shell
npm run test:unit
```

### Run your end-to-end tests

```shell
npm run test:e2e
```

### Lints and fixes files

```shell
npm run lint
```

### Compiles and minifies for production

```shell
npm run build
```

### Deploy to production

```shell
npm run deploy
```

Production deploys of site updates are coordinated by the [`jared-wordzoo-origin`](https://github.com/jaredrhine/jared-wordzoo-origin) repo. It builds a static version of the site using webpack with all content compiled inside, build those static files into a Docker container, hosts the docker container on `fly.io` (with a edge CDN serving the site to viewers.

## History

Initialized via `npx @vue/cli ui` on 2020-01-08
