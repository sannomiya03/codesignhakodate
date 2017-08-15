<template lang="pug">
	div.postBodyContainer
		div.postBody
			h2.postTitle {{post.title}}
			htmlRenderer(:content="post.content")
		p.back
			router-link(:to="{name:'top'}") もどる
</template>
<script lang="coffee">
	module.exports =
		props: ["post"]
		components:
			htmlRenderer: require "components/common/htmlRenderer"
		computed:
			pageName: -> return this.$route.name
</script>
<style lang="stylus" scoped>
	@import "~stylus/setting"
	bgColor = Gray100
	.background
		width 100%
		height 150px
		background-color bgColor
		overflow hidden
		.background
			position absolute
			left 0
			top 0
			height 100%
	.postBody
		max-width 820px
	.postTitle
		font-size 18pt
		margin-top 20px
		margin-bottom 20px
	.postBodyContainer
		padding 20px
	.back
		margin-top 20px
		padding-top 5px
		border-top 1px solid Gray500
		a
			animate()
			color Gray500
			&:hover
				color Gray900
</style>