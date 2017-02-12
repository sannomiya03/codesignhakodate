<template lang="pug">
	article.single-page
		main.page-content
			div(v-for="post in posts")
				header.content-header
					p.back(@click="back") ← BACK
					h1.content-title {{post.title.rendered}}
				div.page-body( v-html="post.content.rendered" )
				div.publish-link
					a(:href="post.acf.pdf.url" target="_blank")
						img(:src="post.acf.pdfImage")
						p {{post.acf.pdf.caption}}
</template>
<script lang="coffee">
	request = require 'superagent'
	module.exports =
		data: ->
			site: require "scripts/site_setting"
			prevParam: this.$route.params
			posts: []
		methods:
			back: ->
				history.back()
			date: (dateStr) ->
				return dateStr.split("T")[0].replace(/-/g,".")
			getContents: ->
				self = this
				request
					.get self.site.endPoint+"publication/"+this.$route.params.post_id
					.end (err, res)->
						self.posts = []
						self.posts.push res.body
		created: ->
			self = this
			this.getContents()
		
</script>
<style lang="stylus" scoped>
	@import "~stylus/setting"
	
	.back
		font-weight 500
		padding-bottom 10px
	
	.post-meta
		padding-top 10px
		padding-bottom 8px
		border-top 2px solid Gray900
		display flex
		justify-content space-between
	
	.post-project
		font-size 9pt
		line-height 1.5em
		
	.post-category
		font-size 9pt
		line-height 1.5em
		padding 0 0.5em
		background-color Gray200
		color Gray700
</style>