# Part 2: NoSQL Database – MongoDB Analysis

## Why MongoDB for FlexiMart?

MongoDB is suitable for FlexiMart’s product catalog because it handles semi-structured and nested data very well. 
Each product contains reviews and supplier details which can be stored easily as embedded documents.

## Data Model Used

We used a document-based model where each product is stored as one document.
Each document contains:
- Product information
- Ratings
- Reviews (array)
- Supplier details (object)

## Operations Performed

- Imported JSON product catalog into MongoDB
- Filtered products by price, rating, and stock
- Queried nested fields like supplier country
- Sorted products by price
- Analyzed embedded reviews

## Conclusion

MongoDB makes it easy to store and query flexible product data.
It is faster to modify and well suited for e-commerce catalog systems like FlexiMart.
