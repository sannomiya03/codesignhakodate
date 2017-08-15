<template lang="pug">
	nav.primaryNav
		ul(v-if="primaryNav!=null")
			li(v-if="true", v-for="link in primaryNav", @click="to(link)") {{link.label}}
</template>
<script lang="coffee">
	ENV = require "config/env"
	WP = require "scripts/wordpress"
	module.exports =
		data: ->
			primaryNav: ENV.primaryNav
		computed:
			pageName: -> return this.$route.name
		methods:
			to: (link) -> this.$router.replace({name: link.name, params: link.params})
</script>
<style lang="stylus" scoped>
	@import "~stylus/setting"
	.primaryNav
		position relative
		width 100%
		height 100%
		ul
			width 100%
			height 100%
			display flex
		li
			@extend .btn
			display block
			height 100%
			padding 0 20px
			font-size 14px
			color Gray300
			font-weight 400
			line-height siteHeaderHeight
			&:hover
				color Green500
				background-color Gray700
</style>