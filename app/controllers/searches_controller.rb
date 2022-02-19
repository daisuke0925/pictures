class SearchesController < ApplicationController
  def search
    @model = params['model']
    @content = params['content']
    @method = params['method']
    @records = search_for(@model, @content, @method)
    @photos = Photo.all
  end

  private
  #検索機能
  def search_for(model, content, method)
    if model == 'user' #ユーザーモデルの場合
      if method == 'perfect'#完全一致
        User.where('last_name || first_name = "' + content + '"')#姓名が完全一致
      else#部分一致
        User.where('last_name LIKE "%' + content + '%" or first_name LIKE "%' + content + '%"')#姓名どちらかが一致
      end
    elsif model == 'photo'#投稿モデルの場合
      if method == 'perfect'
        Photo.where('title = "' + content + '"')#タイトルが完全一致
      else
        Photo.where('title LIKE "%' + content + '%"')#タイトルが部分一致
      end
    end
  end
end
