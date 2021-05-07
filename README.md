# MoviesApp
Application that fetches data from the OMDb API and displays in a list. On tapping the item, takes user to new screen with the movie/series details.

# Coding process
1. Created moviestore.swift file to access the OMDb api.

2. Pass in stateobject stores in MoviesApp.swift.

3. In contentview take in theapi call from moviestore.swift to show the titles of the films.

4. Bring in the imageloader and urlimage.swift in order to use the url image from the 'poster' field of the api.

5. Wrap the vstack of the poster and title in a navigation link in order to make them clickable to see more info about the movie.

6. Create a new swiftui file that shows the information about the selected movie.
