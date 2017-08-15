<template lang="pug">
	div.about
		div.columns
			div.readColumn(v-html="content")
</template>
<script lang="coffee">
	module.exports = 
		data: ->
			content: "日本デザイン学会第１支部大会を秋季企画大会と同時に開催します。今年の幹事校は、札幌市立大学です。第１支部大会の企画は、秋季企画大会のプログラムの中に組み込まれています。秋季企画大会の企画内容に関連した内容となっています。第１支部以外のみなさんもぜひご参加ください。"
</script>
<style lang="stylus" scoped>
	@import "~stylus/setting"
	.columns
		justify-content flex-start
		align-items flex-start
	.readColumn
		max-width 400px
		margin-right 50px
		text-align justify
		p:not(:last-child)
			margin-bottom 1em
	.sectionLabel
		line-height 1.5em
		font-weight bold
		color Gray400
	.readHeading, .readSubHeading
		font-weight bold
		line-height 1.2em
	.readHeading
		font-size 18pt
		margin-top 0.3em
		margin-bottom 0.3em
	.readSubHeading
		font-size 17.6pt
		margin-bottom 24px
	+max-screen(1239)
		.columns
			display block
		.readColumn
			max-width 100%
			margin-right 0
			padding-bottom 30px
</style>