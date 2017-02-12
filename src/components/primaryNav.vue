<template lang="pug">
	ul
		li(v-for="link in site.primaryNav", :class="{active: $route.path.indexOf(link.name)!=-1}")
			router-link(:to="{name:link.name, params:link.params}" v-if="!isEnglish") {{link.title.ja}}
			router-link(:to="{name:'en_'+link.name, params:link.params}" v-if="isEnglish") {{link.title.en}}
		li.ja(:class="{active: !isEnglish}")
			router-link(:to="toJa") JA
		li.en(:class="{active: isEnglish}")
			router-link(:to="toEn") EN
</template>
<script lang="coffee">
	module.exports =
		data: ->
			site: require "scripts/site_setting"
		computed:
			isEnglish: -> return if this.$route.fullPath.match(/en/) then true else false
			toEn: ->
				return {
					name: "en_"+this.$route.name.replace("en_","")
					params: this.$route.params
				}
			toJa: ->
				return {
					name: this.$route.name.replace("en_","")
					params: this.$route.params
				}
</script>
<style lang="stylus" scoped>
	@import "~stylus/setting"
	ul
		display: flex
		li:not(:last-child)
			margin-right 1.5em
		a
			font-size 10pt
			font-weight 500
			color Gray400
			animate()
			&:hover
				color Gray900
		li.active a
			color Gray900
		li.ja
			margin-left 1em
			margin-right 1em
			a 
				padding-right 1em
				border-right 1px solid Gray200
	.isTop
		li:not(:last-child)
			margin-right 2em
</style>