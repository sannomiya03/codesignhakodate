<template lang="pug">
	article.single-page
		header.page-header
		main.page-content
			header.content-header
				h1.content-title: span 404
			div.content-body
				p We are sorry... NOT FOUND
				p.toHome: router-link(:to="{name: 'top'}") to TOP
</template>
<style lang="stylus">
	@import "~stylus/setting"
	.toHome
		margin-top 3em
	.toHome a
		padding 0.5em 1em
		color Gray500
		border 1px Gray500
		animate()
		&:hover
			color White
			border 1px Gray500
			background-color Gray500
</style>