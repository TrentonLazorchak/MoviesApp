//
//  MovieDetailsView.swift
//  MoviesApp
//
//  Created by Trenton Lazorchak on 4/29/21.
//

import SwiftUI

struct MovieDetailsView: View {
    
    var title: String
    var poster: String
    var year: String
    var type: String
    
    var body: some View {
        
        Text(title)
            .font(.largeTitle)
            .multilineTextAlignment(.center)
        
        URLImage(url: poster)
            .frame(width: 200, height: 250)
        
        Text(year)
        
        Text(type.capitalizingFirstLetter())
        
    }
    
}

// used to capitalize the first letter of the type (movie or series)
// need this since in the API the type is lowercase
extension String {
    func capitalizingFirstLetter() -> String {
        return prefix(1).capitalized + dropFirst()
    }

    mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter()
    }
}

struct MovieDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailsView(title: "", poster: "https://thumbs.dreamstime.com/z/student-choosing-answers-test-form-to-pass-exam-student-choosing-answers-test-form-to-pass-exam-table-109691505.jpg", year: "2021", type: "Movie")
    }
}
