<template>
	<v-container>
		<h1 class="subheader">Datos Autor</h1>

		<v-snackbar
			v-model="snackbar"
			:top="true"
			:right="true"
			:timeout="2000"
			color="success"
		>{{ text }}</v-snackbar>

		<v-card>
			<v-card-title>
			<v-btn color="primary" @click="dialogAdd = true">Nuevo Autor</v-btn>

				<v-spacer></v-spacer>

				<v-text-field
					v-model="search"
					append-icon="search"
					label="Busca aquí"
				></v-text-field>

			</v-card-title>
			<v-data-table
				:headers="headers"
				:items="authors"
				:search="search"
				class="elevation-1"
			>
				<template slot="items" slot-scope="props">
					<td>{{ props.item.pengarang }}</td>
					<td>{{ props.item.tgl_lahir }}</td>
					<td>
						<v-btn fab small color="primary" title="Ubah">
							<v-icon>mdi-pencil</v-icon>
						</v-btn>

						<v-btn fab small color="error" title="Hapus" @click="deleteConfirm(props.item.id_pengarang)">
							<v-icon>mdi-delete</v-icon>
						</v-btn>
					</td>
				</template>

				<template slot="no-data">
					<v-alert
						:value="true"
						color="error"
						icon="mdi-magnify"
						outline
					>Tidak Ada Data</v-alert>
				</template>

				<template slot="no-results">
					<v-alert
						:value="true"
						color="error"
						icon="mdi-magnify"
						outline
					>Pengarang tidak ditemukan</v-alert>
				</template>

				<template slot="pageText" slot-scope="props">
					Data ke {{ props.pageStart }} - {{ props.pageStop }} dari {{ props.itemsLength }}
				</template>
			</v-data-table>
		</v-card>

		<v-dialog v-model="dialogAdd" max-width="500px">
			<v-divider></v-divider>
			<v-card>
				<v-card-title>Información</v-card-title>
				<v-card-text>
					<v-form ref="form">
						<v-text-field
							v-model="pengarang"
							:counter="10"
							label="Autor"
						></v-text-field>

						<v-dialog
							ref="dialog"
							v-model="dialogDob"
							lazy
							full-width
							width="290px"
							:return-value.sync="tgl_lahir"
						>
							<v-text-field
								slot="activator"
								label="Fecha"
								v-model="tgl_lahir"
								prepend-icon="event"
								readonly
							></v-text-field>
							<v-date-picker v-model="tgl_lahir" scrollable>
								<v-spacer></v-spacer>
								<v-btn flat color="error" @click="dialogDob = false">Cancelar</v-btn>
								<v-btn flat color="primary" @click="$refs.dialog.save(tgl_lahir)">OK</v-btn>
							</v-date-picker>
						</v-dialog>
					</v-form>
				</v-card-text>
				<v-card-actions>
					<v-spacer></v-spacer>
					<v-btn flat color="error" @click="reset">Cancelar</v-btn>
					<v-btn flat color="primary" @click="saveCategory">Guardar</v-btn>
				</v-card-actions>
			</v-card>
		</v-dialog>

		<v-dialog v-model="dialogConfirm" max-width="300px">
			<v-divider></v-divider>
			<v-card>
				<v-card-text>
					<p class="font-weight-bold">Apakah Anda ingin menghapus Pengarang yang dipilih?</p>
				</v-card-text>
				<v-card-actions>
					<v-spacer></v-spacer>
					<v-btn flat color="error" @click="dialogConfirm = false">Cancelar</v-btn>
					<v-btn flat color="primary" @click="deleteAuthor(id)">Oke</v-btn>
				</v-card-actions>
			</v-card>
		</v-dialog>
	</v-container>
</template>

<script>
export default {
	name: 'Author',
	metaInfo: {
		title: 'Administración'
	},

	data: () => ({
		pengarang: '',
		tgl_lahir: '',
		id: '',
		search: '',
		text: '',
		dialogAdd: false,
		dialogConfirm: false,
		dialogDob: false,
		snackbar: false,
		headers: [
			{
				text: 'Autor',
				value: 'pengarang',
			},
			{
				text: 'Fecha de nacimiento',
				value: 'tgl_lahir',
				width: '50%'
			},
			{
				sortable: false,
				value: 'actions'
			}
		],
		authors: []
	}),

	mounted () {
		this.fetchData()
	},

	methods: {
		fetchData () {
			this.axios.get('authors')
				.then(res => {
					this.authors = res.data.data
				})
				.catch(err => {
					console.log(err)
				})
		},

		saveCategory () {
			let data = 	'pengarang=' + 
						this.pengarang +
						'&tgl_lahir=' + this.tgl_lahir

			this.axios.post('authors', data)
				.then(res => {
					this.reset()
					this.fetchData()
					this.snackbar = true
					this.text = res.data.message
				})
				.catch(err => {
					console.log(err)
				})
		},

		deleteAuthor (id) {
			this.axios.delete('authors?id=' + id)
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
