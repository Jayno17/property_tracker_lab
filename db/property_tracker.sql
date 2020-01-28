DROP TABLE IF EXISTS property_tracker;

CREATE TABLE property_tracker (
  id SERIAL PRIMARY KEY,
  address VARCHAR(255),
  value VARCHAR(255),
  number_of_bedrooms INT,
  year_built INT
);
