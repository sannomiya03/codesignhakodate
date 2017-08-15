<template lang="pug">
	div.headerContainer
		h1.identity(:style="{width: width+'px'}"): img(src="static/images/logo.svg")
		nav.primaryNav
			ul
				li.item(v-for="item, index in nav", :class="{active: item.visible}", @click="jumpTo(index)") {{item.label}}
</template>
<script lang="coffee">
	module.exports =
		data: ->
			width: 400
			nav: [
				{ label: "大会概要", visible: false }
				{ label: "プログラム", visible: false }
				{ label: "アクセス", visible: false }
				{ label: "函館情報", visible: false }
				{ label: "参加登録", visible: false }
			]
		methods:
			jumpTo: (index) ->
				elm = $(".sectionItem")[index]
				elmTop = $(elm).offset().top
				$('html,body').animate({scrollTop: elmTop}, 500, 'swing')

			setIndentityWidth: (scrollY, windowH) ->
				windowW = $(window).width()
				if windowW >= 1240
					if scrollY <= 400-150
						this.width = 400 - scrollY
					else
						this.width = 150
				else
					if scrollY*3.0 <= 425-160
						this.width = 425 - scrollY*3.0
					else
						this.width = 160

			handleScroll: ->
				scrollY = window.scrollY
				windowH = $(window).height()
				this.setIndentityWidth(scrollY, windowH)
				
				elms = $(".sectionItem")
				for elm, index in elms
					elmY = $(elm).offset().top
					elmH = $(elm).height()
					if elmY + 50 < scrollY + windowH && elmY + elmH + 50 > scrollY
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
		justify-content flex-end
		align-items center
		width 100%
		height 100%
		padding 20px
		background-color rgba(White, 0.9)
	.identity
		position fixed
		left 20px
		top 15px
		img
			width 100%
	.primaryNav ul
		display flex
	.item
		@extend .btn
		text-align right
		line-height 1em
		color Gray600
		font-weight bold
		&.active
			color Black
	.item:not(:last-child)
		margin-right 2em
	
	+min-screen(1240)
		.headerContainer, .primaryNav ul
			display block
			padding 0
		.identity
			top 50px
			left 50px
			width 400px
		.primaryNav
			position absolute
			bottom 80px
			right 50px
		.item
			text-align right
		.item:not(:last-child)
			margin-right 0
			margin-bottom 2em
</style>