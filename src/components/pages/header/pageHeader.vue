<template lang="pug">
	div.headerContainer(:class="{navFixed: navFixed}")
		div.siteIdentity
			h1.identity(:style="{width: width+'px'}"): img(src="static/images/logo.svg")
			div.description(v-show="isTop"): description
		div.mainvisualWrapper(:style="{height: mainvisualHeight}"): mainvisual.mainvisual
		primaryNav.primaryNav(:nav="nav", :navFixed="navFixed", v-show="isTop")
</template>
<script lang="coffee">
	module.exports =
		components:
			primaryNav: require "./primaryNav"
			description: require "./description"
			mainvisual: require "./mainvisual/mainvisual"
		data: ->
			width: 500
			navFixed: true
			nav: [
				{ label: "秋季企画大会概要", visible: false }
				{ label: "第１支部大会概要", visible: false }
				{ label: "プログラム", visible: false }
				{ label: "参加登録", visible: false }
				{ label: "アクセス", visible: false }
				{ label: "函館情報", visible: false }
			]
		computed:
			pageName: -> return this.$route.name
			isTop: -> return this.pageName is "top"
			isSingle: -> return this.pageName is "single"
			mainvisualHeight: -> return if this.isTop then return "400px" else "200px"
		methods:
			setIndentityWidth: (scrollY, windowH) ->
				windowW = $(window).width()
				if windowW >= 1240
					if scrollY <= 400-200
						this.width = 500 - scrollY
					else
						this.width = 200
				else
					this.width = 425
				elm = $(".mainvisual")
				if elm.length > 0
					if scrollY > $(elm).offset().top + 400
						this.navFixed = true
					else
						this.navFixed = false
			handleScroll: ->
				scrollY = window.scrollY
				windowH = $(window).height()
				this.setIndentityWidth(scrollY, windowH)
				
				elms = $(".sectionItem")
				for elm, index in elms
					elmY = $(elm).offset().top
					elmH = $(elm).height()
					if elmY + 50 < scrollY + windowH && elmY + elmH + 50 > scrollY
						console.log this.nav[index]
						this.nav[index].visible = true
					else
						this.nav[index].visible = false
		created: ->
			window.addEventListener("scroll", this.handleScroll)
			scrollY = window.scrollY
			windowH = $(window).height()
			this.setIndentityWidth(scrollY, windowH)
		destroyed: ->
			window.removeEventListener('scroll', this.handleScroll)
</script>
<style lang="stylus" scoped>
	@import "~stylus/setting"
	.headerContainer
		position relative
		display flex
		flex-direction column
		align-items center
		width 100%
		height 100%
	.mainvisualWrapper
		animate()
		position relative
		width 100%
		height 200px
		display flex
		align-items center
		overflow hidden
	.identity
		max-width 90%
		img
			width 100%
	.description
		max-width 90%

	+max-screen(1239)
		.siteIdentity
			position relative
			display flex
			flex-direction column
			padding 20px
		.navFixed
			padding-bottom 40px
		.primaryNav
			width 100%
	+min-screen(1240)
		.identity
			position fixed
			left 20px
			top 15px
			z-index 9999
		.headerContainer
			display block
			padding 0
			padding-left 300px
		.identity
			top 50px
			left 50px
			width 400px
		.description
			padding 50px
			padding-left 300px
		.primaryNav
			position fixed
			bottom 80px
			left 140px
			z-index 9999
</style>