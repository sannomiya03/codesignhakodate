setting = require "scripts/site_setting"

setRoute = (routes, page, parentURL) ->
	parentURL += "/"+page.slug
	routes.push {
		path: parentURL
		component: require "components/" + page.path
		name: page.name
	}
	if page.children? then for child in page.children
		setRoute routes, child, parentURL

# -------------------------------------------------

routes = [
	{
		path: "/"
		component: require "components/" + setting.architecture.path
		name: setting.architecture.name
	}
	{
		path: "/404"
		component: require "components/404/404"
		name: "404"
	}
	# {
	# 	path: "*"
	# 	redirect: { name: "404" }
	# }
]
for page in setting.architecture.children
	setRoute routes, page, "", "components/"+page.path

module.exports =
	mode: "history"
	routes: routes

