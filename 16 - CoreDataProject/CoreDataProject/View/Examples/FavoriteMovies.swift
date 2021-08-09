//
//  FavoriteMovies.swift
//  CoreDataProject
//
//  Created by Natasha Godwin on 8/6/21.
//

import SwiftUI

struct FavoriteMovies: View {
	@Environment(\.managedObjectContext) var viewContext
	@FetchRequest(entity: Movie.entity(), sortDescriptors: [
		NSSortDescriptor(keyPath: \Movie.director, ascending: true),
	]) var movies: FetchedResults<Movie>
	var body: some View {
		List {
			ForEach(movies, id:\.self) { movie in
				VStack(alignment: .leading) {
					HStack {
						Text(movie.wrappedTitle)
							.font(.headline)
						// TO DO: Fix the formatting for this number.
						Text("(\(movie.year))")
					}
					Text(movie.wrappedDirector)
						.foregroundColor(.secondary)
				}
			}
			.onDelete(perform: delete)
		}
		.navigationBarTitle("Favorite Movies", displayMode: .inline)
		.navigationBarItems(trailing: Button("Add") {
			let favoriteMovie = Movie(context: self.viewContext)
			favoriteMovie.title = "Ocean's Twelve"
			favoriteMovie.director = "Steven Soderbergh"
			favoriteMovie.year = Int16(2012)
			
			if viewContext.hasChanges {
				try? viewContext.save()
			}
		})
	}
	
	func delete(at locations: IndexSet) {
		for location in locations {
			let movie = movies[location]
			viewContext.delete(movie)
			try? viewContext.save()
		}
	}
}


struct FavoriteMovies_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteMovies()
    }
}
