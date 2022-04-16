defmodule RockeliveryWeb.UsersViewTest do
  use RockeliveryWeb.ConnCase, async: true

  import Phoenix.View
  import Rockelivery.Factory

  alias RockeliveryWeb.UsersView

  test "renders create.json" do
    user = build(:user)

    response = render(UsersView, "create.json", user: user)

    assert %{
             message: "User created",
             user: %Rockelivery.User{
               address: "rua sla 20",
               age: 20,
               cep: "12345678",
               cpf: "12345678901",
               email: "sla@sla.com",
               id: "421e98f7-5700-4386-ab18-d1e96008b28a",
               inserted_at: nil,
               name: "sla",
               password: "123456",
               password_hash: nil,
               updated_at: nil
             }
           } = response
  end
end
