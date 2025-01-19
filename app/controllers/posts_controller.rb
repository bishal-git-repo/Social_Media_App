class PostsController < ApplicationController
    before_action :authorize_request, except: [:index, :show]
    before_action :set_post, only: [:show, :update, :destroy]

    # GET /posts
    def index
        posts = Post.page(params[:page]).per(10)
        render json: {
            posts: posts,
            meta: {
                total_pages: posts.total_pages,
                total_posts: posts.total_count,
                current_page: posts.current_page
            }
        }, status: :ok
    end

    # GET /posts/:id
    def show
        render json: @post, status: :ok
    end

    # POST /posts
    def create
        post = @current_user.posts.new(post_params)
        if post.save
            render json: post, status: :created
        else
            render json: { errors: post.errors.full_messages }, status: :unprocessable_entity
        end
    end

    # PUT /posts/:id
    def update
        if @post.user == @current_user
            if @post.update(post_params)
                render json: @post, status: :ok
            else
                render json: { errors: @post.errors.full_messages }, status: :unprocessable_entity
            end
        else
            render json: { errors: 'Not authorized to update this post' }, status: :forbidden
        end
    end

    # DELETE /posts/:id
    def destroy
        if @post.user == @current_user
            @post.destroy
            head :no_content
        else
            render json: { error: 'Not authorized to delete this post' }, status: :forbidden
        end
    end

    private
    def post_params
        params.require(:post).permit(:title, :content)
    end

    private

    def set_post
        @post = Post.find_by(id: params[:id])
        render json: { error: 'Post not found' }, status: :not_found unless @post
    end
end
