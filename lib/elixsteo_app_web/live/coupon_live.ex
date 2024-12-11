defmodule ElixsteoAppWeb.CouponLive do
  use ElixsteoAppWeb, :live_view

  def mount(_params, _session, socket) do
    socket = assign(socket, dropdown_open: false)
    {:ok, socket}
  end

  def handle_event("toggle-dropdown", _params, socket) do
    socket = assign(socket, dropdown_open: !socket.assigns.dropdown_open)
    {:noreply, socket}
  end

  def handle_event("close", _params, socket) do
    socket = assign(socket, dropdown_open: false)
    {:noreply, socket}
  end
end
