# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
WorldBoss.destroy_all
Region.destroy_all
Location.destroy_all

mortanis = WorldBoss.create!(name: "Mortanis", max_health:18_466_000, is_current_boss: false, zone: "Maldraxxus")
great_plateau = Region.create!(name: "The Great Plateau", has_divine_beast: false, shrines: 4)
akkala = Region.create!(name: "Akkala", has_divine_beast: false, shrines: 8)

akkala.locations.create!(name: "Tarrey Town", is_cold: false, korok_seeds: 13)
akkala.locations.create!(name: "Lomei Labrynth", is_cold: false, korok_seeds: 5)
akkala.locations.create!(name: "Akkala Tower", is_cold: true, korok_seeds: 1)

great_plateau.locations.create!(name: "Mount Hylia", is_cold: true, korok_seeds: 11)
great_plateau.locations.create!(name: "Temple of Time", is_cold: false, korok_seeds: 8)
great_plateau.locations.create!(name: "Shrine of Resurrection", is_cold: false, korok_seeds: 7)
