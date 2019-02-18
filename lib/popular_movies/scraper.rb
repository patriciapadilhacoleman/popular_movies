class PopularMovies::Scraper
  attr_accessor :doc,:all_movies,:db


  def initialize(db)
    self.db = db
    self.doc = Nokogiri::HTML(open("https://tubitv.com/category/most_popular"))
    @all_movies = []
    self.all_movies = list_movies
  end

  def list_movies

    # movie_banner = []
    # i = 0
    # while i != 10
      self.all_movies = doc.search("div.JB9zq")
    #   i += 1
    # end
    # movie_banner
  end

  def get_movie_title_from(node)
    self.all_movies.css('h3')[node].text
  end

  def get_movie_genre_from(node)
    self.all_movies.css('div.RmVOo._27rH2')[node].text
  end

  def get_movie_rating_from(node)
    self.all_movies.css('div._30bN1._2x-ll')[node].text
  end

  def get_movie_url(node)
    movie_url_string = "https://tubitv.com"
    movie_url_string << self.all_movies.css('a')[node]['href']
    movie_url_string.split("?")[0]
  end

  def get_movie_description_from(url)

    doc = Nokogiri::HTML(open(url))
    doc.search("div._1_hc6").first.text

  end

  def scrape

      movie_list = []
      movie_node = 0
      while movie_node != 10
        movie_title = get_movie_title_from(movie_node)
        movie_genre = get_movie_genre_from(movie_node)
        movie_rating = get_movie_rating_from(movie_node)
        movie_url = get_movie_url(movie_node)
        movie_description = get_movie_description_from(movie_url)
        movie_list << PopularMovies::Movie.save(movie_title, movie_genre, movie_rating,movie_url, movie_description, db)
        movie_node += 1
     end

     movie_list

  end

end
