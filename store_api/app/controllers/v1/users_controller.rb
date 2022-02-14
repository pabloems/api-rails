#  es necesario agregar module v1
# por la ubicación de la carpeta

module V1
  class UsersController < ApplicationController

    def create
      @user = Owner.new(user_params)
      if @user.valid?
          @user.save
          # creamos un token en caso de que 
          # el usuario pueda crear su cuenta
          @token = @user.tokens.create
          render :show, status: :created
        # render json: @user, status: :created
      else
        # key errors
        # encuentra su definidición en create_spec line:48
        render json: {errors: @user.errors.messages}, status: :bad_request
      end
    end

    def login
      # en la tabla de usuario buscaremos login_params
      @user = User.find_by(email: login_params[:email])
      # si el usuario está presente, se puede autenticar
      # authenticate es palabra reservada de la gema scrypt
      if @user.present? && @user.authenticate(login_params[:password])
        @token = @user.tokens.create
        render :show
      else
        render( json: { errors: I18n.t('user.bad_credentials') }, status: :bad_request )
      end
    end

  private

    def login_params
      params.require(:user).permit( :email, :password)
    end

    def user_params
      # debemos escribir password, para que bycript
      # reconozca que existe params password
      # y establezca una password encryptada
      params.require(:user).permit(:email, :age, :password, store_attributes: %i[name])
      # el parámentro store_attributtes está nesteado
    end

  end

end