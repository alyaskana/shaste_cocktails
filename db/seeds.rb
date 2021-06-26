Cocktail.destroy_all
User.destroy_all

puts "Destroyed everything you touch"

coffee_liquor = Ingredient.find_or_create_by!({name: 'кофейный ликер'})
irish_cream = Ingredient.find_or_create_by!({name: 'айриш крим'})
gin = Ingredient.find_or_create_by!({name: 'джин'})
rum = Ingredient.find_or_create_by!({name: 'ром'})
tripple_sek = Ingredient.find_or_create_by!({name: 'трипл сек'})
ice = Ingredient.find_or_create_by!({name: 'лед'})
tonik = Ingredient.find_or_create_by!({name: 'тоник'})
lime = Ingredient.find_or_create_by!({name: 'лайм'})
sugar_syrup = Ingredient.find_or_create_by!({name: 'сахарный сироп'})
vodka = Ingredient.find_or_create_by!({name: 'водка'})
tomato_juice = Ingredient.find_or_create_by!({name: 'томатный сок'})
tobasco = Ingredient.find_or_create_by!({name: 'тобаско соус'})
salt = Ingredient.find_or_create_by!({name: 'соль'})
lemon_juice = Ingredient.find_or_create_by!({name: 'лимонный сок'})
cranberry_jelly = Ingredient.find_or_create_by!({name: 'клюквенный кисель'})
melon_liquor = Ingredient.find_or_create_by!({name: 'дынный ликер'})
red_sweet_vermut = Ingredient.find_or_create_by!({name: 'красный сладкий вермут'})
orange_bitter = Ingredient.find_or_create_by!({name: 'апельсиновый биттер'})
shartrez = Ingredient.find_or_create_by!({name: 'шартрёз'})
pure_lichi = Ingredient.find_or_create_by!({name: 'пюре личи'})
brendy = Ingredient.find_or_create_by!({name: 'бренди'})
absent = Ingredient.find_or_create_by!({name: 'абсент'})
muscat_nut = Ingredient.find_or_create_by!({name: 'мускатный орех'})
egg = Ingredient.find_or_create_by!({name: 'яйцо'})
milk = Ingredient.find_or_create_by!({name: 'молоко'})
cookies = Ingredient.find_or_create_by!({name: 'овсяное печенье'})

sweet = Tag.find_or_create_by!({name: 'сладкий', tag_type: 'taste'})
sour = Tag.find_or_create_by!({name: 'кислый', tag_type: 'taste'})
sweet_sour = Tag.find_or_create_by!({name: 'кисло-сладкий', tag_type: 'taste'})
bitter = Tag.find_or_create_by!({name: 'горький', tag_type: 'taste'})
salty = Tag.find_or_create_by!({name: 'соленый', tag_type: 'taste'})
to_sit_well = Tag.find_or_create_by!({name: 'хорошо посидеть', tag_type: 'goal'})
to_relax = Tag.find_or_create_by!({name: 'расслабиться', tag_type: 'goal'})
to_party = Tag.find_or_create_by!({name: 'вечеринка с друзьями', tag_type: 'goal'})
to_die = Tag.find_or_create_by!({name: 'набухаться в хлам', tag_type: 'goal'})

alina = User.create!({
  email: "ialina240200@gmail.com",
  login: "alyaskana",
  user_name: "Алина",
  description: 'Развлекательное шоу Ирины Чесноковой на YouTube. В гостях звезды российского шоу-бизнеса с ЧЮ, актуальные темы и живая музыка.',
  link: 'vk.com/alyaskana',
  password: 'qwerty',
  avatar: File.open(File.join(Rails.root, "/app/assets/images/avatars/avatar_1.jpeg")),
  ingredients: [tonik, salt, tripple_sek, irish_cream, coffee_liquor, ice]
})

amgalan = User.create!({
  email: "amgalan@gmail.com",
  login: "amgalan",
  user_name: "Амгалан",
  description: 'Развлекательное шоу Ирины Чесноковой на YouTube. В гостях звезды российского шоу-бизнеса с ЧЮ, актуальные темы и живая музыка.',
  link: 'vk.com/alan_amg',
  password: 'qwerty',
  avatar: File.open(File.join(Rails.root, "/app/assets/images/avatars/avatar_2.jpeg")),
  ingredients: [tonik, salt, tripple_sek, irish_cream, coffee_liquor, ice]
})

