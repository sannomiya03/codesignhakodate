<template lang="pug">
	div
		h2.subSectionTitle 企画概要
		div.events
			div.event
				h3.eventTitle
					span 企画テーマ討論会
					span 「共創・当事者デザイン」
				p.description 「共創・当事者デザイン」について、デザイン研究者、市民活動家、建築家などから話題提供をいただき、参加者のみなさんとともに議論を行います。<br>スカンジナビアのCo-Designの歴史や考え方、日本のまちづくりや企業活動の中での参加型デザインに付いて事例を紹介していただき討論を始めたいと思います。<br>Co-Designや参加型デザインのアプローチは、建築の世界では日常的なアプローチですが、情報環境の進化（ネットワーク、生産革命）の中で新しい意味や役割を持ち始めているのではないでしょうか？ <br>デザインが向き合う相手は、「消費者」でも「ユーザ」でもなく、自律した生活の「当事者」です。
				p.description <strong>話題提供予定者</strong>　安岡美佳（IT University of Copenhagen、Co-Design）、上平崇仁（専修大学）、髙田傑（建築家、函館市）、鈴木辰徳(八百屋すず辰、函館市)　他。<br><strong>司会</strong>　岡本誠(公立はこだて未来大学)

			div.event
				h3.eventTitle
					span 企画テーマセッション
				p.description 企画テーマ「共創・当事者デザイン」に関連した、またはその他の発表を募集します。発表形式はライトニングトーク方式（発表５分、質疑応答５分の発表形式）です。<br>研究成果、実践結果、新しい取り組みの宣言、課題の共有など、どんな切り口でもかまいません。<br>発表の登録時に、テーマや概要を大会websiteに登録してください。<br>学会員だけでなく非会員の方の参加も大歓迎です。<br>発表時間（5分）と質疑（5分）と短いですが、様々な話題を同時に共有することができます。<br>積極的なご参加をお待ちしています。<br>
				p.description <strong>司会</strong>　原田泰（公立はこだて未来大学）
				p.applyBtn(@click="jumpToRegister(0)") 参加申し込み
			
			div.event
				h3.eventTitle
					span 企画テーマワークショップ
					span 「旅するデザイン函館編」
				p.description 「旅するデザイン」とは訪問先の街を味わいその街の未来を自分事化することから始める、未来提案型のデザイン活動です。<br>ワークショップ形式で 観察、表現、省察から地域の価値と可能性を見出す活動を行います。<br>「もし自分が函館に住むことになったら」という仮定から、自身の未来の生活を妄想してみましょう。<br>一般的な観光では味わえない「函館」の魅力を探りながら、自身のデザイン観を問い直してみましょう。
				p.description  <strong>募集人数</strong>　約30名<br><strong>ワークショップファシリテータ</strong>　原田泰(公立はこだて未来大学)
				p.applyBtn(@click="jumpToRegister(1)") 参加申し込み

			div.event
				h3.eventTitle
					span 討論会
					span 「ガクガク連携」（2017年度日本デザイン学会第1支部大会）
				p.description 皆さまの多くは、日頃から地域活性化のための様々な活動を実践されていることと思います。<br>しかしながらこうした活動は、地域の住民や各種専門分野との連携によって具体化されることもお分かりのことと思います。<br>今回の第１支部大会のテーマは「ガクガク連携」とさせていただきました。「ガクガク」は、学部と学部、学問と学問などを指しています。<br>デザイン学が他の専門分野との連携を効果的に進める上での工夫について、話題を共有し、議論の場にできればと思います。
				p.description &nbsp;&nbsp;&nbsp;&nbsp;前半）札幌市立大学のデザインと看護の「ガクガク連携の成功と失敗」<br>&nbsp;&nbsp;&nbsp;&nbsp;後半）前半の話題と会場の意見を基に討論
				p.description <strong>話題提供</strong>　細谷多聞(札幌市立大学 デザイン学部)、スーディ神崎 和代(いわき明星大学 看護学部)、村松真澄(札幌市立大学 看護学部)、柿山浩一郎(札幌市立大学 デザイン学部)

			div.event
				h3.eventTitle
					span 学生プロポジション
				p.description デザインを学ぶ学生の皆さんのために、「学生プロポジション」（ポスターや成果物の展示によるインタラクティブ発表）を行います。本年の学生プロポジションは、10/14（土）13:00-14:40、函館市地域交流町づくりセンターにて実施します。詳細情報は、以下の参加申込のページをご覧ください。
				p.description: a.applyBtn.targetBlank(href="http://jssd.jp/3399" target="_blank")
					img.icon(src="static/images/icon_link.svg")
					span 詳細情報と参加申し込み
				p.note ※応募方法、実施方法などの詳細は平成29年度学生プロポジション募集のページからご確認ください。

			div.event
				h3.eventTitle
					span 研究部会研究会
				p.description 研究部会の研究会の場を提供いたします。希望する研究部会は、大会ホームページを通じてお申し込みください。函館らしい素敵な施設をご用意しますので、部会で自由にお使いください。参加人数や要望を参加申し込みのフォームにご記入ください。
				p.description 候補：弥生町長屋、旧大黒湯、旧商船問屋の建物など
				p.applyBtn(@click="jumpToRegister(2)") 参加申し込み
				

			div.event
				h3.eventTitle
					span レセプション（懇親会）
				p.description レセプション（懇親会）の会場は、老舗西洋洋食店の「五島軒」です。このお店は、明治１２年に創業した由緒ある料理店で、伝統の味を守っています。お得な内容ですので、ぜひご参加ください。
				p.description &nbsp;&nbsp;&nbsp;&nbsp;会員：5,000円<br>&nbsp;&nbsp;&nbsp;&nbsp;学生会員：2,000円<br>&nbsp;&nbsp;&nbsp;&nbsp;非会員：5,000円<br>&nbsp;&nbsp;&nbsp;&nbsp;学生非会員：2,000円

		h2.subSectionTitle 大会日程
		table
			tr
				th.time
				th.date: p 10月13日（金）
				th.date: p 10月14日（土）
				th.date: p 10月15日（日）
			tr.oclock
				th.time 9:00
				td
				td.event.orange
					div.inner(:style="height(12)")
						p.label 企画テーマワークショップ
						h3.eventTitle 旅するデザイン函館編 1日目 
						ul.detail
							li 集合時間　9時
							li 集合場所　函館市地域交流まちづくりセンター
							li &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2階フリースペース
							li 活動時間　09:00 - 12:00

						p.applyBtn(@click="jumpToRegister(1)") 参加申し込み
						p.note ※2日続けての参加が条件となります
						
				td.event.green
					div.inner(:style="height(12)")
						p.label 企画テーマワークショップ
						h3.eventTitle 旅するデザイン函館編 2日目
						ul.detail
							li 集合時間 9時
							li 会場　デザインベース02 旧大黒湯
							li 活動時間　09:00 - 12:00
			tr
				th.time
				td
				td
				td
			tr
				th.time
				td
				td
				td
			tr
				th.time
				td
				td
				td
			tr.oclock
				th.time 10:00
				td
				td
				td
			tr
				th.time
				td
				td
				td
			tr
				th.time
				td
				td
				td
			tr
				th.time
				td
				td
				td
			tr.oclock
				th.time 11:00
				td
				td
				td
			tr
				th.time
				td
				td
				td
			tr
				th.time
				td
				td
				td
			tr
				th.time
				td
				td
				td
			tr.oclock
				th.time 12:00
				td
				td
				td
			tr
				th.time
				td
				td
				td
			tr.oclock
				th.time 13:00
				td.event.purple
					div.inner(:style="height(4)") 
						h3.eventTitle 受付開始
						ul.detail
							li 時間　13:00 〜
							li 会場　函館市地域交流まちづくりセンター2F
				td.event.orange
					div.inner(:style="height(7)")
						h3.eventTitle 学生プロポジション
						ul.detail
							li 出展登録・設営　11:00 - 12:00　 
							li 発表と議論　　　13:00 - 14:40
							li 会場　函館市地域交流まちづくりセンター2F
						a.applyBtn.targetBlank(href="http://jssd.jp/3399" target="_blank")
							img.icon(src="static/images/icon_link.svg")
							span 詳細情報と参加申し込み
						p.note ※応募方法、実施方法などの詳細は平成29年度学生プロポジション募集のページからご確認ください。
				td.event.green
					div.inner(:style="height(8)")
						h3.eventTitle 研究部会研究会
						ul.detail
							li 時間　13:00 - 15:00
							li 会場　函館市地域交流まちづくりセンター2F
							li &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;函館大学サテライト
							li &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;はこだて未来大学デザインベース01
							li &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;はこだて未来大学デザインベース02
							li &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;港の庵、他
						p.applyBtn(@click="jumpToRegister(2)") 参加申し込み
			tr
				th.time
				td
				td
				td
			tr
				th.time
				td
				td
				td
			tr
				th.time
				td
				td
				td
			tr.oclock
				th.time 14:00
				td.event.purple
					div.inner(:style="height(2.6)")
						h3.eventTitle 開会式
						ul.detail
							li 時間　14:00 - 14:30
							li 会場　函館市地域交流まちづくりセンター2F
				td
				td
			tr
				th.time
				td
				td
				td
			tr
				th.time
				td
				td
				td
			tr
				th.time 
				td.event.purple
					div.inner(:style="height(7)")
						p.label.noPadding 企画テーマ討論会
						h3.eventTitle 共創・当事者デザイン
						ul.detail
							li 時間　14:45 - 16:15
							li 会場　函館市地域交流まちづくりセンター2F
							li 話題提供予定者　安岡美佳（IT University of Copenhagen、Co-Design）、上平崇仁（専修大学）、髙田傑（建築家、函館市）、鈴木辰徳(八百屋すず辰、函館市)　他。
							li 司会　岡本誠(公立はこだて未来大学)
				td
				td
			tr.oclock
				th.time 15:00
				td
				td.event.orange
					div.inner(:style="height(12)")
						h3.eventTitle 企画テーマセッション
						ul.detail
							li 時間　15:00 - 18:00
							li 会場　函館市地域交流まちづくりセンター2F
							li 司会　原田泰
						p.applyBtn(@click="jumpToRegister(0)") 参加申し込み
				td.event.green
					div.inner(:style="height(2)")
						h3.eventTitle 閉会式
						ul.detail
							li 時間　15:10 - 15:30
							li 会場　函館市地域交流まちづくりセンター
			tr
				th.time
				td
				td
				td
			tr
				th.time
				td
				td
				td
			tr
				th.time
				td
				td
				td
			tr.oclock
				th.time 16:00
				td
				td
				td
			tr
				th.time
				td
				td
				td
			tr
				th.time
				td.event.purple
					div.inner(:style="height(4)")
						p.label.noPadding 2017年度日本デザイン学会第１支部大会
						h3.eventTitle 討論会「ガクガク連携」
						ul.detail
							li 時間　16:30 - 17:30 
							li 主催　札幌市立大学（日本デザイン学会第１支部支部2017年度幹事校）
							li 会場　函館市地域交流まちづくりセンター2F
							li 話題提供　細谷多聞(札幌市立大学 デザイン学部)、スーディ神崎 和代(いわき明星大学 看護学部)、村松真澄(札幌市立大学 看護学部)、柿山浩一郎(札幌市立大学 デザイン学部)
				td
				td
			tr
				th.time
				td
				td
				td
			tr.oclock
				th.time 17:00
				td
				td
				td
			tr
				th.time
				td
				td
				td
			tr
				th.time
				td
				td
				td
			tr
				th.time
				td
				td
				td
			tr.oclock
				th.time 18:00
				td
				td
				td
			tr
				th
				td
				td
				td
			tr.oclock
				th.time 19:00
				td.event.purple
					div.inner(:style="height(4)")
						h3.eventTitle レセプション（懇親会）
						ul.detail
							li 時間　19:00 - 21:00
							li 会場　五島軒（函館市末広町）
				td
				td
			tr
				th
				td
				td
				td
			tr.oclock
				th.time 20:00
				td
				td
				td
			tr
				th
				td
				td
				td
			tr.oclock
				th.time 21:00
				td
				td
				td
