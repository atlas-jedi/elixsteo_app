defmodule ElixsteoApp.Repo.Migrations.CreateCoupons do
  use Ecto.Migration

  def change do
    create table(:coupons) do
      add :name, :string
      add :type, :string
      add :status, :string
      add :discount, :string
      add :currency_code, :string, size: 3

      timestamps(type: :utc_datetime)
    end
  end
end
