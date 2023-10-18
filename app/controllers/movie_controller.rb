class MovieController < ApplicationController
  def movies_by_city
    city = City.find_by(pincode: params[:pincode])
    movies = city.movies if city.present?

    if movies.blank?
      render json: { status: 'ERROR', message: 'No movies found' },
             status: :ok
      return
    end

    data = movie_crews_map(movies)
    render json: { status: 'SUCCESS', message: 'Movies fetched',
                   data: data },
           status: :ok
  end

  def movie_shows
    show = Show.find_by(id: params[:show_id])
    if show.present?
      render json: { status: 'SUCCESS', message: 'Movies fetched',
                     data: show }
      return
    end
    render json: { status: 'ERROR', message: 'No shows found' } if show.blank?
    # movie = show.movies.last
    # crews = movie.crews
  end

  def cinema_halls_by_movie
    movie = Movie.find_by(id: params[:movie_id])
    if movie.nil?
      render json: { status: 'ERROR', message: 'No movies found' }
      return
    end

    cinema_halls = movie.unique_cinema_halls.by_city(params[:pincode])

    shows = cinema_halls.joins(hall_movie_shows: :show)
                        .where("start_time >= ?", DateTime.now)
                        .select(:id, :name, :start_time,
                                :end_time, 'shows.id as show_id')

    render json: { status: 'SUCCESS', message: 'Cinema halls fetched',
                   cinema_halls: cinema_halls, shows: shows }
  end
  #--------------------------------functions----------------------

  def shows_to_cinema_hall_map(show)
    shows_data =
      {
        start_time: show.start_time,
        end_time: show.end_time,
        cinema_hall: {
          id: show.cinema_halls.first.id,
          name: show.cinema_halls.first.name
        }
      }
  end

  def movie_crews_map(movies)
    movies.map do |movie|
      {
        crews: movie.crews,
        movie: movie
      }
    end
  end
end
