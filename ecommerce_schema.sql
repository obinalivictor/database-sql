 CREATE TABLE user (
     id SERIAL PRIMARY KEY ,
     name VARCHAR (100),
   email VARCHAR (100) UNIQUE
);


CREATE TABLE product(
    productId SERIAL PRIMARY KEY,
    productName VARCHAR(100),
   productPrice DECIMAL(10,2),
);



CREATE TABLE orders (
    id SERIAL PRIMARY KEY,
    userId BIGINT UNSIGNED,
    productId BIGINT UNSIGNED,
    FOREIGN KEY (userId) REFERENCES user(id),
    FOREIGN KEY (productId) REFERENCES product(productId)
);