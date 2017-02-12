<template lang="pug">
	div
		div.subTitleWrapper
			p.subTitle
				span(v-if="projectID==1") {{text(site.projectShortTitle.project01.ja, site.projectShortTitle.project01.en)}}
				span(v-if="projectID==2") {{text(site.projectShortTitle.project02.ja, site.projectShortTitle.project02.en)}}
				span(v-if="projectID==3") {{text(site.projectShortTitle.project03.ja, site.projectShortTitle.project03.en)}}
		h1.projectTitle(v-if="!isEnglish")
			span(v-if="projectID==1") ハインリッヒ・フォン・シーボルト（以下シーボルト〈子〉）収集の<br>「もの資料」及び文献資料の総合調査をもとに、データベース化、<br>展示等の活用事業へと展開させるウィーンを中心とした<br>シーボルト（子）収集日本関係資料の調査研究
			span(v-if="projectID==2") 博物館学芸員や教育普及担当者と共に、現地の実情やニーズに応じた<br>日本展示を各地で実現させるイギリスにおける日本展示活性化事業
			span(v-if="projectID==3") 現地大学及び博物館との連携による資料調査と展示協力を通じて、<br>国内外の日本研究者の養成を支援するスイスにおける大学教育連携事業
		h1.projectTitle(v-if="isEnglish")
			span(v-if="projectID==1") Lorem ipsum dolor sit amet, consectetur adipiscing elit
			span(v-if="projectID==2") Lorem ipsum dolor sit amet, consectetur adipiscing elit
			span(v-if="projectID==3") Lorem ipsum dolor sit amet, consectetur adipiscing elit
</template>
<script lang="coffee">
	module.exports = 
		data: ->
			site: require "scripts/site_setting"
		computed:
			isEnglish: -> return if this.$route.fullPath.match(/en/) then true else false
			projectID: -> return Number(this.$route.params.project_id)
		methods:
			text: (strJa, strEn) -> return if !this.isEnglish then strJa else strEn
</script>
<style lang="stylus">
	@import "~stylus/setting"
	.subTitleWrapper
		centering Object
	.subTitle
		margin-bottom 40px
		span
			display block
			// centering Object
			padding-left 3px
			line-height 1.5em
			font-size 12pt
			font-weight 400
			color White
	.projectTitle
		centering Object
		margin-bottom 20px
		span
			font-size 14pt
			font-weight 500
	.project01
		.subTitle
			background-color Project01Color
	.project02
		.subTitle
			background-color Project02Color
	.project03
		.subTitle
			background-color Project03Color
</style>