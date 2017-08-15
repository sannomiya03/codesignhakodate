<template lang="pug">
	div.accountInfo
		p.accountFormTitle 登録情報
			span
				span.logout(v-show="!isEditing" @click="logout()") ログアウト
				span.toEdit(v-show="!isEditing" @click="toEdit()") 編集
				span.cancelEdit(v-show="isEditing" @click="cancelEdit()") キャンセル
				span.update(v-show="isEditing", :class="{'disabled': !validateUpdate}" @click="update()") 更新
		div.columns
			div.column
				div.inputLine
					p.label ID
					p.input
						span {{user.id}}
				div.inputLine
					p.label 氏名
					p.input
						span(v-show="!isEditing") {{user.name}}
						input(v-show="isEditing" type="text" v-model="edit.name" placeholder="函館太郎")
				div.inputLine
					p.label 所属
					p.input
						span(v-show="!isEditing") {{user.org}}
						input(v-show="isEditing" type="text" v-model="edit.org" placeholder="JSSD秋季大学")
				div.inputLine
					p.label 種別
					p
						span(v-show="!isEditing") {{user.type}}
						div.inputRadio(v-show="isEditing")
							input(type="radio" v-model="edit.type" value="学会員" id="repT1")
							label(for="repT1") 学会員
						div.inputRadio(v-show="isEditing")
							input(type="radio" v-model="edit.type" value="学生会員" id="repT2")
							label(for="repT2") 学生会員
						div.inputRadio(v-show="isEditing")
							input(type="radio" v-model="edit.type" value="非会員社会人" id="repT3")
							label(for="repT3") 非会員社会人
						div.inputRadio(v-show="isEditing")
							input(type="radio" v-model="edit.type" value="非会員学生" id="repT4")
							label(for="repT4") 非会員学生
			div.column
				div.inputLine
					p.label メールアドレス
					p.input
						span {{user.mail}}
				div.inputLine
					p.label 電話番号
					p.input
						span(v-show="!isEditing") {{user.tell}}
						input(v-show="isEditing" type="text" v-model="edit.tell" placeholder="000-0000-0000")
				div.inputLine
					p.label レセプション
					p
						span(v-show="!isEditing") {{user.reception}}
						div.inputRadio(v-show="isEditing")
							input(type="radio" v-model="edit.reception" value="参加する" id="rep1")
							label(for="rep1") 参加する
						div.inputRadio(v-show="isEditing")
							input(type="radio" v-model="edit.reception" value="参加しない" id="rep2")
							label(for="rep2") 参加しない
				div.inputLine
					p.label 備考
					p.input
						span(v-show="!isEditing") {{user.comment}}
						textarea(v-show="isEditing" v-model="edit.comment" row="4")
</template>
<script lang="coffee">
	request = require "superagent"
	module.exports =
		props: ["user", "edit"]
		data: ->
			isEditing: false
		computed:
			validateUpdate: -> return this.edit.id isnt this.user.id or this.edit.name isnt this.user.name or this.edit.mail isnt this.user.mail or this.edit.org isnt this.user.org or this.edit.type isnt this.user.type or this.edit.tell isnt this.user.tell or this.edit.comment isnt this.user.comment or this.edit.reception isnt this.user.reception
			value: -> this.edit
		methods: 
			logout: ->
				this.$emit("logout")
			toEdit: ->
				this.copyInfo()
				this.isEditing = true
			cancelEdit: ->
				this.isEditing = false
				this.copyInfo()
			copyInfo: ->
				this.edit.id = this.user.id
				this.edit.name = this.user.name
				this.edit.mail = this.user.mail
				this.edit.org = this.user.org
				this.edit.type = this.user.type
				this.edit.tell = this.user.tell
				this.edit.reception = this.user.reception
				this.edit.comment = this.user.comment
			update: ->
				if !this.validateUpdate then return
				this.$emit("startSending")
				self = this
				request
					.post "http://fundesign.jp/jssd2017f/api/regist_id.cgi"
					.send { id: this.value.id, name: this.value.name, mail: this.value.mail, affiliation: this.value.org, tel: this.value.tell, type: this.value.type, reception: this.value.reception, comment: this.value.comment }
					.type "form"
					.end (err, res) ->
						self.$emit("endSending")
						if err?
							console.log err
						else
							console.log res
							if res.body.id != "error" 
								self.isEditing = false
								# self.user.id = res.body.id
								self.user.name = self.value.name
								self.user.mail = self.value.mail
								self.user.tell = self.value.tell
								self.user.org = self.value.org
								self.user.type = self.value.type
								self.user.reception = self.value.reception
								self.user.comment = self.value.comment
								self.$cookie.set('cdch_uid', self.user.id, 7)
								self.$cookie.set('cdch_mail', self.user.mail, 7)
</script>
<style lang="stylus" scoped>
	@import "~stylus/setting"
	.accountInfo
		margin-bottom 40px
		padding 30px 40px
		border 1px solid Gray200
	.accountFormTitle
		font-size 16pt
		line-height 1em
		margin-bottom 20px
		font-weight bold
		flexbox()
		justify-content space-between
		.logout, .toEdit, .cancelEdit, .update
			@extend .btn
			animate()
			display inline-block
			color White
			background-color Gray400
			line-height 1.2em
			padding 10px 20px
			width 100px
			text-align center
			font-size 9pt
			&.logout, &.cancelEdit
				margin-right 10px
			&.logout:hover
				background-color Blue500
			&.toEdit:hover
				background-color Green400
			&.cancelEdit:hover
				background-color Red400
			&.update
				background-color Cyan400
				&:hover
					background-color Cyan200
				&.disabled, &.disabled:hover
					background-color Gray400
	.column:first-child .inputLine .label
		width 50px
	.input.btns
		flexbox()
		justify-content flex-start
	+max-screen(1239)
		.columns
			display block
		.inputLine
			padding-bottom 0
</style>