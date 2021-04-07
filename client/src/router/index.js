import Vue from 'vue'
import Router from 'vue-router'
import Header from '@/components/Header'
import Inicio from '@/components/Inicio'
import Libro from '@/components/Libro'
import Autor from '@/components/Autor'
import Category from '@/components/Category'

Vue.use(Router)

export default new Router({
  base:'/',
  hashbang:false,
  mode: 'hash',
  routes: [
    {
      path: '/',
      component: Header,
      children: [
      	{
      		path: '',
          name: 'Inicio',
          component: Inicio
      	},
        {
          path: 'libro',
          name: 'Libro',
          component: Libro,
        },
        {
          path: 'autor',
          name: 'Autor',
          component: Autor
        },
        {
          path: 'categoria',
          name: 'Categoria',
          component: Category
        }
      ]
    }
  ]
})
