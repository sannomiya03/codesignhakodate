<template lang="pug">
	div.hakodate
		p 函館の旅をお楽しみください。
		br
		div.links
			a.link(v-for="link in links", :href="link.url" target="_blank")
				img.icon(src="static/images/icon_link.svg")
				span {{link.label}}
</template>
<script lang="coffee">
	module.exports =
		data: ->
			links: [
				{ label: "函館市公式観光情報 はこぶら", url: "http://www.hakobura.jp" }
				{ label: "函館タウンなび はこなび", url: "http://www.hakonavi.ne.jp" }
				{ label: "公立はこだて未来大学", url: "https://www.fun.ac.jp" }
			]
</script>
<style lang="stylus" scoped>
	@import "~stylus/setting"
	.links
		flexbox()
		.link:not(:last-child)
			margin-right 10px
			
	.link
		animate(0.3s)
		display block
		margin-top 5px
		width 250px
		padding 5px
		text-align center
		background-color Gray700
		.icon
			display inline-block
			height 15px
			padding-top 2px
			padding-right 10px
		span
			color White
			font-size 10pt
		&:hover
			background-color Blue700
</style>