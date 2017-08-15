<template lang="pug">
	div#gmap
</template>
<script lang="coffee">
	module.exports =
		data: ->
			landmarks: [
				{ name: "函館市地域交流まちづくりセンター", address: "〒040-0053 北海道函館市末広町4−19", lat: 41.763785, lng: 140.716989, }
				{ name: "はこだて未来大学デザインベース01 弥生町長屋", address: "〒040-0056 北海道函館市弥生町8−15", lat: 41.769035, lng: 140.704548 }
				{ name: "はこだて未来大学デザインベース02 旧大黒湯", address: "〒040-0051 北海道函館市弁天町14-8", lat: 41.770654, lng: 140.707151 }
				{ name: "五島軒", address: "〒040-0053 北海道函館市末広町4-5", lat: 41.763624, lng: 140.715987 }
			]
		mounted: ->
			myOptions = 
				zoom: 14,
				center: new google.maps.LatLng(41.763785, 140.716989), 
				mapTypeId: google.maps.MapTypeId.ROADMAP
				scrollwheel: false
			map = new google.maps.Map(document.getElementById("gmap"), myOptions)

			for land, index in this.landmarks
				latlng = new google.maps.LatLng(land.lat, land.lng)
				icon = new google.maps.MarkerImage("static/images/icon_pin"+(index+1)+".svg", new google.maps.Size(30,37), new google.maps.Point(0,0))
				marker = new google.maps.Marker({
					position : latlng,
					map : map
					icon: icon
				})
				# infoWindow = new google.maps.InfoWindow({ content: land.name })
				# marker.addListener('click', ->
				# 	infoWindow.open(map, marker)
				# )
</script>
<style lang="stylus" scoped>
	@import "~stylus/setting"
	#gmap
		width 400px
		height 400px
		background-color Gray100
		+max-screen(1239)
			width 100%
</style>