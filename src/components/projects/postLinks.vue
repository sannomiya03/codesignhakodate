<template lang="pug">
	transition-group.postLinks( name="list" tag="ul" )
		li.postLink.list-item( v-for="post in posts", :key="post.id", :class="[getProjectClass(post),getCategoryClass(post)]" )
			p.post-date {{date(post)}}
				span.new {{text('最新','NEW')}}
			h4.post-title
				router-link( :to="to(post)") {{text(post.title.rendered,post.acf.titleEn)}}
</template>
<script lang="coffee">
	module.exports =
		props: ["posts"]
		data: ->
			site: require "scripts/site_setting"
		computed:
			isEnglish: -> return if this.$route.fullPath.match(/en/) then true else false
		methods:
			text: (strJa, strEn) -> return if !this.isEnglish then strJa else strEn
			to: (post) ->
				name = if !this.isEnglish then "post" else "en_post"
				return { name: name, params: this.getParams(post) }
			getParams: (post) ->
				return {
					project_id: this.site.getProjectNo this.getProjectID post.categories
					category: this.site.getCategoryName this.getCategoryID post.categories
					post_id: post.id
				}
			date: (post) ->
				if post.acf.displayDate? and post.acf.displayDate isnt "" then return post.acf.displayDate
				return post.date.split("T")[0].replace(/-/g,".")
			getProjectClass: (post) ->
				project_id = this.getProjectID(post.categories)
				switch project_id
					when this.site.categories.project01 then return {"project01": true}
					when this.site.categories.project02 then return {"project02": true}
					when this.site.categories.project03 then return {"project03": true}
			getCategoryClass: (post) ->
				category_id = this.getCategoryID(post.categories)
				switch category_id
					when this.site.categories.academic then return {"academic": true}
					when this.site.categories.education then return {"education": true}
					when this.site.categories.research then return {"research": true}
					when this.site.categories.other then return {"other": true}

			getProjectID: (categories) ->
				for category in categories
					if category is this.site.categories.project01 then return category
					if category is this.site.categories.project02 then return category
					if category is this.site.categories.project03 then return category
			getCategoryID: (categories) ->
				for category in categories
					if category is this.site.categories.academic then return category
					if category is this.site.categories.education then return category
					if category is this.site.categories.research then return category
					if category is this.site.categories.other then return category
				return this.site.categories.other
</script>
<style lang="stylus" scoped>
	@import "~stylus/setting"
	
	.postLinks
		display flex
		flex-direction column
		
		.postLink
			min-height 40px
			&:not(:last-child)
				margin-bottom 20px
			border-left 20px solid Gray300
			padding-left 10px
			
			.post-date
				position relative
				top 2px
				font-size 9pt
				color Gray400
				line-height 1em
				margin-bottom 0.5em
				.new
					position relative
					bottom 1px
					display inline-block
					margin-left 0.5em
					font-size 7.5pt
					padding 0 0.5em
					background-color Red300
					color White
			.post-title
				font-size 12pt
				line-height 1.2em
				a
					animate()
				a:hover
					color LightBlue600
	.postLink		
		&:before, &:after
			position absolute
			left -20px
			content " "
			width 20px
			height 50%
			text-align center
			background-repeat no-repeat
			background-position center center
			background-size 70% auto
		&:before
			top 0
		&:after
			bottom 0
		&.project01:before
			background-color Red300
			background-image url("/static/images/typo-01.svg")
		&.project02:before
			background-color Blue300
			background-image url("/static/images/typo-02.svg")
		&.project03:before
			background-color Green300
			background-image url("/static/images/typo-03.svg")
		&.academic:after
			background-color Orange300
			background-image url("/static/images/typo-07.svg")
		&.education:after
			background-color Teal300
			background-image url("/static/images/typo-04.svg")
		&.research:after
			background-color Indigo300
			background-image url("/static/images/typo-05.svg")
		&.other:after
			background-color Gray500
			background-image url("/static/images/typo-06.svg")
	
	.list-item, .list-enter-active, .list-leave-active
		display inline-block
		margin-right 10px
		transition all 1s
		bottom 0
		position relative
		
	.list-enter, .list-leave-to
		opacity 0
		bottom 0
		transform translateY(200px)
		opacity 0
	
	.list-leave-active
		position absolute
		transform translateY(300px)
		opacity 0		
</style>