class ArticlesController < ApplicationController
    # before action, call set_article method in these methods
    before_action :set_article, only: [ :edit, :update, :show, :destroy ]
    before_action :require_user, except: [ :index, :show ]
    before_action :require_same_user, only: [ :edit, :update, :destroy ]

    def index

        @articles = Article.paginate(page: params[:page], per_page: 5)

    end

    def new
        @article = Article.new
    end

    def edit
        # send @article instance variable to the view
        
    end

    def create
        
        @article = Article.new(article_params)

        @article.user = current_user

        if @article.save
            flash[:success] = "Article was successfully created"
            redirect_to article_path(@article)
        else
            render 'new'
        end
    end

    def update

        

        if @article.update(article_params)
            flash[:success] = "Article was succesfully updated"
            redirect_to article_path(@article)
        else
            render 'edit'
        end

    end

    def destroy

        
        @article.destroy
        flash[:danger] = "Article was succesfulle deleted"
        redirect_to articles_path

    end

    def show

        

    end

    private
        # method to remove redundant code in destroy, show, update and edit methods
        def set_article

            @article = Article.find(params[:id])

        end

        def article_params

            params.require(:article).permit(:title, :description)

        end

        def require_same_user
            # current_user from require_user method
            if current_user != @article.user
                flash[:danger] = "You can only delete or delete your own articles!"
                redirect_to root_path
            end
        end

end