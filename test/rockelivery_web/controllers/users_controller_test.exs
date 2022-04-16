defmodule RockeliveryWeb.UsersControllerTest do
  use RockeliveryWeb.ConnCase, async: true
  import Rockelivery.Factory

  describe "create/2" do
    test "when all params are valid, creates the user", %{conn: conn} do
      params = %{
        "age" => 20,
        "address" => "rua sla 20",
        "cep" => "12345678",
        "cpf" => "12345678901",
        "email" => "sla@sla.com",
        "password" => "123456",
        "name" => "sla"
      }

      response =
        conn
        |> post(Routes.users_path(conn, :create, params))
        |> json_response(:created)

      assert %{
               "message" => "User created",
               "user" => %{
                 "address" => "rua sla 20",
                 "age" => 20,
                 "cep" => "12345678",
                 "cpf" => "12345678901",
                 "email" => "sla@sla.com",
                 "id" => _id,
                 "name" => "sla"
               }
             } = response
    end

    test "when there is some error, returns the error", %{conn: conn} do
      params = %{
        "age" => 20,
        "name" => "sla"
      }

      response =
        conn
        |> post(Routes.users_path(conn, :create, params))
        |> json_response(:bad_request)

      expected_response = %{
        "message" => %{
          "address" => ["can't be blank"],
          "cep" => ["can't be blank"],
          "cpf" => ["can't be blank"],
          "email" => ["can't be blank"],
          "password" => ["can't be blank"]
        }
      }

      assert expected_response == response
    end
  end

  describe "delete/2" do
    test "when there is a user with the given id, deletes the user", %{conn: conn} do
      id = "421e98f7-5700-4386-ab18-d1e96008b28a"
      insert(:user)

      response =
        conn
        |> delete(Routes.users_path(conn, :delete, id))
        |> response(:no_content)

      assert response == ""
    end
  end
end
