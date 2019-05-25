defmodule MediumGraphqlApiWeb.Resolvers.SessionResolver do
  def login_user(_, %{input: input}, _) do
    {:ok, %{token: jwt_token, user: user}}
  end
end
