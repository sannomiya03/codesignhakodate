<template lang="pug">
	path(:d="arcPath")
</template>
<script lang="coffee">
	module.exports =
		props: ["position","radius","degreesEnd","degreesStart"]
		methods:
			radians: (degrees) -> return degrees * Math.PI / 180
		computed:
			anchorDegrees: -> return 0
			startPoint: ->
				x: this.position.x + Math.cos(this.radians(Number(this.anchorDegrees) + Number(this.degreesStart))) * this.radius
				y: this.position.y + Math.sin(this.radians(Number(this.anchorDegrees) + Number(this.degreesStart))) * this.radius
			endPoint: ->
				x: this.position.x + Math.cos(this.radians(Number(this.anchorDegrees) + Number(this.degreesEnd))) * this.radius
				y: this.position.y + Math.sin(this.radians(Number(this.anchorDegrees) + Number(this.degreesEnd))) * this.radius
			pattern: -> return if Number(this.degreesEnd) - Number(this.degreesStart) < 180 then "0,1" else "1,1"
			arcPath: -> return "M"+this.position.x+","+this.position.y+" L"+this.startPoint.x+","+this.startPoint.y+" A"+this.radius+","+this.radius+" 0 "+this.pattern+" "+this.endPoint.x+","+this.endPoint.y+"Z"
</script>