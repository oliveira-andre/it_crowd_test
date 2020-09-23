# Responses

### Persons

<details>
  <summary>Create</summary>

  curl:
  ```
  curl -kv -H 'content-type: application/json' -X 'POST' -d '{ "first_name": "root", "last_name": "admin", "email": "root@root.com", "password": "123456"}' 'http://localhost:3000/api/v1/people' | jq
  ```

  expected status: 201

  expected output:
  ```
  {
    "first_name": "root",
    "last_name": "admin",
    "email": "root@root.com"
  }
  ```
</details>

### Sessions

<details>
  <summary>Create</summary>

  curl:
  ```
  curl -kv -H 'content-type: application/json' -X 'POST' -d '{ "email": "root@root.com", "password": "123456" }' 'http://localhost:3000/api/v1/sessions' | jq
  ```

  expected status: 201

  expected output:
  ```
  {
    "token": "eyJhbGciOiJIUzI1NiJ9.eyJkYXRhIjoxMSwiZXhwIjoxNjAwODUzNTY4fQ.-YMcYqNv4rxhmu63qvjIee3FWIbvFJTO4Q2mV4_FX_g"
  }
  ```
</details>
