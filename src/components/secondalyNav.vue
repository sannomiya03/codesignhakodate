<template lang="pug">
	ul.categoryNav
		li.categoryLink( v-for="cat in site.categoryNav", :class="{ active: isActiveCateogy(cat.params.category) }" )
			router-link( :to="to(cat.params.category)" ) {{text(cat.title.ja, cat.title.en)}}
</template>
<script lang="coffee">
	module.exports =
		props:["direction"]
		data: ->
			site: require "scripts/site_setting"
		computed:
			isEnglish: -> return if this.$route.fullPath.match(/en/) then true else false
			projectID: -> return Number(this.$route.params.project_id)
			category: -> return if this.$route.params.category? then return this.$route.params.category else "all"
		methods:
			text: (strJa, strEn) -> return if !this.isEnglish then strJa else strEn
			isActiveCateogy: (category) -> return if this.category is category then true else false
			to: (category) ->
				name = if !this.isEnglish then "category" else "en_category"
				return { name: name, params: { project_id: this.projectID, category: category }}
</script>
<style lang="stylus" scoped>
	@import "~stylus/setting"
	
	.categoryNav
		display flex
		a
			font-size 12pt
			margin-right 0.5em
			color Gray300
			animate()
			&:hover
				color Gray800
		.active a
			color Gray800
</style>