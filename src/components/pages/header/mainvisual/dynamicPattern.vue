<template lang="pug">
	svg(:viewBox="viewBox")
		cell(v-for="index in cells", :x="size.cell * toPosition(index).x", :y="size.cell * toPosition(index).y", :w="size.cell", :h="size.cell", :symbols="symbols", :symbol="symbol", :index="index", @mounted="renderdCell")
</template>
<script lang="coffee">
	module.exports =
		components:
			cell: require "./cell"
		data: ->
			isRunning: false
			count: 0
			size:
				width: 1024
				height: 400
				cell: 201
			length: {x: 0, y: 0}
			cells: []
			symbol:
				width: 100
				height: 50
			symbols: [ # ボーダー
					{ x: 0, y: 12.5, degree: 0, scale: 1.0, opacity: 1.0 }
					{ x: 50, y: 12.5, degree: 0, scale: 1.0, opacity: 1.0 }
					{ x: 0, y: 62.5, degree: 0, scale: 1.0, opacity: 1.0 }
					{ x: 50, y: 62.5, degree: 0, scale: 1.0, opacity: 1.0 }
				]
			animates: [
				[ # ボーダー
					{ x: 0, y: 12.5, degree: 0, scale: 1.0, opacity: 1.0 }
					{ x: 50, y: 12.5, degree: 0, scale: 1.0, opacity: 1.0 }
					{ x: 0, y: 62.5, degree: 0, scale: 1.0, opacity: 1.0 }
					{ x: 50, y: 62.5, degree: 0, scale: 1.0, opacity: 1.0 }
				]
				[ # 一松模様
					{ x: 0, y: 0, degree: 0, scale: 1.0, opacity: 1.0 }
					{ x: 0, y: 25, degree: 0, scale: 1.0, opacity: 1.0 }
					{ x: 50, y: 50, degree: 0, scale: 1.0, opacity: 1.0 }
					{ x: 50, y: 75, degree: 0, scale: 1.0, opacity: 1.0 }
				]
				[ # ギンガム
					{ x: 25, y: 10, degree: -90, scale: 0.9, opacity: 1.0 }
					{ x: -3, y: 37, degree: 180, scale: 0.9, opacity: 1.0 }
					{ x: 53, y: 37, degree: 0, scale: 0.9, opacity: 1.0 }
					{ x: 25, y: 65, degree: 90, scale: 0.9, opacity: 1.0 }
				]
				[ # アーガイル
					{ x: 0, y: 10, degree: 315, scale: 1.2, opacity: 1.0 }
					{ x: 50, y: 10, degree: 225, scale: 1.2, opacity: 1.0 }
					{ x: 0, y: 60, degree: 45, scale: 1.2, opacity: 1.0 }
					{ x: 50, y: 60, degree: 135, scale: 1.2, opacity: 1.0 }
				]
				[ # 檜垣
					{ x: 0, y: 10, degree: 45, scale: 1.2, opacity: 1.0 }
					{ x: 50, y: 25, degree: 315, scale: 1.2, opacity: 1.0 }
					{ x: 0, y: 60, degree: 45, scale: 1.2, opacity: 1.0 }
					{ x: 50, y: 75, degree: 315, scale: 1.2, opacity: 1.0 }
				]
				[ # バスケットチェック
					{ x: 50, y: 0, degree: 0, scale: 1.0, opacity: 1.0 }
					{ x: 50, y: 25, degree: 0, scale: 1.0, opacity: 1.0 }
					{ x: -10, y: 60, degree: 90, scale: 1.0, opacity: 1.0 }
					{ x: 15, y: 60, degree: 90, scale: 1.0, opacity: 1.0 }
				]
				[ # ダイアゴナル
					{ x: 0, y: 10, degree: 45, scale: 1.2, opacity: 1.0 }
					{ x: 50, y: 10, degree: 315, scale: 1.2, opacity: 1.0 }
					{ x: 0, y: 60, degree: 315, scale: 1.2, opacity: 1.0 }
					{ x: 50, y: 60, degree: 45, scale: 1.2, opacity: 1.0 }
				]
				[ # 斜めストライプ
					{ x: 50, y: 0, degree: -45, scale: 1.3, opacity: 0.0 }
					{ x: 50, y: 0, degree: -45, scale: 1.3, opacity: 1.0 }
					{ x: 0, y: 50, degree: -45, scale: 1.3, opacity: 1.0 }
					{ x: 0, y: 50, degree: -45, scale: 1.3, opacity: 0.0 }
				]
				[ # ストライプ
					{ x: 0, y: 10, degree: 90, scale: 1.0, opacity: 1.0 }
					{ x: 0, y: 60, degree: 90, scale: 1.0, opacity: 1.0 }
					{ x: 50, y: 10, degree: 90, scale: 1.0, opacity: 1.0 }
					{ x: 50, y: 60, degree: 90, scale: 1.0, opacity: 1.0 }
				]
			]
		computed:
			viewBox: -> "0 0 "+this.size.width+" "+this.size.height
			scale: -> this.size.cell / this.symbol.width
		methods:
			toPosition: (index) ->
				{
					x: index % this.length.x
					y: Math.floor index / this.length.x
				}
			renderdCell: (index) ->
				if index is this.cells.length-1
					for i in [0..3]
						Velocity $(".s"+i+" .content"), {
							translateX: this.symbols[i].x * this.scale + this.symbol.width*((this.scale-1)/2/2)
							translateY: this.symbols[i].y * this.scale + this.symbol.height*((this.scale-1)/2/2)
							rotateZ: this.symbols[i].degree
							scale: this.symbols[i].scale * this.scale
							opacity: 0
						}, {
							duration: 0
							easing: "easeInOutSine"
						}
					for i in [0..3]
						Velocity $(".s"+i+" .content"), {
							translateX: this.symbols[i].x * this.scale + this.symbol.width*((this.scale-1)/2/2)
							translateY: this.symbols[i].y * this.scale + this.symbol.height*((this.scale-1)/2/2)
							rotateZ: this.symbols[i].degree
							scale: this.symbols[i].scale * this.scale
							opacity: this.symbols[i].opacity
						}, {
							duration: 1000
							easing: "easeInOutSine"
						}
					if !this.isRunning
						this.isRunning = true
						setTimeout(this.run, 2000)
			run: ->
				this.count++
				if this.count % this.animates.length is 0 then this.count = 0
				this.symbols = this.animates[this.count]
				for i in [0..3]
					Velocity $(".s"+i+" .content"), {
						translateX: this.symbols[i].x * this.scale + this.symbol.width*((this.scale-1)/2/2)
						translateY: this.symbols[i].y * this.scale + this.symbol.height*((this.scale-1)/2/2)
						rotateZ: this.symbols[i].degree
						scale: this.symbols[i].scale * this.scale
						opacity: this.symbols[i].opacity
					}, {
						duration: 400
						easing: "easeInOutSine"
					}
				delayMax = 2000
				delayMin = 500
				delay = Math.floor( Math.random() * (delayMax + 1 - delayMin) ) + delayMin
				setTimeout(this.run, delay)
		mounted: ->
			this.size.width = $("#mainVisualWrapper").width()
			# this.size.height = $("#mainVisualWrapper").height()
			this.size.height = 400
			this.length.x = Math.floor this.size.width / this.size.cell + 1
			this.length.y = Math.floor this.size.height / this.size.cell + 1
			index = 0
			for yi in [0...this.length.y]
				for xi in [0...this.length.x]
					this.cells.push index
					index++
</script>
<style lang="stylus">
	@import "~stylus/setting"
</style>