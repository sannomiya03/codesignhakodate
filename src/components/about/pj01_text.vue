<template lang="pug">
	div
		p(v-if="!isEnglish") ウィーンを中心としたシーボルト（子）収集日本関係資料の調査研究では、ウィーン世界博物館（以下ウィーン世界博）が所蔵するハインリッヒ・フォン・シーボルト収集の「もの資料」の悉皆調査をおこない、画像付データベースを公開するとともに、シーボルトの末裔であるブランデンシュタイン＝ツェッペリン家（以下ブランデンシュタイン家）所蔵のシーボルト父子関連文献資料の調査及び目録化、１９世紀日本コレクションの形成にかかわる国際連携展示、国際シンポジウムの開催など、「時代の基準となる資料群」の総合調査に基づく《資源基盤型》の日本文化発信をおこなう。
		p(v-if="isEnglish") Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
</template>
<script lang="coffee">
	module.exports = 
		computed:
			isEnglish: -> return if this.$route.fullPath.match(/en/) then true else false
</script>