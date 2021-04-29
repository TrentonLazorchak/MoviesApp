//
//  ContentView.swift
//  MoviesApp
//
//  Created by Trenton Lazorchak on 4/29/21.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var store: MovieStore
    
    let columns: [GridItem] = Array(repeating: .init(.flexible()), count: 3)
    
    var body: some View {
        
        NavigationView {
            
            ScrollView {
                
                LazyVGrid(columns: columns){
                    
                    // imdbID is unique
                    ForEach(store.movies ?? [Movie](), id: \.imdbID) { movie in
                        
                        NavigationLink(destination: MovieDetailsView(title: movie.title, poster: movie.poster, year: movie.year, type: movie.type)) {
                            
                            VStack {
                                URLImage(url: movie.poster)
                                    .frame(width: 100, height: 150)
                                
                                Text(movie.title)
                                    .frame(maxHeight: .infinity, alignment: .top)
                            }
                            
                        }
                        
                    }
                    
                }
            }
            .navigationTitle("Movies")
        }
        .onAppear{
            store.getAll()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(store: MovieStore())
    }
}
