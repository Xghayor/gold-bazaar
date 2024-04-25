# # # db/seeds.rb

# # # Create users
# user1 = User.create!(username: 'john_doe', firstname: 'John', lastname: 'Doe', email: 'john@example.com', password_digest: '$2a$12$vI8aWBnW3fIDpZQ46qTdLOPq1lRPK6Fpz/bCXN4zvM3dRqJ7n54YS')
# user2 = User.create!(username: 'jane_doe', firstname: 'Jane', lastname: 'Doe', email: 'jane@example.com', password_digest: '$2a$12$vI8aWBnW3fIDpZQ46qTdLOPq1lRPK6Fpz/bCXN4zvM3dRqJ7n54YS')

# # # Create products
# product1 = Product.create!(name: 'Product A', description: 'This is Product A', price: 19.99)
# product2 = Product.create!(name: 'Product B', description: 'This is Product B', price: 29.99)
# product3 = Product.create!(name: 'Product C', description: 'This is Product C', price: 39.99)

# # # Create orders
# order1 = Order.create!(shippingaddress: '123 Main St', user_id: user1.id)
# order2 = Order.create!(shippingaddress: '456 Elm St',  user_id: user2.id)

# # # Create order details
# OrderDetail.create!(quantity: 2, unitprice: product1.price, product_id: product1.id, order_id: order1.id)
# OrderDetail.create!(quantity: 1, unitprice: product2.price, product_id: product2.id, order_id: order1.id)
# OrderDetail.create!(quantity: 3, unitprice: product3.price, product_id: product3.id, order_id: order2.id)
