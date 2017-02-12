<template lang="pug">
	article.single-page
		header.page-header
		main.page-content
			header.content-header
				h1.content-title: span 刊行物
			div.content-body
				ul.posts
					li.post(v-for="post in posts")
						router-link(:to="{name: 'publicationPost', params: {post_id: post.id}}")
							img.post-thumbnail(:src="post.acf.pdfImage")
							p.post-title {{post.title.rendered}}
					li.post(v-for="post in posts")
						router-link(:to="{name: 'publicationPost', params: {post_id: post.id}}")
							img.post-thumbnail(:src="post.acf.pdfImage")
							p.post-title {{post.title.rendered}}
					li.post(v-for="post in posts")
						router-link(:to="{name: 'publicationPost', params: {post_id: post.id}}")
							img.post-thumbnail(:src="post.acf.pdfImage")
							p.post-title {{post.title.rendered}}
					li.post(v-for="post in posts")
						router-link(:to="{name: 'publicationPost', params: {post_id: post.id}}")
							img.post-thumbnail(:src="post.acf.pdfImage")
							p.post-title {{post.title.rendered}}
					li.post(v-for="post in posts")
						router-link(:to="{name: 'publicationPost', params: {post_id: post.id}}")
							img.post-thumbnail(:src="post.acf.pdfImage")
							p.post-title {{post.title.rendered}}
						
</template>
<script lang="coffee">
	request = require 'superagent'
	module.exports =
		data: ->
			site: require "scripts/site_setting"
			params: {}
			posts: []
		
		methods:
			date: (dateStr) ->
				return dateStr.split("T")[0].replace(/-/g,".")
			
			getContents: ->
				# this.params = this.$route.params
				self = this
				request
					.get self.site.endPoint+"publication"
					.end (err, res) ->
						console.log res
						self.posts = res.body
			
		created: ->
			self = this
			console.log "hi"
			this.getContents()

			# beforeUpdate: ->
			# 	if this.params != this.$route.params
			# 		this.getContents()
</script>
<style lang="stylus" scoped>
	@import "~stylus/setting"
	.posts
		display flex
		flex-wrap wrap
	.post
		width 20%
		margin-bottom 40px
		&:not(:last-child)
			margin-right 5%
	.post-thumbnail
		width 100%
		height auto
	.post-title
		line-height 1.3em
		font-size 9pt
		color Gray400
</style>