krawleek = User.create!({
  email: "krawleek@gmail.com",
  login: "krawleek",
  user_name: "Елена",
  description: 'Развлекательное шоу Ирины Чесноковой на YouTube. В гостях звезды российского шоу-бизнеса с ЧЮ, актуальные темы и живая музыка.',
  link: 'vk.com/krawleek',
  password: 'qwerty',
  avatar: File.open(File.join(Rails.root, "/app/assets/images/avatars/avatar_3.jpeg")),
  ingredients: [tonik, salt, tripple_sek, irish_cream, coffee_liquor, ice]
})

# def build_ci(ingredient, amount)
#   CocktailsIngredient.new((ingredient: ingredient, amount: amount))
# end

cocktails = [
  {
    user_id: alina.id,
    title: "Джин персиковый чай",
    cocktails_ingredients: [
      CocktailsIngredient.new({ingredient: gin, amount: '40 мл'}), 
      CocktailsIngredient.new({ingredient: lemon_juice, amount: '30 мл'}),
      CocktailsIngredient.new({ingredient: sugar_syrup, amount: '20 мл'}),
      CocktailsIngredient.new({ingredient: ice, amount: ''}),
    ],
    tags: [sweet, to_relax, to_sit_well],
    image: File.open(File.join(Rails.root, "/app/assets/images/cocktails/cocktail_16.png")),
    description: "Это очень крепкий лонг на пяти видах алкоголя. Кроме водки, джина, рома, текилы и цитрусового ликёра, туда добавляют колу и лимонный сок, так что на вкус он получается сладковато-кислым.",
    directions: [
      "Налей в шейкер сок манго 15 мл, кофейный ликер 15 мл и лимончелло 15 мл",
      "Наполни шейкер кубиками льда и взбей",
      "Перелей через стрейнер в стопку",
      "Укрась лимонной цедрой"
    ],
    youtube: 'pN13U2boC-Y'
  },
  {
    user_id: alina.id,
    title: "Lemon Drop",
    cocktails_ingredients: [
      CocktailsIngredient.new({ingredient: vodka, amount: '60 мл'}), 
      CocktailsIngredient.new({ingredient: tripple_sek, amount: '15 мл'}),
      CocktailsIngredient.new({ingredient: lemon_juice, amount: '30 мл'}),
      CocktailsIngredient.new({ingredient: sugar_syrup, amount: '30 мл'}),
      CocktailsIngredient.new({ingredient: ice, amount: ''}),
    ],
    tags: [bitter, sour, to_die],
    image: File.open(File.join(Rails.root, "/app/assets/images/cocktails/cocktail_11.png")),
    description: "Lemon Drop (или Lemon Drop Martini) впервые появился в Сан-Франциско где-то в 1970-х годах. Его изобретателем считается Норман Джей Хобдей, безработный ветеран Вьетнама. Этот приятный кисло-сладкий коктейль состоит из водки, ликёра Трипл сек, лимонного сока и сахарного сиропа. ",
    directions: [
    "Шейкуем все ингредиенты со льдом.",
    "Отцеживаем, с помощью стрейнера и барного сита в охлаждённую коктейльную рюмку.",
    "Украшаем, по желанию, либо сахарной каёмкой, либо цедрой лимона.",
    youtube: 'pN13U2boC-Y'
    ]
  },
  {
    user_id: alina.id,
    title: "Pink Cosmo",
    cocktails_ingredients: [
      CocktailsIngredient.new({ingredient: vodka, amount: '60 мл'}), 
      CocktailsIngredient.new({ingredient: tripple_sek, amount: '25 мл'}),
      CocktailsIngredient.new({ingredient: lemon_juice, amount: '20 мл'}),
      CocktailsIngredient.new({ingredient: cranberry_jelly, amount: '30 мл'}),
    ],
    tags: [bitter, sweet_sour, to_sit_well],
    image: File.open(File.join(Rails.root, "/app/assets/images/cocktails/cocktail_14.png")),
    description: "Авторский коктейль Романа Табакова PINK COSMO — немного изменённый Космополитен с обычной водкой вместо цитрусовой и с клюквенным киселём вместо сока.",
    directions: [
    "Все ингредиенты взбить со льдом в шейкере.",
    "Отцедить с помощью стрейнера и барного сита в охлаждённую коктейльную рюмку.",
    ],
    youtube: 'pN13U2boC-Y'
  },
  {
    user_id: alina.id,
    title: "Японские тапки",
    cocktails_ingredients: [
      CocktailsIngredient.new({ingredient: tripple_sek, amount: '25 мл'}),
      CocktailsIngredient.new({ingredient: lemon_juice, amount: '20 мл'}),
      CocktailsIngredient.new({ingredient: melon_liquor, amount: '30 мл'}),
    ],
    tags: [bitter, sweet_sour, to_sit_well],
    image: File.open(File.join(Rails.root, "/app/assets/images/cocktails/cocktail_13.png")),
    description: "Простой кисло-сладкий коктейль, известный также под именами Японский шлёпок, Японская туфелька и Японские башмачки. В коктейль входят: Трипл сек (или Куантро), дынный ликёр (или Мидори) и лимонный сок.",
    directions: [
    "Охлаждаем коктейльную рюмку и шейкер.",
    "Наливаем в смесительный стакан Трипл сек, дынный ликёр и лимонный фреш.",
    'Тщательно взбиваем в шейкере.',
    'Освобождаем коктейльную рюмку от льда.',
    'С помощью стрейнера и барного ситечка, отцеживаем полученный коктейль в коктейльную рюмку.',
    'Не украшаем (но если если хорошая мараскиновая вишня, можно добавить её.'
    ],
    youtube: 'L4ERVvAa8Ak'
  },
  {
    user_id: amgalan.id,
    title: "Бижу",
    cocktails_ingredients: [
      CocktailsIngredient.new({ingredient: gin, amount: '40 мл'}), 
      CocktailsIngredient.new({ingredient: red_sweet_vermut, amount: '30 мл'}),
      CocktailsIngredient.new({ingredient: orange_bitter, amount: '20 мл'}),
      CocktailsIngredient.new({ingredient: shartrez, amount: '1-2 капли'}),
    ],
    tags: [sweet, to_relax, to_sit_well],
    image: File.open(File.join(Rails.root, "/app/assets/images/cocktails/cocktail_12.png")),
    description: "Это очень крепкий лонг на пяти видах алкоголя. Кроме водки, джина, рома, текилы и цитрусового ликёра, туда добавляют колу и лимонный сок, так что на вкус он получается сладковато-кислым.",
    directions: [
      "Налей в шейкер сок манго 15 мл, кофейный ликер 15 мл и лимончелло 15 мл",
      "Наполни шейкер кубиками льда и взбей",
      "Перелей через стрейнер в стопку",
      "Укрась лимонной цедрой"
    ],
    youtube: 'pN13U2boC-Y'
  },
  {
    user_id: amgalan.id,
    title: "Аляска",
    cocktails_ingredients: [
      CocktailsIngredient.new({ingredient: gin, amount: '40 мл'}), 
      CocktailsIngredient.new({ingredient: orange_bitter, amount: '20 мл'}),
      CocktailsIngredient.new({ingredient: shartrez, amount: '100 мл'}),
    ],
    tags: [bitter, sour, to_die],
    image: File.open(File.join(Rails.root, "/app/assets/images/cocktails/cocktail_9.png")),
    description: "Lemon Drop (или Lemon Drop Martini) впервые появился в Сан-Франциско где-то в 1970-х годах. Его изобретателем считается Норман Джей Хобдей, безработный ветеран Вьетнама. Этот приятный кисло-сладкий коктейль состоит из водки, ликёра Трипл сек, лимонного сока и сахарного сиропа. ",
    directions: [
    "Шейкуем все ингредиенты со льдом.",
    "Отцеживаем, с помощью стрейнера и барного сита в охлаждённую коктейльную рюмку.",
    "Украшаем, по желанию, либо сахарной каёмкой, либо цедрой лимона.",
    youtube: 'pN13U2boC-Y'
    ]
  },
  {
    user_id: amgalan.id,
    title: "Личи Мартини",
    cocktails_ingredients: [
      CocktailsIngredient.new({ingredient: vodka, amount: '60 мл'}), 
      CocktailsIngredient.new({ingredient: pure_lichi, amount: '25 мл'}),
      CocktailsIngredient.new({ingredient: lemon_juice, amount: '20 мл'}),
      CocktailsIngredient.new({ingredient: sugar_syrup, amount: '30 мл'}),
    ],
    tags: [bitter, sweet_sour, to_sit_well],
    image: File.open(File.join(Rails.root, "/app/assets/images/cocktails/cocktail_7.png")),
    description: "Сладкий клубный коктейль из 80-90-х из водки, лимона и пюре консервированного личи. Он же — крепкий сухой коктейль с джином, саке и сиропа личи, который подавали в баре Антикварный Boutique & Bar. ",
    directions: [
    "Все ингредиенты взбить со льдом в шейкере.",
    "Отцедить с помощью стрейнера и барного сита в охлаждённую коктейльную рюмку.",
    ],
    youtube: 'pN13U2boC-Y'
  },
  {
    user_id: amgalan.id,
    title: "Абсент Бренди Флип",
    cocktails_ingredients: [
      CocktailsIngredient.new({ingredient: brendy, amount: '60 мл'}),
      CocktailsIngredient.new({ingredient: absent, amount: '20 мл'}),
      CocktailsIngredient.new({ingredient: muscat_nut, amount: 'для украшения'}),
    ],
    tags: [bitter, sweet_sour, to_sit_well],
    image: File.open(File.join(Rails.root, "/app/assets/images/cocktails/cocktail_8.png")),
    description: "Простой кисло-сладкий коктейль, известный также под именами Японский шлёпок, Японская туфелька и Японские башмачки. В коктейль входят: Трипл сек (или Куантро), дынный ликёр (или Мидори) и лимонный сок.",
    directions: [
    "Охлаждаем коктейльную рюмку и шейкер.",
    "Наливаем в смесительный стакан Трипл сек, дынный ликёр и лимонный фреш.",
    'Тщательно взбиваем в шейкере.',
    'Освобождаем коктейльную рюмку от льда.',
    'С помощью стрейнера и барного ситечка, отцеживаем полученный коктейль в коктейльную рюмку.',
    'Не украшаем (но если если хорошая мараскиновая вишня, можно добавить её.'
    ],
    youtube: 'L4ERVvAa8Ak'
  },
  {
    user_id: krawleek.id,
    title: "Эгг-ног",
    cocktails_ingredients: [
      CocktailsIngredient.new({ingredient: gin, amount: '40 мл'}), 
      CocktailsIngredient.new({ingredient: egg, amount: '1 шт'}),
      CocktailsIngredient.new({ingredient: brendy, amount: '20 мл'}),
      CocktailsIngredient.new({ingredient: rum, amount: '10 мл'}),
      CocktailsIngredient.new({ingredient: milk, amount: '100 мл'}),
      CocktailsIngredient.new({ingredient: muscat_nut, amount: 'для украшения'}),
    ],
    tags: [sweet, to_relax, to_sit_well],
    image: File.open(File.join(Rails.root, "/app/assets/images/cocktails/cocktail_9.png")),
    description: "Это очень крепкий лонг на пяти видах алкоголя. Кроме водки, джина, рома, текилы и цитрусового ликёра, туда добавляют колу и лимонный сок, так что на вкус он получается сладковато-кислым.",
    directions: [
      "Налей в шейкер сок манго 15 мл, кофейный ликер 15 мл и лимончелло 15 мл",
      "Наполни шейкер кубиками льда и взбей",
      "Перелей через стрейнер в стопку",
      "Укрась лимонной цедрой"
    ],
    youtube: 'pN13U2boC-Y'
  },
  {
    user_id: krawleek.id,
    title: "Глинтвейн",
    cocktails_ingredients: [
      CocktailsIngredient.new({ingredient: gin, amount: '40 мл'}), 
      CocktailsIngredient.new({ingredient: tripple_sek, amount: '40 мл'}), 
      CocktailsIngredient.new({ingredient: cranberry_jelly, amount: '40 мл'}), 
      CocktailsIngredient.new({ingredient: orange_bitter, amount: '20 мл'}),
      CocktailsIngredient.new({ingredient: shartrez, amount: '100 мл'}),
      CocktailsIngredient.new({ingredient: lime, amount: ''}),
    ],
    tags: [bitter, sour, to_die],
    image: File.open(File.join(Rails.root, "/app/assets/images/cocktails/cocktail_10.png")),
    description: "Lemon Drop (или Lemon Drop Martini) впервые появился в Сан-Франциско где-то в 1970-х годах. Его изобретателем считается Норман Джей Хобдей, безработный ветеран Вьетнама. Этот приятный кисло-сладкий коктейль состоит из водки, ликёра Трипл сек, лимонного сока и сахарного сиропа. ",
    directions: [
    "Шейкуем все ингредиенты со льдом.",
    "Отцеживаем, с помощью стрейнера и барного сита в охлаждённую коктейльную рюмку.",
    "Украшаем, по желанию, либо сахарной каёмкой, либо цедрой лимона.",
    youtube: 'pN13U2boC-Y'
    ]
  },
  {
    user_id: krawleek.id,
    title: "Молочный пунш «Леон»",
    cocktails_ingredients: [
      CocktailsIngredient.new({ingredient: rum, amount: '60 мл'}), 
      CocktailsIngredient.new({ingredient: cookies, amount: '1 шт'}),
      CocktailsIngredient.new({ingredient: lemon_juice, amount: '20 мл'}),
      CocktailsIngredient.new({ingredient: milk, amount: '30 мл'}),
    ],
    tags: [bitter, sweet_sour, to_sit_well],
    image: File.open(File.join(Rails.root, "/app/assets/images/cocktails/cocktail_11.png")),
    description: "Коктейль «Леон» — молочный пунш с ромом, овсяным печеньем, солёной карамелью и лимоном, который придумал для конкурса Медиа Бармен Кирилл Становнов из Екатеринбурга",
    directions: [
    "Все ингредиенты взбить со льдом в шейкере.",
    "Отцедить с помощью стрейнера и барного сита в охлаждённую коктейльную рюмку.",
    ],
    youtube: 'pN13U2boC-Y'
  },
  {
    user_id: krawleek.id,
    title: "Tom & Jerry",
    cocktails_ingredients: [
      CocktailsIngredient.new({ingredient: egg, amount: '60 мл'}),
      CocktailsIngredient.new({ingredient: rum, amount: '20 мл'}),
      CocktailsIngredient.new({ingredient: sugar_syrup, amount: '20 мл'}),
      CocktailsIngredient.new({ingredient: muscat_nut, amount: 'для украшения'}),
    ],
    tags: [bitter, sweet_sour, to_sit_well],
    image: File.open(File.join(Rails.root, "/app/assets/images/cocktails/cocktail_12.png")),
    description: "Простой кисло-сладкий коктейль, известный также под именами Японский шлёпок, Японская туфелька и Японские башмачки. В коктейль входят: Трипл сек (или Куантро), дынный ликёр (или Мидори) и лимонный сок.",
    directions: [
    "Охлаждаем коктейльную рюмку и шейкер.",
    "Наливаем в смесительный стакан Трипл сек, дынный ликёр и лимонный фреш.",
    'Тщательно взбиваем в шейкере.',
    'Освобождаем коктейльную рюмку от льда.',
    'С помощью стрейнера и барного ситечка, отцеживаем полученный коктейль в коктейльную рюмку.',
    'Не украшаем (но если если хорошая мараскиновая вишня, можно добавить её.'
    ],
    youtube: 'L4ERVvAa8Ak'
  },
  {
    user_id: alina.id,
    title: "Кэнди шот",
    cocktails_ingredients: [
      CocktailsIngredient.new({ingredient: egg, amount: '60 мл'}),
      CocktailsIngredient.new({ingredient: irish_cream, amount: '20 мл'}),
      CocktailsIngredient.new({ingredient: tonik, amount: '20 мл'}),
      CocktailsIngredient.new({ingredient: tobasco, amount: '20 мл'}),
      CocktailsIngredient.new({ingredient: coffee_liquor, amount: '20 мл'}),
      CocktailsIngredient.new({ingredient: lime, amount: 'для украшения'}),
    ],
    tags: [sweet, sweet_sour, to_party],
    image: File.open(File.join(Rails.root, "/app/assets/images/cocktails/cocktail_13.png")),
    description: "Это очень крепкий лонг на пяти видах алкоголя. Кроме водки, джина, рома, текилы и цитрусового ликёра, туда добавляют колу и лимонный сок, так что на вкус он получается сладковато-кислым.",
    directions: ["Налей в шейкер сок манго 15 мл, кофейный ликер 15 мл и лимончелло 15 мл",
    "Наполни шейкер кубиками льда и взбей",
    "Перелей через стрейнер в стопку",
    "Укрась лимонной цедрой"]
  },
  {
    user_id: alina.id,
    title: "Лонг айленд айс ти",
    cocktails_ingredients: [
      CocktailsIngredient.new({ingredient: vodka, amount: '60 мл'}),
      CocktailsIngredient.new({ingredient: tonik, amount: '20 мл'}),
      CocktailsIngredient.new({ingredient: tripple_sek, amount: '20 мл'}),
      CocktailsIngredient.new({ingredient: coffee_liquor, amount: '20 мл'}),
      CocktailsIngredient.new({ingredient: salt, amount: ''}),
      CocktailsIngredient.new({ingredient: ice, amount: ''}),
    ],
    tags: [sweet, sweet_sour, to_sit_well, to_relax, salty],
    image: File.open(File.join(Rails.root, "/app/assets/images/cocktails/cocktail_14.png")),
    description: "Это очень крепкий лонг на пяти видах алкоголя. Кроме водки, джина, рома, текилы и цитрусового ликёра, туда добавляют колу и лимонный сок, так что на вкус он получается сладковато-кислым.",
    directions: ["Наполни хайбол кубиками льда доверху",
    "Налей в шейкер лимонный сок 10 мл, томатный сок 120 мл и водку 50 мл",
    "Добавь табаско соус красный 3 дэш и ворчестер соус 3 дэш",
    "Долей колу доверху и аккуратно размешай коктейльной ложкой"]
  },
  {
    user_id: alina.id,
    title: "Кровавая Мэри",
    cocktails_ingredients: [
      CocktailsIngredient.new({ingredient: vodka, amount: '60 мл'}),
      CocktailsIngredient.new({ingredient: tomato_juice, amount: '20 мл'}),
      CocktailsIngredient.new({ingredient: lemon_juice, amount: '20 мл'}),
      CocktailsIngredient.new({ingredient: tonik, amount: '20 мл'}),
      CocktailsIngredient.new({ingredient: gin, amount: '20 мл'}),
      CocktailsIngredient.new({ingredient: salt, amount: ''}),
      CocktailsIngredient.new({ingredient: ice, amount: ''}),
    ],
    tags: [bitter, sour, to_relax, to_party],
    image: File.open(File.join(Rails.root, "/app/assets/images/cocktails/cocktail_15.png")),
    description: "Это слабоалкогольный овощной лонг на водке с томатным соком и сельдереем. Напиток, в который также добавляют лимонный сок, табаско и ворчестер, когда-то придумали как лекарство против похмелья.",
    directions: ["Наполни хайбол кубиками льда доверху",
    "Налей в шейкер лимонный сок 10 мл, томатный сок 120 мл и водку 50 мл",
    "Добавь табаско соус красный 3 дэш и ворчестер соус 3 дэш",
    "Приправь щепоткой сельдереевой соли и щепоткой черного перца молотого",
    "Наполни шейкер льдом, закрой и перекатывай несколько минут из одной руки в другую по вертикали",
    "Перелей через стрейнер в хайбол и укрась стеблем сельдерея"]
  },
  {
    user_id: alina.id,
    title: "Б-52",
    cocktails_ingredients: [
      CocktailsIngredient.new({ingredient: coffee_liquor, amount: '60 мл'}),
      CocktailsIngredient.new({ingredient: irish_cream, amount: '20 мл'}),
      CocktailsIngredient.new({ingredient: tripple_sek, amount: '20 мл'}),
    ],
    tags: [sweet, to_die],
    image: File.open(File.join(Rails.root, "/app/assets/images/cocktails/cocktail_16.png")),
    description: "Это крепкий сладкий шот на кофейном ликёре с добавлением айриш крима и трипл сека. На вкус он сладкий и сливочно-кофейный. Верхний слой шота поджигается, и коктейль нужно быстро выпить через трубочку: не только вкусно, но и зрелищно.",
    directions: ["Налей в стопку кофейный ликер 15 мл",
    "Используя коктейльную ложку, уложи слой айриш крим 15 мл и слой ликера трипл сек 15 мл",
    "Поджигай, вооружайся трубочками и угощай!"]
  },
  {
    user_id: alina.id,
    title: "Маргарита",
    cocktails_ingredients: [
      CocktailsIngredient.new({ingredient: tripple_sek, amount: '60 мл'}),
      CocktailsIngredient.new({ingredient: sugar_syrup, amount: '20 мл'}),
      CocktailsIngredient.new({ingredient: lime, amount: '20 мл'}),
      CocktailsIngredient.new({ingredient: ice, amount: ''}),
    ],
    tags: [salty, to_sit_well, bitter],
    image: File.open(File.join(Rails.root, "/app/assets/images/cocktails/cocktail_1.png")),
    description: 'Это солоноватый кислый коктейль на текиле с лаймовым соком. Бармены во всем мире очень любят создавать твисты на этот классический коктейль, но окаёмка из соли практически всегда остаётся неизменным украшением "Маргариты".',
    directions: ["Сделай на бокале для маргариты соленую окаемку",
    "Налей в шейкер лаймовый сок 30 мл, сахарный сироп 10 мл, ликер трипл сек 25 мл и серебряную текилу 50 мл",
    "Наполни шейкер кубиками льда и взбей",
    "Перелей через стрейнер в охлажденный бокал для маргариты",
    "Укрась кружком лайма"]
  },
  {
    user_id: alina.id,
    title: "Джин тоник",
    cocktails_ingredients: [
      CocktailsIngredient.new({ingredient: tonik, amount: '60 мл'}),
      CocktailsIngredient.new({ingredient: gin, amount: '20 мл'}),
      CocktailsIngredient.new({ingredient: lime, amount: '20 мл'}),
      CocktailsIngredient.new({ingredient: ice, amount: ''}),
    ],
    tags: [sweet_sour, to_party],
    image: File.open(File.join(Rails.root, "/app/assets/images/cocktails/cocktail_2.png")),
    description: "Это бессмертный микс джина и тоника, который подается, наверное, в каждом баре Земли. Травяной и немного горький коктейль прекрасно освежает и тонизирует.",
    directions: ["Наполни хайбол кубиками льда доверху",
    "Налей джин 50 мл",
    "Долей тоник доверху и аккуратно размешай коктейльной ложкой",
    "Укрась кружками лайма"]
  },
  {
    user_id: alina.id,
    title: "Негрони",
    cocktails_ingredients: [
      CocktailsIngredient.new({ingredient: vodka, amount: '60 мл'}),
      CocktailsIngredient.new({ingredient: gin, amount: '20 мл'}),
      CocktailsIngredient.new({ingredient: tonik, amount: '20 мл'}),
      CocktailsIngredient.new({ingredient: sugar_syrup, amount: '20 мл'}),
      CocktailsIngredient.new({ingredient: salt, amount: ''}),
    ],
    tags: [sweet, to_sit_well, to_party, to_relax, salty],
    image: File.open(File.join(Rails.root, "/app/assets/images/cocktails/cocktail_3.png")),
    description: "Это очень крепкий лонг на пяти видах алкоголя. Кроме водки, джина, рома, текилы и цитрусового ликёра, туда добавляют колу и лимонный сок, так что на вкус он получается сладковато-кислым.",
    directions: ["Наполни хайбол кубиками льда доверху",
    "Налей в шейкер лимонный сок 10 мл, томатный сок 120 мл и водку 50 мл",
    "Добавь табаско соус красный 3 дэш и ворчестер соус 3 дэш",
    "Долей колу доверху и аккуратно размешай коктейльной ложкой"]
  },
  {
    user_id: alina.id,
    title: "Вера и доверие",
    cocktails_ingredients: [
      CocktailsIngredient.new({ingredient: vodka, amount: '60 мл'}),
      CocktailsIngredient.new({ingredient: gin, amount: '20 мл'}),
      CocktailsIngredient.new({ingredient: lemon_juice, amount: '20 мл'}),
      CocktailsIngredient.new({ingredient: coffee_liquor, amount: '20 мл'}),
      CocktailsIngredient.new({ingredient: salt, amount: ''}),
    ],
    tags: [bitter, sweet, to_relax],
    image: File.open(File.join(Rails.root, "/app/assets/images/cocktails/cocktail_4.png")),
    description: "Это слабоалкогольный овощной лонг на водке с томатным соком и сельдереем. Напиток, в который также добавляют лимонный сок, табаско и ворчестер, когда-то придумали как лекарство против похмелья.",
    directions: ["Наполни хайбол кубиками льда доверху",
    "Налей в шейкер лимонный сок 10 мл, томатный сок 120 мл и водку 50 мл",
    "Добавь табаско соус красный 3 дэш и ворчестер соус 3 дэш",
    "Приправь щепоткой сельдереевой соли и щепоткой черного перца молотого",
    "Наполни шейкер льдом, закрой и перекатывай несколько минут из одной руки в другую по вертикали",
    "Перелей через стрейнер в хайбол и укрась стеблем сельдерея"]
  },
  {
    user_id: alina.id,
    title: "Испанский эг-ног",
    cocktails_ingredients: [
      CocktailsIngredient.new({ingredient: coffee_liquor, amount: '60 мл'}),
      CocktailsIngredient.new({ingredient: irish_cream, amount: '20 мл'}),
      CocktailsIngredient.new({ingredient: lemon_juice, amount: '20 мл'}),
      CocktailsIngredient.new({ingredient: sugar_syrup, amount: '20 мл'}),
    ],
    tags: [sweet, to_die, bitter],
    image: File.open(File.join(Rails.root, "/app/assets/images/cocktails/cocktail_5.png")),
    description: "Это крепкий сладкий шот на кофейном ликёре с добавлением айриш крима и трипл сека. На вкус он сладкий и сливочно-кофейный. Верхний слой шота поджигается, и коктейль нужно быстро выпить через трубочку: не только вкусно, но и зрелищно.",
    directions: ["Налей в стопку кофейный ликер 15 мл",
    "Используя коктейльную ложку, уложи слой айриш крим 15 мл и слой ликера трипл сек 15 мл",
    "Поджигай, вооружайся трубочками и угощай!"]
  },
  {
    user_id: alina.id,
    title: "Текила санрайз",
    cocktails_ingredients: [
      CocktailsIngredient.new({ingredient: lemon_juice, amount: '60 мл'}),
      CocktailsIngredient.new({ingredient: gin, amount: '20 мл'}),
      CocktailsIngredient.new({ingredient: tripple_sek, amount: '20 мл'}),
      CocktailsIngredient.new({ingredient: sugar_syrup, amount: '20 мл'}),
      CocktailsIngredient.new({ingredient: lime, amount: ''}),
    ],
    tags: [sweet_sour, sweet, to_sit_well, bitter],
    image: File.open(File.join(Rails.root, "/app/assets/images/cocktails/cocktail_6.png")),
    description: 'Это солоноватый кислый коктейль на текиле с лаймовым соком. Бармены во всем мире очень любят создавать твисты на этот классический коктейль, но окаёмка из соли практически всегда остаётся неизменным украшением "Маргариты".',
    directions: ["Сделай на бокале для маргариты соленую окаемку",
    "Налей в шейкер лаймовый сок 30 мл, сахарный сироп 10 мл, ликер трипл сек 25 мл и серебряную текилу 50 мл",
    "Наполни шейкер кубиками льда и взбей",
    "Перелей через стрейнер в охлажденный бокал для маргариты",
    "Укрась кружком лайма"]
  },
  {
    user_id: alina.id,
    title: "Голубая лагуна",
    cocktails_ingredients: [
      CocktailsIngredient.new({ingredient: tripple_sek, amount: '60 мл'}),
      CocktailsIngredient.new({ingredient: gin, amount: '20 мл'}),
      CocktailsIngredient.new({ingredient: lemon_juice, amount: '20 мл'}),
      CocktailsIngredient.new({ingredient: sugar_syrup, amount: '20 мл'}),
      CocktailsIngredient.new({ingredient: lime, amount: ''}),
    ],
    tags: [sweet_sour, to_party],
    image: File.open(File.join(Rails.root, "/app/assets/images/cocktails/cocktail_7.png")),
    description: "Это бессмертный микс джина и тоника, который подается, наверное, в каждом баре Земли. Травяной и немного горький коктейль прекрасно освежает и тонизирует.",
    directions: ["Наполни хайбол кубиками льда доверху",
    "Налей джин 50 мл",
    "Долей тоник доверху и аккуратно размешай коктейльной ложкой",
    "Укрась кружками лайма"]
  },
]

cocktails.each do |cocktail|
  cocktailik = Cocktail.create!(cocktail)
  puts "Some magic just create a #{ cocktailik.title } with id #{ cocktailik.id }!"
end

CocktailsIngredient.all.each do |ci|
  ci.update(amount: "#{rand(20..50)} мл")
end

CocktailsIngredient.where(ingredient: [ice, salt]).each do |ci|
  ci.update(amount: "")
end

AdminUser.first_or_create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') 