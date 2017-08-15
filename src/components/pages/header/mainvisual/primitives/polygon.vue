<template lang="pug">
	polygon(:points="attrPoints")
</template>
<script lang="coffee">
	module.exports =
		props: ["points", "offset"]
		computed:
			attrPoints: ->
				str = ""
				offset =
					x: if this.offset? then this.offset.x else 0
					y: if this.offset? then this.offset.y else 0
				for point in this.points
					str += (point.x+offset.x)+","+(point.y+offset.y)+" "
				return str
</script>