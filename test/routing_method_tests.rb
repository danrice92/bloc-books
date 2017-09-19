require_relative "../config/application"
require "bloc_works"
require "test/unit"
require "rack/test"

# Write tests for map and look_up_url methods

class CrudTests < Test::Unit::TestCase
  include Rack::Test::Methods

  def app
    app = BlocBooks::Application.new

    app.route do
      map "", "books#welcome"
      map ":controller/:id/:action"
      map ":controller/:id", default: { "action" => "show" }
      map ":controller", default: { "action" => "index" }
    end

    app

  end

  def test_root_is_welcome_page
    get '/'
    assert last_response.ok?
    assert_equal "<div>\n  <p>Welcome to BlocBooks!</p>\n  <p>Please start by reading Eloquent Ruby.</p>\n</div>\n", last_response.body
  end

  def test_controller_defaults_to_show_view
    get '/books'
    assert last_response.ok?
    assert_equal "<h1>All books</h1>\n\n  <p><b>Name: </b><a href=\"show?id=1\">'The Well-Grounded Rubyist'</a></p>\n  <p><b>Author: </b>'David A. Black'</p>\n  <p><b>Pages: </b>520</p>\n  <br>\n  <p><b>Name: </b><a href=\"show?id=2\">'Practical Object-Oriented Design in Ruby'</a></p>\n  <p><b>Author: </b>'Sandi Metz'</p>\n  <p><b>Pages: </b>272</p>\n  <br>\n  <p><b>Name: </b><a href=\"show?id=3\">'Eloquent Ruby'</a></p>\n  <p><b>Author: </b>'Russ Olsen'</p>\n  <p><b>Pages: </b>448</p>\n  <br>\n", last_response.body
  end

  def test_controller_accepts_id
    get '/books/2'
    assert last_response.ok?
    assert_equal "<h1 style=\"font-size: 19px\"><b>Name: </b>'Practical Object-Oriented Design in Ruby'</h1>\n<p><strong>Author: </strong>'Sandi Metz'</p>\n<p><strong>Pages: </strong>272</p>\n", last_response.body
  end
end
