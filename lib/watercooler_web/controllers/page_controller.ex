defmodule WatercoolerWeb.PageController do
  use WatercoolerWeb, :controller

  def home(conn, _params) do
    render(conn, :home)
  end
end
