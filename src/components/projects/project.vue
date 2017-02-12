<template lang="pug">
	article.single-page
		main.page-content
			header.content-header
				h1.content-title {{page.title.rendered}}
			div.content-body
				div( v-html="page.content.rendered" )
				div.contents
					h2.section-title 活動報告
					div.columns
						div.column
							h3.content-title 学術成果
								router-link( :to="{name: 'category', params: {project_id: $route.params.project_id, category:'academic'}}") 学術成果 一覧へ
							postLinks(:posts="contents.academic", :category="'academic'", :project_id:="$route.params.project_id")
						div.column
							h3.content-title 教育活動
							postLinks(:posts="contents.education", :category="'education'", :project_id:="$route.params.project_id")
						div.column
							h3.content-title 研究調査
							postLinks(:posts="contents.research", :category="'research'", :project_id:="$route.params.project_id")
					//- div.columns
					//- 	p.column.toArchive
					//- 		router-link( :to="{name: 'category', params: {project_id: $route.params.project_id, category:'academic'}}") 学術成果 一覧へ
					//- 	p.column.toArchive
					//- 		router-link( :to="{name: 'category', params: {project_id: $route.params.project_id, category:'education'}}") 教育活動 一覧へ
					//- 	p.column.toArchive
					//- 		router-link( :to="{name: 'category', params: {project_id: $route.params.project_id, category:'research'}}") 研究調査 一覧へ
		footer.page-footer
			secondalyNav
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
			page:
				title: { rendered: "" }
				content: { rendered: "" }
			contents:
				academic: []
				education: []
				research: []

		computed:
			pageID: ->
				return this.site.getPageID this.$route.params.project_id
			projectCatID: ->
				return this.site.getCategoryID "project0"+this.$route.params.project_id
			keyword: ->
				return this.site.getKeyword this.$route.params.project_id
			commonQuery: ->
				return {
					categories: this.projectCatID
					orderby: "date"
					per_page: 3
				}

		methods:
			date: (dateStr) ->
				return dateStr.split("T")[0].replace(/-/g,".")
			excludeQuery: (category) ->
				return this.site.getExcludeCatsQuery(category)
			getContents: ->
				self = this
				request
					.get self.site.endPoint+"pages/"+self.pageID
					.end (err, res)-> self.page = res.body
				request
					.get self.site.endPoint+"posts"
					.query self.commonQuery
					.query self.excludeQuery("academic")
					.end (err, res)-> self.contents.academic = res.body
				request
					.get self.site.endPoint+"posts"
					.query self.commonQuery
					.query self.excludeQuery("education")
					.end (err, res)-> self.contents.education = res.body
				request
					.get self.site.endPoint+"posts"
					.query self.commonQuery
					.query self.excludeQuery("research")
					.end((err, res)-> self.contents.research = res.body )

		created: ->
			self = this
			this.getContents()

		beforeUpdate: ->
			if this.prevParams != this.$route.params
				this.page =
					title: { rendered: "" }
					content: { rendered: "" }
				this.contents =
					academic: []
					education: []
					research: []
				this.getContents()
				this.prevParams = this.$route.params
</script>
<style lang="stylus" scoped>
	@import "~stylus/setting"
	.subTitle
		font-size 12pt
		font-weight 400
		margin-bottom 40px
		line-height 1.8em
		
	.contents
		margin-top 80px
	
	.content-title
		margin-bottom 10px
	
	.section-title
		margin-bottom 0.3em
		font-weight 500
		font-size 11pt
		color Gray800
		
	.postLinks .postLink .post-title
		font-size 11pt
		
	.toArchive a
		display block
		margin-top 20px
		text-align center
		border 1px Gray600
		color Gray600
		&:hover
			background-color Gray600
			color White
</style>