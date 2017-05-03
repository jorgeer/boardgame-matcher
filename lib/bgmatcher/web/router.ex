defmodule Bgmatcher.Web.Router do
  use Bgmatcher.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Bgmatcher.Web do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    
    resources "/users", UserController do
      resources "/posts", PostController
    end
    
    resources "/sessions", SessionController, only: [:new, :create, :delete]
  end

  # Other scopes may use custom stacks.
  # scope "/api", Bgmatcher.Web do
  #   pipe_through :api
  # end
end
