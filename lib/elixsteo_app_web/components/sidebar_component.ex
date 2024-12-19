defmodule ElixsteoAppWeb.SidebarComponent do
  use ElixsteoAppWeb, :live_component

  def render(assigns) do
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
          
          <div class="group relative flex items-center justify-center">
            <.link navigate={~p"/users"} class="group-hover:text-primary">
              <.icon name="hero-user" class="w-4 h-4" />
            </.link>
            
            <.tooltip>Usuários</.tooltip>
          </div>
          
          <div class="group relative flex items-center justify-center">
            <.link navigate={~p"/coupons"} class="group-hover:text-primary">
              <.icon name="hero-ticket" class="w-4 h-4" />
            </.link>
            
            <.tooltip>Cupons</.tooltip>
          </div>
        </nav>
      </div>
    </div>
    """
  end
end
