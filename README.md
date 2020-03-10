# Jungle

A mini e-commerce application built with Rails 4.2 for purposes of teaching Rails by example and tested using Rspec.

This project helps simulate a real world scenario where you inherit an existing code base in a language/framework that you are not yet familiar with and you are asked to implement new features and fix bugs.

## Final Product

### Browse Available Products

Home Page - View all products

![Home_All_Products](https://user-images.githubusercontent.com/8763915/76361468-7bb21780-62f5-11ea-8019-47419c3c12af.png)

See products by Categories

![Show_Categories](https://user-images.githubusercontent.com/8763915/76361475-7d7bdb00-62f5-11ea-97ed-0842bde2c72f.png)

See a selected product's detail page

![Product_Details_Page](https://user-images.githubusercontent.com/8763915/76361474-7ce34480-62f5-11ea-9b7f-f40f15451b16.png)

---

### Cart / Order

![My_cart](https://user-images.githubusercontent.com/8763915/76361470-7c4aae00-62f5-11ea-88a7-6b246434402c.png)

Empty Cart Error Handling

![Empty_Cart_Error_Handling](https://user-images.githubusercontent.com/8763915/76361467-7bb21780-62f5-11ea-9793-ba57d060c2b6.png)

Order Receipt Page

![Order_Receipt_Page](https://user-images.githubusercontent.com/8763915/76361472-7ce34480-62f5-11ea-9f28-79a0293614a9.png)

---

### Admin

Demonstration of the admin add new product functionality.

![Admin_Adding-Product](https://user-images.githubusercontent.com/8763915/76361462-78b72700-62f5-11ea-9728-affa8240feff.gif)

## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rake db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails s -b 0.0.0.0` to start the server

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

* Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
* PostgreSQL 9.x
* Stripe
