<template>
  <div>
    <h1>Skills inventory</h1>

    <h2>My best skills: up-to-date, daily usage</h2>

    <p>Senior technologist: Software management, architecture, and mentorship.</p>

    <p>Web full-stack software development: TypeScript. Vue.js. Rails. HTML/JS/CSS. Web components. Reactive apps.</p>
  </div>
</template>

<script>
// Interests: concurrent JavaScript (off-main-thread processing, web workers, etc)
// Interests: Erlang-VM operations (Elixir)
// Interests, upcoming. Log-oriented data structure. Event stream processing. Messaging architectures, pub/sub. Elixir.
// | Full-stack | |
// | | TypeScript/JavaScript/ES6 | Daily |
// | | Ruby | Daily |
// ## Solid
// TypeScript. JavaScript. Ruby.
// CSS. HTML. DOM. Box model. Responsive design. Evergreen browser. caniuse. CSS Grid. Flexbox. Design systems.
// HTTP. Networking. Linux and cloud operations. DNS. REST. HATEOAS.
// OOP. SOLID. DRY.
// Ruby production hosting: Gemfile, unicorn, rack, writing gems.
// Technical project management. Technical program management. Technical team management.****
// ## Services I've directly supported in production
// MySQL. PostgreSQL. Redis. Memcached. Elasticsearch. nginx.
// node.js.
// Django.
// SumoLogic. NTP. NFS. iSCSI.
// ## Solid at one time but not fresh
// Python. Perl. wsgi.
// Web frameworks: Django. HTML::Mason.
// Apache.
// ## Touched, but never developed any depth
// Java. C. Scheme.
// Graph theory.

export default {
  name: "skills",
  data() {
    return {
      skills: {
        "TypeScript": {
          "category": "frontend",
        },
        "SumoLogic": {
          "tags": ["ran-in-prod"]
        }
      }
    }
  }
}
</script>
