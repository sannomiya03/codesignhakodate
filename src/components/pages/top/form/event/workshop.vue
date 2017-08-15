<template lang="pug">
	div
		div.description(v-html="content")
		attension(v-show="disabled")
		div.workshopForm(v-show="!disabled")
			div.btns
				div.inputRadio(:class="{disabled: disabled}")
					input(type="radio", v-model="value.content", value="参加する" id="ws1", :disabled="disabled", :checked="value.content==='参加する'")
					label(for="ws1") 参加する
				div.inputRadio(:class="{disabled: disabled}")
					input(type="radio", v-model="value.content", value="参加しない" id="ws2", :disabled="disabled", :checked="value.content==='参加しない'")
					label(for="ws2") 参加しない
			p.submitBtn(v-show="!disabled", :class="{disabled: !validate}" @click="update()") 保存
</template>
<script lang="coffee">
	request = require "superagent"
	CONTENT = require "config/content"
	module.exports =
		props: ["disabled", "login", "user", "edit"]
		components:
			attension: require "./attension"
		data: ->
			content: CONTENT.form.workshop
		computed:
			validate: -> this.edit.events.workshop.content != this.user.events.workshop.content && !this.disabled
			value: -> this.edit.events.workshop
			registerd: -> this.user.events.workshop
			eid: -> return if this.registerd.id is null then "" else this.registerd.id
		methods:
			update: ->
				if !this.validate then return
				this.$emit("startSending")
				self = this
				request
					.post "http://fundesign.jp/jssd2017f/api/regist_ev.cgi"
					.send { evid: this.eid, id: this.user.id, evtype: "workshop", data1: this.value.content, data2: "", data3: "" }
					.type "form"
					.end (err, res) ->
						self.$emit("endSending")
						if err?
							console.log err
						else
							console.log res
							if res.body.evid != "error"
								self.registerd.content = self.value.content
								if self.value.id is null
									self.registerd.id = res.body.evid
									self.value.id = res.body.evid
								if self.value.content is "参加しない" then alert self.user.name+"様\nワークショップへの参加をキャンセルしました。"
								if self.value.content is "参加する" then alert self.user.name+"様\nワークショップの参加を受け付けました。"
</script>
<style lang="stylus" scoped>
	@import "~stylus/setting"
	.workshopForm
		margin-top 30px
	.description
		a
			color Blue800
			&:hover
				color Blue600
	.inputRadio
		label
			padding-left 10px
		&:not(:last-child)
			margin-bottom 10px
		&.disabled
			label
				color Gray400
	.submitBtn
		margin-top 20px
</style>