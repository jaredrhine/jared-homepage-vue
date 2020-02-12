import Vue from "vue"
import VueRouter from "vue-router"
import Home from "../views/home.vue"
import Skills from "../views/skills.vue"

Vue.use(VueRouter)

const routes = [
  {
    path: "*",
    name: "home",
    component: Home,
  },
  {
    path: "/skills",
    name: "skills",
    component: Skills,
  },
]

const router = new VueRouter({
  mode: "history",
  base: process.env.BASE_URL,
  routes,
})

export default router
