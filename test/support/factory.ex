defmodule Rockelivery.Factory do
  use ExMachina.Ecto, repo: Rockelivery.Repo
  alias Rockelivery.User

  def user_params_factory do
    %{
      age: 20,
      address: "rua sla 20",
      cep: "12345678",
      cpf: "12345678901",
      email: "sla@sla.com",
      password: "123456",
      name: "sla"
    }
  end

  def user_factory do
    %User{
      age: 20,
      address: "rua sla 20",
      cep: "12345678",
      cpf: "12345678901",
      email: "sla@sla.com",
      password: "123456",
      name: "sla",
      id: "421e98f7-5700-4386-ab18-d1e96008b28a"
    }
  end
end
