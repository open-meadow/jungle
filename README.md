# Jungle

Jungle is an inherited codebase in which I performed several bug fixes and feature additions.

<!-- ## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rails db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails s -b 0.0.0.0` to start the server

## Database

If Rails is complaining about authentication to the database, uncomment the user and password fields from `config/database.yml` in the development and test sections, and replace if necessary the user and password `development` to an existing database user.

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

- Rails 6.1 [Rails Guide](http://guides.rubyonrails.org/v6.1/)
- Bootstrap 5
- PostgreSQL 9.x
- Stripe -->

## Added Features

### Category editing for Admins
Allow website admins to create and edit product categories.
> Admin Categories

![screenshot](https://github.com/open-meadow/scheduler/blob/d89e4d7a41476328005519e4c462f2fbd1e82af5/docs/1-displaying_appointments.png)

### Dashboard for Admins
Create Dashboard for Admins to view categories and products
> Admin Dashboard

![screenshot](https://github.com/open-meadow/scheduler/blob/d89e4d7a41476328005519e4c462f2fbd1e82af5/docs/1-displaying_appointments.png)

### Allow Admins to add or remove Holiday Discount periods
### About Page
### User Authentication
### E-mail receipt
### Product reviews and ratings

## UI Improvements
### Sold-out badge
When a product has a quantity of zero, a badge is displayed by the product to reflect this.

> Sold out badge

![screenshot](https://github.com/open-meadow/scheduler/blob/d89e4d7a41476328005519e4c462f2fbd1e82af5/docs/1-displaying_appointments.png)




### Order details

## Bug fixes
### Inventory Adjustment
Accurately reduce inventory whenever a user makes a purchase.

> Inventory Adjustment

![screenshot](https://github.com/open-meadow/scheduler/blob/d89e4d7a41476328005519e4c462f2fbd1e82af5/docs/1-displaying_appointments.png)  

### Admin Authentication
### Display formatting
### Empty Cart

## Testing
Various tests through RSpec and Cypress