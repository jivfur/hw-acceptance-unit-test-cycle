Given("the following movies exist:") do |table|
  table.hashes.each do |movie|
    Movie.create!(movie)
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
    end
end

When("the edit page for {string}") do |title|
    movie = Movie.find_by_title(string)
    edit_movie_path(movie.id)
end

When("Find Movies With Same Director") do
  movie = Movie.find_by_title('Star Wars')
  samedirector_movie_path(movie)
end 


Then("the director of {string} should be {string}")  do |title, director|
  expect(page).to have_content("#{director} was successfully updated.")
end