defmodule CurrencyConverter.Repo.Migrations.CreateCurrencies do
  use Ecto.Migration

  def change do
    create table(:currencies, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :name, :string
      add :code, :string

      timestamps()
    end

    create index(:currencies, :code, unique: true)
  end
end
