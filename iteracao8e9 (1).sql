create database iteracao8e9;

use iteracao8e9;

CREATE TABLE Usuario (
id int NOT NULL,
nome VARCHAR (235) NOT NULL,
email VARCHAR(235) NOT NULL,
senha CHAR (60) NOT NULL,
codigo_verificacao CHAR (36) not null,
verificado BOOL,
PRIMARY KEY (id)
);

create table criar_lista(
id int not null,
nome VARCHAR (100) NOT NULL,
id_usuario int NOT NULL,
cor CHAR (6) NOT NULL,
primary key (id),
foreign key (id_usuario) REFERENCES Usuario (id)
);

CREATE TABLE Tarefas(
id int NOT NULL,
descricao VARCHAR (100) NOT NULL,
id_usuario int NOT NULL,
realizada BOOL,
id_criar_lista int NOT NULL,
data date not null,
PRIMARY KEY (id),
FOREIGN KEY (id_criar_lista) REFERENCES criar_lista(id) on delete cascade
);

CREATE TABLE alteracao_senha (
id int not null,
id_usuario int not null,
cod_verificacao char (36),
gerada_em datetime NOT NULL,
utilizada BOOL NOT NULL,
primary key (id),
foreign key (id_usuario) REFERENCES Usuario (id)
);

INSERT INTO Usuario VALUES
(1, 'Joao', 'joao@gmail.com', '$2a$12$6utziCb40RFAB1h/b2A6e.w6.MEAqSyB4SAZlEocibYWO50BoTwA2', '52ce6f3c-b445-11ec-b909-0242ac120002', false),
(2, 'Maria', 'maria@gmail.com', '$2a$12$ofGpmET7XPPl4NCJo6iMBOR9B3wdbw4jSpBQjsvl0CpaZt.h/lBSK', '5e46b928-b445-11ec-b909-0242ac120002', false),
(3, 'luana', 'luana@gmail.com', '$2a$12$FXxkzhNZFSQSXJFhwNv7muE0I/FCtAY14FJCdn03zaaR61mGSewZS', '6853901c-b445-11ec-b909-0242ac120002', false);
 
insert into alteracao_senha values
(1, 1, '1c16122d-5f74-4772-bc93-b521160ab5b0', '2022-04-09 20:18:30', false);


insert into criar_lista VALUES
(1, 'obrigações do lar', 1, 'FFBF00'),
(2, 'vida saudavel', 2,  '04B486'),
(3, 'escola', 3, 'AC58FA');

insert into Tarefas values
(1, 'comprar carne moida', 1, false, 1, '2022-04-19'),
(2, 'limpar pia', 1, false, 1, '2022-04-19'),
(3, 'lavar o banheiro', 1, false, 1, '2022-04-20'),
(4, 'andar 2 km', 2, false, 2, '2022-04-18'),
(5, 'comer salada', 2, false, 2, '2022-04-18'),
(6, 'acordar cedo', 2, false, 2, '2022-04-19'),
(7, 'fazer lição de logica 2', 3, false, 3, '2022-04-21'),
(8, 'fazer licao de lp1', 3, false, 3, '2022-04-21'),
(9, 'alimentar o gato', 3, false, 3, '2022-04-18');

select*from Usuario;
select *from alteracao_senha;
select*from criar_lista;
select*from Tarefas;

select*
from Tarefas
where data = '2022-04-18'
and realizada=false
and id_criar_lista in (1,2,3);

delete from Tarefas where id=2;
delete from criar_lista where id=1;


