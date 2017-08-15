<template lang="pug">
	g.cell
		//- myPolygon.line(:points="innerPoints")
		g.symbol.s0(:style="{transform: toTransformStyle(symbols[0])}")
			logoSymbol.content(style="transform: translate(25px,37.5px) scale(2.0); opacity: 0.0")
		g.symbol.s1(:style="{transform: toTransformStyle(symbols[1])}")
			logoSymbol.content(style="transform: translate(25px,37.5px) scale(2.0); opacity: 0.0")
		g.symbol.s2(:style="{transform: toTransformStyle(symbols[2])}")
			logoSymbol.content(style="transform: translate(25px,37.5px) scale(2.0); opacity: 0.0")
		g.symbol.s3(:style="{transform: toTransformStyle(symbols[3])}")
			logoSymbol.content(style="transform: translate(25px,37.5px) scale(2.0); opacity: 0.0")
</template>
<script lang="coffee">
	module.exports =
		props: ["x", "y", "w", "h", "symbols", "index"]
		
		components:
			myPolygon: require "./primitives/polygon"
			logoSymbol: require "./symbol"
		
		computed:
			innerPoints: -> return [
				{ x: this.x, y: this.y }
				{ x: this.x + this.w, y: this.y }
				{ x: this.x + this.w, y: this.y + this.h }
				{ x: this.x, y: this.y+this.h }
			]

		methods:
			toTranslate: (x, y) -> return "translate("+(this.x)+"px,"+(this.y)+"px)"
			toTransformStyle: (symbol) -> return this.toTranslate(symbol.x, symbol.y)

		mounted: ->
			this.$emit("mounted", this.index)
</script>
<style lang="stylus">
	@import "~stylus/setting"
	.line
		fill rgba(0,0,0,0)
		stroke cyan
		stroke-width 0.5
	.symbol
		.st0, .st1, .st2
			fill Gray100
		.st0
			fill #B08BBE
		.st1
			fill #8FC31F
		.st2
			fill #F39800
	.content
		transform-origin 25px 12.5px
</style>