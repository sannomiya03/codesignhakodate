<template lang="pug">
	article.single-page
		header.page-header
		main.page-content
			header.content-header
				h1.content-title: span 報道記事
			div.content-body
				transition-group.posts(name="list" tag="ul")
					li.post( v-for="post in posts", :key="post.id", class="list-item")
						div.post-inner
							div.post-meta
								p.post-date {{date(post.date)}}
								p.post-category: span {{post.acf.記載元}}
							h4.post-title
								a(:href="'http://'+post.acf.url" target="_blank" v-if="post.acf.url!=''") {{post.title.rendered}}
								span(v-if="post.acf.url==''") {{post.title.rendered}}
</template>
<script lang="coffee">
	request = require 'superagent'
	module.exports =
		data: ->
			site: require "scripts/site_setting"
			params: {}
			posts:[]

		methods:
			date: (dateStr) ->
				return dateStr.split("T")[0].replace(/-/g,".")
			
			getContents: ->
				this.params = this.$route.params
				self = this
				request
					.get(self.site.endPoint+"news/")
					.end((err, res)-> self.posts = res.body )

		created: ->
			self = this
			this.getContents()

		beforeUpdate: ->
			if this.params != this.$route.params
				this.posts = []
				this.getContents()
</script>
<style lang="stylus" scoped>
	@import "~stylus/setting"
	.posts
		display flex
		flex-direction column
	.post
		display inline-block
		.post-inner
			display flex
			align-items flex-start
		margin-bottom 30px
		span
			color Gray400
		a
			animate()
			&:hover
				color Blue900
				text-decoration underline
	.post-meta
		padding-right 20px
	
	.post-date 
		color Gray500
		width 80px
		line-height 1.3em
		font-size 10pt
		text-align right
		
	.post-category
		font-size 9pt
		line-height 1.5em
		text-align right
		padding-top 3px
		span
			padding 0 0.5em
			background-color Gray200
			color Gray700
			font-weight 400
			
	.post-title
		font-weight 300
		line-height 1.4em
		font-size 11pt
	
	.list-item
		display inline-block
		margin-right 10px
		transition all 1s
		bottom 0
		
	.list-enter, .list-leave-to
		opacity 0
		bottom 0
		transform translateY(30px)
	
	.list-leave-active
		position absolute
		bottom 0
		opacity 0
</style>