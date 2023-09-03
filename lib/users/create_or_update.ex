defmodule Flightex.Users.CreateOrUpdate do
  alias Flightex.Users.User
  alias Flightex.Users.Agent, as: UserAgent

  def call(%{name: name, cpf: cpf, email: email}) do
    name
    |> User.build(email, cpf)
    |> save_user()
  end

  defp save_user({:ok, %User{} = user}), do: UserAgent.save(user)
  defp save_user({:error, _reason} = error), do: error
end
