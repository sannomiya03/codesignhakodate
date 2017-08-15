<template lang="pug">
	tr.postLink
		td.title: router-link.anchor(:to="to") {{title}}
		td.width(v-if="post.acf.width!=null"): router-link.anchor(:to="to") {{post.acf.width}} mm
		td.height(v-if="post.acf.height!=null"): router-link.anchor(:to="to") {{post.acf.height}} mm
		td.price(v-if="post.acf.price!=null"): router-link.anchor(:to="to") ¥ {{post.acf.price}}
		td.price(v-if="post.acf.lots!=null"): router-link.anchor(:to="to") {{separate(post.acf.lots)}}個
		td.price(v-if="post.acf.total!=null"): router-link.anchor(:to="to") ¥ {{separate(post.acf.total)}}
		td.delete(@click="deletePost(post.id, index)") [del]
</template>
<script lang="coffee">
	WP = require "scripts/wordpress"
	module.exports =
		props: ["post", "index"]
		computed:
			pageName: -> return this.$route.name
			postType: -> return this.$route.params.postType
			date: -> WP.date(this.post)
			isNew: -> WP.isNew(this.post)
			title: -> WP.title(this.post)
			to: -> return {name: "single", params: {postType: this.postType, id: this.post.id}}
		methods:
			separate: (num)-> return String(num).replace( /(\d)(?=(\d\d\d)+(?!\d))/g, '$1,')
			deletePost: (id, index) ->
				this.$emit("deletePost", {id: id, index: index})
</script>
<style lang="stylus" scoped>
	@import "~stylus/setting"
	.postLink
		animate()
		background-color White
		&:hover
			background-color Gray200
		&:hover a
			color Blue800
	td
		line-height 1em
	
	.anchor
		display block
		font-size 14px
		padding 18px 10px
	
	.title
		font-weight 400
	
	.id
		width 70px
	.date, .width, .height, .price
		width 100px
		color Gray600
		font-weight 400
	
	.delete
		@extend .btn
		animate()
		width 40px
		font-size 13px
		color Gray600
		&:hover
			color Red600
</style>