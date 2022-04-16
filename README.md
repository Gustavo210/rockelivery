# Rockelivery

To start your Phoenix server:

- Install dependencies with `mix deps.get`
- Create and migrate your database with `mix ecto.setup`
- Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

# How to use

## User

To create a user

Path: POST `/api/users`

```json
{
  "address": "rua dos cajus",
  "age": 19,
  "cep": "12345644",
  "cpf": "12345678921",
  "email": "cajus@cajus.com",
  "name": "cajusman",
  "password": "123"
}
```

<br />

To get user

Path: GET `/api/users/{uuid}`

<br />

To delete user

Path: DELETE `/api/users/{uuid}`

<br />
To modify params of user

Path: PUT `/api/users/{uuid}`

```json
{
  "address": "rua dos cajus",
  "age": 19,
  "cep": "12345644",
  "cpf": "12345678921",
  "email": "cajus@cajus.com",
  "name": "cajusman",
  "password": "123"
}
```

<br />

## Item

To create a item

Path: POST `/api/items/`

```json
{
  "description": "suco de maracuja com limão",
  "category": "drink",
  "price": 5.02,
  "photo": "/temp/suco-de-maracuja.svg"
}
```

<br />

## Order

To create a order

Path: POST `/api/orders/`

```json
{
  "user_id": "0167573e-8ccf-4d64-b70a-e9348e71609f",
  "address": "ali perto de casa",
  "items": [
    {
      "id": "f86b71af-c592-4ceb-bcb9-e95200a4ba96",
      "quantity": 2
    },
    {
      "id": "6c4e12dd-9d0a-4cc5-89d8-4f51815174d0",
      "quantity": 3
    }
  ],
  "comments": "compra de produtos",
  "payment_method": "money"
}
```
