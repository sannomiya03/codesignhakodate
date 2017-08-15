<template lang="pug">
	div.forms
		div.form
			h2.formTitle 大会参加登録
			div.formBody
				div.loaderWrapper(v-show="isSending.account"): spinner
				register.register(v-show="!isSending.account && !isLogin", :isSending="isSending.account", @login="login", :edit="edit", :user="user", @startSending="startSending", @endSending="endSending")
				div(v-show="!isSending.account && isLogin")
					account(:user="user", :edit="edit", @logout="logout", @startSending="startSending", @endSending="endSending")
		div.form
			h2.formTitle 企画参加登録
			div.loaderWrapper(v-show="isSending.event"): spinner
			events.events(v-show="!isSending.event", :user="user", :edit="edit", :isLogin="isLogin", :isSending="isSending.event", @startSending="startEventSending", @endSending="endEventSending")
</template>
<script lang="coffee">
	module.exports =
		components:
			spinner: require "components/common/function/spinner"
			register: require "./register"
			account: require "./account"
			events: require "./events"
		data: ->
			isSending:
				account: false
				event: false
			loginType: null
			user:
				id: null
				name: null
				mail: null
				org: null
				type: null
				tell: null
				reception: null
				comment: null
				events:
					session:
						id: null
						title: ""
						author: ""
						content: ""
					workshop:
						id: null
						content: ""
					sig:
						id: null
						title: ""
						number: ""
						content: ""
						location: ""
			edit:
				id: null
				name: null
				mail: null
				org: null
				type: null
				tell: null
				reception: null
				comment: null
				events:
					session: 
						id: null
						title: ""
						author: ""
						content: ""
					workshop:
						id: null
						content: ""
					sig:
						id: null
						title: ""
						number: ""
						content: ""
						location: ""
		computed:
			isLogin: ->
				this.user.id != null 
		methods:
			login: (user) ->
				this.user = user
				this.copyInfo()
			logout: ->
				this.$cookie.delete('cdch_uid')
				this.$cookie.delete('cdch_mail')
				this.user.id = null
				this.user.name = null
				this.user.mail = null
				this.user.org = null
				this.user.type = null
				this.user.tell = null
				this.user.reception = null
				this.user.comment = null
				this.user.events.session.id = null
				this.user.events.session.title = ""
				this.user.events.session.author = ""
				this.user.events.session.content = ""
				this.user.events.workshop.id = null
				this.user.events.workshop.content = ""
				this.user.events.sig.id = null
				this.user.events.sig.title = ""
				this.user.events.sig.number = ""
				this.user.events.sig.content = ""
				this.user.events.sig.location = ""
				this.copyInfo()
			startSending: -> this.isSending.account = true
			endSending: -> this.isSending.account = false
			startEventSending: -> this.isSending.event = true
			endEventSending: -> this.isSending.event = false
			copyInfo: ->
				this.edit.id = this.user.id
				this.edit.name = this.user.name
				this.edit.mail = this.user.mail
				this.edit.org = this.user.org
				this.edit.type = this.user.type
				this.edit.tell = this.user.tell
				this.edit.reception = this.user.reception
				this.edit.comment = this.user.comment
				this.edit.events.session.id = this.user.events.session.id
				this.edit.events.session.title = this.user.events.session.title
				this.edit.events.session.author = this.user.events.session.author
				this.edit.events.session.content = this.user.events.session.content
				this.edit.events.workshop.id = this.user.events.workshop.id
				this.edit.events.workshop.content = this.user.events.workshop.content
				this.edit.events.sig.id = this.user.events.sig.id
				this.edit.events.sig.title = this.user.events.sig.title
				this.edit.events.sig.number = this.user.events.sig.number
				this.edit.events.sig.content = this.user.events.sig.content
				this.edit.events.sig.location = this.user.events.sig.location			
</script>
<style lang="stylus" scoped>
	@import "~stylus/setting"
	.formTitle
		display inline-block
		line-height 1.3em
		padding-left 5px
		margin-bottom 10px
		border-left 5px solid Gray400
		color Gray700
		font-weight bold
		font-size 12pt
	.register
		width 100%
	.events
		width 100%
	.loaderWrapper
		width 100%
		min-height 500px
		flexbox()
		justify-content center
		align-items center
</style>