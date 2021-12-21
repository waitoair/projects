module Api
  module V1
    class ArticlesController < ApplicationController
      skip_before_action :verify_authenticity_token
      #lista todos os artigos por ordem ascendente(default) limitando pelos 5 primeiros
      def index #localhost:3000/api/v1/articles
        articles = Article.order('created_at LIMIT 5')
        render json: {status: 'success', message: 'Here are the Articles!', data: articles}, status: :ok
      end

      def show #localhost:3000/api/v1/articles/4
        article = Article.find(params[:id])
        render json: {status: 'success', message: 'Here is your Article :)', data: article}, status: :ok
      end

      def create #localhost:3000/api/v1/articles
        if article = Article.create(article_params)
          render json: {status: 'success', message: 'Article created!', data: article}, status: :ok
        else 
          render json: {status: 'error', message: 'Article could not be created!', data: article.errors}, status: :unprocessable_entity
        end
      end

      private
      def article_params
        params.require(:article).permit(:title, :body)
      end
    end
  end
end
