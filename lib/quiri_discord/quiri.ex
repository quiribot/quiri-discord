defmodule Quiri do
  use HTTPoision.Base

  def search(term, user) do
    get("/search").body[[term: term, user: user.id]]
  end

  def query()
end
