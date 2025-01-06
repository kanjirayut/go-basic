package repository

import (
	"backend/internal/models"
	"database/sql"
)

type DatabaseRepo interface {
	Connection() *sql.DB
	//get user by email
	GetUserByEmail(email string) (*models.User, error)
	//get user by id
	GetUserByID(id int) (*models.User, error)

	//Get All Movies
	AllMovies() ([]*models.Movie, error)
	//Get One Movies
	OneMovie(id int) (*models.Movie, error)
	//Get One Movies For Edit
	OneMovieForEdit(id int) (*models.Movie, []*models.Genre, error)
	//Get All Genres
	AllGenres() ([]*models.Genre, error)
	//Get One Movie
	InsertMovie(movie models.Movie) (int, error)
	//Update One Movie
	UpdateMovie(movie models.Movie) error
	//Update Movie Genres
	UpdateMovieGenres(id int, genreIDs []int) error
	//Delete Movie
	DeleteMovie(id int) error
}
