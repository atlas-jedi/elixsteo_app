defmodule ElixsteoAppWeb.CouponLive do
  use ElixsteoAppWeb, :live_view

  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  def handle_event("toggle-dropdown", _params, socket) do
    {:noreply, socket}
  end

  def handle_event("close", _params, socket) do
    {:noreply, socket}
  end
end
