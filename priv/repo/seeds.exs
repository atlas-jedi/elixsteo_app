# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     ElixsteoApp.Repo.insert!(%ElixsteoApp.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias ElixsteoApp.Repo
alias ElixsteoApp.Coupons.Coupon

# Clear existing coupons
Repo.delete_all(Coupon)

# Create sample coupons
[
  %{
    name: "WELCOME10",
    status: "active",
    discount: "10.0",
    type: "percentage"
  },
  %{
    name: "SAVE20",
    status: "active",
    discount: "20.0",
    type: "percentage"
  },
  %{
    name: "FIXED50",
    status: "active",
    discount: "50.0",
    type: "fixed"
  },
  %{
    name: "SUMMER2024",
    status: "inactive",
    discount: "15.0",
    type: "percentage"
  }
]
|> Enum.each(fn coupon_data ->
  %Coupon{}
  |> Coupon.changeset(coupon_data)
  |> Repo.insert!()
end)
