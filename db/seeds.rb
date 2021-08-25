# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
WorldBoss.destroy_all
Region.destroy_all
Loot.destroy_all

mortanis = WorldBoss.create!(name: "Mortanis", max_health:18_466_000, is_current_boss: false, zone: "Maldraxxus")
muckformed = WorldBoss.create!(name: "Muckformed", max_health:19_000_000, is_current_boss: false, zone: "Revendreth")

the_great_plateau = Region.create!(name: "The Great Plateau", has_divine_beast: false, shrines: 4)

mortanis.loots.create!(name: "Band of the Risen Bonelord", memory: false, armor: 0)
mortanis.loots.create!(name: "Spine Crawler Waistcord", memory: false, armor: 27)
mortanis.loots.create!(name: "Memory of Fujieda", memory: true, armor: 0)

muckformed.loots.create!(name: "Memory of a Frenzied Monstrosity", memory: true, armor: 0)
muckformed.loots.create!(name: "Jingling Stone Stompers", memory: false, armor: 82)
muckformed.loots.create!(name: "Hardened Castle Crusher", memory: false, armor: 21)
