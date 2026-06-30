CREATE DATABASE IF NOT EXISTS osm_db;
USE osm_db;

-- ------------------------------------------------------------
-- Tabela: Pessoa
-- Representa qualquer entidade humana no sistema
-- (usuário, cliente, colaborador, participante, etc.)
-- ------------------------------------------------------------
CREATE TABLE IF NOT EXISTS pessoa (
    id_pessoa              INT AUTO_INCREMENT PRIMARY KEY,
    nome            VARCHAR(100) NOT NULL,
    email           VARCHAR(150) UNIQUE,
    data_nascimento DATE,
    telefone        VARCHAR(20),
    status_pessoa          VARCHAR(20) DEFAULT 'ativo'
);
-- ------------------------------------------------------------
-- Tabela: Item
-- Representa qualquer recurso, produto ou elemento do sistema
-- (produto, livro, equipamento, serviço, vaga, etc.)
-- ------------------------------------------------------------
CREATE TABLE IF NOT EXISTS item (
    id_item                    INT AUTO_INCREMENT PRIMARY KEY,
    titulo                  VARCHAR(100) NOT NULL,
    genero             VARCHAR(50),
    data_lancamento DATE,
    descricao             TEXT,
    valor                 DECIMAL(10, 2),
    quantidade_disponivel INT DEFAULT 0
);

-- ------------------------------------------------------------
-- Tabela: Registro
-- Representa uma relação entre Pessoa e Item
-- (compra, empréstimo, inscrição, reserva, etc.)
-- ------------------------------------------------------------
CREATE TABLE IF NOT EXISTS registro (
    id_registro           INT AUTO_INCREMENT PRIMARY KEY,
    id_pessoa    INT NOT NULL,
    id_item      INT NOT NULL,
    data_registro DATE DEFAULT NULL,
    observacao   TEXT,
    status_registro       VARCHAR(20) DEFAULT 'pendente',
    FOREIGN KEY (id_pessoa) REFERENCES pessoa(id_pessoa),
    FOREIGN KEY (id_item)   REFERENCES item(id_item)
);

-- ------------------------------------------------------------
-- Dados
-- Quais outros dados poderiam fazer parte do seu banco?
-- ------------------------------------------------------------

INSERT INTO pessoa (nome, email, data_nascimento, telefone, status_pessoa) VALUES
 ('Ana Carolina Souza', 'ana.souza@email.com', '1988-03-15', '(11) 98765-4321', 'ativo'),
 ('Bruno Henrique Lima', 'bruno.lima@email.com', '1992-07-28', '(21) 99876-5432', 'ativo'),
 ('Camila Ferreira Alves', 'camila.alves@email.com', '1980-11-09', '(31) 99123-4567', 'inativo'),
 ('Daniel Rodrigues Costa', 'daniel.costa@email.com', '1977-05-22', '(41) 98888-1122', 'ativo'),
 ('Eduarda Martins Silva', 'eduarda.silva@email.com', '1999-09-14', '(51) 99777-3344', 'ativo'),
 ('Felipe Augusto Gomes', 'felipe.gomes@email.com', '1985-01-30', '(61) 99666-7788', 'inativo'), 
 ('Gabriela Oliveira Rocha', 'gabriela.rocha@email.com', '2001-06-18', '(71) 99555-6677', 'ativo'),
 ('Henrique Barbosa Santos', 'henrique.santos@email.com', '1979-12-03', '(81) 99444-8899', 'ativo'),
 ('Isabela Cristina Moraes', 'isabela.moraes@email.com', '1996-04-11', '(91) 99333-2211', 'ativo'),
 ('João Pedro Nascimento', 'joao.nascimento@email.com', '2004-08-25', '(85) 99222-1100', 'inativo');

