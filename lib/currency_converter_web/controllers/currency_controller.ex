defmodule CurrencyConverterWeb.CurrencyController do
  use CurrencyConverterWeb, :controller

  alias CurrencyConverter.Directory
  alias CurrencyConverter.Directory.Currency

  action_fallback CurrencyConverterWeb.FallbackController

  def index(conn, _params) do
    currencies = Directory.list_currencies()
    render(conn, "index.json", currencies: currencies)
  end

  def create(conn, %{"currency" => currency_params}) do
    with {:ok, %Currency{} = currency} <- Directory.create_currency(currency_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.currency_path(conn, :show, currency))
      |> render("show.json", currency: currency)
    end
  end

  def show(conn, %{"id" => id}) do
    currency = Directory.get_currency!(id)
    render(conn, "show.json", currency: currency)
  end

  def update(conn, %{"id" => id, "currency" => currency_params}) do
    currency = Directory.get_currency!(id)

    with {:ok, %Currency{} = currency} <- Directory.update_currency(currency, currency_params) do
      render(conn, "show.json", currency: currency)
    end
  end

  def delete(conn, %{"id" => id}) do
    currency = Directory.get_currency!(id)

    with {:ok, %Currency{}} <- Directory.delete_currency(currency) do
      send_resp(conn, :no_content, "")
    end
  end
end
