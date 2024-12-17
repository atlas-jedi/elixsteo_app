defmodule ElixsteoAppWeb.CouponLive.Index do
  use ElixsteoAppWeb, :live_view

  alias ElixsteoApp.Coupons

  @impl true
  def mount(_params, _session, socket) do
    {:ok,
     socket
     |> stream(:coupons, Coupons.list_coupons())
     |> assign(:delete_modal_open, false)
     |> assign(:coupon_to_delete, nil)}
  end

  @impl true
  def handle_event("open_delete_modal", %{"id" => id}, socket) do
    {:noreply,
     socket
     |> assign(:delete_modal_open, true)
     |> assign(:coupon_to_delete, id)}
  end

  @impl true
  def handle_event("close_delete_modal", _params, socket) do
    {:noreply,
     socket
     |> assign(:delete_modal_open, false)
     |> assign(:coupon_to_delete, nil)}
  end

  @impl true
  def handle_event("delete_coupon", %{"id" => id}, socket) do
    coupon = Coupons.get_coupon!(id)
    {:ok, _} = Coupons.delete_coupon(coupon)

    {:noreply,
     socket
     |> stream(:coupons, Coupons.list_coupons())
     |> assign(:delete_modal_open, false)
     |> assign(:coupon_to_delete, nil)
     |> put_flash(:info, "Cupom excluído com sucesso")}
  end
end
