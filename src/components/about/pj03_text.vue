<template lang="pug">
	div
		p(v-if="!isEnglish") スイスにおける大学教育連携事業は、現地大学及び美術館・博物館と協力関係を保ちながら、資料調査と展示協力の過程において、学生及び学芸員の教育やスキルアップ を図るもので、現地において次世代の日本紹介を担うことのできる研究者の養成を手助けする《人材育成型》の事業を計画している。ジュネーヴ市立版画キャビネット（以下 ジュネーヴ版画博）、ジュネーヴ市立アリアナ美術館（以下「アリアナ美術館」という。）、 ルツェルン大学、チューリッヒの個人コレクションなどから提案された調査研究課題に 対し、チューリッヒ大学東アジア美術史学科との協力のもと、諸事業をおこなう。
		p(v-if="isEnglish") Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
</template>
<script lang="coffee">
	module.exports = 
		computed:
			isEnglish: -> return if this.$route.fullPath.match(/en/) then true else false
</script>