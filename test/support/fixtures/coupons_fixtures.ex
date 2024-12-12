defmodule ElixsteoApp.CouponsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `ElixsteoApp.Coupons` context.
  """

  @doc """
  Generate a coupon.
  """
  def coupon_fixture(attrs \\ %{}) do
    {:ok, coupon} =
      attrs
      |> Enum.into(%{
        name: "TEST10",
        discount: "10.0"
      })
      |> ElixsteoApp.Coupons.create_coupon()

    coupon
  end
end