INSERT INTO item (titulo, genero, data_lancamento, descricao, valor, quantidade_disponivel) VALUES
 ( 'O Poderoso Chefão', 'Drama', '1972-03-24', 'Clássico sobre a poderosa família mafiosa Corleone.', 9.90, 5),
 ( 'Titanic', 'Romance', '1997-12-19', 'História de amor a bordo do famoso navio Titanic.', 8.50, 4),
 ( 'Vingadores: Ultimato', 'Ação', '2019-04-26', 'Os heróis da Marvel enfrentam Thanos em sua batalha final.', 12.90, 7),
 ( 'Toy Story', 'Animação', '1995-11-22', 'Brinquedos ganham vida quando seus donos não estão por perto.', 7.90, 6),
 ( 'Jurassic Park', 'Ficção Científica', '1993-06-11', 'Dinossauros são recriados geneticamente em um parque temático.', 8.90, 3),
 ( 'Cidade de Deus', 'Drama', '2002-08-30', 'Retrata a violência e a vida em uma comunidade do Rio de Janeiro.', 9.50, 5),
 ( 'Matrix', 'Ficção Científica', '1999-03-31', 'Um programador descobre que a realidade é uma simulação.', 10.90, 4),
 ( 'Shrek', 'Comédia', '2001-05-18', 'Um ogro embarca em uma aventura para salvar uma princesa.', 7.50, 8),
 ( 'Homem-Aranha: Sem Volta para Casa', 'Ação', '2021-12-16', 'Peter Parker enfrenta desafios com personagens de diferentes universos.', 13.90, 6),
 ( 'A Origem', 'Suspense', '2010-07-16', 'Especialistas invadem sonhos para roubar ou implantar ideias.', 11.50, 5);
INSERT INTO registro (id_registro, id_pessoa, id_item, data_registro, observacao, status_registro) VALUES 
(1, 1, 3, '2026-06-01', 'Cliente retirou o filme no período da manhã.', 'concluido'),
(2, 2, 5, '2026-06-03', 'Primeira locação do cliente.', 'concluido'),
(3, 3, 1, '2026-06-05', 'Filme devolvido com um dia de atraso.', 'atrasado'),
(4, 4, 7, '2026-06-08', 'Cliente solicitou renovação da locação.', 'pendente'), 
(5, 5, 2, '2026-06-10', 'Atendimento realizado sem observações.', 'concluido'),
(6, 6, 9, '2026-06-12', 'Cliente informou que devolverá no prazo.', 'pendente'),
(7, 7, 4, '2026-06-15', 'Filme devolvido em perfeito estado.', 'concluido'),
(8, 8, 10, '2026-06-18', 'Aguardando devolução do filme.', 'pendente'),
(9, 9, 6, '2026-06-20', 'Cliente entrou em contato informando atraso.', 'atrasado'),
(10, 10, 8, '2026-06-22', 'Locação realizada normalmente.', 'concluido');
 
select*from pessoa;
 
select*from item;
 
select*from registro;
-- ------------------------------------------------------------
-- Agora:
-- 1. Defina o contexto do seu sistema (Fase 1)
-- 2. Gere dados coerentes com esse contexto com IA (Fase 2)
--    e adicione os dados usando INSERT
-- 3. Formule suas perguntas e escreva os comandos abaixo (Fase 3)
-- ------------------------------------------------------------

-- Pergunta 1 (UPDATE):
-- [escreva aqui uma pergunta que pode ser respondida usando UPDATE]
-- O Felipe que estava inativo volto esta ativo precisa muda de volta
-- [agora escreva o código que ajuda a responder essa pergunta logo abaixo]
UPDATE pessoa
SET status_pessoa = 'ativo'
WHERE id_pessoa= 5;




-- Pergunta 2 (DELETE):
-- [escreva aqui uma pergunta que pode ser respondida usando DELETE]
-- A um cliente esqueceu de leva o filmer que foi alugado entao deve se deletato o registro  
-- [agora escreva o código que ajuda a responder essa pergunta logo abaixo]
DELETE FROM registro
WHERE id_registro= 9;

-- Pergunta 3 (ALTER TABLE):
-- [escreva aqui uma pergunta que pode ser respondida usando ALTER TABLE]
-- a locadora passou a precisa registra dias do aluguel para sabe quanto tempo foi alugador para determina o valor do aluguel
-- [agora escreva o código que ajuda a responder essa pergunta logo abaixo]
Alter table registro
add data_aluguel date;
