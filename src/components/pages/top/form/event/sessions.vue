<template lang="pug">
	div
		div.description(v-html="content")
		attension(v-show="disabled")
		div.sessionForm(v-show="!disabled")
			div.inputLine(:class="{disabled: disabled}")
				p.label 発表タイトル
				div.input
					input(type="text" v-model="value.title", :disabled="disabled")
			div.inputLine(:class="{disabled: disabled}")
				p.label 著者名
				div.input
					input(type="text" v-model="value.author", :disabled="disabled")
			div.inputLine(:class="{disabled: disabled}")
				p.label 本文（300字程度）
				div.input
					textarea(v-model="value.content", :disabled="disabled" rows="10")
			div.inputLine(v-show="!disabled")
				p.label
				p.submitBtn(:class="{disabled: !validate}" @click="update()") 保存
</template>
<script lang="coffee">
	request = require "superagent"
	CONTENT = require "config/content"
	module.exports =
		props: ["disabled", "user", "edit"]
		components:
			attension: require "./attension"
		data: ->
			content: CONTENT.form.session
		computed:
			value: -> this.edit.events.session
			registerd: -> this.user.events.session
			eid: -> return if this.registerd.id is null then "" else this.registerd.id
			validate: ->  !this.disabled && ( this.value.title isnt this.registerd.title or this.value.author isnt this.registerd.author or this.value.content isnt this.registerd.content ) && this.value.title!="" && this.value.author!="" and this.value.content
		methods:
			update: -> 
				if !this.validate then return
				this.$emit("startSending")
				self = this
				request
					.post "http://fundesign.jp/jssd2017f/api/regist_ev.cgi"
					.send { evid: this.eid, id: this.user.id, evtype: "session", data1: this.value.title, data2: this.value.author, data3: this.value.content }
					.type "form"
					.end (err, res) ->
						self.$emit("endSending")
						if err?
							console.log err
						else
							console.log res
							if res.body.evid != "error"
								self.registerd.title = self.value.title
								self.registerd.author = self.value.author
								self.registerd.content = self.value.content
								if self.value.id is null
									self.registerd.id = res.body.evid
									self.value.id = res.body.evid
								alert self.user.name+"様\n企画テーマセッションへの参加を受け付けました。"
</script>
<style lang="stylus" scoped>
	@import "~stylus/setting"
	.sessionForm
		margin-top 30px
	.disabled
		.label
			color Gray400
	.inputLine .label
		min-width 150px
</style>