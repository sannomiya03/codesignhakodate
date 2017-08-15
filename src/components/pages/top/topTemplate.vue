<template lang="pug">
	div.container
		div.news
			news(:posts="posts")
		section.section.sectionItem
			h2.sectionTitle 秋季企画大会概要
			about.sectionContent
		section.section.sectionItem
			h2.sectionTitle 第１支部大会概要
			aboutGroup.sectionContent
		section.section.sectionItem
			h2.sectionTitle 大会プログラム
			program.sectionContent.programContent
		section.section.sectionItem
			h2.sectionTitle 参加登録
			myForm.sectionContent
		section.section.sectionItem
			h2.sectionTitle アクセス
			access.sectionContent
		section.section.sectionItem
			h2.sectionTitle 函館情報
			sightseeing.sectionContent
		footer.footer
			siteFooter
</template>
<script lang="coffee">
	module.exports = 
		props: ["posts"]
		components:
			news: require "./news/news"
			about: require "./about/about"
			aboutGroup: require "./aboutGroup/aboutGroup"
			program: require "./program/program"
			access: require "./access/access"
			sightseeing: require "./sightseeing/sightseeing"
			myForm: require "./form/form"
			siteFooter: require "components/common/siteFooter"
</script>
<style lang="stylus" scoped>
	@import "~stylus/setting"
	.container
		position relative
		width 100%
		height 100%
	.description
		padding 20px
		padding-top 130px
	.news
		padding 30px 20px
	.section
		padding-bottom 40px
	.sectionTitle
		font-size 16pt
		line-height 1.5em
		padding 0 20px
		margin 0 20px
		color Gray500
		background-color Gray200
		line-height 80px
	.sectionContent
		padding 20px
	.footer
		padding 20px
		background-color Gray200
	.programContent
		overflow scroll
	
	+max-screen(1239)
		.sectionTitle
			margin-bottom 0
	+min-screen(1240)
		.description
			position absolute
			top 0
			width 100%
			padding-top 50px
			padding-left 200px
		.section, .news
			padding-left 0
			margin-left 0
		.sectionTitle
			margin-left 0
			margin-right 0
		.sectionContent
			max-width 1100px
</style>