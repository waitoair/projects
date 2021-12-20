module Api
  module V1
    class ArticlesController < ApplicationController
      #lista todos os artigos por ordem ascendente(default) limitando pelos 5 primeiros
      def index #localhost:3000/api/v1/articles
        articles = Article.order('created_at LIMIT 5')
        render json: {status: 'success', message: 'Articles sucessfully created', data: articles}, status: :ok
      end

      def show #localhost:3000/api/v1/articles/4
        article = Article.find(params[:id])
        render json: {status: 'success', message: 'Here is your Article :)', data: article}, status: :ok
      end
    end
  end
end
