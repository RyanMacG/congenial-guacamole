# CurrencyConverter

To start your Phoenix server:

  * Install Elixir
  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.setup`
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Usage

### Currencies

#### Create a currency

To create a new currency send a JSON post to the currencies endpoint with currency as the body and the name and short code of the currency you want to add.

```sh
curl -X POST \
  http://localhost:4000/api/currencies \
  -H 'cache-control: no-cache' \
  -H 'content-type: application/json' \
  -d '{
	"currency": {
		"name": "Euros",
		"code": "EUR"
	}
}'
```

response:
```json
  {
      "data": {
          "code": "EUR",
          "id": "db89e438-edc2-46af-b0bf-f004ec671588",
          "name": "Euros"
      }
  }
```

### Update a currency

To update submit a patch or put to the specific currency endpoint and sned across the field(s) you want to change as part of the currency body

```sh
curl -X PATCH \
  http://localhost:4000/api/currencies/db89e438-edc2-46af-b0bf-f004ec671588 \
  -H 'cache-control: no-cache' \
  -H 'content-type: application/json' \
  -d '{
	"currency": {
		"code": "USD"
	}
}'
```

response:
```json
  {
      "data": {
          "code": "EUR",
          "id": "db89e438-edc2-46af-b0bf-f004ec671588",
          "name": "USD"
      }
  }
```

#### List Currencies

Submitting a get request to the currencies endpoint will provide an index of all currencies

```sh
curl -X GET \
  http://localhost:4000/api/currencies \
  -H 'cache-control: no-cache' \
  -H 'content-type: application/json'
```

response:
```json
{
    "data": [
        {
            "code": "GBP",
            "id": "14376d5e-5ec1-47bd-866a-6de1f2cfb0e8",
            "name": "Pounds Sterling"
        }
    ]
}
```

#### Show Currency

Submitting a get request to the currencies endpoint with the ID of a specific currency will returns it's details

```sh
curl -X GET \
  http://localhost:4000/api/currencies/14376d5e-5ec1-47bd-866a-6de1f2cfb0e8 \
  -H 'cache-control: no-cache' \
  -H 'content-type: application/json'
```

response:
```json
{
    "data": {
        "code": "GBP",
        "id": "14376d5e-5ec1-47bd-866a-6de1f2cfb0e8",
        "name": "Pounds Sterling"
    }
}
```

## Learn more

  * Official website: http://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Mailing list: http://groups.google.com/group/phoenix-talk
  * Source: https://github.com/phoenixframework/phoenix
