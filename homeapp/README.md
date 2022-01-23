# Jared Rhine vue+markdown homepage

## Project setup

```shell
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

### Customize configuration

See [vue-cli configuration reference](https://cli.vuejs.org/config/).
