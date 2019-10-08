defmodule TrelloApiWeb.BoardController do
  use TrelloApiWeb, :controller

  def index(conn, _params) do
    json(conn, %{})
  end
end
