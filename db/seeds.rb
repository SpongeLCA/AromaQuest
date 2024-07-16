User.destroy_all
Perfume.destroy_all
Result.destroy_all
Note.destroy_all
Review.destroy_all
Favorite.destroy_all
Magasin.destroy_all

puts "Creating users..."
users = User.create!([
  { name: 'Alice', surname: 'Dupont', address: '12 Rue de la Paix, Paris', email: 'alice.dupont@example.com', password: 'password', lat: 48.868, long: 2.328 },
  { name: 'Bob', surname: 'Martin', address: '34 Avenue des Champs-Élysées, Paris', email: 'bob.martin@example.com', password: 'password', lat: 48.869, long: 2.307 }
])
puts "finished creating users"
puts "Creating perfumes..."
perfumes = Perfume.create!([
  { name: 'Shalimar', description: 'Une fragrance orientale iconique avec des notes de bergamote, iris et vanille.', brand: 'Guerlain', price: 120.0, photo: 'shalimar.jpg', intensity: 5 },
  { name: 'Mon Guerlain', description: 'Un parfum oriental frais avec des notes de lavande, jasmin Sambac et bois de santal.', brand: 'Guerlain', price: 110.0, photo: 'mon_guerlain.jpg', intensity: 3 },
  { name: 'Aqua Allegoria Mandarine Basilic', description: 'Un parfum frais et pétillant avec des notes de mandarine et basilic.', brand: 'Guerlain', price: 85.0, photo: 'aqua_allegoria_mandarine_basilic.jpg', intensity: 2 },
  { name: 'L\'Homme Idéal', description: 'Un parfum masculin avec des notes d\'amande, cuir et vanille.', brand: 'Guerlain', price: 95.0, photo: 'lhomme_ideal.jpg', intensity: 4 }
])
puts "finished creating perfumes"
puts "Creating results..."
results = Result.create!([
  { user: users.first, name: 'Resultat 1', description: 'Premier résultat', answer_1: 'Réponse 1', answer_2: 'Réponse 2', answer_3: 'Réponse 3', answer_4: 'Réponse 4', answer_5: 'Réponse 5', answer_6: 'Réponse 6', answer_7: 'Réponse 7', answer_8: 'Réponse 8', answer_9: 'Réponse 9', answer_10: 'Réponse 10' },
  { user: users.last, name: 'Resultat 2', description: 'Deuxième résultat', answer_1: 'Réponse 1', answer_2: 'Réponse 4', answer_3: 'Réponse 2', answer_4: 'Réponse 4', answer_5: 'Réponse 5', answer_6: 'Réponse 6', answer_7: 'Réponse 7', answer_8: 'Réponse 8', answer_9: 'Réponse 9', answer_10: 'Réponse 10' }
])
puts "finished creating results"
puts "creatting perfume results..."
PerfumeResult.create!([
  { perfume: perfumes[0], result: results[0] },
  { perfume: perfumes[1], result: results[1] }
])
puts "finished creating perfume results"
puts "creating notes..."
notes = Note.create!([
  { perfume: perfumes[0], tete: 'Bergamote', coeur: 'Iris', fond: 'Vanille' },
  { perfume: perfumes[1], tete: 'Lavande', coeur: 'Jasmin Sambac', fond: 'Bois de santal' },
  { perfume: perfumes[2], tete: 'Mandarine', coeur: 'Basilic', fond: 'Thé vert' },
  { perfume: perfumes[3], tete: 'Amande', coeur: 'Cuir', fond: 'Vanille' }
])
puts "finished creating notes"
puts "creating reviews..."
reviews = Review.create!([
  { user: users.first, perfume: perfumes[0], comment: 'Parfum incroyable!', rating: 5 },
  { user: users.last, perfume: perfumes[1], comment: 'Très frais et agréable.', rating: 4 }
])
puts "finished creating reviews"
puts "creating favorites..."
favorites = Favorite.create!([
  { user: users.first, perfume: perfumes[0] },
  { user: users.last, perfume: perfumes[1] }
])
puts "finished creating favorites"
puts "creating magasins..."
magasins = Magasin.create!([
  { name: 'Guerlain Boutique', address: '68 Avenue des Champs-Élysées, Paris', lat: 48.8705, long: 2.3044, photo: 'guerlain_boutique.jpg', brand: 'Guerlain' }
  ])
  puts "finished creating magasins"
puts "Seed data created successfully!"
