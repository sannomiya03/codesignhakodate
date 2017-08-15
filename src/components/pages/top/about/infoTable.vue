<template lang="pug">
	div.infoTable
		h4.tableTitle {{content.title}}
		table
			tr(v-for="row in content.rows")
				th {{row.heading}}
				td(v-html="row.data")
</template>
<script lang="coffee">
	CONTENT = require "config/content"
	module.exports =
		data: ->
			content: CONTENT.about.table
</script>
<style lang="stylus" scoped>
	@import "~stylus/setting"
	.infoTable
		background-color Gray100
	.tableTitle
		font-weight bold
		color Gray700
		padding 15px
		padding-bottom 0
	table
		border-collapse separate
		border-spacing 15px
	tr:not(:last-child)
		border-bottom 5px solid White
	td, th, span
		line-height 1.8em
		color Gray700
	th
		vertical-align top
		text-align right
		padding-right 0px
</style>