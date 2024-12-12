defmodule ElixsteoApp.Coupons.Coupon do
  use Ecto.Schema
  import Ecto.Changeset

  schema "coupons" do
    field :name, :string
    field :status, :string, default: "active"
    field :type, :string, default: "percentage"
    field :discount, :string
    field :currency_code, :string, default: "BRL"

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(coupon, attrs) do
    coupon
    |> cast(attrs, [:name, :type, :status, :discount, :currency_code])
    |> validate_required([:name, :type, :status, :discount, :currency_code])
    |> validate_length(:currency_code, is: 3)
  end
end
