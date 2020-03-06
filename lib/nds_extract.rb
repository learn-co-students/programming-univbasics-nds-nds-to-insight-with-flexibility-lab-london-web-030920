# Provided, don't edit
require 'directors_database'
require 'pry'

# A method we're giving you. This "flattens"  Arrays of Arrays so: [[1,2],
# [3,4,5], [6]] => [1,2,3,4,5,6].

def flatten_a_o_a(aoa)
  result = []
  i = 0

  while i < aoa.length do
    k = 0
    while k < aoa[i].length do
      result << aoa[i][k]
      k += 1
    end
    i += 1
  end

  result
end

def movie_with_director_name(director_name, movie_data)
  {
    :title => movie_data[:title],
    :worldwide_gross => movie_data[:worldwide_gross],
    :release_year => movie_data[:release_year],
    :studio => movie_data[:studio],
    :director_name => director_name
  }
end


# Your code after this point

def movies_with_director_key(name, movies_collection)
  # GOAL: For each Hash in an Array (movies_collection), provide a collection
  # of movies and a directors name to the movie_with_director_name method
  # and accumulate the returned Array of movies into a new Array that's
  # returned by this method.
  #
  # INPUT:
  # * name: A director's name
  # * movies_collection: An Array of Hashes where each Hash represents a movie
  #
  # RETURN:
  #
  # Array of Hashes where each Hash represents a movie; however, they should all have a
  # :director_name key. This addition can be done by using the provided
  # movie_with_director_name method
  array = []
  movie_index = 0
while movie_index < movies_collection.length
  new_movie_data = movie_with_director_name(name, movies_collection[movie_index])
  array.push(new_movie_data)
  movie_index += 1
end
  array
end


def gross_per_studio(collection)
  # GOAL: Given an Array of Hashes where each Hash represents a movie,
  # return a Hash that includes the total worldwide_gross of all the movies from
  # each studio.
  #
  # INPUT:
  # * collection: Array of Hashes where each Hash where each Hash represents a movie
  #
  # RETURN:
  #
  # Hash whose keys are the studio names and whose values are the sum
  # total of all the worldwide_gross numbers for every movie in the input Hash
studio_value_hash = {}
movie_index = 0

while movie_index < collection.length
  movie_studio = collection[movie_index][:studio]
  movie_gross = collection[movie_index][:worldwide_gross]

    if studio_value_hash[movie_studio]
    studio_value_hash[movie_studio] += movie_gross

  else
    studio_value_hash[movie_studio] = movie_gross
  end
  movie_index += 1
end
studio_value_hash
end

def movies_with_directors_set(source)
  # GOAL: For each director, find their :movies Array and stick it in a new Array
  #
  # INPUT:
  # * source: An Array of Hashes containing director information including
  # :name and :movies
  #
  # RETURN:
  #
  # Array of Arrays containing all of a director's movies. Each movie will need
  # to have a :director_name key added to it.
  # movies_with_director_array = [ movies: ["At the park"], ["On the couch"]}, ]
array = []
director_index = 0

while director_index < source.length
  director_name_new = source[director_index][:name]
  director_movies = source[director_index][:movies]

  array.push(movies_with_director_key(director_name_new, director_movies))

  # while movie_index < source[director_index].length
  #   director_name_new = source[director_index][:name]
  #   individual_movie_data = source[director_index][:movies][movie_index][:title]
  #
  #   array.push({director_name_new => individual_movie_data})
  #
  #   movie_index += 1
  # end
  director_index += 1
end



array

end



# ----------------    End of Your Code Region --------------------
# Don't edit the following code! Make the methods above work with this method
# call code. You'll have to "see-saw" to get this to work!

def studios_totals(nds)
  a_o_a_movies_with_director_names = movies_with_directors_set(nds)
  movies_with_director_names = flatten_a_o_a(a_o_a_movies_with_director_names)
  return gross_per_studio(movies_with_director_names)
end
