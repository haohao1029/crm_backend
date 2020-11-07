defmodule CrmBackendWeb.Router do
  use CrmBackendWeb, :router

  pipeline :api do
    plug CORSPlug, origin: "*"
    plug :accepts, ["json"]
  end

  scope "/api", CrmBackendWeb do
    pipe_through :api
    post "/datatable/:schema", PageController, :datatable
    post "/webhook", PageController, :webhook
    resources "/contacts", ContactController
    resources "/companies", CompanyController
    resources "/users", UserController
    resources "/roles", RoleController
    
  end
  scope "/api", CrmBackendWeb do 
    pipe_through :api
    options "/datatable/:schema", PageController, :options
    options "/webhook", PageController, :options
    options "/contacts", ContactController, :options
    options "/contacts/:id", ContactController, :options
    options "/companies", CompanyController, :options
    options "/companies/:id", CompanyController, :options
    options "/users", UserController, :options
    options "/users/:id", UserController, :options
    options "/roles", RoleController, :options
    options "/roles/:id", RoleController, :options
    
  end
  # Enables LiveDashboard only for development
  #
  # If you want to use the LiveDashboard in production, you should put
  # it behind authentication and allow only admins to access it.
  # If your application does not have an admins-only section yet,
  # you can use Plug.BasicAuth to set up some basic authentication
  # as long as you are also using SSL (which you should anyway).
  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through [:fetch_session, :protect_from_forgery]
      live_dashboard "/dashboard", metrics: CrmBackendWeb.Telemetry
    end
  end
end
