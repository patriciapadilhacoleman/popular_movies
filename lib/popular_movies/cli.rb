class PopularMovies::CLI

  def call

    @movies = PopularMovies::Scraper.new(@db).scrape
    list_movies
    menu

  end

  def list_movies
    #this method will call in the srapper method to get the movies
    puts "These are Today's 10 Most Popular Movies available for FREE:"
    @movies.each.with_index(1) do |movie,i|
      puts "#{i}. #{movie.title} - #{movie.genre} - #{movie.rating}"
    end
  end

  def menu
    input = nil
    while input!="exit"
      puts "Which one would you like to know more about?"
      puts "<Type the number> or <Type 'list' to see the list again> or <Type 'exit'>"
      input = gets.strip.downcase
        if input.to_i > 0
          puts @movies[input.to_i-1].title.upcase
          puts @movies[input.to_i-1].description
          puts @movies[input.to_i-1].url
        elsif input == 'list'
          list_movies
        elsif input =='exit'
          goodbye
        else
           puts "Choose a number between 1-5 OR 'list' OR 'exit'"
        end
     end
  end

  def goodbye
     puts "Enjoy your movie!!!"
  end

end
