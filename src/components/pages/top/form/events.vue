<template lang="pug">
	div.events
		ul.selector
			li(v-for="event, index in events", :class="{active: selectEvent==index}", @click="select(index)") {{event.label}}
		div.formContent#register
			div.event(v-show="selectEvent==0")
				h2.eventTitle 企画テーマセッション
				sessions.formItem(:disabled="!isLogin", :user="user", :edit="edit", @startSending="startSending", @endSending="endSending")
			div.event(v-show="selectEvent==1")
				h2.eventTitle 企画テーマワークショップ「旅するデザイン」 
				workshop.formItem(:disabled="!isLogin", :user="user", :edit="edit", @startSending="startSending", @endSending="endSending")
			div.event(v-show="selectEvent==2")
				h2.eventTitle 研究部会研究会
				sig.formItem(:disabled="!isLogin", :user="user", :edit="edit", @startSending="startSending", @endSending="endSending")
			div.event(v-show="selectEvent==3")
				h2.eventTitle 学生プロポジション
				proposition
</template>
<script lang="coffee">
	module.exports =
		props: ["user", "edit", "isLogin"]
		components:
			sessions: require "./event/sessions"
			workshop: require "./event/workshop"
			sig: require "./event/sig"
			proposition: require "./event/proposition"
		data: ->
			bus: require "components/pages/top/bus"
			events:	[
				{ label: "テーマセッション" }
				{ label: "ワークショップ" }
				{ label: "研究部会" }
				{ label: "学生プロポジション" }
			]
		computed:
			selectEvent: -> this.bus.selectEvent
		methods:
			select: (index) -> this.bus.selectEvent = index
			updateWorkshop: (value) -> this.user.events.workshop = value
			startSending: -> this.$emit("startSending")
			endSending: -> this.$emit("endSending")
</script>
<style lang="stylus" scoped>
	@import "~stylus/setting"
	.selector
		flexbox()
		li
			@extend .btn
			width 25%
			padding 15px 5px
			line-height 1.2em
			background-color Gray200
			color Gray600
			border 1px solid Gray200
			text-align center
			&:hover
				background-color Gray100
			&.active
				background-color transparent
				color Gray800
				border-bottom 1px solid transparent
			&:not(:last-child)
				border-right-color Gray300
	.event
		padding 30px 40px
		border 1px solid Gray200
		border-top-color transparent
	.eventTitle
		font-size 16pt
		line-height 1em
		margin-bottom 20px
		font-weight bold
	+max-screen(1239)
		.event
			padding 20px
</style>