</template>
<script lang="coffee">
	BUS = require "components/pages/top/bus"
	module.exports =
		methods:
			height: (rowNum) -> return { height: rowNum*25-2+"px" }
			jumpToRegister: (index)->
				BUS.selectEvent = index
				elm = $("#register")
				elmTop = $(elm).offset().top
				$('html,body').animate({scrollTop: elmTop-100}, 500, 'swing')
		# data: ->
		# 	rows: [0..4*9]
</script>
<style lang="stylus" scoped>
	@import "~stylus/setting"
	table
		width 100%
		min-width 960px
	tr
		height 25px
	th:not(:first-child), td
		width 300px
		max-width 300px
	th, td
		vertical-align top
	.oclock
		th, td
			border-top 1px solid Gray300
	.date
		padding-bottom 10px
		p
			padding 0 10px
			background-color Gray800
			color White
		&:not(:last-child) p
			border-right 10px solid White
	th.time
		width 30px
		padding-right 10px
		font-size 9pt
		color Gray500
	.event
		position relative
		.inner
			position absolute
			top 0
			left 0
			width 100%
			padding 0 10px
			border-left 5px solid Gray400
			background-color rgba(White, 0.6)			
	.purple .inner
		border-color #B08BBE
	.orange .inner
		border-color #F39801
	.green .inner
		border-color #8FC31F
	.label
		line-height 1em
		padding-top 10px
		padding-bottom 2px
		font-weight bold
		&.noPadding
			padding-top 3px
			padding-bottom 0
	.eventTitle, .eventTitle span
		font-size 16pt
		line-height 1.2em
		padding-top 3px
		padding-bottom 1px
		font-weight bold
	.description
		line-height 1.8em
		padding-top 5px
		padding-bottom 5px
		font-size 10pt
	.detail
		li
			font-size 9pt
			line-height 1.5em
	.applyBtn
		@extend .btn
		animate()
		display block
		max-width 190px
		margin 0.5em 0
		font-size 8pt
		line-height 2.5em
		text-align center
		// background-color Gray700
		// color White
		color Gray900
		border 2px solid Gray900
		&:hover
			background-color Gray900
			color White
		span
			color White
			font-size 8pt
			padding-left 10px
		&.targetBlank
			line-height 2.8em
			border none
			background-color Gray800
			&:hover
				background-color Blue700
				color White
			
	.note
		font-size 9pt
		color Gray600
		line-height 1.5em
	.description strong
		font-weight bold
	.subSectionTitle
		display inline-block
		line-height 1.3em
		padding-left 5px
		margin-bottom 10px
		border-left 5px solid Gray400
		color Gray700
		font-weight bold
		font-size 12pt
	.events
		padding-left 45px
		margin-bottom 40px
	.event
		&:not(:last-child)
			margin-bottom 40px
	.other
		font-weight bold
</style>