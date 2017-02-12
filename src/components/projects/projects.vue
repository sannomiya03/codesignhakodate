<template lang="pug">
	article.single-page
		header.page-header
		main.page-content
			header.content-header
				h1.content-title: span 活動報告
			div.content-body
				div.content-columns
					div.colum
						secondalyNav(:direction="'column'")
					div.colum
						h2.target-title 活動一覧
						postLinks(:posts="posts")
</template>
<script lang="coffee">
	request = require 'superagent'
	module.exports =
		components:
			secondalyNav: require "components/secondalyNav"
			postLinks: require "./postLinks"
		
		data: ->
			site: require "scripts/site_setting"
			prevParams: this.$route.params
			posts: []
		
		computed:
			projectCatID: ->
				return this.site.getCategoryID("project0"+this.$route.params.project_id)
			query: ->
				return 	"categories[]="+this.site.categories.project01+"&categories[]="+this.site.categories.project02+"&categories[]="+this.site.categories.project03

		methods:
			date: (dateStr) ->
				return dateStr.split("T")[0].replace(/-/g,".")
			getContents: ->
				self = this
				request
					.get self.site.endPoint+"posts"
					.query self.query
					.query { per_page: 20 }
					.end (err, res)-> self.posts = res.body
		created: ->
			self = this
			this.getContents()
</script>
<style lang="stylus" scoped>
	@import "~stylus/setting"
	
	.content-columns
		display flex
	.colum:first-child
		padding-right 40px
	.subTitle
		line-height 1em
		margin-bottom 1em
		color Gray500
	.target-title
		font-size 16pt
		line-height 1em
		margin-bottom 1em
</style>