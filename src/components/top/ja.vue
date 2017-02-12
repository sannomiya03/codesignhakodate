<template lang="pug">
	div
		p 本プロジェクトは、ヨーロッパ各地に現存する１９世紀日本関連資料の調査をおこない、 それらをデータベース公開、展示、シンポジウム、教育プログラム（セミナー・ワークショ ップ・大学教育等）など、多彩な方法により効果的に活用することによって、日本研究や日 本文化理解を促進することを目的とする。以下の３つの異なる地域における異なるレベルの 事業を、現地の博物館・大学などとの学術協力協定のもと、共同で展開することにより、日 本・現地双方へ成果の還元を図るとともに、日本文化発信の国際連携モデルの構築を目指すものである。
		br
		p 以下３つの各事業を総括班のもとで推進する。
		br
		div.projectLink
			router-link( :to="{name: 'aboutProject', params:{ project_id: 1, category: 'all' }}" )
				p.subTitle Project 01 / 資源基盤型
				h2.projectTitle ハインリッヒ・フォン・シーボルト（以下シーボルト〈子〉）収集の「もの資料」及び文献資料の総合調査をもとに、データベース化、展示等の活用事業へと展開させるウィーン を中心としたシーボルト（子）収集日本関係資料の調査研究
		br
		div.projectLink
			router-link( :to="{name: 'aboutProject', params:{ project_id: 2, category: 'all' }}" )
				p.subTitle Project 02 / 対話型
				h2.projectTitle 博物館学芸員や教育普及担当者と共に、現地の実情やニーズに応じた日本展示を各地で実現させるイギリスにおける日本展示活性化事業
		br
		div.projectLink
			router-link( :to="{name: 'aboutProject', params:{ project_id: 3, category: 'all' }}" )
				p.subTitle Project 03 / 人材育成型
				h2.projectTitle 現地大学及び博物館との連携による資料調査と展示協力を通じて、国内外の日本研究者の養成を支援するスイスにおける大学教育連携事業
		br
		p ◎総括　日高 薫（本プロジェクト研究代表者・国立歴史民俗博物館教授）
</template>