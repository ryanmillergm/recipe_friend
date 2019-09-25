# Recipe Friend

This project is for users to find, add, share and convert recipes. Greate for restaurants who need different batch sizes! Users can input in the number of portions they want and the recipe will automatically convert the quantity for ingredients. This app also makes it easy to create a grocery list according to ingredients in a recipe. Recipe's are of course rated and commented on by any registered user. A user can create or join groups and once in a group can chat with each other in a chatroom. 

This REST API has several endpoints for basic CRUD functionality of **users**, **recipes**, **comments**, **grocery_list**, **friends** and **groups**. All responses are JSON.

The app is deployed at https://somewhere.com.

View the project board at https://github.com/ryanmillergm/recipe_friend/projects/1

## Schema
![schema](./public/images/schema.png)

## Tech Stack
 - Framework: Ruby on Rails v5.2.3
 - Language: Ruby
 - Database: PostgreSQL v7.12.1
 - Query Language: GraphQL v1.8.13
 - Testing: RSpec

## Other Packages
 - Figaro
 - Faraday
 - Active Model Serializers v0.10.0

## Local Setup
 - `$ git clone https://github.com/ryanmillergm/recipe_friend.git`
 - `$ cd recipe_friend`
 - `$ bundle exec install`
 - `$ bundle exec rails db:create`
 - `$ bundle exec rails db:migrate`
 - `$ bundle exec rails db:seed`
 - `$ bundle exec figaro install`

## Additional steps
 -

## Running the Server Locally
 - `$ rails s`
 - Access local endpoints at `http://localhost:3000/graphql`
 - Access deployed endpoints at `https://somewhere.com`

## Running the Test Suite
 - `$ rspec`

## API Endpoints
### List all users in the database
Request:
```
GET /graphql
Body: GraphQL
{
    allUsers {
        id
        firstName
        lastName
        email
        phone
    }
}
```
Example response:
```
Status: 200
Body:
{
    "data": {
        "allUsers": [
            {
                "id": "1",
                "firstName": "joe",
                "lastName": "bob",
                "email": "joebob@gma\nil.com",
                "phone": 5555555555
            },
            {
                "id": "2",
                "firstName": "chris",
                "lastName": "johnson",
                "email": "chris@gmail.com",
                "phone": 34534543534
            }
        ]
    }
}
```
### List one specific user by id in the database
Request:
```
GET /graphql
Body: GraphQL
{
  user(id: "4") {
    firstName
    lastName
  }
}
```
Example response:
```
Status: 200
Content-Type: application/json
Body:
{
  "data": {
    "user": {
      "firstName": "Miss",
      "lastName": "Piggy"
    }
  }
}
```
### Create a new user
Request:
```
POST /graphql
Body: GraphQL
```
Example response:
```
mutation {
  createUser(
    firstName: "joe",
    lastName: "bob",
    username: "joebob",
    authProvider: {
      email: {
        email: "joebob@gmail.com",
   			password: "password"
      }
    },
    phone: 9327482,
    avatar: "image",
    about: "about",
    backgroundImage: "image"
  ){
    firstName
    lastName
    username
    email
    phone
    avatar
    about
    backgroundImage
  }
}
```
Example successful response:
```
Status: 200
Content-Type: application/json
Body:
{
  "data": {
    "createUser": {
      "firstName": "joe",
      "lastName": "bob",
      "username": "joebob",
      "email": "joebob@gmail.com",
      "phone": 9327482,
      "avatar": "image",
      "about": "about",
      "backgroundImage": "image"
    }
  }
}
```
Failed response (did not include username or email):
```
Status: 400
Body:
{
  "errors": [
    {
      "message": "Field 'createUser' is missing required arguments: username",
      "locations": [
        {
          "line": 2,
          "column": 3
        }
      ],
      "fields": [
        "mutation",
        "createUser"
      ]
    }
  ]
}
```
Failed response (duplicate email):
```
Status: 422
Body:
*UPDATE!!!
{ "error": "That email is already taken" }
```
### Update an existing user by id in the database
Request:
```
GET /graphql
Body: GraphQL
mutation {
  updateUser(
    id: 5
    firstName: "Johnny"
  )
  {
    id
    firstName
    lastName
    username
    email
    phone
    avatar
    about
    backgroundImage
  }
}
```
Example successful response:
```
{
  "data": {
    "updateUser": {
      "id": "5",
      "firstName": "Johnny",
      "lastName": "Waldorf",
      "username": "Grumpy",
      "email": "grouches@muppets.com",
      "phone": 1118889999,
      "avatar": "https://pm1.narvii.com/7110/b456dd8951e3ae3e8c3969ee2fbe5c101d5fe912r1-1232-816v2_128.jpg",
      "about": "always complaining about other riders",
      "backgroundImage": "https://www.redlandsdailyfacts.com/wp-content/uploads/migration/2016/201609/NEWS_160919986_AR_0_QYVJSPJQZBCE.jpg?w=535"
    }
  }
}
```
### Remove a user from the database (based on the id)
Request (enter the id of the user into `:id`):
```
GET /graphql
Body: GraphQL
mutation {
  deleteUser(id: 3)
  {
    id
    firstName
    lastName
    username
    email
    phone
  }
}

```
Successful deletion response:
```
{
  "data": {
    "deleteUser": {
      "id": "3",
      "firstName": "Miss",
      "lastName": "Piggy",
      "username": "Pink Pig",
      "email": "piggy@muppets.com",
      "phone": 1114445555
    }
  }
}
```
Failed deletion response (did not find a user with that id):
```
{
  "error": {
    "message": "Couldn't find User with 'id'=55",
    "backtrace": []
  },
  "data": {}
}
```

## Core Contributors
 - Ryan Miller, [@ryanmillergm](https://github.com/ryanmillergm)

### How to Contribute
 - Fork and clone the [repo](https://github.com/ryanmillergm/recipe_friend.git)
 - Make changes on your fork & push them to GitHub
 - Visit https://github.com/ryanmillergm/recipe_friend and click `New pull request`

## Known Issues
 -
