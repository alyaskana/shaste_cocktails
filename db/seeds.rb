Cocktail.destroy_all

puts "Destroyed everything you touch"

coffee_liquor = Ingredient.find_or_create_by!({name: 'кофейный ликер'})
irish_cream = Ingredient.find_or_create_by!({name: 'айриш крим'})
gin = Ingredient.find_or_create_by!({name: 'джин'})
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

sweet = Tag.find_or_create_by!({name: 'сладкий', tag_type: 'taste'})
sour = Tag.find_or_create_by!({name: 'кислый', tag_type: 'taste'})
sweet_sour = Tag.find_or_create_by!({name: 'кисло-сладкий', tag_type: 'taste'})
bitter = Tag.find_or_create_by!({name: 'горький', tag_type: 'taste'})
salty = Tag.find_or_create_by!({name: 'соленый', tag_type: 'taste'})
to_sit_well = Tag.find_or_create_by!({name: 'хорошо посидеть', tag_type: 'goal'})
to_relax = Tag.find_or_create_by!({name: 'расслабиться', tag_type: 'goal'})
to_party = Tag.find_or_create_by!({name: 'вечеринка с друзьями', tag_type: 'goal'})
to_die = Tag.find_or_create_by!({name: 'набухаться в хлам', tag_type: 'goal'})

user = User.first_or_create!({
  email: "ialina240200@gmail.com",
  login: "alyaskana",
  user_name: "Алина мутит шейки",
  password: 'qwerty',
  ingredients: [tonik, salt, tripple_sek, irish_cream, coffee_liquor, ice]
})

def build_ci(ingredient, amount)
  CocktailsIngredient.new(ingredient: ingredient, amount: amount)
end

