# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
WorldBoss.destroy_all
Region.destroy_all

mortanis = WorldBoss.create!(name: "Mortanis", max_health:100_000_000, is_current_boss: false, zone: "Maldraxxus")
the_great_plateau = Region.create!(name: "The Great Plateau", has_divine_beast: false, shrines: 4)
