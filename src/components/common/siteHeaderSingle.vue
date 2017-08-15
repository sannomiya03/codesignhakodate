<template lang="pug">
	div.headerContainer
		h1.identity: img(src="static/images/logo.svg")
		p.back: router-link(:to="{name: 'top'}") トップへもどる
</template>
<style lang="stylus" scoped>
	@import "~stylus/setting"
	.headerContainer
		position relative
		height 100%
		background-color White
	.identity
		position fixed
		top 50px
		left 50px
		width 180px
		img
			width 100%
	.back
		position fixed
		top 205px
		left 50px
		width 150px
		text-align right
		a
			@extend .btn
			animate()
			color Gray400
			&:hover
				color Black
</style>