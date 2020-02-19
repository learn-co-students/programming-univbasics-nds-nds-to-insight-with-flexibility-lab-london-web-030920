# Provided, don't edit
require 'directors_database'
require 'pry'
require 'pp'
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
    directors_array = []
    movie_index = 0 
    
    while movie_index < movies_collection.length do
    directors_array.push(movie_with_director_name(name, movies_collection[movie_index]))
    
    movie_index +=1
end

directors_array


end


def gross_per_studio(collection)
    total_studio_gross = {}
    movie_index = 0 
    
  while movie_index < collection.length do
    movie = collection[movie_index]
    
    # studio_name = collection[movie_index][:studio]
    studio_gross = collection[movie_index][:worldwide_gross]
    # total_studio_gross[studio_name] = 0 
    
    if !total_studio_gross[movie[:studio]]
      total_studio_gross[movie[:studio]] = studio_gross
    else 
      total_studio_gross[movie[:studio]] += studio_gross
    
    end
   
    movie_index+=1
  end
  
  total_studio_gross
end


def movies_with_directors_set(source)
 movie_director_array = []
 movie_director_index = 0 
 
 while movie_director_index < source.length do
    movie_director = source[movie_director_index][:name]
    movies_collection = source[movie_director_index][:movies]
  
  movie_director_array << movies_with_director_key(movie_director, movies_collection) 
   movie_director_index+=1
   
 end 

movie_director_array
 
end
  #
  # INPUT:
  # * source: An Array of Hashes containing director information including
  # :name and :movies
  #
  # RETURN:
  #
  # Array of Arrays containing all of a director's movies. Each movie will need
  # to have a :director_name key added to it.


# ----------------    End of Your Code Region --------------------
# Don't edit the following code! Make the methods above work with this method
# call code. You'll have to "see-saw" to get this to work!

def studios_totals(nds)
  a_o_a_movies_with_director_names = movies_with_directors_set(nds)
  movies_with_director_names = flatten_a_o_a(a_o_a_movies_with_director_names)
  return gross_per_studio(movies_with_director_names)
end
