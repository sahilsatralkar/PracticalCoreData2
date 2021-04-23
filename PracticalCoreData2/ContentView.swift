//
//  ContentView.swift
//  PracticalCoreData2
//
//  Created by Sahil Satralkar on 19/04/21.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    let storageProvider: StorageProvider
    @State private var name: String = ""
    
    var body: some View {
        TextField("Enter the text", text: $name)
        Button("Press") {
            storageProvider.saveMovie(named: name)
        }
        Text("Hello, world!")
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(storageProvider: StorageProvider())
    }
}

extension StorageProvider {
    
    func saveMovie(named name: String) {
        
        let movie = Movie(context: persistentContainer.viewContext)
        movie.name = name
        
        do {
            try persistentContainer.viewContext.save()
            print("Movie saved successfully")
        } catch {
            persistentContainer.viewContext.rollback()
            print("Failed to save movie: \(error)")
        }
    }
}

extension StorageProvider {
    func deleteMovie(_ movie: Movie) {
        persistentContainer.viewContext.delete(movie)
        do {
            try persistentContainer.viewContext.save()
        } catch { persistentContainer.viewContext.rollback()
            print("Failed to save context: \(error)")
        }
    }
}

extension StorageProvider {
    func getAllMovies() -> [Movie] {
        let fetchRequest: NSFetchRequest<Movie> = Movie.fetchRequest()
        do {
            return try persistentContainer.viewContext.fetch(fetchRequest)
        } catch {
            print("Failed to fetch movies: \(error)")
            return []
        }
    }
}


extension StorageProvider {
    func updateMovies() {
        do {
            try persistentContainer.viewContext.save()
        } catch {
            persistentContainer.viewContext.rollback()
            print("Failed to save context: \(error)")
        }
    }
}

//Testing Github1
