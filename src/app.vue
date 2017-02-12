<template lang="pug">
	div.site
		header.site-header
			siteHeader
		main.site-body
			router-view.body-content
		footer.site-footer
			siteFooter
</template>
<script lang="coffee">
	module.exports =
		components:
			siteHeader: require "components/siteHeader"
			siteFooter: require "components/siteFooter"
</script>
<style lang="stylus">
	@import "~stylus/setting"

	html, body
		position relative
		width 100%
		height 100%
	
	.site
		display flex
		flex-direction column
		height 100%

	.site-body
		position relative
		-webkit-flex-grow 1
		flex-grow 1
		z-index 0
</style>