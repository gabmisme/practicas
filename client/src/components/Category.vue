<template>
	<v-container>
		<h1 class="subheader">Categoria</h1>

		<v-card>
			<v-card-title>
			<v-btn color="primary" @click="dialogAdd = true">Nuevo</v-btn>
				<v-spacer></v-spacer>
				<v-text-field v-model="search" append-icon="search" label="Buscar categoria">
				</v-text-field>
			</v-card-title>
			<!-- table -->
			<v-data-table
				:headers="headers"
				:items="categories"
				:search="search"
				class="elevation-1"
			>
				<template slot="items" slot-scope="props">
					<td>{{ props.item.kategori }}</td>
					<td>{{ props.item.deskripsi }}</td>
					<td>
						<v-btn fab small color="primary" title="Ubah">
							<v-icon>mdi-pencil</v-icon>
						</v-btn>
						<v-btn fab small color="error" title="Hapus" @click="deleteConfirm(props.item.id_kategori)">
							<v-icon>mdi-delete</v-icon>
						</v-btn>
					</td>
				</template>

				<!-- alerta sin datos -->
				<template slot="no-data">
					<v-alert
						:value="true"
						color="error"
						icon="mdi-magnify"
						outline
					>Sin datos</v-alert>
				</template>
				<!-- alerta  Categoría no encontrada-->
				<template slot="no-results">
					<v-alert
						:value="true"
						color="error"
						icon="mdi-magnify"
						outline
					>Categoría no encontrada</v-alert>
				</template>

				<template slot="pageText" slot-scope="props">
					Data ke {{ props.pageStart }} - {{ props.pageStop }} dari {{ props.itemsLength }}
				</template>
			</v-data-table>
			<!-- fin table
			 -->
		</v-card>
		<!--  modal agregar -->
		<v-dialog v-model="dialogAdd" max-width="500px">
			<v-divider></v-divider>
			<v-card>
				<v-card-title>Agregar Categoria</v-card-title>
				<v-card-text>
					<v-form ref="form">
						<v-text-field
							v-model="kategori"
							:counter="10"
							label="Categoria"
						></v-text-field>

						<v-textarea
							v-model="deskripsi"
							:counter="100"
							label="Descripcion"
						></v-textarea>
					</v-form>
				</v-card-text>
				<v-card-actions>
					<v-spacer></v-spacer>
					<v-btn flat color="error" @click="reset">Cancelar</v-btn>
					<v-btn flat color="primary" @click="saveCategory">ok</v-btn>
				</v-card-actions>
			</v-card>
		</v-dialog>
		<!-- modal confimar eliminacion  -->
		<v-dialog v-model="dialogConfirm" max-width="300px">
			<v-divider></v-divider>
			<v-card>
				<v-card-text>
					<p class="font-weight-bold">Esta seguro de eliminar?</p>
				</v-card-text>
				<v-card-actions>
					<v-spacer></v-spacer>
					<v-btn flat color="error" @click="dialogConfirm = false">Cancelar</v-btn>
					<v-btn flat color="primary" @click="deleteCategory(id)">ok</v-btn>
				</v-card-actions>
			</v-card>
		</v-dialog>

		<v-snackbar
			v-model="snackbar"
			:top="true"
			:right="true"
			:timeout="2000"
			color="success"
		>{{ text }}</v-snackbar>
	</v-container>
</template>

<script>
export default {
	name: 'Home',
	metaInfo: {
		title: 'Categoria'
	},

	data: () => ({
		id: '',
		kategori: '',
		deskripsi: '',
		search: '',
		text: '',
		dialogAdd: false,
		dialogConfirm: false,
		snackbar: false,
		headers: [
			{
				text: 'Categoria',
				value: 'kategori',
			},
			{
				text: 'Descripcion',
				value: 'deskripsi',
				width: '50%'
			},
			{
				sortable: false,
				value: 'actions'
			}
		],
		categories: []
	}),

	mounted () {
		this.fetchData()
	},

	methods: {
		fetchData () {
			this.axios.get('categories')
				.then(res => {
					this.categories = res.data.data
				})
				.catch(err => {
					console.log(err)
				})
		},

		saveCategory () {
			let data = 	'kategori=' + this.kategori +
									'&deskripsi=' + this.deskripsi

			this.axios.post('categories', data)
				.then(res => {
					this.dialogAdd = false
					this.reset()
					this.fetchData()
					this.snackbar = true
					this.text = res.data.message
				})
				.catch(err => {
					console.log(err)
				})
		},

		deleteCategory (id) {
			this.axios.delete('categories?id=' + id)
				.then(res => {
					if (res.data.success) {
						this.dialogConfirm = false
						this.fetchData()
						this.snackbar = true
						this.text = res.data.message
					}
				})
				.catch(err => {
					console.log(err)
				})
		},

		deleteConfirm (id) {
			this.id = id
			this.dialogConfirm = true
		},

		reset () {
			this.$refs.form.reset()
			this.dialogAdd = false
		}
	}
}
</script>