defmodule RandomNumberWeb.RandomNumberController do
  use RandomNumberWeb, :controller


  def random(conn, _params) do
    render(conn, :random, layout: false)
  end
end
