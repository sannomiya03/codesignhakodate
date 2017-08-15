<template lang="pug">
	polyline(:points="attrPoints")
</template>
<script lang="coffee">
	module.exports =
		props: ["points"]
		computed:
			attrPoints: ->
				str = ""
				for point, index in this.points
					str += point.x+","+point.y+" "
				return str
</script>