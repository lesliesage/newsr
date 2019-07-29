User.destroy_all
Article.destroy_all
SearchTerm.destroy_all
Favorite.destroy_all
Follow.destroy_all
Search.destroy_all

u1 = User.create(first_name: "Bob", last_name: "Brown", username: "bob123", private?: false, password: "123")
u2 = User.create(first_name: "Jane", last_name: "Johnson", username: "jane123", private?: false, password: "asd")
u3 = User.create(first_name: "Sally", last_name: "Smith", username: "sally123", private?: false, password: "asd")
u4 = User.create(first_name: "Walter", last_name: "Williams", username: "walter123", private?: true, password: "123")

a1 = Article.create(title: "California quakes drive emergency supply sales",
                    blurb: "Nothing prompts people to prepare for a natural disaster like a brush with one, a truism reinforced when a pair of earthquakes rattled southern California this month.",
                    url: "https://www.washingtonexaminer.com/news/california-quakes-drive-emergency-supply-sales",
                    img_url: "https://mediadc.brightspotcdn.com/dims4/default/f6d43e8/2147483647/strip/true/crop/2290x1322+0+0/resize/2290x1322!/quality/90/?url=https%3A%2F%2Fmediadc.brightspotcdn.com%2Fba%2F5c%2F121ad75940239459aa3cd92c61c5%2Fbiz2.Earthquake.jpg")
a2 = Article.create(title: "Teacher stipends could attract new talent to underserved schools",
                    blurb: "San Francisco is working to recruit more qualified staff at its public schools and reduce educator turnover with a combination of increased financial incentives and housing.",
                    url: "https://www.sfexaminer.com/the-city/teacher-stipends-could-attract-new-talent-to-underserved-schools/",
                    img_url: "https://2zwmzkbocl625qdrf2qqqfok-wpengine.netdna-ssl.com/wp-content/uploads/2019/06/17200956_web1_190609-sfe-everettms-002.jpg")
a3 = Article.create(title: "NYC unveils $58 million plan to protect cyclists",
                    blurb: "New York City is putting $58.4 million toward an effort to protect its growing population of bicyclists. ",
                    url: "https://www.metro.us/news/local-news/new-york/new-nyc-bike-lanes",
                    img_url: "https://www.metro.us/sites/default/files/styles/normal_article_breakpoints_theme_metrous_desktop_1x/public/main/articles/2019/07/26/nyc-cyclist-deaths-getty_copy.jpg")
a4 = Article.create(title: "Schools deny $22K offer to cover lunch bills, CEO says",
                    blurb: "The president of a Pennsylvania school board allegedly rejected an offer from a company CEO to cover $22,000 worth of school lunch debt racked up by parents who were warned that their kids could end up in foster care.",
                    url: "https://www.metro.us/news/local-news/philadelphia/schools-deny-22k-debt-lunch-bills",
                    img_url: "https://www.metro.us/sites/default/files/styles/normal_article_breakpoints_theme_metrous_desktop_1x/public/main/articles/2019/07/25/school-lunch-cafeteria-istock_copy.jpg")
a5 = Article.create(title: "Daily on Energy: Inslee promises to attack Biden over climate",
                    blurb: "Jay Inslee is vowing to more aggressively take on frontrunner Joe Biden to elevate the issue of climate change in the Democratic presidential debates this week.",
                    url: "https://www.washingtonexaminer.com/policy/energy/daily-on-energy-inslee-promises-to-attack-biden-over-climate",
                    img_url: "https://mediadc.brightspotcdn.com/dims4/default/f6e347c/2147483647/strip/true/crop/1060x600+0+0/resize/1060x600!/quality/90/?url=https%3A%2F%2Fmediadc.brightspotcdn.com%2F32%2F8a%2F2b3f3bb440e7aa2767319be2ea38%2Fdoe-default-1060x600.png")
a6 = Article.create(title: "Daily on Healthcare: GOP nears chance to undo Obamacare — but without a plan to prevent chaos or electoral disaster",
                    blurb: "Republicans are nearing an opportunity to undo Obamacare that could wreak unprecedented disruption on healthcare markets and expose the party to tremendous political risk in the 2020 elections.",
                    url: "https://www.washingtonexaminer.com/policy/healthcare/daily-on-healthcare-gop-nears-chance-to-undo-obamacare-but-without-a-plan-to-prevent-chaos-or-electoral-disaster",
                    img_url: "https://mediadc.brightspotcdn.com/dims4/default/1382337/2147483647/strip/true/crop/1060x600+0+0/resize/1060x600!/quality/90/?url=https%3A%2F%2Fmediadc.brightspotcdn.com%2F7f%2F97%2F308f3ea84be9932852ebfd7cf784%2Fdoh-default-2019-1060x600.png")
