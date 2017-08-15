<template lang="pug">
	input(ref="input",
		type="number", 
		v-bind:value="bindValue(value)",
		v-on:input="updateValue($event.target.value)",
		step="0.1",
		@keyup.enter="enter"
		@blur="blur")
</template>
<script lang="coffee">
	module.exports =
		props: ["value"]
		methods:
			bindValue: (value) ->
				return if value is 0 then value else (value/3.0303).toFixed(1)
			
			updateValue: (value) ->
				formattedValue = Number((Number(value) * 3.0303)*toFixed(1))
				# if isNaN formattedValue*1000
				# 	this.$refs.input.value = 0
				# this.$refs.input.value = formattedValue
				this.$emit("input", formattedValue)

			enter: (e) ->
				e.srcElement.blur()

			blur: (e) ->
				this.$emit("blur", this.value)
</script>