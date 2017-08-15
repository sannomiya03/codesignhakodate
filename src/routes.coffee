architecture = require "config/architecture"

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
		component: require "components/" + architecture.path
		name: architecture.name
	}
	{
		path: "/404"
		component: require "components/pages/404/404"
		name: "404"
	}
]
for page in architecture.children
	setRoute routes, page, "", "components/"+page.path
routes.push {
	path: "*"
	redirect: { name: "404" }
}

module.exports =
	mode: "history"
	routes: routes
	# base: "jssd2017f"