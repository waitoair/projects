module Api
  module V1
    class ArticlesController < ApplicationController
      #lista todos os artigos por ordem decrescente 
      def index
        articles = Article.order('created_at DESC')
        render json: {status: 'success', message: 'Articles sucessfully created', data: articles} status: :ok
      end
    end
  end
end
