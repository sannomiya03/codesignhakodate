<template lang="pug">
	input(ref="input",
		type="text",
		v-bind:value="value",
		v-on:input="updateValue($event.target.value)",
		@keyup.enter="enter"
		@blur="blur")
</template>
<script lang="coffee">
	module.exports =
		props: ["value"]
		methods:
			updateValue: (value) ->
				this.$emit("input", value)
			enter: (e) ->
				e.srcElement.blur()
				this.$emit("entered", this.value)
			blur: (e) ->
				this.$emit("blur", this.value)
</script>