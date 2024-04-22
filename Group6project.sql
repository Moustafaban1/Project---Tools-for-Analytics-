
    CREATE TABLE IF NOT EXISTS zip_codes (
    id INTEGER PRIMARY KEY,
    zipcode CHAR(5),
    geometry GEOMETRY (Polygon,4326)
);


CREATE TABLE IF NOT EXISTS NYC_311 (
    unique_key VARCHAR(50) PRIMARY KEY,
    created_date VARCHAR(50),
    closed_date VARCHAR(50),
    complaint_type VARCHAR(100),
    zip_code VARCHAR(5),
    latitude VARCHAR(50),
    longitude VARCHAR(50),
    geometry GEOMETRY(POINT, 4326)
);


DROP TABLE IF EXISTS trees;
CREATE TABLE IF NOT EXISTS trees (
    tree_id VARCHAR(50) PRIMARY KEY,
    zipcode VARCHAR(10),
    address VARCHAR(255),
    health VARCHAR(255), 
    zip_city VARCHAR(255), 
    spc_common VARCHAR(255),
    status VARCHAR(255),
    sidewalk VARCHAR(255),
    borocode VARCHAR(10),
    block_id VARCHAR(255),
    geometry GEOMETRY (Point,4326)
);

CREATE TABLE IF NOT EXISTS rents
(
    id INTEGER PRIMARY KEY,
    zip_code CHAR(5),
    Jan_2023 FLOAT,
    Feb_2023 FLOAT,
    Mar_2023 FLOAT,
    Apr_2023 FLOAT,
    May_2023 FLOAT,
    Jun_2023 FLOAT,
    Jul_2023 FLOAT,
    Aug_2023 FLOAT,
    Sep_2023 FLOAT,
    Oct_2023 FLOAT,
    Nov_2023 FLOAT,
    Dec_2023 FLOAT,
    Jan_2024 FLOAT,
    mean FLOAT
);
