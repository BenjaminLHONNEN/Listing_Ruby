class Api::V1::UsersController <  Api::V1::ApiController
  def index
    render json: User.all
  end
end