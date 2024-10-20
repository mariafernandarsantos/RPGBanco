CREATE DATABASE RPG;
USE RPG;

CREATE TABLE Conta(
    Nome_Usuario VARCHAR(20) PRIMARY KEY,
    Email VARCHAR(50) NOT NULL UNIQUE,
    Senha VARCHAR(20) NOT NULL,
    Sexo CHAR(1),
    Idade INT NOT NULL,
    Dt_Nasc DATE
);

CREATE TABLE Tipos_Classe (
	ID_Classe INT PRIMARY KEY AUTO_INCREMENT,
    Tipo_Classe VARCHAR(20) NOT NULL,
    Inteligencia INT NOT NULL,
    Sorte INT NOT NULL,
    Hab_Especial VARCHAR(30) NOT NULL,
    Vida INT NOT NULL
);

CREATE TABLE Tipos_Montaria (
    ID_Montaria INT PRIMARY KEY AUTO_INCREMENT,
    Tipo_Mont VARCHAR(20) NOT NULL,
    Capacidade INT NOT NULL,
    Velocidade INT NOT NULL,
    Terreno VARCHAR(20) NOT NULL,
    Vida INT NOT NULL
);

CREATE TABLE Tipos_Itens (
	ID_Item INT PRIMARY KEY AUTO_INCREMENT,
    Tipo_Item VARCHAR(20) NOT NULL,
    Raridade VARCHAR(15) NOT NULL,
    Durabilidade INT NOT NULL,
    Peso DECIMAL (7,2) NOT NULL,
    Material VARCHAR(30) NOT NULL
);

CREATE TABLE Tipos_Raca (
	ID_Raca INT PRIMARY KEY AUTO_INCREMENT,
    Tipo_Raca VARCHAR(20) NOT NULL,
    Altura DECIMAL (4,2) NOT NULL,
    Peso DECIMAL (5,2) NOT NULL,
    Vigor INT NOT NULL,
    Velocidade INT NOT NULL
);

CREATE TABLE Tipos_Mobs(
    ID_Mobs INT PRIMARY KEY AUTO_INCREMENT,
    Tipo_mob VARCHAR(20),
    Vida INT NOT NULL,
    Forca INT NOT NULL,
    Defesa INT NOT NULL,
    Drop_item INT,
    FOREIGN KEY (Drop_item) REFERENCES Tipos_Itens(ID_Item)
);

CREATE TABLE Tipos_Regiao (
    ID_Regiao INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    Tipo_Reg VARCHAR(20) NOT NULL,
    Clima VARCHAR(10) NOT NULL,
    Spawn_item INT,
    Spawn_montaria INT,
    Spawn_mobs INT,
    FOREIGN KEY (Spawn_item) REFERENCES Tipos_Itens(ID_Item),
    FOREIGN KEY (Spawn_montaria) REFERENCES Tipos_Montaria(ID_Montaria),
    FOREIGN KEY (Spawn_mobs) REFERENCES Tipos_Mobs(ID_Mobs)
);

CREATE TABLE Perfil_Personagem (
	Nome_Personagem VARCHAR(20) PRIMARY KEY,
    Classe_Personagem INT NOT NULL,
    Idade_Personagem INT,
    Raca_Personagem INT NOT NULL,
    Item_Principal INT NOT NULL,
    Montaria INT,
    Regiao_Nasc INT NOT NULL,
    FOREIGN KEY (Classe_Personagem) REFERENCES Tipos_Classe (ID_Classe),
    FOREIGN KEY (Raca_Personagem) REFERENCES Tipos_Raca (ID_Raca),
    FOREIGN KEY (Item_Principal) REFERENCES Tipos_Itens (ID_Item),
    FOREIGN KEY (Montaria) REFERENCES Tipos_Montaria (ID_Montaria),
    FOREIGN KEY (Regiao_Nasc) REFERENCES Tipos_Regiao (ID_Regiao)
);

INSERT INTO Conta(Nome_Usuario, Email, Senha, Sexo, Idade, Dt_Nasc) VALUES
("Pedrin", "pedrin@gmail.com", "pedrinrpg123", "M", 21, '2003-04-07'),
("Ferzinha", "ferzinha@gmail.com", "mafer123", "F", 19, '2005-01-01'),
("Murillins", "murilosantana@gmail.com", "murilo123", "M", 20, '2003-11-29');

INSERT INTO Tipos_Classe (Tipo_Classe, Inteligencia, Sorte, Hab_Especial, Vida) VALUES
("Guerreiro", 20, 40, "Super Força", 150),
("Mago", 80, 20, "Telepatia", 100),
("Samurai", 40, 40, "Velocidade", 130);

INSERT INTO Tipos_Montaria(Tipo_Mont, Capacidade, Velocidade, Terreno, Vida) VALUES 
("Cavalo", 2, 110, "Solo", 100),
("Javali Selvagem", 2, 100, "Solo", 125),
("Elefante de Guerra", 5, 75, "Solo", 175),
("Coruja da Noite", 3, 150, "Céu", 85),
("Tartaruga Gigante", 5, 70, "Água", 150); 

INSERT INTO Tipos_Itens(Tipo_Item, Raridade, Durabilidade, Peso, Material) VALUES 
("Espada Longa", "Comum", 60, 4.50, "Aço"),
("Escudo de Torre", "Raro", 100, 10.00, "Aço Reforçado"),
("Arco Curto", "Incomum", 80, 2.25, "Madeira de Teixo"),
("Cajado Místico", "Épico", 200, 3.00, "Cristal Arcano"),
("Machado de Guerra", "Lendário", 300, 7.75, "Mithril");

INSERT INTO Tipos_Raca(Tipo_Raca, Altura, Peso, Vigor, Velocidade) VALUES 
("Elfo", 1.90, 75, 10, 18),
("Anão", 1.20, 70, 10, 8),
("Orc", 1.90, 90, 20, 10),
("Halfing", 0.90, 20, 8, 15),
("Draconato", 1.80, 100, 15, 10); 



