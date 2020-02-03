defmodule CurrencyConverterWeb.Router do
  use CurrencyConverterWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", CurrencyConverterWeb do
    pipe_through :api
    resources "/currencies", CurrencyController, except: [:new, :edit]
  end
end
