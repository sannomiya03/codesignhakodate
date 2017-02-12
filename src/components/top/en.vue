<template lang="pug">
	div
		p Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
		br
		p Lorem ipsum dolor sit amet, consectetur adipiscing elit.
		br
		div.projectLink
			router-link( :to="{name: 'enAboutProject', params:{ project_id: 1, category: 'all' }}" )
				p.subTitle Project 01
				h2.projectTitle Lorem ipsum dolor sit amet, consectetur adipiscing elit, didunt ut labore et dolore magna aliqua.
		br
		div.projectLink
			router-link( :to="{name: 'enAboutProject', params:{ project_id: 2, category: 'all' }}" )
				p.subTitle Project 02
				h2.projectTitle Lorem ipsum dolor sit amet, consectetur adipiscing elit, didunt ut labore et dolore magna aliqua.
		br
		div.projectLink
			router-link( :to="{name: 'enAboutProject', params:{ project_id: 3, category: 'all' }}" )
				p.subTitle Project 03
				h2.projectTitle Lorem ipsum dolor sit amet, consectetur adipiscing elit, didunt ut labore et dolore magna aliqua.
		br
		p Lorem ipsum dolor sit amet, consectetur adipiscing elit.
</template>