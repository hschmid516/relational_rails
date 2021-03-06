# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Location.destroy_all
Loot.destroy_all

WorldBoss.destroy_all
Region.destroy_all


great_plateau = Region.create!(name: "The Great Plateau", has_divine_beast: false, shrines: 4)
akkala = Region.create!(name: "Akkala", has_divine_beast: false, shrines: 8)
eldin = Region.create!(name: "Eldin", has_divine_beast: true, shrines: 18)
faron = Region.create!(name: "Faron", has_divine_beast: true, shrines: 12)

akkala.locations.create!(name: "Tarrey Town", is_cold: false, korok_seeds: 13)
akkala.locations.create!(name: "Lomei Labrynth", is_cold: true, korok_seeds: 5)
akkala.locations.create!(name: "Akkala Tower", is_cold: true, korok_seeds: 1)

great_plateau.locations.create!(name: "Mount Hylia", is_cold: true, korok_seeds: 11)
great_plateau.locations.create!(name: "Temple of Time", is_cold: true, korok_seeds: 8)
great_plateau.locations.create!(name: "Shrine of Resurrection", is_cold: true, korok_seeds: 7)

eldin.locations.create!(name: "Death Mountain", is_cold: true, korok_seeds: 19)
eldin.locations.create!(name: "Goron City", is_cold: true, korok_seeds: 4)
eldin.locations.create!(name: "Broca Island", is_cold: true, korok_seeds: 22)
eldin.locations.create!(name: "Southern Mine", is_cold: true, korok_seeds: 3)
eldin.locations.create!(name: "Gorko Tunnel", is_cold: false, korok_seeds: 9)

faron.locations.create!(name: "Necluda Sea", is_cold: true, korok_seeds: 11)


mortanis = WorldBoss.create!(name: "Mortanis", max_health:18_466_000, is_current_boss: false, zone: "Maldraxxus")
muckformed = WorldBoss.create!(name: "Muckformed", max_health:19_000_000, is_current_boss: false, zone: "Revendreth")
valinor = WorldBoss.create!(name: "Valinor, the Light of Eons", max_health:18_000_000, is_current_boss: false, zone: "Bastion")

mortanis.loots.create!(name: "Band of the Risen Bonelord", memory: false, armor: 0)
mortanis.loots.create!(name: "Spine Crawler Waistcord", memory: false, armor: 27)
mortanis.loots.create!(name: "Memory of Fujieda", memory: true, armor: 0)

muckformed.loots.create!(name: "Memory of a Frenzied Monstrosity", memory: true, armor: 0)
muckformed.loots.create!(name: "Jingling Stone Stompers", memory: false, armor: 82)
muckformed.loots.create!(name: "Hardened Castle Crusher", memory: false, armor: 21)

valinor.loots.create!(name: "Shroud of the Penitent (Back)", memory: false, armor: 24)
