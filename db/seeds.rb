# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create!({:email => "avpn@mail.ru", :name => "Палкин Антон", :roles => ["admin" , "user"], :password => "painpain10", :password_confirmation => "painpain10" })
CompType.create(comp_type: "Внешняя")
CompType.create(comp_type: "Внутренняя")
Currency.create(name: "RU", to_dollar: 65)
TypeOfBill.create(name: "На согласовании")
TypeOfBill.create(name: "Буфер")
TypeOfBill.create(name: "Согласован")
TypeOfBill.create(name: "Оплачен")
TypeOfBill.create(name: "Отложен")
TypeOfBill.create(name: "Отклонен")
TypeOfBill.create(name: "Оплачен не полностью")
TypeOfBill.create(name: "Исправить")
TypeOfBill.create(name: "Переплата")

TypeIoe.create(name: "Офис")
TypeIoe.create(name: "Бухгалтерия")
TypeIoe.create(name: "Рекламный бюджет")
TypeIoe.create(name: "Заработная плата")
TypeIoe.create(name: "Доходные")
TypeIoe.create(name: "Мат. ценности")
TypeIoe.create(name: "Продажи")
TypeIoe.create(name: "Расходные")
