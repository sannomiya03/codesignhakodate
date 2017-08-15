<template lang="pug">
	ul.newItems
		li.newItem(v-if="posts != null", v-for="post in posts")
			div.meta
				p.date {{post.date}}
				p.category {{post.category}}
			p.title: router-link(:to="{name:'single', params:{slug: post.slug}}") {{post.title}}
</template>
<script lang="coffee">
	module.exports =
		props: ["posts"]
</script>
<style lang="stylus" scoped>
	@import "~stylus/setting"
	.newItem
		flexbox()
	.newItem:not(:last-child)
		margin-bottom 20px
	.meta
		flexbox()
	.date, .category
		padding-right 50px
	.title a
		animate()
		text-decoration underline
		&:hover
			color Blue700
	+max-screen(1239)
		.newItem
			display block
		.date
			padding-right 20px
		.category
			padding 0
		.meta, .date, .category
			font-size 9pt
			color Gray500
</style>