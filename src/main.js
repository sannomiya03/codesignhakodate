import Vue from 'vue'
import app from './app'
import VueRouter from "vue-router"
import routes from "./routes"

Vue.use(VueRouter)
const router = new VueRouter(routes)

new Vue({
  el: '#app',
  template: '<app/>',
  components: { app },
  router,
  created: function(){
  	document.title = require("scripts/site_setting").siteTitle
  }
})
