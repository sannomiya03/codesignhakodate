<template lang="pug">
	nav.secondaryNav
		ul: li(v-for="link in list", :class="{active: isActive(link)}" @click="to(link)") {{link.title}}
</template>
<script lang="coffee">
	ENV = require "config/env"
	FUNCTIONS = require "scripts/common"
	module.exports =
		props: ["list"]
		computed:
			pageName: -> return this.$route.name
			pageID: -> return Number this.$route.params.id
		methods:
			to: (link) ->
				if this.isPagesLink
					this.$router.replace({name: "page", params: {id: link.object_id}})
					this.$emit("pressed", true)
				else
					window.open(link.url).focus()
			isPagesLink: (link) -> link.type is "post_type"
			isCustomLink: (link) -> link.type is "custom"
			isActive: (link) -> this.pageID is link.object_id
</script>
<style lang="stylus" scoped>
	@import "~stylus/setting"
	.secondaryNav
		border-bottom 2px solid Gray200
		ul
			position relative
			bottom -2px
			centering Medium
			display flex
			flex-wrap wrap
		li
			animate()
			@extend .btn
			// margin-right 2em
			padding 10px 20px
			line-height 1.5em
			font-size 13px
			border-bottom 2px solid transparent
			&:hover
				border-color Gray600
			&.active
				border-color Indigo500
</style>