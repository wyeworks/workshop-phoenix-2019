defmodule TrelloApiWeb.Router do
  use TrelloApiWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", TrelloApiWeb do
    pipe_through :api
  end
end
