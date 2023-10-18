class UserController < ApplicationController
  include ErrorModule
  # POST /signup
  def create_user
    user = User.new(user_params)

    if user.save
      render json: { status: 'SUCCESS', message: 'User created', data: user },
             status: :ok
    elsif user.errors[:password_confirmation].present?
      render json: { status: 'ERROR', message: 'Password mismatched' },
             status: :ok
      # raise ErrorModule::PasswordMismatchedError, 'Password mismatched'
    elsif user.errors[:email].present?
      render json: { status: 'ERROR', message: 'Email already registered' },
             status: :ok
      # raise ErrorModule::AlreadyEmailTakenError, 'Email already registered'
    elsif user.errors[:phone].present?
      render json: { status: 'ERROR', message: 'Phone already registered' },
             status: :ok

      # raise ErrorModule::AlreadyPhoneTakenError, 'Phone already registered'
    else
      render json: { status: 'ERROR', message: 'User not created', data: user.errors },
             status: :unprocessable_entity
      # render json: { status: 'ERROR', message: 'User not created', data: user.errors },
      #        status: :unprocessable_entity
      #
    end
  end

  def movies_by_city
    city = City.find_by(pincode: params[:pincode])
    movies = city.movies if city.present?

    if movies.blank?
      render json: { status: 'ERROR', message: 'No movies found' },
             status: :ok
      return
    end
    render json: { status: 'SUCCESS', message: 'Movies fetched', data: movies },
           status: :ok
  end

  def movie_shows
    show = Show.find_by(id: params[:show_id])
    render json: { status: 'ERROR', message: 'No shows found' } if show.blank?
    show_cinema_map = shows_to_cinema_hall_map(show)
    movie = show.movies.last
    crews = movie.crews

    render json: { status: 'SUCCESS', message: 'Movies fetched',
                   data: { movie: movie, shows: show_cinema_map, crews: crews } }
  end

  def shows_to_cinema_hall_map(show)
    shows_data =
      {
        id: show.id,
        start_time: show.start_time,
        end_time: show.end_time,
        cinema_hall: {
          id: show.cinema_halls.first.id,
          name: show.cinema_halls.first.name
        }
      }
  end

  private

  def user_params
    params.permit(:email, :phone, :password, :password_confirmation)
  end
end
