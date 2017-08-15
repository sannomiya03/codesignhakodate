<template lang="pug">
	div.archiveContainer
		div.archiveBody.inner
			section.list.archiveSection
				h3.sectionTitle {{pageTitle}}一覧
				table.postLinks
					postLink.postLink(v-for="post, index in posts", :post="post", :index="index", @deletePost="deletePost")
				p.notFound(v-if="posts.length==0") データがありません
		div.archiveFooter
			pagenation(:totalPages="totalPages")
</template>
<script lang="coffee">
	ENV = require "config/env"
	WP = require "scripts/wordpress"
	module.exports =  
		props: ["title", "posts", "totalPages"]
		components:
			postLink: require "./postLink"
			pagenation: require "./pagenation"
		computed:
			postType: -> return this.$route.params.postType
			pageTitle: ->
				archive = ENV.getArchivePage(this.postType)
				return if archive? then return archive.label else ""
		methods:
			deletePost: (msg) ->
				if window.confirm("データを削除してもよろしいですか?")
					self = this
					WP.deletePost "admin", this.postType, msg.id, (err,res) ->
						self.posts.splice(msg.index, 1)

</script>
<style lang="stylus" scoped>
	@import "~stylus/setting"
	.archiveContainer
		padding-top 20px
	
	.archiveSection:not(:last-child)
		margin-bottom 20px
	
	.sectionTitle
		color BlueGray600
		line-height 1.5em
		font-size 14px
		margin-bottom 10px
		
	.archiveFooter
		padding-top 10px
	
	.listHeader
		display flex
		margin-bottom 10px
		.listTitle
			font-weight 400
			color BlueGray600
	
	.postLinks
		width 100%
	.postLink
		animate()
		border-top 1px solid Gray200
		&:last-child
			border-bottom 1px solid Gray200
			
	.notFound
		margin-bottom 20px
</style>