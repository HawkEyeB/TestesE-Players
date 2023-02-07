USE NewGame;

CREATE TABLE usuario (
	idUsuario INT PRIMARY KEY IDENTITY,
	email VARCHAR (100) UNIQUE NOT NULL,
	senha VARCHAR (255) NOT NULL
);

CREATE TABLE persona (
	idPersona INT PRIMARY KEY IDENTITY,
	nome VARCHAR (30) UNIQUE NOT NULL,
	idUsuario INT UNIQUE,
	idClasse INT
)

CREATE TABLE classes(
	idClasse INT PRIMARY KEY IDENTITY,
	nome VARCHAR (100) UNIQUE NOT NULL,
	descricao VARCHAR (500)
);

CREATE TABLE habilidades (
	idHabilidade INT PRIMARY KEY IDENTITY,
	nome VARCHAR (100) UNIQUE NOT NULL,
	descricao VARCHAR (500)
);
	

CREATE TABLE personaClassHab(
	idCat INT PRIMARY KEY IDENTITY,
	idClasse INT,
	idHabilidade INT 
);

ALTER TABLE personaClassHab
ADD FOREIGN KEY (idClasse) REFERENCES classes (idClasse);

ALTER TABLE personaClassHab
ADD FOREIGN KEY (idHabilidade) REFERENCES habilidades (idHabilidade);

ALTER TABLE persona
ADD FOREIGN KEY (idClasse) REFERENCES classes(idClasse);

ALTER TABLE persona
ADD FOREIGN KEY (idUsuario) REFERENCES usuario(idUsuario)


INSERT INTO classes (nome, descricao)
VALUES ('Monge','Os monges s�o pessoas que buscam a perfei��o espiritual atrav�s da medita��o da contempla��o,
e a perfei��o corporal, atrav�s de um intenso controle e treinamento em artes marciais. Devido ao seu treinamento em artes marciais,
geralmente a arma mais perigosa de um monge � seu pr�prio corpo.
Alem de conseguir causar mais dano desarmado que uma pessoa normal, seu treino geralmente o concede ataques mais r�pidos e
a capacidade de acertar pontos vitais de uma criatura a fim de atordo�-lo.'),

('B�rbaro', 'B�rbaros S�o guerreiros de origem selvagem, geralmente derivados de tribos b�rbaras em regi�es distantes.
Justamente por sua dist�ncia da civiliza��o, eles n�o tem refinamento algum em seu jeito de lutar, dando espa�o ao uso de for�a bruta.
Presumivelmente, tamb�m n�o s�o muito inteligentes. Geralmente � dado aos b�rbaros a capacidade de entrar em uma f�ria bestial e selvagem,
que os permite atacar mais violentamente e aguentar mais dano, em detrimento de sua pr�pria seguran�a.');

INSERT INTO habilidades (nome, descricao)
VALUES ('Lan�a Mortal', 'Descri��o a ser posta'),
('Escudo Supremo', 'Atr�ves do uso de magia, � poss�vel endurecer as mol�culas do corpo, o deixando mais duro que diamante.
O uso cont�nuo dessa habilidade causa danos ao personagem'),
('Recuperar Vida', 'Recupera 100 pontos de vida do alvo, al�m de dano de habilidade e diversas condi��es.');

INSERT INTO personaClassHab
VALUES (1,1), (1,2), (2,3), (2,2);

INSERT INTO usuario 
VALUES ('email@gmail.com', 123456);

INSERT INTO usuario
VALUES ('bitbug@email.com', 654321);

INSERT INTO persona
VALUES ('DeuBug', 1, 1),
('BitBug', 2,2);


SELECT c.nome, h.nome 
FROM personaClassHab p
INNER JOIN classes c
ON p.idClasse = c.idClasse
INNER JOIN habilidades h
ON p.idHabilidade = h.idHabilidade;

CREATE LOGIN aluno
WITH PASSWORD = '1234'

CREATE USER aluno FOR LOGIN aluno

GRANT SELECT TO aluno



SELECT p.nome AS 'Nome do Personagem', c.nome AS Classe, 
(SELECT h.nome FROM personaClassHab ph
INNER JOIN habilidades h
ON ph.idHabilidade = h.idHabilidade)
FROM persona p
INNER JOIN classes c
ON p.idClasse = c.idClasse;
-- N�o funciona