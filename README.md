# Clothing Shop App

## Description

This app has the functionality of a simple clothing shop with the following features:
*  Users can view products and their category, price and availability information.
*  Users can add a product to their shopping cart.
*  Users can remove a product from their shopping cart.
*  Users can view the total price of the products in their shopping cart.
*  Users can apply a voucher to their shopping cart.
*  Users can view the total price of the products in their shopping cart with discounts applied.
*  Users are alerted when they apply an invalid voucher to their shopping cart.
*  Users are unable to add Out of Stock products to their shopping cart.

## Approach

I decided to use Ruby on Rails to develop this app as Rails conventions would make sure my work was easy to interpret.

I created three different models: ShopItem to store the data of the items available to the user, Voucher to store the available vouchers and whether they were applied and BasketItem to store items the user has put into the basket. 

The data in the models were managed by three controllers. ShopItems has an index method which runs the root web page and stores the vouchers and shop items to the database when the app is first opened. BasketItems saves and deletes itmes to the BasketItem table when the user removes and adds items to their basket. Vouchers edits entries in the Voucher table when the user applies vouchers.

I decided to make this app a single page app so all the information is available to the user in one page and to keep the app simple. This means there is only one view shop-items/index.html.erb.

I realised there was a bug when a voucher is applied and afterwards an item is deleted from the basket. The voucher remained applied yet with the current basket could be invalid. I solved this in the simplest way possible by removing all vouchers once an item is deleted from the basket. 

## Tech Stack
Ruby v 2.5.1

Rails v 5.2.3 

Travis CI  

Rspec  

Capybara

## Quickstart

```bash
$ git clone https://github.com/matharotheelf/clothingshop
$ cd clothingshop
$ bundle install
$ bin/rails db:create
$ bin/rails db:migrate

$ bundle exec rspec # Run the tests to ensure it works
$ bin/rails server # Start the server at localhost:3000
```
To run the tests, navigate to the clothingshop directory (`$ cd clothingshop`) and run `$ rspec`.

## How to Use

From the homepage you can see a list of available products. Press 'Buy' under an item to add the item to your shopping cart.

You can see the total price of your basket underneath the list of items in the basket.

To remove an item from your shopping cart press 'Delete' under that item's entry in the cart.

To apply a voucher when valid press 'Apply' with the appropriate items in your cart.

You can see the reduced price of your basket with vouchers applied at the bottom of the page.

## User Stories
```
As a User I can view the products and their category, price and availability information.
1. As a User I can add a product to my shopping cart.
2. As a User I can remove a product from my shopping cart.
3. As a User I can view the total price for the products in my shopping cart.
4. As a User I can apply a voucher to my shopping cart.
5. As a User I can view the total price for the products in my shopping cart with discounts applied.
6. As a User I am alerted when I apply an invalid voucher to my shopping cart.
7. As a User I am unable to Out of Stock products to the shopping cart.
```

## Contributors
 
[Tom Lawrence](https://github.com/matharotheelf)  
 
## How to Contribute

If you want to improve this Shopping cart app and see your name added to the above list of contributors, simply branch this repo, do your thing, and make a pull request back to this repo explaining the contributions you made.

