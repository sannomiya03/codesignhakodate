<template lang="pug">
	article.single-page(:class="projectClass")
		header.page-header
			projectHeader
		main.page-content
			header.content-header
				h2.contentTitle
					span {{text('活動報告', 'ACTIVITY')}} 
					secondalyNav(:direction="'column'")
			div.content-body
				postLinks(:posts="posts")
</template>
<script lang="coffee">
	request = require 'superagent'
	module.exports =
		components:
			secondalyNav: require "components/secondalyNav"
			projectHeader: require "components/about/projectHeader"
			postLinks: require "./postLinks"
		data: ->
			site: require "scripts/site_setting"
			prevParams: this.$route.params
			posts: []
		computed:
			isEnglish: -> return if this.$route.fullPath.match(/en/) then true else false
			projectID: -> return Number(this.$route.params.project_id)
			projectCategoryID: -> return this.site.getCategoryID "project0"+this.projectID
			category: -> return this.$route.params.category
			endPoint: -> return this.site.endPoint+"posts"
			projectClass: ->
				return {
					project01: this.projectID is 1
					project02: this.projectID is 2
					project03: this.projectID is 3
				}
			commonQuery: ->
				if this.projectID is 0
					return "categories[]="+this.site.categories.project01+"&categories[]="+this.site.categories.project02+"&categories[]="+this.site.categories.project03
				else
					return {
						categories: this.projectCategoryID
						orderby: "date"
					}
			excludeQuery: ->
				if this.projectID is 0 then return ""
				else return this.site.getExcludeCatsQuery this.category

		methods:
			date: (dateStr) -> return dateStr.split("T")[0].replace(/-/g,".")
			text: (strJa, strEn) -> return if !this.isEnglish then strJa else strEn
			getContents: ->
				self = this
				request
					.get self.endPoint
					.query self.commonQuery
					.query self.excludeQuery
					.end (err, res) -> self.posts = res.body

		created: ->
			this.getContents()
		beforeUpdate: ->
			if this.prevParams != this.$route.params
				this.getContents()
				this.prevParams = this.$route.params
</script>
<style lang="stylus" scoped>
	@import "~stylus/setting"
	.contentTitle
		display flex
		align-items flex-end
		border-top 2px solid Gray300
		span
			display inline-block
			font-weight 500
			font-size 14pt
			width 120px
	.content-body
		margin-top 40px
	
	.project01 .contentTitle
		border-color Project01Color
	.project02 .contentTitle
		border-color Project02Color
	.project03 .contentTitle
		border-color Project03Color
</style>