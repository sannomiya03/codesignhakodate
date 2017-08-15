<template lang="pug">
	div.pageContainer
		div.pageHeader
			pageHeader
		div.pageContent
			topTemplate(v-if="isTop", :posts="container")
			singleTemplate(v-if="isSingle", :post="post")
</template>
<script lang="coffee">
	module.exports =
		props: ["container"]
		components:
			pageHeader: require "./header/pageHeader"
			topTemplate: require "./top/topTemplate"
			singleTemplate: require "./single/singleTemplate"
		computed:
			pageName: -> return this.$route.name
			postName: -> return this.$route.params.slug
			isTop: -> return this.pageName is "top"
			isSingle: -> return this.pageName is "single"
			post: ->
				if !this.container? then return null
				for post in this.container
					if post.slug is this.postName then return post
				return null
		methods:
			update: -> this.$emit("update")
</script>
<style lang="stylus" scoped>
	@import "~stylus/setting"
	.pageContainer
		position relative
		width 100%
		height 100%
	
	.pageContent
		position relative
		top 0
		left 0
		width 100%
		height 100%
		+min-screen(1240)
			padding-left 300px
</style>