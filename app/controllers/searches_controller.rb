class SearchesController < ApplicationController
  def search
    @model = params["model"]
    @content = params["content"]
    @method = params["method"]
    @records = search_for(@model, @content, @method)
    @photos = Photo.all
  end

  private
  def search_for(model, content, method)
    if model == 'user'
      if method == 'perfect'
        User.where('last_name || first_name = "' + content + '"')
      else
        User.where('last_name LIKE "%' + content + '%" or first_name LIKE "%' + content + '%"')
      end
    elsif model == 'photo'
      if method == 'perfect'
        Photo.where('title = "' + content + '"')
      else
        Photo.where('title LIKE "%' + content + '%"')
      end
    end
  end

end
