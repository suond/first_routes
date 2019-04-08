# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#   reset pk ActiveRecord::Base.connection.reset_pk_sequence!('artworks')
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

ArtworkShare.destroy_all
Artwork.destroy_all
User.destroy_all

bob = User.create!(username: 'Bob')
harry = User.create!(username: 'Harry')
sally = User.create!(username: 'Sally')

art1 = Artwork.create(artist_id: bob.id, title: 'Movement', image_url: 'www.coolart.com')
art2 = Artwork.create(artist_id: harry.id, title: 'Popcorn', image_url: 'www.coolart.com/popcorn')
art3 = Artwork.create(artist_id: sally.id, title: 'Lonely Pizza', image_url: 'www.coolart.com/pizza')

ArtworkShare.create(artwork_id: art1.id, viewer_id: harry.id)
ArtworkShare.create(artwork_id: art2.id, viewer_id: sally.id)
ArtworkShare.create(artwork_id: art3.id, viewer_id: bob.id)