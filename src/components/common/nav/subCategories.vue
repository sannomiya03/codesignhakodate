<template lang="pug">
	nav.categoryNav(v-if="subCategory!=null && subCategory.length>0")
		ul
			li: router-link(:to="toArchive('all')", :class="{active: isActive('all')}") 全て
			li(v-for="link in subCategory")
				router-link(:to="toArchive(link.slug)", :class="{active: isActive(link.slug)}") {{link.name}}
</template>
<script lang="coffee">
	ENV = require "config/env"
	WP = require "scripts/wordpress"
	module.exports =
		computed:
			pageName: -> return this.$route.name
			postType: -> return this.$route.params.postType
			categorySlug: -> return if this.$route.params.category? then this.$route.params.category else "all"
			subCategorySlug: -> return if this.$route.params.subCategory? then this.$route.params.subCategory else "all"
			subCategoryContainer: -> return WP.getSubCategoryContainer(this.postType)
			subCategory: -> return if this.subCategoryContainer isnt null then this.subCategoryContainer.content else null
			
		methods:
			toArchive: (subCategorySlug) -> return { name: "archive", params: {postType: this.postType, category: this.categorySlug, subCategory: subCategorySlug, page: 1} }
			isActive: (subCategorySlug) -> return subCategorySlug is this.subCategorySlug 
</script>
<style lang="stylus" scoped>
	@import "~stylus/setting"
	.categoryNav
		display flex
		align-items flex-start
		padding-bottom 30px
		border-bottom 2px solid Gray300
		
		ul
			display flex
			flex-wrap wrap
		li
			margin-bottom 2px
		li:not(:last-child)
			margin-right 5px
		li a
			@extend .btn
			animate()
			display inline-block
			min-width 120px
			padding 0 20px
			text-align center
			color White
			font-size 14px
			line-height 2em
			background-color Gray400
			&:hover
				background-color Gray600
			&.active
				background-color Gray800
</style>