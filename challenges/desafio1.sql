DROP DATABASE IF EXISTS SpotifyClone;
CREATE DATABASE IF NOT EXISTS SpotifyClone;

USE SpotifyClone;

CREATE TABLE plans_details (
    plan_id INT PRIMARY KEY AUTO_INCREMENT,
    plan_name VARCHAR(100) NOT NULL,
    plan_value DECIMAL(10, 2) NOT NULL
) ENGINE = InnoDB;

CREATE TABLE users_details(
user_id INT PRIMARY KEY AUTO_INCREMENT,
username VARCHAR(50) NOT NULL,
age INT NOT NULL,
plan_id INT,
sub_date DATE,
FOREIGN KEY (plan_id) REFERENCES plans_details(plan_id)
) ENGINE = InnoDB;

CREATE TABLE artists_details (
    artist_id INT PRIMARY KEY AUTO_INCREMENT,
    artist_name VARCHAR(100) NOT NULL
) ENGINE = InnoDB;

CREATE TABLE following_artists (
    follow_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    artist_id INT,
    FOREIGN KEY (user_id) REFERENCES users_details(user_id),
    FOREIGN KEY (artist_id) REFERENCES artists_details(artist_id),
    UNIQUE (user_id, artist_id)
) ENGINE = InnoDB;

CREATE TABLE albums_details (
    album_id INT PRIMARY KEY AUTO_INCREMENT,
    album_name VARCHAR(100) NOT NULL,
    release_year YEAR,
    artist_id INT,
    FOREIGN KEY (artist_id) REFERENCES artists_details(artist_id)
) ENGINE = InnoDB;

CREATE TABLE musics_details (
    music_id INT PRIMARY KEY AUTO_INCREMENT,
    music_title VARCHAR(100) NOT NULL,
    duration_seconds INT,
    album_id INT,
    artist_id INT,
    FOREIGN KEY (album_id) REFERENCES albums_details(album_id),
    FOREIGN KEY (artist_id) REFERENCES artists_details(artist_id)
) ENGINE = InnoDB;

CREATE TABLE playback_history (
    play_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    play_date DATE,
    music_id INT,
    FOREIGN KEY (user_id) REFERENCES users_details(user_id),
    FOREIGN KEY (music_id) REFERENCES musics_details(music_id),
    UNIQUE (user_id, play_date, music_id)
) ENGINE = InnoDB;

INSERT INTO plans_details (plan_name, plan_value)
VALUES
    ('gratuito', 0),
    ('familiar', 7.99),
    ('universitário', 5.99),
    ('pessoal', 6.99);

INSERT INTO users_details (username, age, plan_id, sub_date)
VALUES
    ('Barbara Liskov', 82, 1, '2019-10-20'),
    ('Robert Cecil Martin', 58, 1, '2017-01-06'),
    ('Ada Lovelace', 37, 2, '2017-12-30'),
    ('Martin Fowler', 46, 2, '2017-01-17'),
    ('Sandi Metz', 58, 2, '2018-04-29'),
    ('Paulo Freire', 19, 3, '2018-02-14'),
    ('Bell Hooks', 26, 3, '2018-01-05'),
    ('Christopher Alexander', 85, 4, '2019-06-05'),
    ('Judith Butler', 45, 4, '2020-05-13'),
    ('Jorge Amado', 58, 4, '2017-02-17');

INSERT INTO artists_details (artist_name)
VALUES
    ('Beyoncé'),
    ('Queen'),
    ('Elis Regina'),
    ('Baco Exu do Blues'),
    ('Blind Guardian'),
    ('Nina Simone');

INSERT INTO following_artists (user_id, artist_id)
VALUES
    (1, 1),
    (1, 2),
    (1, 3),
    (2, 1),
    (2, 3),
    (3, 2),
    (4, 4),
    (5, 5),
    (5, 6),
    (6, 6),
    (6, 1),
    (7, 6),
    (9, 3),
    (10, 2);

INSERT INTO albums_details (album_name, release_year, artist_id)
VALUES
    ('Renaissance', 2022, 1),
    ('Jazz', 1978, 2),
    ('Hot Space', 1982, 2),
    ('Falso Brilhante', 1998, 3),
    ('Vento de Maio', 2001, 3),
    ('QVVJFA?', 2003, 4),
    ('Somewhere Far Beyond', 2007, 5),
    ('I Put A Spell On You', 2012, 6);

INSERT INTO musics_details (music_title, duration_seconds, album_id)
VALUES
    ("BREAK MY SOUL", 279, 1),
    ("VIRGO'S GROOVE", 369, 1),
    ("ALIEN SUPERSTAR", 116, 1),
    ("Don't Stop Me Now", 203, 2),
    ("Under Pressure", 152, 3),
    ("Como Nossos Pais", 105, 4),
    ("O Medo de Amar é o Medo de Ser Livre", 207, 5),
    ("Samba em Paris", 267, 6),
    ("The Bard's Song", 244, 7),
    ("Feeling Good", 100, 8);
    
INSERT INTO playback_history (user_id, play_date, music_id)
VALUES
    (1, '2022-02-28 10:45:55', 8),
    (1, '2020-05-02 05:30:35', 2),
    (1, '2020-03-06 11:22:33', 10),
    (2, '2022-08-05 08:05:17', 10),
    (2, '2020-01-02 07:40:33', 7),
    (3, '2020-11-13 16:55:13', 10),
    (3, '2020-12-05 18:38:30', 2),
    (4, '2021-08-15 17:10:10', 8),
    (5, '2022-01-09 01:44:33', 8),
    (5, '2020-08-06 15:23:43', 5),
    (6, '2017-01-24 00:31:17', 7),
    (6, '2017-10-12 12:35:20', 1),
    (7, '2011-12-15 22:30:49', 4),
    (8, '2012-03-17 14:56:41', 4),
    (9, '2022-02-24 21:14:22', 9),
    (10, '2015-12-13 08:30:22', 3);
