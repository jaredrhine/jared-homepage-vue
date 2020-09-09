<template>
  <div>
    <h1>Skills inventory</h1>

    <h2>My best skills: up-to-date, daily usage</h2>

    <p>Senior technologist: Software management, architecture, and mentorship.</p>

    <p>Web full-stack software development: TypeScript. Vue.js. Rails. HTML/JS/CSS. Web components. Reactive apps.</p>

    <div class="searchControls">
      search: <input v-model="searchText"/>
    </div>

    <div class="skillsResults">
      <div
       v-for="(skill, name, index) in results"
       :key="index"
       class="skillBlock">
        {{ name }}
        &rarr;
        <span v-if="results[name]['level'] == 'expert'">Expert</span>
      </div>
    </div>
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

/*

Dimensions:
- expert
- none (not a skill)
- used to be an expert
- use frequently in my current day job
- have sysadmin'ed in production
- fond
- if i was building a startup
- it's better than you think
- is a vendor

Search

*/

export default {
  name: "skills",
  data() {
    return {
      searchText: "",
      skills: {
        "TypeScript": {
          "category": "frontend",
        },
        "SumoLogic": {
          "tags": ["ran-in-prod"]
        },
        "TCP/IP Networking": {
          "level": "expert"
        }
      }
    }
  },
  computed: {
    results: function () {
      return this.skills
    }
  }
}
</script>
