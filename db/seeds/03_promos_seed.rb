promos_list = [
  ['MUL1545NVP', '7GB', Environment.where(name: 'production').first],
  ['MUL1602NVP', '7GB', Environment.where(name: 'battlefield').first]
]

promos_list.each do |code, product, environment|
  Promo.create(code: code, product: product, environment: environment)
end
