<template lang="pug">
	div.header-container(:class="{isTop: $route.name == 'top' || $route.name == 'en_top'}")
		div
			h1.site-title(v-if="!isEnglish")
				router-link(:to="{name: 'top'}")
					span.main ヨーロッパにおける19世紀日本関連在外資料調査研究・活用
					span.sub 日本文化発信に向けた国際連携のモデル構築
			h1.site-title(v-if="isEnglish")
				router-link(:to="{name: 'en_top'}")
					span.main Lorem ipsum dolor sit amet, consectetur adipiscing elit
					span.sub Lorem ipsum dolor sit amet, consectetur adipiscing elit
		primaryNav.primary-nav
</template>
<script lang="coffee">
	module.exports =
		components:
			primaryNav: require "./primaryNav"
		data: ->
			site: require "scripts/site_setting"
		computed:
			isEnglish: -> return if this.$route.fullPath.match(/en/) then true else false
</script>
<style lang="stylus" scoped>
	@import "~stylus/setting"
	
	.header-container
		display flex
		justify-content space-between
		align-items center
		centering Large
		padding-top 10px
		padding-bottom 10px

	.site-title
		padding 10px 0
		a
			display flex
			flex-direction column
			align-items flex-start
			color Gray500
			animate()
			&:hover
				color Gray900
			.main
				font-size 12pt
				font-weight 500
				line-height 1.2em
			.sub
				font-size 9pt
				font-weight 300
				line-height 1.4em
	.isTop
		flex-direction column
		justify-content center
		padding-top 80px
		border-bottom 1px solid Gray300
		centering Object
		.site-title
			a
				color Gray900
				align-items center
				.main
					font-size 18pt
					line-height 1.8em
				.sub
					font-size 14pt
		.primary-nav
			margin-top 40px
			
</style>