a7 = Article.create(title: "'People are dying': how the climate crisis has sparked an exodus to the US",
                    blurb: "After several years of drought, the downpour brought some hope of relief to the subsistence farmers in this part of eastern Guatemala. But as Esteban Gutiérrez, 30, takes a break from his work, he explains why he is still willing to incur crippling debts – and risk his life – to migrate to the United States.",
                    url: "https://www.theguardian.com/global-development/2019/jul/29/guatemala-climate-crisis-migration-drought-famine",
                    img_url: "https://i.guim.co.uk/img/media/165d55c5b0d21705c08ceec0bc45472e8d913147/0_77_3200_1921/master/3200.jpg?width=1900&quality=45&auto=format&fit=max&dpr=2&s=6a8879da75d6089aa8bac42133f7a1b9")
a8 = Article.create(title: "Ex-UN chief Ban Ki-moon says US healthcare system is 'morally wrong'",
                    blurb: "The former United Nations secretary general Ban Ki-moon has denounced the United States’ healthcare system as politically and morally wrong, and urged American leaders to enact publicly financed healthcare as a “human right”.",
                    url: "https://www.theguardian.com/us-news/2018/sep/25/ex-un-chief-ban-kioon-says-us-healthcare-system-is-morally-wrong",
                    img_url: "https://i.guim.co.uk/img/media/52a4272289700c42dd60dd78cca1d8983010179b/0_84_5410_3246/master/5410.jpg?width=620&quality=45&auto=format&fit=max&dpr=2&s=07512ed214739cdff6c0de3830f739d8")

t1 = SearchTerm.create(search_text: "california")
t2 = SearchTerm.create(search_text: "teacher")
t3 = SearchTerm.create(search_text: "school")
t4 = SearchTerm.create(search_text: "nyc")
t5 = SearchTerm.create(search_text: "cyclist")
t6 = SearchTerm.create(search_text: "healthcare")
t7 = SearchTerm.create(search_text: "biden")
t8 = SearchTerm.create(search_text: "climate")

Favorite.create(user_id: u1.id, article_id: a1.id)
Favorite.create(user_id: u1.id, article_id: a2.id)
Favorite.create(user_id: u1.id, article_id: a3.id)
Favorite.create(user_id: u1.id, article_id: a8.id)
Favorite.create(user_id: u2.id, article_id: a1.id)
Favorite.create(user_id: u2.id, article_id: a2.id)
Favorite.create(user_id: u2.id, article_id: a4.id)
Favorite.create(user_id: u2.id, article_id: a5.id)
Favorite.create(user_id: u3.id, article_id: a2.id)
Favorite.create(user_id: u3.id, article_id: a3.id)
Favorite.create(user_id: u3.id, article_id: a5.id)
Favorite.create(user_id: u3.id, article_id: a6.id)
Favorite.create(user_id: u3.id, article_id: a7.id)
Favorite.create(user_id: u4.id, article_id: a6.id)
Favorite.create(user_id: u4.id, article_id: a8.id)

Follow.create(follower_id: u1.id, followee_id: u2.id)
Follow.create(follower_id: u1.id, followee_id: u3.id)
Follow.create(follower_id: u2.id, followee_id: u1.id)
Follow.create(follower_id: u2.id, followee_id: u3.id)
Follow.create(follower_id: u3.id, followee_id: u1.id)
Follow.create(follower_id: u4.id, followee_id: u1.id)
Follow.create(follower_id: u4.id, followee_id: u2.id)
Follow.create(follower_id: u4.id, followee_id: u3.id)

Search.create(original_text: "california stuff", search_term_id: t1.id)
Search.create(original_text: "california quakes", search_term_id: t1.id)
Search.create(original_text: "teacher news", search_term_id: t2.id)
Search.create(original_text: "news about teachers", search_term_id: t2.id)
Search.create(original_text: "school updates", search_term_id: t3.id)
Search.create(original_text: "school shooting", search_term_id: t3.id)
Search.create(original_text: "nyc news", search_term_id: t4.id)
Search.create(original_text: "nyc", search_term_id: t4.id)
Search.create(original_text: "cyclist", search_term_id: t5.id)
Search.create(original_text: "healthcare and me", search_term_id: t6.id)
Search.create(original_text: "healthcare policy", search_term_id: t6.id)
Search.create(original_text: "healthcare in the elections", search_term_id: t6.id)
Search.create(original_text: "do I have healthcare", search_term_id: t6.id)
Search.create(original_text: "biden primary", search_term_id: t7.id)
Search.create(original_text: "biden harris warren", search_term_id: t7.id)
Search.create(original_text: "climate change", search_term_id: t8.id)
Search.create(original_text: "climate hoax", search_term_id: t8.id)
Search.create(original_text: "climate science", search_term_id: t8.id)
