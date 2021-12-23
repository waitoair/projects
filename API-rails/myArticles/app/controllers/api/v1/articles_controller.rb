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
      article = Article.new(article_params)
      if article.save
        render json: {status: 'success', message:'Saved article', data: article}, status: :ok
      else
        render json: {status: 'error', message:'Articles not saved', data: article.errors}, status: :unprocessable_entity
      end
    end

    def update  #localhost:3000/api/v1/articles/5
      article = Article.find(params[:id])
      if article.update_attributes(article_params)
        render json: {status: 'success', message:'Updated article', data: article}, status: :ok
      else
        render json: {status: 'error', message:'Articles not update', data: article.errors}, status: :unprocessable_entity
      end
    end

      def destroy #localhost:3000/api/v1/articles/6
        article = Article.find(params[:id])
        article.destroy
        render json: {status: 'success', message:'Deleted article', data: article}, status: :ok
      end

      private
      def article_params
        params.require(:article).permit(:title, :body)
      end
    end
  end
end
