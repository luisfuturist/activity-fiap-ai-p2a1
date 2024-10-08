CREATE TABLE Producer (
    id_producer INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    location VARCHAR(255) NOT NULL,
    registration_date DATE NOT NULL
);

CREATE TABLE Crop (
    id_crop INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    type VARCHAR(100) NOT NULL,
    id_producer INT NOT NULL,
    FOREIGN KEY (id_producer) REFERENCES Producer(id_producer) ON DELETE CASCADE
);

CREATE TABLE Sensor (
    id_sensor INT PRIMARY KEY AUTO_INCREMENT,
    sensor_type ENUM('humidity', 'pH', 'nutrients') NOT NULL,
    id_crop INT NOT NULL,
    FOREIGN KEY (id_crop) REFERENCES Crop(id_crop) ON DELETE CASCADE
);

CREATE TABLE Sensor_Reading (
    id_reading INT PRIMARY KEY AUTO_INCREMENT,
    id_sensor INT NOT NULL,
    reading_value DOUBLE NOT NULL,
    reading_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_sensor) REFERENCES Sensor(id_sensor) ON DELETE CASCADE
);

CREATE TABLE Application_Adjustment (
    id_adjustment INT PRIMARY KEY AUTO_INCREMENT,
    water_quantity DOUBLE NOT NULL,
    nutrient_quantity DOUBLE NOT NULL,
    adjustment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    id_crop INT NOT NULL,
    FOREIGN KEY (id_crop) REFERENCES Crop(id_crop) ON DELETE CASCADE
);
