module.exports =
	slug: ""
	path: "pages/pages"
	name: "top"
	children: [
		{
			slug: ":slug"
			path: "pages/pages"
			name: "single"
		}
		# {
		# 	slug: ":postType/page/:pageNo"
		# 	path: "pages/pages"
		# 	name: "archive"
		# }
		# {
		# 	slug: ":postType/:id"
		# 	path: "pages/pages"
		# 	name: "single"
		# }
	]