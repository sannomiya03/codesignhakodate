<template lang="pug">
	div.register
		div.sineUpForm
			p.accountFormTitle 新規参加登録
				span.description 参加登録がお済みでない方
			div.formContent
				div.inputLine(:class="{alert: isEmpty.name}")
					p.label 氏名*
					div.input
						input(type="text" v-model="value.name" placeholder="未来太郎", @blur="checkEmpty('name')")
						p.alertMessage(v-show="isEmpty.name") 氏名を入力してください。
				div.inputLine(:class="{alert: isEmpty.org}")
					p.label 所属*
					div.input
						input(type="text" v-model="value.org" placeholder="はこだて未来大学", @blur="checkEmpty('org')")
						p.alertMessage(v-show="isEmpty.org") 所属を入力してください。
				div.inputLine
					p.label 種別*
					div.input.btns
						div.inputRadio
							input(type="radio" v-model="value.type" value="学会員" id="repT1")
							label(for="repT1") 学会員
						div.inputRadio
							input(type="radio" v-model="value.type" value="学生会員" id="repT2")
							label(for="repT2") 学生会員
						div.inputRadio
							input(type="radio" v-model="value.type" value="非会員社会人" id="repT3")
							label(for="repT3") 非会員社会人
						div.inputRadio
							input(type="radio" v-model="value.type" value="非会員学生" id="repT4")
							label(for="repT4") 非会員学生
				div.inputLine(:class="{alert: disabled.mail}")
					p.label メールアドレス* 
					div.input
						input(type="text" v-model="value.mail" placeholder="xxx@fun.ac.jp", @blur="validateMail")
						p.alertMessage(v-show="disabled.mail && isEmpty.mail") メールアドレスを入力してください。
						p.alertMessage(v-show="disabled.mail && mailCheaker.disabled && !isEmpty.mail") 既に登録されているメールアドレスです。
				div.inputLine
					p.label 電話番号
					div.input
						input(type="text" v-model="value.tell" placeholder="000-0000-0000")
				div.inputLine
					p.label レセプション*
					div.input.btns
						div.inputRadio
							input(type="radio" v-model="value.reception" value="参加する" id="rep1")
							label(for="rep1") 参加する
						div.inputRadio
							input(type="radio" v-model="value.reception" value="参加しない" id="rep2")
							label(for="rep2") 参加しない
				div.inputLine
					p.label 備考
					div.input
						textarea(v-model="value.comment" row="4")
				div.inputLine
					p.label
					div.input
						p.submitBtn(:class="{disabled: !validateSignUp}" @click="addUser()") 登録
		div.loginForm
			p.accountFormTitle ログイン
				span.description 既に参加登録がお済みの方
			div.formContent
				div.inputLine
					p.label ID
					div.input
						input(type="text" v-model="login.id" placeholder="000")
						//- p.alertMessage 登録されていないIDです。
				div.inputLine
					p.label メールアドレス
					div.input
						input(type="text" v-model="login.mail" placeholder="xxx@fun.ac.jp")
				div.inputLine
					p.label
					div.input
						p.submitBtn(:class="{disabled: !validateLogin}", @click="logIn()") ログイン
