# Kairanban API

It is a REST API connected to the Kairanban Web App. It contains all the restaurants used in the application and allows to:
- Read all or one specific restaurant.
- Add a new restaurant.
- Update or delete a certain restaurant only if you are its owner.

## How to use

In case you want to do actions such as adding a new restaurant, updating it or deleting it, you first need to **become a user of Kairanban**, a platform to connect with your local communities (https://good-neighbour.herokuapp.com/).

#### Check all the available restaurants
GET https://good-neighbour-api.herokuapp.com/api/v1/shops

#### Check one specific restaurant
GET https://good-neighbour-api.herokuapp.com/api/v1/shops/[shop_id]

#### Add a new restaurant
POST https://good-neighbour-api.herokuapp.com/api/v1/shops

Attach a body that contains "name", "address", "phone number", "website" and "image". 
You must also add the email from when you registered as a user in Kairanban, as well as the unique Token given to you as a user.

#### Update a restaurant
PATCH https://good-neighbour-api.herokuapp.com/api/v1/shop/[shop_id]

Attach a body that contains the information you want to update for the restaurant.
You must also add the email from when you registered as a user in Kairanban, as well as the unique Token given to you as a user.

**NOTE**: It is important to note that you need to be the owner of the restaurant for you to be able to update its information.

#### Delete a restaurant
DELETE https://good-neighbour-api.herokuapp.com/api/v1/shop/[shop_id]

You must add the email from when you registered as a user in Kairanban, as well as the unique Token given to you as a user.

**NOTE**: It is important to note that you need to be the owner of the restaurant for you to be able to update its information.
