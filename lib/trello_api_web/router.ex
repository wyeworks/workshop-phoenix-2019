defmodule TrelloApiWeb.Router do
  use TrelloApiWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", TrelloApiWeb do
    pipe_through :api
    get "/boards", BoardController, :index
    post "/boards", BoardController, :create
  end
end
