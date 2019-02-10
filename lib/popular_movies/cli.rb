class PopularMovies::CLI

  def call
    puts "List of Free Popular Movies:"
    list_movies
    puts "Which one would you like to know more about?(Type the number and press <Enter>)"
  end

  def list_movies
    #this method will call in the srapper method to get the movies
   puts<<-DOC

   1. Bird Box - Suspense
   2. Finding Nemo - Family
   3. Annabelle - Horror

   DOC

  end


end
