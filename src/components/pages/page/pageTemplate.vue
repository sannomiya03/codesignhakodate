<template lang="pug">
	div.post
		h2.pageTitle {{title}}
		htmlRenderer(:content="post.content.rendered")
		htmlRenderer(v-for="child in children", :content="child.content.rendered")
</template>
<script lang="coffee">
	ENV = require "config/env"
	FN = require "scripts/common"
	WP = require "scripts/wordpress"
	module.exports =
		props: ["post", "children"]
		components:
			htmlRenderer: require "components/common/htmlRenderer"
		computed:
			title: -> return if this.post isnt null then WP.title(this.post) else ""
		methods:
			back: -> FN.back()
</script>
<style lang="stylus" scoped>
	@import "~stylus/setting"
	.pageTitle
		margin-bottom 30px
		padding-left 10px
		border-left 4px solid Indigo500
		font-size 24px
		font-weight 500
		line-height 1.5em
</style>