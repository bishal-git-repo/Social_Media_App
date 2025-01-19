class UsersController < ApplicationController
  before_action :authorize_request, only: [:show, :posts]

  # POST /signup
  def create
    user = User.new(user_params)
    if user.save
      render json: {message: 'User created successfully', user: user}, status: :created
    else
      render json: { errors: user.errors.full_messages, full_errors: user.errors },
             status: :unprocessable_entity
    end
  end

    # GET /users/:id
    def show
        user = User.find(params[:id])
        if user
            render json: user, status: :ok
        else
            render json: { error: 'User not found' }, status: :not_found
        end
    end

    # GET /users/:id/posts
    def posts
        user = User.find_by(id: params[:id])
        if user
            posts = user.posts.page(params[:page]).per(10)
            render json: {
                posts: posts,
                meta: {
                    total_pages: posts.total_pages,
                    total_posts: posts.total_count,
                    current_page: posts.current_page
                }
            }, status: :ok
        else
            render json: { error: 'User not found' }, status: :not_found
        end
    end

    private

    def user_params
     params.require(:user).permit(:name, :email, :password, :role)
    end

end