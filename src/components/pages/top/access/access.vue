<template lang="pug">
	div.access
		div.columns
			gmap
			div.landmarks
				ul
					li.landmark(v-for="landmark, index in landmarks")
						div.name
							img.icon(:src="'./static/images/icon_num'+(index+1)+'.svg'")
							p.label {{landmark.name}}
						p.address {{landmark.address}}
							a.gmapLink(:href="landmark.link", target="_blank") Googleマップで開く
				div.toHakodate
					p.label 函館市へのアクセス
					p 飛行機、JR、高速バス、フェリー、自家用車
					a.link(href="http://www.hakobura.jp/access/" target="_blank")
						img.icon(src="static/images/icon_link.svg")
						span 函館市公式観光情報 はこぶら
</template>
<script lang="coffee">
	module.exports =
		components:
			gmap: require "./map"
		data: ->
			landmarks: [
				{ name: "函館市地域交流まちづくりセンター", address: "〒040-0053 北海道函館市末広町4−19", link: "https://goo.gl/maps/r5xfTyKKdn42" }
				{ name: "はこだて未来大学デザインベース01 弥生町長屋", address: "〒040-0056 北海道函館市弥生町8−15", link: "https://goo.gl/maps/TQ6DLkYZ8Lk" }
				{ name: "はこだて未来大学デザインベース02 旧大黒湯", address: "〒040-0051 北海道函館市弁天町14-8", link: "https://goo.gl/maps/9xYuycGYBn72" }
				{ name: "レストラン雪河亭（五島軒 本店）", address: "〒040-0053 北海道函館市末広町4-5", link: "https://goo.gl/maps/Gv8PVCuTdAK2"  }
			]
</script>
<style lang="stylus" scoped>
	@import "~stylus/setting"
	.columns
		justify-content flex-start
	.landmarks
		padding-left 50px
	.landmark:not(:last-child)
		margin-bottom 1em
	.landmark
		.name
			flexbox()
			align-items center
		.icon
			height 20px
		.label
			font-size 12pt
			font-weight bold
			line-height 1.3em
			padding-left 5px
			padding-top 3px
		.address
			padding-left 25px
			padding-top 2px
		.gmapLink
			animate()
			display inline-block
			margin-left 15px
			color Gray400
			padding 0 5px
			font-size 8pt
			&:hover
				color Blue600
	.toHakodate
		margin-top 20px
		padding-top 10px
		border-top 2px solid Gray300
		.label
			font-weight bold
		.link
			animate(0.3s)
			display inline-block
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
	+max-screen(1239)
		.columns
			display block
		.landmarks
			padding-top 20px
			padding-left 0
</style>