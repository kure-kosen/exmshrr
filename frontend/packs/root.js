import Vue from 'vue'

// Library
import VueRouter from 'vue-router'
import Vuetify from 'vuetify'
import('vuetify/dist/vuetify.min.css')
import('vuetify/src/stylus/main.styl')
import Axios from 'axios'
import VueAxios from 'vue-axios'

Vue.use(VueRouter)
Vue.use(Vuetify)
Vue.use(VueAxios, Axios)
// Vue.use(VueAxios, axios)

// Component
import App from '../app.vue'

// Page
import Index from '../pages/index.vue'
import Detail from '../pages/detail.vue'
import Search from '../pages/search.vue'
import Add from '../pages/add.vue'

const router = new VueRouter({
  mode: 'history',
  base: '/app',
  routes: [
    { path: '/', component: Index, props: (route) => ({ query: route.query }) },
    { path: '/detail', component: Detail },
    { path: '/search', component: Search },
    { path: '/add', component: Add },
    { path: '/exams/:id', name: 'exam', component: Detail}
  ]
})

document.addEventListener('DOMContentLoaded', function () {
  document.body.appendChild(document.createElement('app'))
  const app = new Vue({
    router: router,
    render: function (h) {
      return h(App)
    }
  }).$mount('app')
})
