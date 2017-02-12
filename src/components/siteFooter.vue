<template lang="pug">
	div.footer-wrapper
		div.footer-container
			div.links
				div.link-group
					h1
						span(v-if="!isEnglish") 関連研究機関
						span(v-if="isEnglish") Lorem ipsum
					ul
						li(v-for="link in links")
							a(:href="link.url" target="_blank" v-if="!isEnglish") {{link.title.ja}}
							a(:href="link.url" target="_blank" v-if="isEnglish") {{link.title.en}}
				div.link-group
					h1
						span(v-if="!isEnglish") 関連研究プロジェクト
						span(v-if="isEnglish") Lorem ipsum
					ul
						li
							a(href="http://www.nihu.jp" target="_blank" v-if="!isEnglish") 人間文化研究機構「日本関連在外資料調査研究事業」プロジェクト（カテゴリーB）
							a(href="http://www.nihu.jp" target="_blank" v-if="isEnglish") Lorem ipsum
			p.copy(v-if="!isEnglish") Copyright &copy; 2017 人間文化研究機構ネットワーク型基幹研究プロジェクト
			p.copy(v-if="isEnglish") Copyright &copy; 2017 Lorem ipsum
</template>
<script lang="coffee">
	module.exports =
		data: -> return {
			site: require "scripts/site_setting"
			links: [
				{
					url: "http://www.nihu.jp"
					title:
						ja: "人間文化研究機構"
						en: "Lorem ipsum"
				}
				{
					url: "http://www.rekihaku.ac.jp/index.html"
					title:
						ja: "国立歴史民俗博物館"
						en: "Lorem ipsum"
				}
				{
					url: "http://www.hi.u-tokyo.ac.jp/index-j.html"
					title:
						ja: "東京大学史料編纂所"
						en: "Lorem ipsum"
				}
				{
					url: "http://www.minpaku.ac.jp"
					title:
						ja: "国立民族学博物館"
						en: "Lorem ipsum"
				}
				{
					url: "http://www.nijl.ac.jp"
					title:
						ja: "国文学研究資料館"
						en: "Lorem ipsum"
				}
				{
					url: "http://www.nichibun.ac.jp/ja/"
					title:
						ja: "国際日本文化研究センター"
						en: "Lorem ipsum"
				}
			]
		}
		methods:
			toTop: -> $("body").animate({scrollTop: 0}, 500, 'swing')
		computed:
			isEnglish: -> return if this.$route.fullPath.match(/en/) then true else false
</script>
<style lang="stylus" scoped>
	@import "~stylus/setting"
	
	.footer-wrapper
		background-color Gray200
		margin-top 80px
		
	.footer-container
		padding-bottom 20px
	
	.links
		display flex
		padding-top 40px
		padding-bottom 20px
		centering Large
		
	.link-group
		&:not(:last-child)
			margin-right 100px
		h1
			font-weight 500
			font-size 12pt
			color Gray700
		li a
			font-size 10pt
			font-weight 300
			color Gray500
			animate()
			&:hover
				color Blue700
	
	.copy
		font-size 9pt
		text-align center
		font-weight 400
		color Gray600
</style>
