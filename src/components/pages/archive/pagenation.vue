<template lang="pug">
	p.pagenation
		span.pagelink(v-for="page in totalPages", :class="{active: page==pageNo}" @click="pageJump(page)") {{page}}
</template>
<script lang="coffee">
	module.exports =
		props: ["totalPages"]
		computed:
			pageName: -> return this.$route.name
			pageNo: -> return this.$route.params.pageNo
		methods:
			pageJump: (page) ->
				if page is this.pageNo then return
				newParams = this.$route.params
				newParams.pageNo = page
				this.$router.replace({name: this.pageName, params: newParams})
</script>
<style lang="stylus">
	@import "~stylus/setting"
	.pagenation
		text-align center
	.pagelink
		display inline-block
		width 30px
		height 30px
		line-height 30px
		text-align center
		border 1px transparent
		color Gray800
		&:hover
			background-color LightBlue700
			color White
			cursor pointer
		&.active, &.active:hover
			background-color Gray300
			color Gray800
			cursor default
</style>