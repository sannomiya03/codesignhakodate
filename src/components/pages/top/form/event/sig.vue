<template lang="pug">
	div
		div.description(v-html="content")
		attension(v-show="disabled")
		div.sigForm(v-show="!disabled")
			div.inputLine(:class="{disabled: disabled}")
				p.label 部会名
				input.input(type="text" v-model="value.title", :disabled="disabled")
			div.inputLine(:class="{disabled: disabled}")
				p.label 予定参加人数
				input.input(type="text" v-model="value.number", :disabled="disabled")
			div.inputLine(:class="{disabled: disabled}")
				p.label 希望場所
				select.input(v-model="value.location")
					option(disabled value="") 希望場所を選択してください
					option(v-for="select in selecter") {{select}}
			div.inputLine(:class="{disabled: disabled}")
				p.label 要望
				textarea.input(v-model="value.content", :disabled="disabled", rows="10")
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
			content: CONTENT.form.sig
			selecter: [
				"まちセン小会議室A"
				"まちセン小会議室B"
				"デザインベース01 弥生町長屋"
				"デザインベース02 大黒湯"
				"函館大サテライト"
			]
		computed:
			value: -> return this.edit.events.sig
			registerd: -> return this.user.events.sig
			eid: -> return if this.registerd.id is null then "" else this.registerd.id
			validate: ->  !this.disabled && ( this.value.title isnt this.registerd.title or this.value.number isnt this.registerd.number or this.value.content isnt this.registerd.content or this.value.location isnt this.registerd.location ) && this.value.title!="" && this.value.number!="" and this.value.content!="" and this.value.location!=""
		methods:
			update: -> 
				if !this.validate then return
				this.$emit("startSending")
				self = this
				request
					.post "http://fundesign.jp/jssd2017f/api/regist_ev.cgi"
					.send { evid: this.eid,  id: this.user.id, evtype: "sig", data1: this.value.title, data2: this.value.number, data3: this.value.content, wplace: this.value.location }
					.type "form"
					.end (err, res) ->
						self.$emit("endSending")
						if err?
							console.log err
						else
							console.log res
							if res.body.evid != "error"
								self.registerd.title = self.value.title
								self.registerd.number = self.value.number
								self.registerd.location = self.value.location
								self.registerd.content = self.value.content
								if self.value.id is null
									self.registerd.id = res.body.evid
									self.value.id = res.body.evid
								alert self.user.name+"様\n研究部会研究会への参加を受け付けました。"
</script>
<style lang="stylus" scoped>
	@import "~stylus/setting"
	.sigForm
		margin-top 30px
	.description
		a
			color Blue800
			&:hover
				color Blue600
	.disabled
		.label
			color Gray400
	select
		width 300px
</style>