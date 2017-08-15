<template lang="pug">
	input(ref="input",
		type="number",
		v-bind:value="bindValue(value)",
		v-on:input="updateValue($event.target.value)",
		@keyup.enter="enter"
		@blur="blur")
</template>
<script lang="coffee">
	module.exports =
		props: ["value", "fixed"]
		methods:
			bindValue: (value) ->
				return if  isNaN(Number(value)) or value is 0 then value else Number(value).toFixed(this.fixed)

			updateValue: (value) ->
				formattedValue = Number(value)
				this.$emit("input", formattedValue)
			
			enter: (e) ->
				e.srcElement.blur()

			blur: (e) ->
				this.$emit("blur", this.value)
</script>