cocktails = [
  {
    user_id: user.id,
    title: "Джин персиковый чай",
    ingredients: [gin, ice, lemon_juice, sugar_syrup],
    tags: [sweet, to_relax, to_sit_well],
    image: File.open(File.join(Rails.root, "/app/assets/images/cocktails/cocktail-1.png")),
    description: "Это очень крепкий лонг на пяти видах алкоголя. Кроме водки, джина, рома, текилы и цитрусового ликёра, туда добавляют колу и лимонный сок, так что на вкус он получается сладковато-кислым.",
    directions: "1. Налей в шейкер сок манго 15 мл, кофейный ликер 15 мл и лимончелло 15 мл
    2. Наполни шейкер кубиками льда и взбей
    3. Перелей через стрейнер в стопку
    4. Укрась лимонной цедрой"
  },
  {
    user_id: user.id,
    title: "Сливочная мечта",
    ingredients: [coffee_liquor, ice, tonik, tobasco],
    tags: [bitter, sour, to_die],
    image: File.open(File.join(Rails.root, "/app/assets/images/cocktails/cocktail-2.png")),
    description: "Это очень крепкий лонг на пяти видах алкоголя. Кроме водки, джина, рома, текилы и цитрусового ликёра, туда добавляют колу и лимонный сок, так что на вкус он получается сладковато-кислым.",
    directions: "1. Налей в шейкер сок манго 15 мл, кофейный ликер 15 мл и лимончелло 15 мл
    2. Наполни шейкер кубиками льда и взбей
    3. Перелей через стрейнер в стопку
    4. Укрась лимонной цедрой"
  },
  {
    user_id: user.id,
    title: "Антифриз в огурце",
    ingredients: [vodka, ice, tomato_juice],
    tags: [bitter, sweet_sour, to_sit_well],
    image: File.open(File.join(Rails.root, "/app/assets/images/cocktails/cocktail-3.png")),
    description: "Это очень крепкий лонг на пяти видах алкоголя. Кроме водки, джина, рома, текилы и цитрусового ликёра, туда добавляют колу и лимонный сок, так что на вкус он получается сладковато-кислым.",
    directions: "1. Налей в шейкер сок манго 15 мл, кофейный ликер 15 мл и лимончелло 15 мл
    2. Наполни шейкер кубиками льда и взбей
    3. Перелей через стрейнер в стопку
    4. Укрась лимонной цедрой"
  },
  {
    user_id: user.id,
    title: "Кэнди шот",
    ingredients: [vodka, coffee_liquor, lemon_juice],
    tags: [sweet, sweet_sour, to_party],
    image: File.open(File.join(Rails.root, "/app/assets/images/cocktails/cocktail-4.png")),
    description: "Это очень крепкий лонг на пяти видах алкоголя. Кроме водки, джина, рома, текилы и цитрусового ликёра, туда добавляют колу и лимонный сок, так что на вкус он получается сладковато-кислым.",
    directions: "1. Налей в шейкер сок манго 15 мл, кофейный ликер 15 мл и лимончелло 15 мл
    2. Наполни шейкер кубиками льда и взбей
    3. Перелей через стрейнер в стопку
    4. Укрась лимонной цедрой"
  },
  {
    user_id: user.id,
    title: "Лонг айленд айс ти",
    ingredients: [vodka, salt, ice, lime, tripple_sek, tonik],
    tags: [sweet, sweet_sour, to_sit_well, to_relax, salty],
    image: File.open(File.join(Rails.root, "/app/assets/images/cocktails/cocktail-1.png")),
    description: "Это очень крепкий лонг на пяти видах алкоголя. Кроме водки, джина, рома, текилы и цитрусового ликёра, туда добавляют колу и лимонный сок, так что на вкус он получается сладковато-кислым.",
    directions: "1. Наполни хайбол кубиками льда доверху
    2. Налей в шейкер лимонный сок 10 мл, томатный сок 120 мл и водку 50 мл
    3. Добавь табаско соус красный 3 дэш и ворчестер соус 3 дэш
    4. Долей колу доверху и аккуратно размешай коктейльной ложкой"
  },
  {
    user_id: user.id,
    title: "Кровавая Мэри",
    ingredients: [vodka, tomato_juice, salt, ice, lemon_juice, gin, tonik],
    tags: [bitter, sour, to_relax, to_party],
    image: File.open(File.join(Rails.root, "/app/assets/images/cocktails/cocktail-2.png")),
    description: "Это слабоалкогольный овощной лонг на водке с томатным соком и сельдереем. Напиток, в который также добавляют лимонный сок, табаско и ворчестер, когда-то придумали как лекарство против похмелья.",
    directions: "1. Наполни хайбол кубиками льда доверху
    2. Налей в шейкер лимонный сок 10 мл, томатный сок 120 мл и водку 50 мл
    3. Добавь табаско соус красный 3 дэш и ворчестер соус 3 дэш
    4. Приправь щепоткой сельдереевой соли и щепоткой черного перца молотого
    5. Наполни шейкер льдом, закрой и перекатывай несколько минут из одной руки в другую по вертикали
    6. Перелей через стрейнер в хайбол и укрась стеблем сельдерея"
  },
  {
    user_id: user.id,
    title: "Б-52",
    ingredients: [coffee_liquor, irish_cream, tripple_sek],
    tags: [sweet, to_die],
    image: File.open(File.join(Rails.root, "/app/assets/images/cocktails/cocktail-3.png")),
    description: "Это крепкий сладкий шот на кофейном ликёре с добавлением айриш крима и трипл сека. На вкус он сладкий и сливочно-кофейный. Верхний слой шота поджигается, и коктейль нужно быстро выпить через трубочку: не только вкусно, но и зрелищно.",
    directions: "1. Налей в стопку кофейный ликер 15 мл
    2. Используя коктейльную ложку, уложи слой айриш крим 15 мл и слой ликера трипл сек 15 мл
    3. Поджигай, вооружайся трубочками и угощай!"
  },
  {
    user_id: user.id,
    title: "Маргарита",
    ingredients: [lime, sugar_syrup, tripple_sek, ice],
    tags: [salty, to_sit_well, bitter],
    image: File.open(File.join(Rails.root, "/app/assets/images/cocktails/Margarita.jpg")),
    description: 'Это солоноватый кислый коктейль на текиле с лаймовым соком. Бармены во всем мире очень любят создавать твисты на этот классический коктейль, но окаёмка из соли практически всегда остаётся неизменным украшением "Маргариты".',
    directions: "1. Сделай на бокале для маргариты соленую окаемку
    2. Налей в шейкер лаймовый сок 30 мл, сахарный сироп 10 мл, ликер трипл сек 25 мл и серебряную текилу 50 мл
    3. Наполни шейкер кубиками льда и взбей
    4. Перелей через стрейнер в охлажденный бокал для маргариты
    5. Укрась кружком лайма"
  },
  {
    user_id: user.id,
    title: "Джин тоник",
    ingredients: [ice, gin, tonik, lime],
    tags: [sweet_sour, to_party],
    image: File.open(File.join(Rails.root, "/app/assets/images/cocktails/jin-tonik.png")),
    description: "Это бессмертный микс джина и тоника, который подается, наверное, в каждом баре Земли. Травяной и немного горький коктейль прекрасно освежает и тонизирует.",
    directions: "1. Наполни хайбол кубиками льда доверху
    2. Налей джин 50 мл
    3. Долей тоник доверху и аккуратно размешай коктейльной ложкой
    4. Укрась кружками лайма"
  },
  {
    user_id: user.id,
    title: "Негрони",
    ingredients: [vodka, salt, gin, tonik, sugar_syrup],
    tags: [sweet, to_sit_well, to_party, to_relax, salty],
    image: File.open(File.join(Rails.root, "/app/assets/images/cocktails/b-52.png")),
    description: "Это очень крепкий лонг на пяти видах алкоголя. Кроме водки, джина, рома, текилы и цитрусового ликёра, туда добавляют колу и лимонный сок, так что на вкус он получается сладковато-кислым.",
    directions: "1. Наполни хайбол кубиками льда доверху
    2. Налей в шейкер лимонный сок 10 мл, томатный сок 120 мл и водку 50 мл
    3. Добавь табаско соус красный 3 дэш и ворчестер соус 3 дэш
    4. Долей колу доверху и аккуратно размешай коктейльной ложкой"
  },
  {
    user_id: user.id,
    title: "Вера и доверие",
    ingredients: [gin, ice, lemon_juice, tonik, coffee_liquor],
    tags: [bitter, sweet, to_relax],
    image: File.open(File.join(Rails.root, "/app/assets/images/cocktails/cocktail-4.png")),
    description: "Это слабоалкогольный овощной лонг на водке с томатным соком и сельдереем. Напиток, в который также добавляют лимонный сок, табаско и ворчестер, когда-то придумали как лекарство против похмелья.",
    directions: "1. Наполни хайбол кубиками льда доверху
    2. Налей в шейкер лимонный сок 10 мл, томатный сок 120 мл и водку 50 мл
    3. Добавь табаско соус красный 3 дэш и ворчестер соус 3 дэш
    4. Приправь щепоткой сельдереевой соли и щепоткой черного перца молотого
    5. Наполни шейкер льдом, закрой и перекатывай несколько минут из одной руки в другую по вертикали
    6. Перелей через стрейнер в хайбол и укрась стеблем сельдерея"
  },
  {
    user_id: user.id,
    title: "Испанский эг-ног",
    ingredients: [coffee_liquor, ice, irish_cream, lemon_juice],
    tags: [sweet, to_die, bitter],
    image: File.open(File.join(Rails.root, "/app/assets/images/cocktails/cocktail-3.png")),
    description: "Это крепкий сладкий шот на кофейном ликёре с добавлением айриш крима и трипл сека. На вкус он сладкий и сливочно-кофейный. Верхний слой шота поджигается, и коктейль нужно быстро выпить через трубочку: не только вкусно, но и зрелищно.",
    directions: "1. Налей в стопку кофейный ликер 15 мл
    2. Используя коктейльную ложку, уложи слой айриш крим 15 мл и слой ликера трипл сек 15 мл
    3. Поджигай, вооружайся трубочками и угощай!"
  },
  {
    user_id: user.id,
    title: "Текила санрайз",
    ingredients: [lime, tripple_sek, ice, gin,lemon_juice, sugar_syrup],
    tags: [sweet_sour, sweet, to_sit_well, bitter],
    image: File.open(File.join(Rails.root, "/app/assets/images/cocktails/cocktail-2.png")),
    description: 'Это солоноватый кислый коктейль на текиле с лаймовым соком. Бармены во всем мире очень любят создавать твисты на этот классический коктейль, но окаёмка из соли практически всегда остаётся неизменным украшением "Маргариты".',
    directions: "1. Сделай на бокале для маргариты соленую окаемку
    2. Налей в шейкер лаймовый сок 30 мл, сахарный сироп 10 мл, ликер трипл сек 25 мл и серебряную текилу 50 мл
    3. Наполни шейкер кубиками льда и взбей
    4. Перелей через стрейнер в охлажденный бокал для маргариты
    5. Укрась кружком лайма"
  },
  {
    user_id: user.id,
    title: "Голубая лагуна",
    ingredients: [ice, gin, tripple_sek, lemon_juice, lime],
    tags: [sweet_sour, to_party],
    image: File.open(File.join(Rails.root, "/app/assets/images/cocktails/jin-tonik.png")),
    description: "Это бессмертный микс джина и тоника, который подается, наверное, в каждом баре Земли. Травяной и немного горький коктейль прекрасно освежает и тонизирует.",
    directions: "1. Наполни хайбол кубиками льда доверху
    2. Налей джин 50 мл
    3. Долей тоник доверху и аккуратно размешай коктейльной ложкой
    4. Укрась кружками лайма"
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