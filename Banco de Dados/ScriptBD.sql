create database ProjetoIndividual;
use ProjetoIndividual;
drop database projetoindividual;

create table Usuario(
idUsuario int primary key auto_increment,
Nome varchar(45),
Email varchar(45),
Senha varchar(45)
);

create table Quiz(
idQuiz int primary key auto_increment,
Pontos int,
fkUsuario int,
QtdAcertos int,
foreign key(fkUsuario) references Usuario(idUsuario)
);

create table Comentarios(
idComentario int primary key auto_increment,
Comentario varchar(200),
fk_Usuario int,
foreign key(fk_Usuario) references Usuario(idUsuario)
);

-- DADOS DAS TABELAS
select * from Usuario;
select * from Quiz;
select * from Comentarios;

-- NOMES E OS PONTOS DOS USUÁRIOS
select Usuario.Nome, Quiz.Pontos from Usuario join Quiz on fkUsuario = idUsuario;

-- NOMES E OS COMENTÁRIOS DOS USUÁRIOS
select Usuario.Nome, Comentarios.Comentario from Usuario join Comentarios on fk_Usuario = idUsuario;

-- NOMES E QUANTIDADE DE RESPOSTAS CERTAS
select Usuario.Nome, Quiz.QtdAcertos from Usuario join Quiz on fkUsuario = idUsuario;

-- NOMES, PONTOS, QUANTIDADE DE ACERTOS E OS COMENTÁRIOS DOS USUÁRIOS ORDENADO EM ORDEM DECRESCENTE
select Usuario.Nome, Quiz.Pontos, Quiz.QtdAcertos, Comentarios.Comentario from Usuario join Quiz on fkUsuario = idUsuario join Comentarios on idComentario = idQuiz order by Pontos desc;

-- QTD DE USUÁRIOS CADASTRADOS
select count(Nome)'Qtd Usuários cadastrados' from Usuario;

-- MAIOR QTD DE PONTOS 
select max(Pontos)'Pontos' from Quiz;

-- MENOR QTD DE PONTOS
select min(Pontos)'Pontos' from Quiz;

-- SOMA DOS PONTOS
select sum(Pontos)'Soma Dos Pontos' from Quiz;

-- MAIOR E MENOR QTD DE PONTOS
select max(Pontos) 'Maior Qtd Pontos', min(Pontos) 'Menor Qtd Pontos' from Quiz;

-- MÉDIA DE PONTOS
select round(avg(Pontos),0)'Média dos Pontos' from Quiz;

-- NOME DO USUÁRIO COM MENOR QTD DE PONTOS
select Quiz.Pontos, Usuario.Nome from Quiz join Usuario on fkUsuario = idUsuario where Pontos = (select min(Pontos) from Quiz);

-- NOME DO USUÁRIO COM MAIOR QTD DE PONTOS
select Quiz.Pontos, Usuario.Nome from Quiz join Usuario on fkUsuario = idUsuario where Pontos = (select max(Pontos) from Quiz);

-- QUANTIDADE DE VEZES QUE O USUÁRIO TARCISO JOGOU O QUIZ
select count(Pontos)'Qtd de Vezes que Jogou o Quiz', Usuario.Nome from Quiz join Usuario on fkusuario = idUsuario where idUsuario = "1";

-- USUARIOS QUE TIVERAM PONTOS ACIMA DA MÉDIA
select Quiz.Pontos, Usuario.Nome from Quiz join Usuario on fkUsuario = idUsuario where Pontos > (select avg(Pontos) from Quiz);

-- USUARIOS QUE TIVERAM PONTOS ABAIXO DA MÉDIA
select Quiz.Pontos, Usuario.Nome from Quiz join Usuario on fkUsuario = idUsuario where Pontos < (select avg(Pontos) from Quiz);

-- USUÁRIOS QUE TEM A LETRA "T" NO NOME
select * from Usuario where Nome like '%t%';

-- USUÁRIOS QUE COMEÇA COM A LETRA 'J'
select * from Usuario where Nome like 'j%';

-- USUÁRIOS QUE TERMINA COM A LETRA 'O'
select * from Usuario where Nome like '%s';

-- USUÁRIOS QUE TEM A SEGUNDA LETRA 'A'
select * from Usuario where Nome like '_a%';

-- USUÁRIOS QUE A PENULTIMA LETRA É 'I'
select * from Usuario where Nome like '%i_';

