<template lang="pug">
	div.mainVisual#mainVisualWrapper
		dynamicPattern.dynamicPattern
		subTitle.subTitle(:class="color")
</template>
<script lang="coffee">
	module.exports = 
		components:
			dynamicPattern: require "./dynamicPattern"
			subTitle: require "./subTitle"
		data: ->
			colorIndex: 0
			isRunning: false
		computed:
			color: ->
				switch this.colorIndex
					when 0 then return "purple"
					when 1 then return "orange"
					when 2 then return "green"
		methods:
			run: ->
				this.colorIndex++
				if this.colorIndex%3 is 0 then this.colorIndex = 0
				setTimeout(this.run, 3000)
		mounted: ->
			if !this.isRunning
				this.isRunning = true
				this.run()
</script>
<style lang="stylus" scoped>
	@import "~stylus/setting"
	bgColor = #F4F4F4
	bgColor = #EEEEEE
	.mainVisual
		position relative
		width 100%
		height 400px
		overflow hidden
		display flex
		justify-content center
		align-items center
		background-color bgColor
		.dynamicPattern
			position absolute
			left 0
			top 0
			height 100%
		.subTitle
			animate(2s)
			max-width 90%
			position relative
			z-index 9999
			&.purple
				fill #B08BBE
			&.orange
				fill #8FC31F
			&.green
				fill #F39800
</style>