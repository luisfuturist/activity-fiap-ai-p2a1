-- Criação da tabela Produtor
CREATE TABLE Produtor (
    id_produtor INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    localizacao VARCHAR(255) NOT NULL,
    data_registro DATE NOT NULL
);

-- Criação da tabela Cultura
CREATE TABLE Cultura (
    id_cultura INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    tipo VARCHAR(100) NOT NULL,
    id_produtor INT NOT NULL,
    FOREIGN KEY (id_produtor) REFERENCES Produtor(id_produtor) ON DELETE CASCADE
);

-- Criação da tabela Sensor
CREATE TABLE Sensor (
    id_sensor INT PRIMARY KEY AUTO_INCREMENT,
    tipo_sensor ENUM('umidade', 'pH', 'nutrientes') NOT NULL,
    id_cultura INT NOT NULL,
    FOREIGN KEY (id_cultura) REFERENCES Cultura(id_cultura) ON DELETE CASCADE
);

-- Criação da tabela Leitura_Sensor
CREATE TABLE Leitura_Sensor (
    id_leitura INT PRIMARY KEY AUTO_INCREMENT,
    id_sensor INT NOT NULL,
    valor_leitura DOUBLE NOT NULL,
    data_leitura TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_sensor) REFERENCES Sensor(id_sensor) ON DELETE CASCADE
);

-- Criação da tabela Ajuste_Aplicacao
CREATE TABLE Ajuste_Aplicacao (
    id_ajuste INT PRIMARY KEY AUTO_INCREMENT,
    quantidade_agua DOUBLE NOT NULL,
    quantidade_nutriente DOUBLE NOT NULL,
    data_ajuste TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    id_cultura INT NOT NULL,
    FOREIGN KEY (id_cultura) REFERENCES Cultura(id_cultura) ON DELETE CASCADE
);
