promos_list = [
  ['MUL1545NVP', '7GB', Environment.find(1)],
  ['MUL1602NVP', '7GB', Environment.find(2)]
]

promos_list.each do |code, product, environment|
  Promo.create(code: code, product: product, environment: environment)
end
