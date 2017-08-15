<template lang="pug">
	div
		div(v-html="content")
		a.applyBtn.targetBlank(href="http://jssd.jp/3399" target="_blank" v-show="!disabled")
			img.icon(src="static/images/icon_link.svg")
			span 参加申し込み
</template>
<script lang="coffee">
	CONTENT = require "config/content"
	module.exports =
		props: ["disabled"]
		data: ->
			content: CONTENT.form.proposition
</script>
<style lang="stylus" scoped>
	@import "~stylus/setting"
	.applyBtn
		@extend .btn
		animate()
		display block
		max-width 190px
		font-size 9pt
		line-height 40px
		text-align center
		background-color Blue700
		color White
		&:hover
			background-color Blue500
		span
			color White
			font-size 10pt
			padding-left 10px
</style>