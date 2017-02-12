<template lang="pug">
	article.single-page(:class="projectClass")
		header.page-header
			projectHeader
		main.page-content(v-for="post in posts")
			header.content-header
				h2.contentTitle
					span {{text('活動報告', 'ACTIVITY')}} / {{text(categoryName(categoryID(post)).ja, categoryName(categoryID(post)).en)}}
			main.article
				p.articleMeta {{date(post)}}
				h1.articleTitle {{text(post.title.rendered, post.acf.titleEn)}}
				div.page-body(v-if="!isEnglish" v-html="post.acf.textJa")
				div.page-body(v-if="isEnglish"  v-html="post.acf.textEn")
			footer.article-footer
				p.back: span(@click="back") ← {{text('戻る','BACK')}}
</template>
<script lang="coffee">
	request = require 'superagent'
	module.exports =
		components:
			projectHeader: require "components/about/projectHeader"
		data: ->
			site: require "scripts/site_setting"
			prevParam: this.$route.params
			posts: []
		computed:
			isEnglish: -> return if this.$route.fullPath.match(/en/) then true else false
			projectID: -> return Number(this.$route.params.project_id)
			postID: -> return Number(this.$route.params.post_id)
			projectClass: ->
				return {
					project01: this.projectID is 1
					project02: this.projectID is 2
					project03: this.projectID is 3
				}
		methods:
			back: -> history.back()
			text: (strJa, strEn) -> return if !this.isEnglish then strJa else strEn
			date: (post) ->
				if post.acf.displayDate? and post.acf.displayDate isnt "" then return post.acf.displayDate
				return post.date.split("T")[0].replace(/-/g,".")
			postProjectID: (post) -> return this.site.getProjectNo this.site.getPostProjectID post
			categoryID: (post) -> return this.site.getPostCategoryID post
			categoryName: (categoryID) -> return this.site.categoryIDtoLabel categoryID
			getContents: ->
				self = this
				request
					.get self.site.endPoint+"posts/"+self.postID
					.end (err, res) ->
						self.posts = []
						self.posts.push res.body
		created: ->
			this.getContents()
		beforeUpdate: ->
			if this.prevParam != this.$route.params
				this.getContents()
				this.prevParam = this.$route.params
</script>
<style lang="stylus" scoped>
	@import "~stylus/setting"
	.contentTitle
		border-top 2px solid Gray300
		span
			font-weight 400
			font-size 12pt
	
	.article
		margin-top 40px
		
	.articleMeta
		font-size 11pt
		margin-bottom 10px
		
	.articleTitle
		font-size 18pt
		margin-bottom 20px
	
	.article-footer
		margin-top 40px
		border-top 1px solid Gray300
	
	.back
		padding-bottom 10px
		animate()
		span
			font-weight 500
			color Gray700
		span:hover
			color LightBlue600
			cursor pointer
	
	.post-project
		font-size 9pt
		line-height 1.5em
		
	.post-category
		font-size 9pt
		line-height 1.5em
		padding 0 0.5em
		background-color Gray200
		color Gray700
	
	.project01 .contentTitle
		border-color Project01Color
	.project02 .contentTitle
		border-color Project02Color
	.project03 .contentTitle
		border-color Project03Color
</style>