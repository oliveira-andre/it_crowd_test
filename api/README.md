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
