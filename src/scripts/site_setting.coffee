module.exports =
	siteTitle: "ヨーロッパにおける19世紀日本関連在外資料調査研究・活用"
	domain: "http://localhost:8080"
	endPoint: "http://dev.kuwadate-hakodate.com/rekihaku/wp-json/wp/v2/"
	categories:
		project01: 4
		project02: 5
		project03: 6
		academic: 10
		education: 11
		research: 12
		other: 1
	projectShortTitle:
		project01:
			ja: "Project01 資源基盤型"
			en: "Project01"
		project02:
			ja: "Project02 対話型"
			en: "Project02"
		project03:
			ja: "Project03 人材育成型"
			en: "Project03"
	primaryNav: [
		{ name: "aboutProject", params:{ project_id: 1 }, title: { ja: "プロジェクト01", en: "PROJECT 01" } }
		{ name: "aboutProject", params:{ project_id: 2 }, title: { ja: "プロジェクト02", en: "PROJECT 02" } }
		{ name: "aboutProject", params:{ project_id: 3 }, title: { ja: "プロジェクト03", en: "PROJECT 03" } }
		{ name: "publication", params:{}, title: { ja: "刊行物", en: "PUBLICATION" } }
		{ name: "news", params:{}, title: { ja: "報道記事", en: "NEWS" } }
	]
	categoryNav: [
		{ params: { category: "all" }, title: { ja: "[一覧]", en: "[ALL]"} }
		{ params: { category: "academic" }, title: { ja: "[学術成果]", en: "[ACADEMIC]"} }
		{ params: { category: "education" }, title: { ja: "[教育活動]", en: "[EDUCATION]"} }
		{ params: { category: "research" }, title: { ja: "[研究調査]", en: "[RESERACH]"} }
		{ params: { category: "other" }, title: { ja: "[その他]", en: "[OTHER]"} }
	]
	architecture: 
		slug: ""
		path: "top/top"
		name: "top"
		children: [
			{
				slug: "about"
				path: "about/about"
				name: "about"
				children: [
					{
						slug: ":project_id"
						path: "about/project"
						name: "aboutProject"
						children: []
					}
				]
			}
			{
				slug: "posts/:project_id/:category"
				path: "projects/category"
				name: "category"
				children: [
					{
						slug: ":post_id"
						path: "projects/post"
						name: "post"
						children: []
					}
				]
			}
			{
				slug: "publication"
				path: "publication/publication"
				name: "publication"
				children: [
					{
						slug: ":post_id"
						path: "publication/post"
						name: "publicationPost"
						children: []
					}
				]
			}
			{
				slug: "news"
				path: "news/news"
				name: "news"
				children: []
			}
			{
				slug: "en"
				path: "top/top"
				name: "en_top"
				params: {}
				children: [
					{
						slug: "about"
						path: "about/about"
						name: "en_bout"
						children: [
							{
								slug: ":project_id"
								path: "about/project"
								name: "en_aboutProject"
								children: []
							}
						]
					}
					{
						slug: "posts/:project_id/:category"
						path: "projects/category"
						name: "en_category"
						children: [
							{
								slug: ":post_id"
								path: "projects/post"
								name: "en_post"
								children: []
							}
						]
					}
					{
						slug: "publication"
						path: "publication/publication"
						name: "en_publication"
						children: [
							{
								slug: ":post_id"
								path: "publication/post"
								name: "en_publicationPost"
								children: []
							}
						]
					}
					{
						slug: "news"
						path: "news/news"
						name: "en_news"
						children: []
					}
				]
			}
		]
	getKeyword: (project_id) ->
		switch Number(project_id)
			when 1 then return "資源基盤"
			when 2 then return "対話"
			when 3 then return "人材育成"
	getCategoryName: (category) ->
		switch category
			when "academic" then return "学術成果"
			when "education" then return "教育活動"
			when "research" then return "研究調査"
			when "other" then return "その他"
			when "all" then return ""
			when this.categories.academic then return "academic"
			when this.categories.education then return "education"
			when this.categories.research then return "research"
			when this.categories.other then return "other"
	categoryIDtoLabel: (category_id) ->
		switch category_id
			when this.categories.academic then return { ja: "学術成果", en: "academic" }
			when this.categories.education then return { ja: "教育活動", en: "education" }
			when this.categories.research then return { ja: "研究調査", en: "research" }
			else return { ja: "その他", en: "other" }
	getPageID: (project_id) ->
		switch Number(project_id)
			when 1 then return this.pages.project01
			when 2 then return this.pages.project02
			when 3 then return this.pages.project03
			else return -1
	getProjectNo: (project_id) ->
		switch project_id
			when this.categories.project01 then return 1
			when this.categories.project02 then return 2
			when this.categories.project03 then return 3
	getCategoryID: (category) ->
		switch category
			when "project01" then return this.categories.project01
			when "project02" then return this.categories.project02
			when "project03" then return this.categories.project03
			when "academic" then return this.categories.academic
			when "education" then return this.categories.education
			when "research" then return this.categories.research
			when "other" then return this.categories.other
			when "all" then return 0
			else 0
	getPostProjectID: (post) ->
		if post.categories?
			for category in post.categories
				if category is this.categories.project01 then return category
				if category is this.categories.project02 then return category
				if category is this.categories.project03 then return category
	getPostCategoryID: (post) ->
		if post.categories?
			for category in post.categories
				if category is this.categories.academic then return category
				if category is this.categories.education then return category
				if category is this.categories.research then return category
				if category is this.categories.other then return category
		return this.categories.other
	getExcludeCatsQuery: (category) ->
		if category is "all" then return "";
		exclude = { a: "",  b: "", c: "" }
		switch category
			when "academic"
				exclude.a = this.categories.education
				exclude.b = this.categories.research
				exclude.c = this.categories.other
			when "education"
				exclude.a = this.categories.academic
				exclude.b = this.categories.research
				exclude.c = this.categories.other
			when "research"
				exclude.a = this.categories.academic
				exclude.b = this.categories.education
				exclude.c = this.categories.other
			when "other"
				exclude.a = this.categories.academic
				exclude.b = this.categories.education
				exclude.c = this.categories.research
		return "categories_exclude[]=" + exclude.a + "&categories_exclude[]=" + exclude.b +  "&categories_exclude[]=" + exclude.c