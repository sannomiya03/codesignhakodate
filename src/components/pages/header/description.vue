<template lang="pug">
	div.descriptionContainer
		p: strong 共　　催：2017年度日本デザイン学会第１支部支部大会 
		p 開催日時：平成29年10月13日（金）〜10月15日（日）
		p 会　　場：北海道函館市　西部地区
		div.detail
			p 函館市地域交流まちづくりセンター、五島軒(末広町)
			p はこだて未来大学デザインベース（弥生町長屋、旧大黒湯）、他
</template>
<style lang="stylus" scoped>
	@import "~stylus/setting"
	p
		font-size 13pt
		line-height 1.5em
		color Gray900
		strong
			color Gray900
	.detail
		padding-top 2px
		padding-left 85px
	.detail p
		font-size 10pt
	+max-screen(900)
		p
			font-size 10pt
		.detail p
			font-size 8pt
</style>