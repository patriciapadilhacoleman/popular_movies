class PopularMovies::Movie

 attr_accessor :title,:genre, :rating, :description, :url, :db

  def initialize(title:,genre:,rating:, url:, description:,db:nil)

    @title, @genre, @rating, @url,@description, @db = title, genre, rating, url, description, db

  end

  def self.save(title,genre,rating, url, description,db)

   # db.execute("INSERT INTO popular_movies(title, genre, rating, url, description) VALUES (?, ?,?,?,?)", title,genre,rating, url, description)

    movie = self.new(title:title, genre: genre,rating:rating, url:url, description:description,db: db)
  
  end

end
