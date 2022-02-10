class SearchesController < ApplicationController
  def search
    @model = params["model"]
    @content = params["content"]
    @method = params["method"]
    @records = search_for(@model, @content, @method)
  end

  private
  def search_for(model, content, method)
    if model == 'user'
    if method == 'perfect'
     User.where(last_name,first_name: content)
    else
     User.where('name LIKE ?', '%'+content+'%')
    end
    elsif model == 'photo'
    if method == 'perfect'
     Book.where(title: content)
    else
     Book.where('title LIKE ?', '%'+content+'%')
    end
    end
  end

end
