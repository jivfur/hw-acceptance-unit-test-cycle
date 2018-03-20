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
  expect(page).to have_content("#{title} was successfully updated.")
end

Then("I should see the movies sorted by title") do 
  previous = ""
  page.all("tbody tr").each do |tr|
    #puts tr.all('td')
    if previous <= tr.all('td')[0].text
      previous = tr.all('td')[0].text
    else
      return nil
    end
  end
end

Then("I should see the movies sorted by release date") do 
  previous = "1900-01-01".to_date
  page.all("tbody tr").each do |tr|
    #puts tr.all('td')
    if previous <= tr.all('td')[2].text.to_date
      previous = tr.all('td')[2].text.to_date
    else
      return nil
    end
  end
end

Then("I read Movie {string} deleted.") do |title|
   expect(page).to have_content("Movie '#{title}' deleted")
end


Then("I should visualize  new movie page") do
  new_movie_path()
end