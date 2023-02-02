# Jungle

Jungle is an inherited codebase in which I performed several bug fixes and feature additions.

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
Allow Admins to create and remove new Discount periods
> Admin Sales Dashboard

![screenshot](https://github.com/open-meadow/scheduler/blob/d89e4d7a41476328005519e4c462f2fbd1e82af5/docs/1-displaying_appointments.png)

> Admin Create New Sale

![screenshot](https://github.com/open-meadow/scheduler/blob/d89e4d7a41476328005519e4c462f2fbd1e82af5/docs/1-displaying_appointments.png)

> Display Current Sale on Webpage

![screenshot](https://github.com/open-meadow/scheduler/blob/d89e4d7a41476328005519e4c462f2fbd1e82af5/docs/1-displaying_appointments.png)

### About Page
Create About Page

### User Authentication
Add user login and password. Passwords are hashed through the use of bcrypt

### E-mail receipt
Sends an e-mail once an order is placed

> Display sent e-mail

![screenshot](https://github.com/open-meadow/scheduler/blob/d89e4d7a41476328005519e4c462f2fbd1e82af5/docs/1-displaying_appointments.png)

### Product reviews and ratings
Allows logged-in users to add new reviews to each product, and to view other reviews.

> Display product reviews

![screenshot](https://github.com/open-meadow/scheduler/blob/d89e4d7a41476328005519e4c462f2fbd1e82af5/docs/1-displaying_appointments.png)

## UI Improvements
### Sold-out badge
When a product has a quantity of zero, a badge is displayed by the product to reflect this.

> Sold out badge

![screenshot](https://github.com/open-meadow/scheduler/blob/d89e4d7a41476328005519e4c462f2fbd1e82af5/docs/1-displaying_appointments.png)


### Order details
Update order details page with image, item description and all relevant information

## Bug fixes
### Inventory Adjustment
Accurately reduce inventory whenever a user makes a purchase.
> Inventory Adjustment

![screenshot](https://github.com/open-meadow/scheduler/blob/d89e4d7a41476328005519e4c462f2fbd1e82af5/docs/1-displaying_appointments.png)  

### Admin Authentication
Admin authentication when viewing Admin pages
> Admin Authentication

![screenshot](https://github.com/open-meadow/scheduler/blob/d89e4d7a41476328005519e4c462f2fbd1e82af5/docs/1-displaying_appointments.png)  


### Display formatting
Show "$" symbol before prices

### Empty Cart
Show special text when cart is empty

## Testing
Tests for various functionality through RSpec and Cypress

## Setup

- Download the code (click 'code' above and download the ZIP)
- Download Ruby (https://www.ruby-lang.org/en/)
- In the same folder as the code, open cmd (click to the blank space beside the path, type 'cmd' and click enter)
- Type `bundle install` to install dependencies
- Create `config/database.yml` by copying `config/database.example.yml`
- Create `config/secrets.yml` by copying `config/secrets.example.yml`
- Run `bin/rails db:reset` to create, load and seed db
- Create .env file based on .env.example
- Sign up for a Stripe account
- Put Stripe (test) keys into appropriate .env vars
- Run `bin/rails s -b 0.0.0.0` to start the server

## Database

If Rails is complaining about authentication to the database, uncomment the user and password fields from `config/database.yml` in the development and test sections, and replace if necessary the user and password `development` to an existing database user.

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

- Rails 6.1 [Rails Guide](http://guides.rubyonrails.org/v6.1/)
- Bootstrap 5
- PostgreSQL 9.x
- Stripe

## Known Bugs
- When orders database is empty, e-mail preview renders error.
- If user hits 'cancel' on admin authentication, it blocks the "Admin" tab. A refresh fixes the issue.