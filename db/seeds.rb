# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


#Users
User.destroy_all
  User.create(name:"pine0113",email: "pine0113@gmail.com", password: "12345678", role: "admin")
  User.create(name:"admin",email: "admin@example.com", password: "12345678", role: "admin")
  User.create(name:"user",email: "user@example.com", password: "12345678", role: "user")
  
puts "Default users created!"


Plan.destroy_all

puts "Default Plan created!"

Numberofday.destroy_all
  Numberofday.create( id: 1, name: "一天一夜" )
  Numberofday.create( id: 2, name: "兩天一夜" )
  Numberofday.create( id: 3, name: "兩天兩夜" )
  Numberofday.create( id: 4, name: "三天兩夜" )
  Numberofday.create( id: 5, name: "三天三夜" )
  Numberofday.create( id: 6, name: "四天三夜" )
  Numberofday.create( id: 7, name: "四天四夜" )
  Numberofday.create( id: 8, name: "五天四夜" )
  Numberofday.create( id: 9, name: "五天五夜" )
  Numberofday.create( id: 10, name: "不限" )

puts "Default Numberofday created!"


Cate.destroy_all
  Cate.create( id: 1, name: "郊山" )
  Cate.create( id: 2, name: "中級山")
  Cate.create( id: 3, name: "百岳路線" )
  Cate.create( id: 4, name: "高山湖泊" )

puts "Default Cates created!"

Hiking.destroy_all
  Hiking.create( id: 1, name:"其他路線", title:"其他路線", level: 1, day: 0, miles: 0,  intro:"", cate_id: 3)
  Hiking.create( id: 2, name:"玉山主峰", title:"玉山主峰 兩天一夜", level: 2, day: 2, miles: 22,  intro:"玉山主峰位於台灣的中心位置，海拔3952公尺，為台灣群山之首，百岳排名第一，也是東北亞的最高峰。主峰四周有東、南、西、北峰環繞，外圍還有前峰、小南山、南玉山、東小南山、鹿山與北北峰遙相呼應，宛如眾星拱月般，襯托出主峰的王者之尊，壯偉雄奇的山容、絕佳的展望和絢麗的日出景觀，吸引了無數的中外登山客前來攀登，近年來更成為台灣人一生必須完成的三件事之一。", cate_id: 3)
  Hiking.create( id: 3, name:"嘉明湖", title:"嘉明湖 三天兩夜", level: 2, day: 3, miles: 26,  intro:"嘉明湖國家步道為中央山脈南二段的一部分，步道全程路徑明顯，高山生態景觀豐富多變，穿越台灣鐵杉林、台灣冷杉林、高山深谷、斷崖崩壁、箭竹草原及山頂稜線；而空谷鹿鳴、相連群峰、冬日雪景、皎潔月色和滿天星子是長久以來吸引登山客的美景。步道所經的向陽山和三叉山生態景觀各具特色，向陽山為中央山脈高山寒原生態分布的最南界限，三叉山則以廣闊壯麗的高山草原及如藍寶石般的嘉明湖聞名，而二山春夏季節綻放的鮮麗繁花與冬日雪景，更是不可錯過的美景。", cate_id: 4)
  Hiking.create( id: 4, name:"松蘿湖", title:"松蘿湖 兩天一夜", level: 1, day: 2, miles: 11,  intro:"深藏於崇山峻嶺之中的松蘿湖，雖地處新北市的烏來區，但大多數人都是從宜蘭大同鄉松蘿村的登山口進入。因宜蘭多雨，湖面常有一層薄紗般的雲霧籠罩，讓人無法一窺全貌，如同少女一般嬌羞美麗，故有「十七歲之湖」的別稱。由大水塔空地附近的登山口出發，沿途路徑明顯，途中的水龍頭營地有源源不絕的山泉，是取水和休息的好地方，緩步慢行於終年潮濕泥濘和樹根盤繞的土石山徑，約兩個多小時即登上此行最高的十字越嶺鞍部，左往棲蘭池、右至拳頭姆山，直行約十多分鐘可抵松蘿湖畔", cate_id: 4)
  Hiking.create( id: 5, name:"雪山主東峰", title:"雪山主東峰 三天兩夜", level: 2, day: 3, miles: 22 ,  intro:"雪山主峰與東峰位於台中市和平區與苗栗泰安鄉的交界，由於鄰近中橫公路、開發較早、路徑清楚、指標和山莊等設施完善，因此在攀登雪山主峰的眾多路線之中，這條沿著東支稜上行、里程最短、難度最低的「雪東線」成為熱門的大眾化高山路線。", cate_id: 3)
  Hiking.create( id: 6, name:"水漾森林", title:"水漾森林 兩天一夜", level: 2, day: 2, miles: 20,  intro:"擁有「水漾森林」如此夢幻之名的地方，是許多曾造訪過山友念念不忘的地方。水漾森林是因1999年的921大地震，地牛翻身令嘉義石鼓盤溪上游的河道受阻而形成的堰塞湖，原本生長在此的樹木被湖水包圍住，形成枯木立在湖中的夢幻奇景。不少人將水漾森林形容成「落入凡間的仙境」，隨著國民旅遊風氣日漸興盛，水漾森林已成為最熱門的登山路線之一，山徑沿途景致秀麗，山嵐縹緲，雲海浪湧，氣象萬千，但因往來腳程至少需兩天以上，進出山徑崎嶇難行，一再發生迷途待援事件，建議山友們可先評估自身能力再上山，以免因體力耗盡，而敗壞遊興。", cate_id: 2)
  Hiking.create( id: 7, name:"合歡北峰", title:"合歡北峰 兩天一夜", level: 1, day: 2, miles: 4,  intro:"合歡北峰（又稱北合歡山）位於太魯閣國家公園西界，海拔3422公尺，為合歡山群最高峰，十崇之一，台灣百岳排名第32。

    由小風口附近的登山口沿稜線上行的一公里坡度稍陡，每年五到六月紅毛杜鵑盛開的季節，這裡也是最佳的賞花地點，還有連綿的箭竹草坡有如阿爾卑斯山的草原直達天際。接近山頂的稜線上，豎立了一座巨型的反射板，是合歡北峰最明顯的標誌，之後視野愈來愈開闊，有時可以欣賞到在山谷翻滾的雲海。山頂更是展望絕佳，玉山、雪山、合歡群峰、奇萊和南湖等遠近群山都可盡收眼底，天氣晴朗時很適合在此欣賞日出與日落。", cate_id: 3)
  Hiking.create( id: 8, name:"合歡西峰", title:"合歡群峰 兩天一夜", level: 2, day: 2, miles: 13,  intro:"合歡西峰以遠的要命、一路不停上上下下，回程也好艱辛而馳名。確實，在登山口還不必踏出第一步就已經看到聳立在眼前的陡上坡，這段上坡在抵達反射板附近之後才會稍稍和緩，然後通往合歡北峰。短短2.2公里已經使人迷醉，武陵四秀、南湖中央尖、奇萊主北清晰可見，有時甚至可以看見雲海，美不勝收。", cate_id: 3)



puts "Default Hiking created!"


PlanMemberApply.destroy_all
PlanOwnerInvite.destroy_all
PlanMember.destroy_all