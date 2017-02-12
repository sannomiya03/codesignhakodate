<template lang="pug">
	article.single-page
		header.page-header
		main.page-content
			div.content-body
				ja(v-if="!isEnglish")
				en(v-if="isEnglish")
</template>
<style lang="stylus" scoped>
	@import "~stylus/setting"
	.content-body
		margin-top 50px
</style>
<script lang="coffee">
	module.exports =
		components:
			ja: require "./ja"
			en: require "./en"
		computed:
			isEnglish: -> return if this.$route.fullPath.match(/en/) then true else false
</script>
