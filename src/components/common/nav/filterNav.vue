<template lang="pug">
	nav.filterNav
		ul: li(v-for="link in secondaryNav", :class="{active: isActive(link.categorySlug)}")
			router-link(:to="toArchive(link.categorySlug)") {{link.label}}
</template>
<script lang="coffee">
	ENV = require "config/env"
	FUNCTIONS = require "scripts/common"
	module.exports =
		computed:
			secondaryNav: -> return ENV.secondaryNav
			pageName: -> return this.$route.name
			postType: -> return this.$route.params.postType
			categorySlug: -> return if this.$route.params.category? then this.$route.params.category else "all"
			subCategorySlug: -> return if this.$route.params.subCategory? then this.$route.params.subCategory else "all"
		methods:
			toArchive: (categorySlug) -> return { name: "archive", params: {postType: this.postType, category: categorySlug, subCategory: this.subCategorySlug, page: 1} }
			isActive: (categorySlug) -> return this.categorySlug is categorySlug
</script>
<style lang="stylus" scoped>
	@import "~stylus/setting"
	.filterNav
		height 40px
		background-color transparent
		ul
			centering Medium
			display flex
			justify-content space-between
			width 100%
		li
			width 25%
			background-color Gray300
			border-right 2px solid Gray300
			&:first-child
				border-radius 10px 0 0 0
			&:last-child
				border-radius 0 10px 0 0
				border-right none
			&:hover
				background-color Gray100
		li a
			@extend .btn
			animate()
			display inline-block
			width 100%
			text-align center
			color Gray500
			font-size 12px
			line-height 40px
		li.active
			background-color White
			a
				color Gray700
</style>