</template>
<script lang="coffee">
	request = require "superagent"
	module.exports =
		props: ["isSending", "edit", "user"]
		data: ->
			login:
				id: null
				mail: null
			mailCheaker:
				sending: false
				sended: false
				disabled: false
			isEmpty:
				name: false
				org: false
				mail: false
				tell: false
		computed:
			value: -> return this.edit
			validateSignUp: -> return this.validateStr(this.value.name) and this.validateStr(this.value.mail) and this.validateStr(this.value.org) and this.validateStr(this.value.type) and this.validateStr(this.value.reception) && !this.mailCheaker.sending and this.mailCheaker.sended and !this.mailCheaker.disabled
			validateLogin: -> return this.validateStr(this.login.id) and this.validateStr(this.login.mail)
			disabled: -> return {
				mail: (!this.mailCheaker.sending and this.mailCheaker.sended and this.mailCheaker.disabled) or this.isEmpty.mail
			}
		methods:
			select: (index) -> this.selectEvent = index
			validateStr: (str) -> return str!=null and str!=""
			checkEmpty: (target) ->
				if target is "name" then this.isEmpty.name = this.value.name is null or this.value.name is ""
				if target is "org" then this.isEmpty.org = this.value.org is null or this.value.org is ""
			validateMail: ->
				if !this.mailCheaker.sending
					if this.value.mail is null or this.value.mail is ""
						this.isEmpty.mail = true
					else
						this.isEmpty.mail = false
						this.mailCheaker.sending = true
						self = this
						request
							.post "http://fundesign.jp/jssd2017f/api/chkmail.cgi"
							.send { mail: self.value.mail }
							.type "form"
							.end (err, res) ->
								if err?
									console.log err
								else
									console.log res
									self.mailCheaker.sending = false
									self.mailCheaker.sended = true
									self.mailCheaker.disabled = res.body.auth is "false"
			addUser: ->
				if !this.validateSignUp then return
				if this.isSending then return
				this.$emit("startSending")
				self = this
				request
					.post "http://fundesign.jp/jssd2017f/api/regist_id.cgi"
					.send { id: "", name: this.value.name, mail: this.value.mail, affiliation: this.value.org, tel: this.value.tell, type: this.value.type, reception: this.value.reception, comment: this.value.comment }
					.type "form"
					.end (err, res) ->
						self.$emit("endSending")
						if err?
							console.log err
						else
							console.log res
							if res.body.id != "error" 
								self.user.id = res.body.id
								self.user.name = self.value.name
								self.user.mail = self.value.mail
								self.user.tell = self.value.tell
								self.user.org = self.value.org
								self.user.type = self.value.type
								self.user.reception = self.value.reception
								self.user.comment = self.value.comment
								self.user.events =
									session: 
										id: null
										title: ""
										author: ""
										content: ""
									workshop:
										id: null
										content: "参加しない"
									sig:
										id: null
										title: ""
										number: ""
										content: ""
								self.$cookie.set('cdch_uid', self.user.id, 7)
								self.$cookie.set('cdch_mail', self.user.mail, 7)
								self.$emit("login", self.user)
								alert self.user.name+"様\n大会参加登録を受け付けました。\n参加受付番号 ：【 "+self.user.id+" 】"
			logIn: ->
				if !this.validateLogin then return
				if this.isSending then return
				this.$emit("startSending")
				self = this
				request
					.post "http://fundesign.jp/jssd2017f/api/auth.cgi"
					.send { id: self.login.id, mail: self.login.mail }
					.type "form"
					.end (err, res) ->
						self.$emit("endSending")
						if err?
							console.log err
						else
							console.log res
							if res.body.id != "error"
								self.user.id = res.body.id
								self.user.name = res.body.name
								self.user.mail = res.body.mail
								self.user.tell = res.body.tel
								self.user.org = res.body.affiliation
								self.user.type = res.body.type
								self.user.reception = res.body.reception
								self.user.comment = res.body.comment
								self.user.events =
									session: 
										id: null
										title: ""
										author: ""
										content: ""
									workshop:
										id: null
										content: "参加しない"
									sig:
										id: null
										title: ""
										number: ""
										content: ""
										location: ""
								for eve in res.body.events
									switch eve.evtype
										when "session"
											self.user.events.session =
												id: eve.evid
												title: eve.data1
												author: eve.data2
												content: eve.data3
										when "workshop"
											self.user.events.workshop =
												id: eve.evid
												content: eve.data1
										when "sig"
											self.user.events.sig = 
												id: eve.evid
												title: eve.data1
												number: eve.data2
												content: eve.data3
												location: eve.location
								self.$cookie.set('cdch_uid', self.user.id, 7)
								self.$cookie.set('cdch_mail', self.user.mail, 7)
								self.$emit("login", self.user)
		mounted: ->
			uid = this.$cookie.get('cdch_uid')
			mail = this.$cookie.get('cdch_mail')
			if uid? and mail?
				this.login.id = uid
				this.login.mail = mail
				this.logIn()
</script>
<style lang="stylus" scoped>
	@import "~stylus/setting"
	.register
		flexbox()
		margin-bottom 40px
		padding 30px 40px
		border 1px solid Gray200
	.sineUpForm
		width 60%
		padding-right 20px
	.loginForm
		width 40%
		padding-left 20px
		border-left 1px solid Gray200
	.accountFormTitle
		font-size 16pt
		line-height 1em
		margin-bottom 20px
		font-weight bold
	.description
		color Gray600
		padding-left 20px
	
	.alertMessage
		position absolute
		bottom -30px
		left 0
		color Red400
		margin-bottom 5px
	.btns
		flexbox()
	+max-screen(1239)
		.register
			display block
			padding 20px
		.sineUpForm, .loginForm
			width 100%
			padding 0
			border none
		.sineUpForm
			padding-bottom 20px
			border-bottom 1px solid Gray200
			margin-bottom 20px
		.btns
			display block
</style>