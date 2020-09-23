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
  ```json
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
  ```json
  {
    "token": "eyJhbGciOiJIUzI1NiJ9.eyJkYXRhIjoxMSwiZXhwIjoxNjAwODUzNTY4fQ.-YMcYqNv4rxhmu63qvjIee3FWIbvFJTO4Q2mV4_FX_g"
  }
  ```
</details>

### Movies

<details>
  <summary>Index</summary>

  curl:
  ```
  curl -kv -H 'content-type: application/json' -X 'GET' 'http://localhost:3000/api/v1/movies/' | jq
  ```

  expected status: 200

  expected output:
  ```json
  [
    {
      "id": 30,
      "title": "Back to the future",
      "release_year": "MM",
      "directors": [
        {
          "movie_person_id": 18,
          "first_name": "root",
          "last_name": "admin",
          "email": "root@root.com"
        }
      ]
    }
  ]
  ```
</details>

<details>
  <summary>Create</summary>

  curl:
  ```
  curl -kv -H 'content-type: application/json' -H 'authorization: bearer eyJhbGciOiJIUzI1NiJ9.eyJkYXRhIjoxMSwiZXhwIjoxNjAwODg4NTk4fQ.9rZJDeUMiGoam7_h0M_U6KX-7BTynIM3zATh4hKZLX8' -X 'POST' -d '{ "title": "Back to the future", "released_at": "28/04/2000", "movie_people_attributes": [{"role": "actors", "person_id": "11"}] }' 'http://localhost:3000/api/v1/movies' | jq
  ```

  expected status: 201
  
  expected output:
  ```json
  {
    "id": 30,
    "title": "Back to the future",
    "release_year": "MM",
    "cascating": [
      {
        "movie_person_id": 18,
        "first_name": "root",
        "last_name": "admin",
        "email": "root@root.com"
      }
    ]
  }
  ```
</details>

<details>
  <summary>Update</summary>

  curl:
  ```
  curl -kv -H 'content-type: application/json' -H 'authorization: bearer eyJhbGciOiJIUzI1NiJ9.eyJkYXRhIjoxMSwiZXhwIjoxNjAwOTA0ODUxfQ.wK3S1eq-66YOMycCAuUTb__6VkPPHPTzB4rrn408Dds' -X 'PUT' -d '{ "title": "Back to the future", "released_at": "28/04/2000", "movie_people_attributes": [{"id": "18", "role": "director", "person_id": "11"}] }' 'http://localhost:3000/api/v1/movies/30' | jq
  ```

  expected status: 202

  expected output:
  ```json
  {
    "id": 30,
    "title": "Back to the future",
    "release_year": "MM",
    "directors": [
      {
        "movie_person_id": 18,
        "first_name": "root",
        "last_name": "admin",
        "email": "root@root.com"
      }
    ]
  }
  ```
</details>

<details>
  <summary>Destroy</summary>

  curl:
  ```
  curl -kv -H 'content-type: application/json' -H 'authorization: bearer eyJhbGciOiJIUzI1NiJ9.eyJkYXRhIjoxMSwiZXhwIjoxNjAwOTA0ODUxfQ.wK3S1eq-66YOMycCAuUTb__6VkPPHPTzB4rrn408Dds' -X 'DELETE' 'http://localhost:3000/api/v1/movies/31' | jq
  ```

  expected status: 204
</details>

<details>
  <summary>Show</summary>

  curl:
  ```
  curl -kv -H 'content-type: application/json' -H 'authorization: bearer eyJhbGciOiJIUzI1NiJ9.eyJkYXRhIjoxMSwiZXhwIjoxNjAwOTA0ODUxfQ.wK3S1eq-66YOMycCAuUTb__6VkPPHPTzB4rrn408Dds' -X 'GET' 'http://localhost:3000/api/v1/movies/30' | jq
  ```

  expected status: 200

  expected output:
  ```json
  {
    "id": 30,
    "title": "Back to the future",
    "release_year": "MM",
    "directors": [
      {
        "movie_person_id": 18,
        "first_name": "root",
        "last_name": "admin",
        "email": "root@root.com"
      }
    ]
  }
  ```
</details>
