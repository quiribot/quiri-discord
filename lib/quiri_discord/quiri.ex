defmodule Quiri do
  use HTTPoision.Base

  def search(term, user) do
    get("/search").body[[form: [term: term, user: user.id]]] do
      {:ok, response} -> response,
      {:error, reason} -> "Error"
    end
  end

  def query() do
    get("/query")
  end
end
