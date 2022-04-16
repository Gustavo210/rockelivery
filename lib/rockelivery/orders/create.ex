defmodule Rockelivery.Orders.Create do
  import Ecto.Query
  alias Rockelivery.{Error, Item, Order, Repo}
  alias Rockelivery.Orders.ValidadeEndMultiplyItems

  def call(%{"items" => item_params} = params) do
    item_ids = Enum.map(item_params, fn item -> item["id"] end)

    query = from item in Item, where: item.id in ^item_ids

    query
    |> Repo.all()
    |> ValidadeEndMultiplyItems.call(item_ids, item_params)
    |> handle_items(params)
  end

  defp handle_items({:error, result}, _params) do
    {:error, Error.build(:bad_request, result)}
  end

  defp handle_items({:ok, items}, params) do
    params
    |> Order.changeset(items)
    |> Repo.insert()
    |> handle_insert()
  end

  defp handle_insert({:ok, %Order{}} = result), do: result

  defp handle_insert({:error, result}) do
    {:error, Error.build(:bad_request, result)}
  end
end
