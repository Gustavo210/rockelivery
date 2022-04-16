defmodule Rockelivery.UserTest do
  use Rockelivery.DataCase, async: true
  alias Ecto.Changeset
  alias Rockelivery.User

  import Rockelivery.Factory

  describe "changeset/2" do
    test "when all params are valid, retuns a valid changeset" do
      params = build(:user_params)

      response = User.changeset(params)

      assert %Changeset{changes: %{name: "sla"}, valid?: true} = response
    end

    test "when updating a changeset, returns a valid changeset with the given chagens" do
      params = build(:user_params)

      update_params = %{
        password: "123456",
        name: "irineu"
      }

      response =
        params
        |> User.changeset()
        |> User.changeset(update_params)

      assert %Changeset{changes: %{name: "irineu"}, valid?: true} = response
    end

    test "when there are some error, returns an invalid changeset" do
      params =
        build(:user_params, %{
          age: 15,
          password: "123"
        })

      response = User.changeset(params)

      expected_response = %{
        age: ["must be greater than or equal to 18"],
        password: ["should be at least 6 character(s)"]
      }

      assert errors_on(response) == expected_response
    end
  end
end
