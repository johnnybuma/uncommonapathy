class VisitorsController < ApplicationController

  def index

    @articles = Article.all



  end

end
