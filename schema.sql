CREATE DATABASE Catalog;

CREATE TABLE genre(
  id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  name TEXT
);

CREATE TABLE source(
  id INT GENERATED ALWAYS AS IDENTITY,
  name VARCHAR(200),
  PRIMARY KEY(id)
);

CREATE TABLE author(
  id INT GENERATED ALWAYS AS IDENTITY,
  first_name VARCHAR(200),
  last_name VARCHAR(200),
  PRIMARY KEY(id)
);

CREATE TABLE label (
  id SERIAL PRIMARY KEY,
  title VARCHAR(50) NOT NULL,
  color VARCHAR(50) NOT NULL,
  item_id int    
);

CREATE TABLE MusicAlbum(
  ID INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  name TEXT,
  source_id INT REFERENCES source(id),
  genre_id INT REFERENCES genre(id),
  author_id INT REFERENCES author(id),
  label_id INT REFERENCES label(id),
  publish_date DATE,
  archived BOOLEAN,
  on_spotify BOOLEAN
);

CREATE TABLE movie(
  id INT GENERATED ALWAYS AS IDENTITY,
  name VARCHAR(300),
  source_id INT REFERENCES source(id),
  genre_id INT REFERENCES genre(id),
  author_id INT REFERENCES author(id),
  label_id INT REFERENCES label(id),
  publishe_date DATE,
  archived BOOLEAN,
  silet BOOLEAN,
  PRIMARY KEY(id)
);

CREATE TABLE book (
  ID INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  publisher TEXT,
  cover_state TEXT,
  source_id INT REFERENCES source(id),
  genre_id INT REFERENCES genre(id),
  author_id INT REFERENCES author(id),
  label_id INT REFERENCES label(id),
  publish_date DATE,
  archived BOOLEAN
);

CREATE TABLE games (
  ID INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  source_id INT REFERENCES source(id),
  genre_id INT REFERENCES genre(id),
  author_id INT REFERENCES author(id),
  label_id INT REFERENCES label(id),
  publish_date DATE,
  last_played_at DATE,
  archived BOOLEAN,
  multiplayer BOOLEAN
);
