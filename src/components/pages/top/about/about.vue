<template lang="pug">
	div.about
		h3.readHeading {{content.mainHeading}}
		h4.readSubHeading {{content.subHeading}}
		div.columns
			div.readColumn(v-html="content.body")
			div.infoColumn: infoTable
</template>
<script lang="coffee">
	CONTENT = require "config/content"
	module.exports = 
		components:
			infoTable: require "./infoTable"
		data: ->
			content: CONTENT.about
</script>
<style lang="stylus" scoped>
	@import "~stylus/setting"
	.columns
		justify-content flex-start
		align-items flex-start
	.readColumn
		max-width 400px
		margin-right 50px
		text-align justify
		p:not(:last-child)
			margin-bottom 1em
	.sectionLabel
		line-height 1.5em
		font-weight bold
		color Gray400
	.readHeading, .readSubHeading
		font-weight bold
		line-height 1.2em
	.readHeading
		font-size 18pt
		margin-top 0.3em
		margin-bottom 0.3em
	.readSubHeading
		font-size 17.6pt
		margin-bottom 24px
	+max-screen(1239)
		.columns
			display block
		.readColumn
			max-width 100%
			margin-right 0
			padding-bottom 30px
</style>