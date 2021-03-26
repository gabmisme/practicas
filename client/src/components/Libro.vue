<template>
	<v-container>
		<h1 class="title">Datos de libros</h1>
	</v-container>
</template>

<script>
export default {
	name: 'Libro',
	metaInfo: {
		title: 'Administracion | Libro'
	},

	data: () => ({

	}),

	mounted () {
		this.fetchData()
	},

	methods: {
		fetchData () {
			this.axios.get('books')
				.then(res => {
					console.log(res.data.data)
				})
				.catch(err => {
					console.log(err)
				})
		}
	}
}
</script>