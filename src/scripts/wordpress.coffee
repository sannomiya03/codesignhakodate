ENV = require "config/env"
request = require "superagent"
module.exports =
	####
	getPostsEndPoint: (postType, postID="") ->
		return ENV.serverURI + ENV.APIURI.posts + postType + "/" + postID

	getMenusEndPoint: (menuID="") ->
		return ENV.serverURI + ENV.APIURI.menus + "/" + menuID
	
	getAuth: (userName) ->
		for user in ENV.users
			if user.name is userName then return user.auth
		return null

	getItem: (postType, postID, filter, callback) ->
		request
			.get this.getPostsEndPoint(postType, postID)
			.query filter
			.end (err, res) ->
				callback(err, res)

	addPost: (userName, postType, id, query, send, callback) ->
		auth = this.getAuth(userName)
		if auth is null then return
		request
			.post this.getPostsEndPoint(postType, id)
			.set {"Authorization": "Basic "+auth}
			.set {"Content-Type": "Application/json"}
			.query query
			.send send
			.end (err, res) ->
				callback(err, res)

	addMedia: (userName, file, callback) ->
		auth = this.getAuth(userName)
		if auth is null then return
		request
			.post this.getPostsEndPoint("media")
			.set {"Authorization": "Basic "+auth}
			.attach "file", file
			.end (err, res) ->
				callback(err, res)

	deletePost: (userName, postType, postID, callback) ->
		auth = this.getAuth(userName)
		if auth is null then return
		request
			.del this.getPostsEndPoint(postType, postID)
			.set {"Authorization": "Basic "+auth}
			.end (err, res) ->
				callback(err, res)

	####
	getPosts: (postType, postID, container, filter="") ->
		container.loading = true
		this.getItem postType, postID, filter, (err, res)->
			container.loading = false
			container.totalPages = []
			if res.header["x-wp-totalpages"]?
				for i in [0...res.header["x-wp-totalpages"]] then container.totalPages.push(i+1)
			container.content = res.body
				

	getPages: (pageID, container, filter="") ->
		container.loading = true
		self = this
		this.getItem "pages", pageID, filter, (err, res)->
			container.content = res.body
			self.getItem "pages", "", "parent=pageID", (err, res)->
				container.loading = true
				container.children = res.body

	loadTaxonomy: (taxonomy, container, page=1) ->
		container.loading = true
		self = this
		this.getItem taxonomy, "", {page: page}, (err, res)->
			if container.content is null then container.content = []
			if err
				console.log err
				return
			for item in res.body then container.content.push item
			totalpage = res.header["x-wp-totalpages"]
			if page is Number(totalpage)
				container.loading = true
			else if Number(totalpage) > 0
				self.loadTaxonomy(taxonomy, container, page+1)

	####
	getTaxonomy: (taxonomySlug) ->
		for taxonomy in ENV.taxonomies
			if taxonomy.slug is taxonomySlug then return taxonomy
		return null

	getTermID: (taxonomySlug, termValue)->
		taxonomy = this.getTaxonomy(taxonomySlug)
		if taxonomy?
			for term in taxonomy.terms
				if term.value is termValue then return term.id
		return null

	toTaxonomyObject: (taxonomySlug, taxonomySrc) ->
		terms = []
		seeds = taxonomySrc.split(",")
		for seed in seeds
			if seed? and seed.trim()!=""
				terms.push {id: null, value: seed.trim()}
		return {
			slug: taxonomySlug.trim()
			terms: terms
		}

	####
	isArchivePage: (pageID) ->
		for archivePage in ENV.archivePages then if archivePage.pageID is pageID then return true
		return false

	getPageContainer: (pageSlug) ->
		for page in ENV.pages then if page.slug is pageSlug then return page
		return { slug: pageSlug, children:[], loading: false, content: null, containers: [] }
	
	getArchiveContainer: -> 
		return { loading: false, content: null, totalPages: [] }
	
	getSingleContainer: -> 
		return { loading: false, content: null }

	getCategoryID: (categorySlug) ->
		for category in ENV.categories then if category.slug is categorySlug then return category.id
		return null

	getCategorySlug: (categoryID) ->
		for category in ENV.categories then if category.id is categoryID then return category.slug
		return null

	getCategoryLabel: (categoryID) ->
		for category in ENV.categories then if category.id is categoryID then return category.label
		return null	

	hasCategory: (post, categoryID)->
		for cat in post.categories then if cat is categoryID then return true
		return false

	getCategoryFillter: (categoryID) ->
		return "categories[]="+categoryID

	getExcludeCategoriesFillter: (activeCategoryID) ->
		return this.getExcludeCategoriesQuery(activeCategoryID, ENV.categories)



	####
	getSecondaryLink: (pageID) ->
		if ENV.primaryNav.content is null then return []
		if !ENV.primaryNav.content.items? then return []
		for link in ENV.primaryNav.content.items
			if !link.children? then continue
			if link.object_id is pageID then return link.children
			for child in link.children
				if child.object_id is pageID then return link.children
		return []

	getPrimaryNavItem: (pageID) ->
		if pageID is null then return null
		if ENV.primaryNav.content is null then return null
		if ENV.primaryNav.content.items is null then return null
		for link in ENV.primaryNav.content.items
			if link.object_id is pageID then return link
			if link.children?
				for child in link.children
					if child.object_id is pageID then return link
		return null
	
	####
	title: (post) -> return post.title.rendered
	date: (post) -> return post.date.split("T")[0].replace(/-/g,".")
	isNew: (post) ->
		date = new Date(post.date)
		today = new Date()
		timeDiff = today.getTime() - date.getTime()
		dateDiff = Math.ceil(timeDiff / (1000 * 3600 * 24))
		return dateDiff <= 3
	
	####
	getExcludeCategoriesQuery: (activeCategoryID, categories) ->
		excludes = []
		for category in categories
			if category.id is activeCategoryID then continue
			excludes.push category.id
		query = ""
		for id, index in excludes
			query += "categories_exclude[]=" + id
			if index < excludes.length - 1 then query += "&"
		return query