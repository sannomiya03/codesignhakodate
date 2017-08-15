const velocity = require('velocity-animate')

import Vue from 'vue'
import app from './app'
import VueRouter from "vue-router"
import VueCookie from 'vue-cookie'
import routes from "./routes"

Vue.use(VueRouter)
Vue.use(VueCookie)
const router = new VueRouter(routes)

new Vue({
  el: '#app',
  template: '<app/>',
  components: { app },
  router,
  created: function(){
  	document.title = require("config/env").title
  }
})
