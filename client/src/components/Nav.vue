<template>
	<div>
		<v-toolbar app fixed>
			<v-toolbar-side-icon @click.stop="drawer = !drawer"></v-toolbar-side-icon>

			<v-toolbar-title>{{ name }}</v-toolbar-title>
		</v-toolbar>

		<v-navigation-drawer
			app
			fixed
			v-model="drawer"
			width="250"
		>
			<v-toolbar flat>
				<v-list-tile>
					<v-list-tile-title class="title">
						Menu
					</v-list-tile-title>
				</v-list-tile>
			</v-toolbar>

			<v-divider></v-divider>

			<v-list dense>
				<v-list-tile to="/" @click="setName">
					<v-list-tile-action>
						<v-icon>mdi-home</v-icon>
					</v-list-tile-action>
					<v-list-tile-content>
						Inicio
					</v-list-tile-content>
				</v-list-tile>

				<v-list-tile to="/libro" @click="setName">
					<v-list-tile-action>
						<v-icon>mdi-book</v-icon>
					</v-list-tile-action>
					<v-list-tile-content>
						Libros
					</v-list-tile-content>
				</v-list-tile>

				<v-list-tile to="/autor" @click="setName">
					<v-list-tile-action>
						<v-icon>mdi-account-box</v-icon>
					</v-list-tile-action>
					<v-list-tile-content>
						Autor
					</v-list-tile-content>
				</v-list-tile>

				<v-list-tile to="/categoria" @click="setName">
					<v-list-tile-action>
						<v-icon>mdi-shape</v-icon>
					</v-list-tile-action>
					<v-list-tile-content>
						Categoria
					</v-list-tile-content>
				</v-list-tile>
			</v-list>
		</v-navigation-drawer>
	</div>
</template>

<script>
export default {
	data: () => ({
		drawer: false,
		name: ''
	}),

	mounted () {
		this.setName()
	},

	methods: {
		setName () {
			this.name = this.$route.name
		}
	}
}
</script>