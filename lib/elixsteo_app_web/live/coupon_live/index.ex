defmodule ElixsteoAppWeb.CouponLive.Index do
  use ElixsteoAppWeb, :live_view

  alias ElixsteoApp.Coupons

  @impl true
  def mount(_params, _session, socket) do
    {:ok, stream(socket, :coupons, Coupons.list_coupons())}
  end
end
