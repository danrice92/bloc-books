require_relative "../config/application"
require "test/unit"
require "rack/test"


# Create a model, views, a controller, and actions for a new Library class

# Implement Rails-style view instance variables (like @some_book)

# write tests for call
class CrudTests < Test::Unit::TestCase
  include Rack::Test::Methods

  def app
    BlocBooks::Application.new
  end

  def test_welcome_page
    get '/books/welcome'
    assert last_response.ok?
    assert_equal "<div>\n  <p>Welcome to BlocBooks!</p>\n  <p>Please start by reading Eloquent Ruby</p>\n</div>\n", last_response.body
    assert last_response.header.has_value?("text/html")
  end

  # library tests. decided any one user only has one library, and any one user/library can have many books.

  # the view of the entire library of books. basically the same as a book index view would be.
  def test_show_library
    get '/libraries/show'
    assert last_response.ok?
    assert_equal "<div>\n  <p>Welcome to your BlocBooks library. All of your books are listed below.</p>\n</div>\n", last_response.body
    assert last_response.header.has_value?("text/html")
  end

  # only really ever done when a new user creates a BlocBooks account.
  def test_new_library
    get '/libraries/new'
    assert last_response.ok?
    assert last_response.header.has_value?("text/html")
  end

  def test_create_library
    get '/libraries/create'
    assert last_response.ok?
    assert last_response.header.has_value?("text/html")
  end

  def test_edit_library
    get '/libraries/edit'
    assert last_response.ok?
    assert last_response.header.has_value?("text/html")
  end

  def test_update_library
    get '/libraries/update'
    assert last_response.ok?
    assert last_response.header.has_value?("text/html")
  end

  # no edit or update methods for library, destroy_library closes account.
  def test_destroy_library
    get '/libraries/destroy'
    assert last_response.ok?
    assert last_response.header.has_value?("text/html")
  end

  # books tests.

  # shows a single book
  def test_show_book
    get '/books/show'
    assert last_response.ok?
    assert last_response.header.has_value?("text/html")
  end

  # fill out form to add a book to the library
  def test_new_book
    get '/books/new'
    assert last_response.ok?
    assert last_response.header.has_value?("text/html")
  end

  # creating the book in the library
  def test_create_book
    get '/books/create'
    assert last_response.ok?
    assert last_response.header.has_value?("text/html")
  end

  # edit occurs before update
  def test_edit_book
    get '/books/edit'
    assert last_response.ok?
    assert last_response.header.has_value?("text/html")
  end

  # update stores in database, theoretically.
  def test_update_book
    get '/books/update'
    assert last_response.ok?
    assert last_response.header.has_value?("text/html")
  end

  # deletes a book from the library
  def test_destroy_book
    get '/books/destroy'
    assert last_response.ok?
    assert last_response.header.has_value?("text/html")
  end
end
