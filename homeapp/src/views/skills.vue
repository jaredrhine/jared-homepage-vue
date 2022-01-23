<template>
  <div>
    <h1>Skills inventory</h1>

    <div class="searchControls">search: <input v-model="searchText" /></div>

    <div class="skillsResults">
      <div v-for="(skill, name, index) in results" :key="index" class="skillBlock">
        {{ name }}
        &rarr;
        <span v-if="results[name]['level'] == 'expert'">Expert</span>
      </div>
    </div>
  </div>
</template>

<script>
import skills from "../assets/skills.json"

export default {
  name: "skills",
  data() {
    return {
      searchText: "",
      skills,
    }
  },
  computed: {
    results: function () {
      // TODO: add filtering/mapping here
      return this.skills
    },
  },
}
</script>
