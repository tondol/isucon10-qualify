DROP DATABASE IF EXISTS isuumo;
CREATE DATABASE isuumo;

DROP TABLE IF EXISTS isuumo.estate;
DROP TABLE IF EXISTS isuumo.chair;

CREATE TABLE isuumo.estate
(
    id          INTEGER             NOT NULL PRIMARY KEY,
    name        VARCHAR(64)         NOT NULL,
    description VARCHAR(4096)       NOT NULL,
    thumbnail   VARCHAR(128)        NOT NULL,
    address     VARCHAR(128)        NOT NULL,
    latitude    DOUBLE PRECISION    NOT NULL,
    longitude   DOUBLE PRECISION    NOT NULL,
    rent        INTEGER             NOT NULL,
    door_height INTEGER             NOT NULL,
    door_width  INTEGER             NOT NULL,
    features    VARCHAR(64)         NOT NULL,
    popularity  INTEGER             NOT NULL,
    popularity_desc  INTEGER AS (-1 * popularity) STORED
);

CREATE TABLE isuumo.chair
(
    id          INTEGER         NOT NULL PRIMARY KEY,
    name        VARCHAR(64)     NOT NULL,
    description VARCHAR(4096)   NOT NULL,
    thumbnail   VARCHAR(128)    NOT NULL,
    price       INTEGER         NOT NULL,
    height      INTEGER         NOT NULL,
    width       INTEGER         NOT NULL,
    depth       INTEGER         NOT NULL,
    color       VARCHAR(64)     NOT NULL,
    features    VARCHAR(64)     NOT NULL,
    kind        VARCHAR(64)     NOT NULL,
    popularity  INTEGER         NOT NULL,
    popularity_desc  INTEGER AS (-1 * popularity) STORED,
    stock       INTEGER         NOT NULL
);

CREATE INDEX estate_lat_lon_idx ON isuumo.estate (latitude, longitude);
-- CREATE INDEX estate_lon_lat_idx ON isuumo.estate (longitude, latitude);
CREATE INDEX estate_rent_idx ON isuumo.estate (rent);
CREATE INDEX chair_stock_idx ON isuumo.chair (stock);
CREATE INDEX chair_price_idx ON isuumo.chair (price);
CREATE INDEX estate_door_wh_idx on isuumo.estate (door_width, door_height);
-- CREATE INDEX estate_door_hw_idx on isuumo.estate (door_height, door_width);
 
CREATE INDEX chair_popularity_desc_idx on isuumo.chair (popularity_desc);
CREATE INDEX estate_popularity_desc_idx on isuumo.estate (popularity_desc);
