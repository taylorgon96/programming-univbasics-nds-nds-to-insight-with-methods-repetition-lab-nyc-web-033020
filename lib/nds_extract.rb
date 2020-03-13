$LOAD_PATH.unshift(File.dirname(__FILE__))
require_relative './directors_database'

def directors_totals(source)
  result = {}
  director_index = 0
  while director_index < source.size do
    director = source[director_index]
    result[director[:name]] = gross_for_director(director)
    director_index += 1
  end
  result
end

def gross_for_director(d)
  total = 0
  index = 0

  while index < d[:movies].length do
    total += d[:movies][index][:worldwide_gross]
    index += 1
  end

  total
end

def list_of_directors(source)
 new_arr = [] 
 new_arr << source[0][:name]
 new_arr << source[1][:name]
 new_arr << source[2][:name]
 new_arr << source[3][:name]
end


def total_gross(source)

  grand_total = 0
  directors_totals(source)[0].each do  |key, value| 
    list_of_directors(source)[0].each do |key|
      grand_total += value 
    end 
  end
  grand_total 
end
# Write this implementation
  #
  # Should use methods:
  # 1. directors_totals: returns a Hash of { dir_name => gross }
  # 2. list_of_directors: names provides an Array of directors names (use
  #
  # Visit each key (i.e. director name), look up the value in the hash
  # returned by directors_totals, and add it to a running total. When done,
  # return the total