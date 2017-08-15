ENV = require "config/env"
WP = require "scripts/wordpress"
module.exports =
	back: -> history.back()
	textDecode: (text)-> return text.replace(/\\n/g,"<br>")
	getSimpleBreadObjects: (pageName) ->
		return [
			{ label: "TOP", to: {name: "top"} }
			{ label: pageName, to: null }
		]