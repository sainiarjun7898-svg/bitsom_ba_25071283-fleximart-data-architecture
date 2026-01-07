// Use database
use fleximart_nosql

// Show all products
db.products.find()

// Products with price greater than 50000
db.products.find({ price: { $gt: 50000 } })

// Products with rating greater than 4.5
db.products.find({ ratings: { $gt: 4.5 } })

// Products with low stock
db.products.find({ stock: { $lt: 50 } })

// Find products by category
db.products.find({ category: "Electronics" })

// Find products by supplier country
db.products.find({ "supplier.country": "India" })

// Sort products by price (high to low)
db.products.find().sort({ price: -1 })
