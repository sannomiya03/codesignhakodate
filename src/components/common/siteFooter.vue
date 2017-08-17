<template lang="pug">
	div.footerContainer
		div
			p.mail お問い合わせ先　jssd2017f<span class="spamclear">spamclear</span>@fun.ac.jp
			p: strong 2017年度日本デザイン学会秋季機各大会実行委員会（公立はこだて未来大学）
			p 大会実行委員長　岡本誠
			p 副実行委員長　柳英克、木村健一
			p 実行委員　美馬義亮、原田泰、安井重哉、伊藤精英、南部美砂子、姜南圭
			p 学生実行委員　三野宮定里、川島奨大、斎田萌、木下誠子
			p: strong 2017年度日本デザイン学会秋季機各大会実行委員会（公立はこだて未来大学）
			p 実行委員長　細谷多門
			p 実行委員　柿山浩一郎、福田大年
		div.logos
			div.logo: img(src="static/images/jssd_logo.png")
			div.logo: img(src="static/images/icon_fun.svg")
</template>
<style lang="stylus" scoped>
	@import "~stylus/setting"
	.footerContainer
		display flex
		justify-content space-between
		align-items flex-end
	.copy
		font-size 12px
		color Gray700
		line-heigth 1em
		padding 0
		margin 0
	p strong
		font-weight bold
	.logo
		display block
		height 50px
		
		&:first-child
			margin-bottom 20px
		img
			height 100%
			width auto
	.spamclear
		display none
	.mail
		margin-bottom 10px
	+max-screen(1239)
		.footerContainer
			flex-direction column
			align-items center
		.logos
			margin-top 20px
		.logo
			text-align center
		
</style>
