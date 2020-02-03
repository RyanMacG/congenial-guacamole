defmodule CurrencyConverter.DirectoryTest do
  use CurrencyConverter.DataCase

  alias CurrencyConverter.Directory

  describe "currencies" do
    alias CurrencyConverter.Directory.Currency

    @valid_attrs %{code: "EUR", name: "Euros"}
    @update_attrs %{code: "USD", name: "US Dollars"}
    @invalid_attrs %{code: nil, name: nil}

    def currency_fixture(attrs \\ %{}) do
      {:ok, currency} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Directory.create_currency()

      currency
    end

    test "list_currencies/0 returns all currencies" do
      currency = currency_fixture()
      assert Directory.list_currencies() == [currency]
    end

    test "get_currency!/1 returns the currency with given id" do
      currency = currency_fixture()
      assert Directory.get_currency!(currency.id) == currency
    end

    test "create_currency/1 with valid data creates a currency" do
      assert {:ok, %Currency{} = currency} = Directory.create_currency(@valid_attrs)
      assert currency.code == "EUR"
      assert currency.name == "Euros"
    end

    test "create_currency/1 with duplicate data returns error changeset" do
      _currency = currency_fixture()
      assert {:error, %Ecto.Changeset{}} = Directory.create_currency(@valid_attrs)
    end

    test "create_currency/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Directory.create_currency(@invalid_attrs)
    end

    test "update_currency/2 with valid data updates the currency" do
      currency = currency_fixture()
      assert {:ok, %Currency{} = currency} = Directory.update_currency(currency, @update_attrs)
      assert currency.code == "USD"
      assert currency.name == "US Dollars"
    end

    test "update_currency/2 with invalid data returns error changeset" do
      currency = currency_fixture()
      assert {:error, %Ecto.Changeset{}} = Directory.update_currency(currency, @invalid_attrs)
      assert currency == Directory.get_currency!(currency.id)
    end

    test "delete_currency/1 deletes the currency" do
      currency = currency_fixture()
      assert {:ok, %Currency{}} = Directory.delete_currency(currency)
      assert_raise Ecto.NoResultsError, fn -> Directory.get_currency!(currency.id) end
    end

    test "change_currency/1 returns a currency changeset" do
      currency = currency_fixture()
      assert %Ecto.Changeset{} = Directory.change_currency(currency)
    end
  end
end
