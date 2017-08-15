<template lang="pug">
	article.page
		pagesTemplate(:container="container" @update="updatePrevValues")
</template>
<script lang="coffee">
	ENV = require "config/env"
	request = require "superagent"

	module.exports =
		components:
			pagesTemplate: require "./pagesTemplate"
		
		data: ->
			container: null
			prev:
				pageName: null
				pageID: null
				postType: null
				pageNo: null

		computed:
			pageName: -> return this.$route.name
			isTop: -> return this.pageName is "top"
			isPage: -> return this.pageName is "page"
			isArchive: -> return this.pageName is "archive"
			isSingle: -> return this.pageName is "single"
			isCreate: -> return this.pageName is "create"
			isPrint: -> return this.pageName is "print"
			isEdit: -> return this.pageName is "edit"
			pageID: -> return if this.$route.params.id? then Number this.$route.params.id else null
			postID: -> return if this.$route.params.id? then Number this.$route.params.id else null
			postType: -> return if this.$route.params.postType? then this.$route.params.postType else null
			pageNo: -> return if this.$route.params.pageNo? then this.$route.params.pageNo else 1
			
		methods:
			pageChanged: -> return this.prev.pageName != this.pageName ||
				this.prev.pageID != this.pageID ||
				this.prev.postType != this.postType ||
				this.prev.pageNo != this.pageNo
			updatePrevValues: ->
				this.prev.pageName = this.pageName
				this.prev.pageID = this.pageID
				this.prev.postType = this.postType
				this.prev.pageNo = this.pageNo

		mounted: ->
			this.updatePrevValues()
			self = this
			request
				.get "./static/news.json"
				.end (err, res) ->
					if err?
						console.log err
					else
						# console.log res
						self.container = JSON.parse res.text

</script>
<style lang="stylus">
	.page
		width 100%
		height 100%
</style>
