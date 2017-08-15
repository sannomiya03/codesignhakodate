<template lang="pug">
	nav.primaryNav(:class="{fixed: navFixed}")
		ul
			li.item(v-for="item, index in nav", :class="{active: item.visible}", @click="jumpTo(index)") {{item.label}}
</template>
<script lang="coffee">
	module.exports =
		props: ["nav", "navFixed"]
		methods:
			jumpTo: (index) ->
				elm = $(".sectionItem")[index]
				elmTop = $(elm).offset().top
				$('html,body').animate({scrollTop: elmTop}, 500, 'swing')
</script>
<style lang="stylus">
	@import "~stylus/setting"
	.primaryNav ul
		flexbox()
		
	.item
		@extend .btn
		text-align right
		color Gray600
		font-weight bold
		&.active
			color Black
	
	+max-screen(1239)
		.primaryNav
			border-bottom 1px solid Gray200
			&.fixed
				position fixed
				top 0
				left 0
				z-index 9999
				background-color rgba(White, 0.9)
		.item
			width 25%
			line-height 1.2em
			padding 20px 0
			text-align center
			font-size 10pt
	+min-screen(1240)
		.primaryNav ul
			display block
			padding 0
		.item
			text-align right
			line-height 1em
		.item:not(:last-child)
			margin-right 0
			margin-bottom 2em
</style>