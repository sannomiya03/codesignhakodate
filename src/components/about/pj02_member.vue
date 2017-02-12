<template lang="pug">
	div
		div(v-if="!isEnglish")
			p 責任者：三木美裕・国立歴史民俗博物館客員教授
			p メンバー
			p 日高薫 国立歴史民俗博物館・教授
			p 澤田和人 立歴史民俗博物館・研究部・准教授
			p 原田泰 公立はこだて未来大学・教授
			p アンドリュー・レントン ウェールズ国立博物館・学芸員
			p レイチェル・バークレイ ダラム大学東洋博物館・学芸員
			p ジェニファー・メルベル スコットランド・ナショナルトラスト財団・学芸部長
		div(v-if="isEnglish")
			p 責任者：三木美裕・国立歴史民俗博物館客員教授
			p メンバー
			p 日高薫 国立歴史民俗博物館・教授
			p 澤田和人 立歴史民俗博物館・研究部・准教授
			p 原田泰 公立はこだて未来大学・教授
			p アンドリュー・レントン ウェールズ国立博物館・学芸員
			p レイチェル・バークレイ ダラム大学東洋博物館・学芸員
			p ジェニファー・メルベル スコットランド・ナショナルトラスト財団・学芸部長
</template>
<script lang="coffee">
	module.exports = 
		computed:
			isEnglish: -> return if this.$route.fullPath.match(/en/) then true else false
</script>