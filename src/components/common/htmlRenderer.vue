<template lang="pug">
	div.htmlRenderer(v-html="content")
</template>
<script lang="coffee">
	module.exports =
		props: ["content"]
</script>
<style lang="stylus">
	@import "~stylus/setting"
	.htmlRenderer
		h1
			font-size 24px
		h2
			font-size 21px
		h3
			font-size 18px
		h4
			font-size 16px
		strong
			font-weight bold
		h1, h2, h3, h4, h5, h6, ul, p
			margin 0.3em 0
			color Gray900
		img
			max-width 100%
		table
			width 100%
			max-width 100%
		tr
			border-top 1px solid Gray300
		tr:last-child
			border-bottom 1px solid Gray300
		th, td
			padding 10px 0
			font-weight 200
			font-size 14px
		a
			color Indigo500
			text-decoration underline
			&:hover
				color Indigo800
</style>