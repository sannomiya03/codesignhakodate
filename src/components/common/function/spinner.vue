<template lang="pug">
	div.spinnerContainer
		p.loader
</template>
<style lang="stylus" scoped>
	@import "~stylus/setting"
	.spinnerContainer
		display flex
		justify-content center
		align-items flex-start
		width 50px
		height 50px
	.loader
		position relative
		display inline-block
		// margin 0 12.5% 100px
		width 50px
		height 50px
		border 2px solid LightBlue500
		border-radius 50%
		animation spin 0.75s infinite linear
		border-top-color transparent
	.loader::before, .loader::after
		left -2px
		top -2px
		display none
		position absolute
		content ''
		width inherit
		height inherit
		border inherit
		border-radius inherit
	@keyframes spin
		from
			transform rotate(0deg)
		to
			transform rotate(360deg)
</style>