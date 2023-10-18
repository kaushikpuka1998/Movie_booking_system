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

  def movie_crews_map(movies)
    movies.map do |movie|
      {
        crews: movie.crews,
        movie: movie
      }
    end
  end
end
