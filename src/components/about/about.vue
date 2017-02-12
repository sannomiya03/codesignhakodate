<template lang="pug">
	article.single-page
		header.page-header
		main.page-content
			header.content-header
				h1.content-title: span プロジェクト
			div.content-body
				div.projectLink
					router-link( :to="{name: 'aboutProject', params:{ project_id: 1, category: 'all' }}" )
						p.subTitle Project 01 / 資源基盤型
						h2.projectTitle ハインリッヒ・フォン・シーボルト（以下シーボルト〈子〉）収集の「もの資料」及び文献資料の総合調査をもとに、データベース化、展示等の活用事業へと展開させるウィーン を中心としたシーボルト（子）収集日本関係資料の調査研究
				br
				div.projectLink
					router-link( :to="{name: 'aboutProject', params:{ project_id: 2, category: 'all' }}" )
						p.subTitle Project 02 / 対話型
						h2.projectTitle 博物館学芸員や教育普及担当者と共に、現地の実情やニーズに応じた日本展示を各地で実現させるイギリスにおける日本展示活性化事業
				br
				div.projectLink
					router-link( :to="{name: 'aboutProject', params:{ project_id: 3, category: 'all' }}" )
						p.subTitle Project 03 / 人材育成型
						h2.projectTitle 現地大学及び博物館との連携による資料調査と展示協力を通じて、国内外の日本研究者の養成を支援するスイスにおける大学教育連携事業
</template>
<script lang="coffee">
	module.exports =
		data: -> return { site: require "scripts/site_setting" }
</script>
<style lang="stylus" scoped>
	@import "~stylus/setting"
	.projectLink
		.subTitle
			font-weight 600
		.projectTitle
			line-height 1.4em
			padding 0 20px
		a
			animate()
			&:hover
				color Blue700
			
</style>