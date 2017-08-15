<template lang="pug">
	div.slideshow
		div.image(v-for="image in images", :style="backgroundImage(image)", :class="{isHide: isHide(image)}")
</template>
<script lang="coffee">
	module.exports =
		props: ["images"]
		data: ->
			index: 0
		methods:
			isHide: (image) ->
				if this.images[this.index] isnt image then return true
				return false
			backgroundImage: (image) -> return "background-image: url("+image+")"
			nextImage: ->
				this.index = (this.index+1)%this.images.length
				setTimeout this.nextImage, 5000
		mounted: ->
			setTimeout this.nextImage, 5000
</script>
<style lang="stylus" scoped>
	@import "~stylus/setting"
	.slideshow
		position relative
		width 100%
		height 100%
	.image
		animate(2s)
		position absolute
		top 0
		left 0
		width 100%
		height 100%
		background-color Gray100
		background-position center center
		background-repeat no-repeat
		background-size cover
		&.isHide
			opacity 0
</style>