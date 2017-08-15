<template lang="pug">
	article.page
		header
			h1.pageTitle 404
		div.content
			p.toHome: router-link(:to="{name:'top'}") トップへ戻る
</template>
<script lang="coffee">
	FUNCTIONS = require "scripts/common"
	module.exports =
		computed:
			pageName: -> return this.$route.name
</script>
<style lang="stylus" scoped>
	@import "~stylus/setting"
	.page
		centering Medium
		padding-top 40px
		padding-bototm 40px
	.pageTitle
		padding-top 40px
		font-size 18px
	.toHome
		margin-top 3em
	.toHome a
		padding 0.5em 1em
		color Gray500
		border 1px Gray500
		animate()
		&:hover
			color White
			border 1px Gray500
			background-color Gray500
</style>