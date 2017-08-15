<template lang="pug">
	nav.breadcrumb
		div.inner
			ul
				li: router-link(:to="toArchvie") {{archiveTitle}}
				li.arrow(v-if="category!=null && category!='all'") >
				li(v-if="category!=null && category!='all'"): router-link(:to="toArchvieCategory") {{categoryLabel}}
				li.arrow >
				li {{title}}
</template>
<script lang="coffee">
	ENV = require "config/env"
	FUNCTIONS = require "scripts/common"
	WP = require "scripts/wordpress"
	module.exports =
		props: ["archiveTitle", "categories", "title"]
		computed:
			pageName: -> return this.$route.name
			postType: -> return this.$route.params.postType
			category: ->
				if this.categories?
					for category in this.categories then return WP.getCategorySlug(category)
				return "all"
			categoryLabel: -> if this.category? and this.category isnt "all" then return WP.getCategoryLabel(WP.getCategoryID(this.category))
			toArchvie: -> {name: "archive", params:{ postType: this.postType, category: "all", subCategory: "all", pageNo: 1 }}
			toArchvieCategory: -> {name: "archive", params:{ postType: this.postType, category: this.category, subCategory: "all", pageNo: 1 }}
		methods:
			back: -> FUNCTIONS.back()
</script>
<style lang="stylus" scoped>
	@import "~stylus/setting"
	.breadcrumb
		border-bottom 2px solid Gray200
		background-color Gray100
		.inner
			centering Medium
		ul
			display flex
			align-items center
		li
			line-height 1.5em
			font-size 13px
			color Gray700
			a
				animate()
				display block
				color Gray700
				padding 10px 0
			&.arrow
				padding 0 20px
			&:hover a
				color Indigo600
</style>