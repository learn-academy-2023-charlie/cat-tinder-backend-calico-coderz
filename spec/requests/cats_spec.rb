require 'rails_helper'

RSpec.describe "Cats", type: :request do
  describe "GET /index" do
    it "gets a list of cats" do
      Cat.create(
        name: 'Winston',
        age: 3,
        hobbies: 'hunts birds',
        image: 'https://images.unsplash.com/photo-1492370284958-c20b15c692d2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1049&q=80'
      )

      get '/cats' 

      cat = JSON.parse(response.body) 
      expect(response).to have_http_status(200)
      expect(cat.length).to eq 1
    end
  end

  describe "POST /create" do
    it "creates a cat" do
      cat_params = {
        cat: {
          name: 'Winston',
          age: 3,
          hobbies: 'hunt birds',
          image: 'https://images.unsplash.com/photo-1492370284958-c20b15c692d2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1049&q=80'
        }
      }

      post '/cats', params: cat_params
      expect(response).to have_http_status(200)
      cat = Cat.first
      expect(cat.name).to eq 'Winston'
      
    end
  end

  # describe "PATCH /update" do
  #   it "updates a cat" do
  #     cat_params = {
  #       cat: {
  #         name: 'Winston',
  #         age: 4,
  #         hobbies: 'hunt birds',
  #         image: 'https://images.unsplash.com/photo-1492370284958-c20b15c692d2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1049&q=80'
  #       }
  #     }

  #     patch '/cats', params: cat_params
  #     expect(response). to have_http_status(200)
  #     cat = Cat.age
  #     expect(cat.age).to eq '4'
  #   end
  # end

end

