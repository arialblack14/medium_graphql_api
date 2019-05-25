defmodule MediumGraphqlApi.Accounts.Session do
  alias MediumGraphqlApi.Accounts.User
  alias MediumGraphqlApi.Repo

  def authenticate(args) do
    user = Repo.get_by(User, email: String.downcase(args.email))

    case check_password(user, args) do
      true -> {:ok, user}
      _ -> {:error, "Invalid login credentials"}
    end
  end

  defp check_password(nil, args), do: Argon2.no_user_verify()
  defp check_password(user, args), do: Argon2.verify_pass(args.password, user.password_hash)
end
