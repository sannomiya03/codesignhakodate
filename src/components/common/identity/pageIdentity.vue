<template lang="pug">
	div.mainVisual(:class="{'isntRootPage': !isRootPage, 'isArchivePage': isArchive, 'isTop':isTop }", :style="imageStyle")
		div.slideshow(v-if="isTop"): slideshow(:images="images")
		div.pattern
		h1.title {{title}}
</template>
<script lang="coffee">
	ENV = require "config/env"
	FUNCTIONS = require "scripts/common"
	WP = require "scripts/wordpress"
	module.exports =
		props: ["title", "isRootPage", "post"]
		components:
			slideshow: require "components/common/function/slideshow"
		data: ->
			link: null
		computed:
			pageName: -> this.$route.name
			pageID: -> return if this.$route.params.id? then Number this.$route.params.id else null
			postType: -> return if this.$route.params.postType? then this.$route.params.postType else ""
			isTop: -> return this.pageName is "top"
			isPage: -> return this.pageName is "page"
			isArchive: -> return this.pageName is "archive"
			isSingle: -> return this.pageName is "single"
			parentItem: -> return if this.post?.id? then WP.getPrimaryNavItem(this.post.id) else null
			parentPage: -> return if this.parentItem?.container?.content? then this.parentItem.container.content else null
			imageStyle: ->
				if this.getImageURL()? then return {"background-image": "url("+this.getImageURL()+")"}
			images: -> ["/static/images/title.png","/static/images/sample01.jpg","/static/images/sample02.jpg","/static/images/sample03.jpg"]
		methods:
			getImageURL: ->
				if this.isPage
					if this.post?.acf.image? && this.post.acf.image!="" then return this.post.acf.image
				return null
</script>
<style lang="stylus" scoped>
	@import "~stylus/setting"
	.mainVisual
		animate()
		position relative
		display flex
		align-items center
		width 100%
		height 400px
		background-color White
		background-repeat no-repeat
		background-position center
		background-size contain
		+max-screen(1240)
			height 300px
		+max-screen(799)
			height 120px
		&.isTop
			background-size cover
			.pattern
				opacity .0
		.slideshow, .pattern
			position absolute
			top 0
			left 0
			width 100%
			height 100%
		.pattern
			background Gray800
			background-image radial-gradient(Gray900 20%, transparent 0), radial-gradient(Gray900 20%, transparent 0)
			background-position 0 0, 10px 10px
			background-size 5px 5px
			opacity .8
		.title
			animate()
			position relative
			centering Medium
			font-size 36px
			color White
		&.isntRootPage
			height 100px
			.title
				font-size 24px
		&.isArchivePage
			height 100px
			padding-bottom 40px
			.title
				font-size 24px
			&.isntRootPage
				height 400px
				padding-bottom 0
				+max-screen(1240)
					height 300px
				+max-screen(799)
					height 200px
				.title
					font-size 36px
</style>
