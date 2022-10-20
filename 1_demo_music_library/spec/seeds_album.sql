

TRUNCATE TABLE artists RESTART IDENTITY;
TRUNCATE TABLE albums RESTART IDENTITY;

-- Below this line there should only be `INSERT` statements.
-- Replace these statements with your own seed data.

INSERT INTO artists (name, genre) VALUES ('Pixies', 'Rock');
INSERT INTO albums (title, release_year, artist_id) VALUES
('Doolittle', '1989', '1'),
('Surfer Rosa', '1988', '1'),
('Bossanova', '1990', '1');
