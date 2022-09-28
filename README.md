# Jungle

A mini e-commerce application built with Rails 6.1 for purposes of learning Rails.

## Setup

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
- Stripe


## Final Product

!["Main Page"](https://github.com/dan-suen/jungle-rails/blob/master/public/sample/1a.png?raw=true)
- On the Main Page, users can browse items listed on the site and add these items to their cart. Sold out items are marked with a Sold out sign and the add button is disabled accordingly.
- Visitors can also access pages of items filtered by their categories. These categories are listed in the navbar next to the Jungle logo. In the image, there are currently "Evergreen", "Shrubs", "Trees" and "tret" catergories along with a link to the About page. More categories may be added by admins.

<br />
<br />

!["Product Page"](https://github.com/dan-suen/jungle-rails/blob/master/public/sample/2a.png?raw=true)
- Product specific pages may be accessed by clicking on the corresponding item on the main or category pages.


<br />
<br />

!["Current Cart"](https://github.com/dan-suen/jungle-rails/blob/master/public/sample/3a.png?raw=true)
- The Cart page shows the current items in the shopping cart. Users may further adjust the quantities of their selected items here.
- The page also shows the current total and allows for checkout. Upon successful checkout, the cart is cleared.


<br />
<br />

!["Order Page"](https://github.com/dan-suen/jungle-rails/blob/master/public/sample/4a.png?raw=true)
- After making a successful checkout, an order page is rendered with the order information and items ordered.

<br />
<br />

!["Multiple pages for features"](https://github.com/dan-suen/jungle-rails/blob/master/public/sample/5a.png?raw=true)
- A variety of pages exist and can be accessed via the navbar. This includes a company About page, and and Admin exclusive pages for altering the products and categories used on the site.
- Guests can sign-up or log into the site via the navbar as well
- Users can proceed to checkout by clicking the cart in the navbar!