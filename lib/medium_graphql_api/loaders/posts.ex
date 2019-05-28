defmodule MediumGraphqlApi.Loaders.Content do
  alias MediumGraphqlApi.Repo

  def data(), do: Dataloader.Ecto.new(Repo, query: &query/2)

  def query(queryable, params) do
    queryable
  end
end
