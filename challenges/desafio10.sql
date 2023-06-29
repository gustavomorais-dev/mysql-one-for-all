USE SpotifyClone;

CREATE TABLE fav_musics (
    fav_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    music_id INT,
    FOREIGN KEY (user_id) REFERENCES users_details(user_id),
    FOREIGN KEY (music_id) REFERENCES musics_details(music_id),
    UNIQUE (user_id, music_id)
) ENGINE = InnoDB;

INSERT INTO fav_musics (user_id, music_id)
VALUES
    (1, 3),
    (1, 6),
    (1, 10),
    (2, 4),
    (3, 1),
    (3, 3),
    (4, 7),
    (4, 4),
    (5, 10),
    (5, 2),
    (8, 4),
    (9, 7),
    (10, 3);
