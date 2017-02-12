<template lang="pug">
	div
		p(v-if="!isEnglish") イギリスにおける日本展示活性化事業は、日本資料の展示・活用方法を、現地の学 芸員や教育普及担当者と共に検討し、モデルとなる展示（常設及び企画）を各地で実現 させていく《対話型》の発信スタイルをとる。ウェールズ国立博物館（以下「ウェール ズ国立博」という。）において、日本特別展を共同で開催する（平成２９年開催予定）ほ か、北部イングランドやスコットランドにおいては、ダラム大学東洋博物館、スコットランド国立博物館、ケルビングローブ美術博物館などにおける常設展示の構築に具体的 に関わり、現地スタッフと対話を重ねながら、新しい展示手法、スタッフトレーニング、 教育普及プログラムの開発などの事例を蓄積し、当該地域の日本展示の活性化を目指す。 同時に城や貴族の居館を管理しているナショナルトラストとの協力事業を進める。
		p(v-if="isEnglish") Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
</template>
<script lang="coffee">
	module.exports = 
		computed:
			isEnglish: -> return if this.$route.fullPath.match(/en/) then true else false
</script>