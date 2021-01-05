Cocktail.destroy_all

puts "Destroyed everything you touch"

user = User.first_or_create!({
  email: "ialina240200@gmail.com",
  login: "alyaskana",
  first_name: "Alina",
  last_name: 'Bychkova',
  password: 'qwerty'
})

coffee_liquor = Ingredient.find_or_create_by!({name: 'кофейный ликер'})
irish_cream = Ingredient.find_or_create_by!({name: 'айриш крим'})
gin = Ingredient.find_or_create_by!({name: 'джин'})
tripple_sek = Ingredient.find_or_create_by!({name: 'трипл сек'})
ice = Ingredient.find_or_create_by!({name: 'лед'})
tonik = Ingredient.find_or_create_by!({name: 'тоник'})
lime = Ingredient.find_or_create_by!({name: 'лайм'})
sugar_syrup = Ingredient.find_or_create_by!({name: 'сахарный сироп'})

cocktails = [
  {
    user_id: user.id,
    title: "Б-52",
    ingredients: [coffee_liquor, irish_cream, tripple_sek],
    image: File.open(File.join(Rails.root, "/app/assets/images/cocktails/b-52.png")),
    description: "Это крепкий сладкий шот на кофейном ликёре с добавлением айриш крима и трипл сека. На вкус он сладкий и сливочно-кофейный. Верхний слой шота поджигается, и коктейль нужно быстро выпить через трубочку: не только вкусно, но и зрелищно.",
    directions: "1. Налей в стопку кофейный ликер 15 мл
    2. Используя коктейльную ложку, уложи слой айриш крим 15 мл и слой ликера трипл сек 15 мл
    3. Поджигай, вооружайся трубочками и угощай!"
  },
  {
    user_id: user.id,
    title: "Маргарита",
    ingredients: [lime, sugar_syrup, tripple_sek, ice],
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
