defmodule ElixsteoAppWeb.SidebarComponent do
  use ElixsteoAppWeb, :live_component

  @links [
    %{"icon" => "hero-user", "label" => "Usuários", "path" => "/users"},
    %{"icon" => "hero-ticket", "label" => "Cupons", "path" => "/coupons"}
  ]

  @impl true
  def render(assigns) do
    assigns = assign(assigns, :links, @links)

    ~H"""
    <div class="sidebar-root">
      <div id={@id} class="fixed h-screen w-16 bg-sidebar text-sidebar-foreground border-r">
        <nav class="flex flex-col items-center py-4 space-y-4">
          <!-- Logo -->
          <div class="flex items-center justify-center w-5 h-5">
            <img
              src="/images/logo-mobile.svg"
              alt="Logo Diabinho"
              class="w-full h-full object-contain"
            />
          </div>
          
          <.nav_item
            :for={link <- @links}
            path={link["path"]}
            icon={link["icon"]}
            tooltip={link["label"]}
          />
        </nav>
      </div>
    </div>
    """
  end

  defp nav_item(assigns) do
    ~H"""
    <div class="group relative flex items-center justify-center">
      <.link navigate={@path} class="group-hover:text-primary">
        <.icon name={@icon} class="w-4 h-4" />
      </.link>
      
      <.tooltip>{@tooltip}</.tooltip>
    </div>
    """
  end
end
