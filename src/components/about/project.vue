<template lang="pug">
	article.single-page(:class="projectClass")
		header.page-header
			projectHeader
		main.page-content
			div.content-body
				div.readText
					pj1Text(v-if="projectID==1")
					pj2Text(v-if="projectID==2")
					pj3Text(v-if="projectID==3")
				div.columns
					h2.column.columnTitle {{text('研究メンバー', 'MEMBER')}}
					h2.column.columnTitle {{text('活動報告', 'ACTIVITY')}}
						router-link.toPosts(:to="toPosts('all')") 0{{projectID}} {{text('活動 一覧へ','MORE')}}
				div.columns
					div.column.member
						pj1Member(v-if="projectID==1")
						pj2Member(v-if="projectID==2")
						pj3Member(v-if="projectID==3")
					div.column
						section.archive
							h3.archiveTitle {{text('学術成果','ACADEMIC')}}
								router-link.toPosts(:to="toPosts('academic')") 0{{projectID}} {{text('学術成果 一覧へ','MORE')}}
							postLinks(:posts="posts.academic")
						section.archive
							h3.archiveTitle {{text('教育活動','EDUCATION')}}
								router-link.toPosts(:to="toPosts('education')") 0{{projectID}} {{text('教育活動 一覧へ','MORE')}}
							postLinks(:posts="posts.education")
						section.archive
							h3.archiveTitle {{text('研究調査','RESEARCH')}}
								router-link.toPosts(:to="toPosts('research')") 0{{projectID}}  {{text('研究調査 一覧へ','MORE')}}
							postLinks(:posts="posts.research")
</template>
<script lang="coffee">
	request = require 'superagent'
	module.exports =
		components:
			secondalyNav: require "components/secondalyNav"
			postLinks: require "components/projects/postLinks"
			projectHeader: require "./projectHeader"
			pj1Text: require "./pj01_text"
			pj2Text: require "./pj02_text"
			pj3Text: require "./pj03_text"
			pj1Member: require "./pj01_member"
			pj2Member: require "./pj02_member"
			pj3Member: require "./pj03_member"
		data: ->
			site: require "scripts/site_setting"
			prevParams: this.$route.params
			posts:
				academic: []
				education: []
				research: []
		computed:
			isEnglish: -> return if this.$route.fullPath.match(/en/) then true else false
			projectID: -> return Number(this.$route.params.project_id)
			endPoint: -> return this.site.endPoint+"posts"
			commonQuery: ->
				return {
					categories: this.site.getCategoryID "project0"+this.$route.params.project_id
					orderby: "date"
					per_page: 1
				}
			projectClass: ->
				return {
					project01: this.projectID is 1
					project02: this.projectID is 2
					project03: this.projectID is 3
				}
		methods:
			date: (dateStr) -> return dateStr.split("T")[0].replace(/-/g,".")
			excludeQuery: (category) -> return this.site.getExcludeCatsQuery category
			text: (strJa, strEn) -> return if !this.isEnglish then strJa else strEn
			toPosts: (category) ->
				name = if !this.isEnglish then "category" else "en_category"
				return { name: name,  params: { project_id: this.projectID,  category: category }}
			getContents: ->
				self = this
				request
					.get self.endPoint
					.query self.commonQuery
					.query self.excludeQuery "academic"
					.end (err, res)-> self.posts.academic = res.body
				request
					.get self.endPoint
					.query self.commonQuery
					.query self.excludeQuery "education"
					.end (err, res)-> self.posts.education = res.body
				request
					.get self.endPoint
					.query self.commonQuery
					.query self.excludeQuery "research"
					.end((err, res)-> self.posts.research = res.body )
		created: ->
			this.getContents()
		beforeUpdate: ->
			if this.prevParams != this.$route.params
				this.getContents()
				this.prevParams = this.$route.params
</script>
<style lang="stylus" scoped>
	@import "~stylus/setting"
	.readText
		margin-bottom 60px
	
	.columnTitle
		display flex
		justify-content space-between
		margin-bottom 1em
		border-top 3px solid Gray600
		font-size 10pt
		font-weight 500
		color Gray800
		
	.archive:not(:last-child)
		margin-bottom 30px
		
	.archiveTitle
		border-top 1px solid Gray300
		display flex
		justify-content space-between
		margin-bottom 0.5em
		color Gray800
		font-size 11pt
		font-weight 500
	
	.toPosts
		color LightBlue600
		font-size 10.5pt
		border-bottom 2px solid transparent
		animate()
		&:hover
			border-bottom 2px solid LightBlue300
			color LightBlue300
	
	.project01 .columnTitle
		border-color Project01Color
	.project02 .columnTitle
		border-color Project02Color
	.project03 .columnTitle
		border-color Project03Color
</style>