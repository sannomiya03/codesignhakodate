<template lang="pug">
	div.site
		main.siteBody: router-view
</template>
<style lang="stylus">
	@import "~stylus/setting"
	.site
		position relative
		width 100%
		height 100%
		
	.siteBody
		position relative
		width 100%
		height 100%
</style>