create database biblioteca;
use biblioteca;
create table Autores (
Nome varchar (40) not null,
Nacionalidade Varchar (20) not null,
primary key (Nome)
);
create table Categoria (
Cód_categoria int not null,
Descrição varchar (60) not null,
primary key (Cód_categoria)
);

create table Livro (
ISBN int not null,
Titulo varchar (40) not null, 
Ano_editora varchar (40) not null,
Nome_autor varchar (40) not null,
Cód_categoria int not null,
primary key (ISBN)
);
alter table Livro add foreign key (Nome_autor) references Autores (Nome);
alter table Livro add foreign key (Cód_categoria) references Categoria (Cód_categoria);

insert into autores values ('courtois','Austríaco');
insert into autores values ('labrareda', 'island');
insert into autores values ('lampard','frances');
insert into categoria values (12, 'romance');
insert into categoria values (15, 'suspense');
insert Into categoria values (10, 'terror');
insert into livro values (159, 'upalumpa','20-01-05','courtois', 15);
insert into livro values (158, 'uma vez','17-12-04','lampard', 12);
insert into livro values (157, 'boodle','19-03-97','courtois', 10);
insert into livro values (156, 'não deixa','17-01-06','lampard', 12);
insert into livro values (155, 'pai rico,pai pobre','30-05-16','labrareda', 15);
insert into livro values (154, 'urna','17-04','lampard', 10);

select * from livro;

/* 1. Informar a quantidade total de livros na biblioteca */
select count(ISBN) from Livro ;
/* 2. Informar qual livro o autor Courtois escreveu */
select * from Livro where Nome_autor= 'courtois';
-- SUBCONSULTA
select Titulo from livro where Nome_autor = (select Nome from Autores where Nome = 'courtois');
/* 3. Informar a quantidade de livros que não foi escrito por Lampard */
select count(*) from livro where not Nome_autor= 'lampard';
-- SUBCONSULTA
select count(Titulo) from livro where Nome_autor != (select Nome from Autores where Nome = 'lampard');
/* 4.Informar quais livros começam com "U" */
select Titulo from livro where Titulo like'u%';
/* 5. Informar quais livros terminam com "A" */
select titulo from livro where titulo like'%a';


/* SUBCONSULTA */
-- Informe a quantidade de livros que o lampard escreveu
select count(nome_autor) from livro where Nome_autor = (select Nome from Autores where Nome = 'lampard');

-- Infromar quais livros estão na categoria terror
select Titulo from livro where cód_categoria = (select Cód_categoria from Categoria where Cód_categoria = 10);

-- Informar quais livros terminam com "A" que o lampard escreveu
select titulo from livro where titulo like'%a' and nome_autor = (select Nome from autores where Nome = 'lampard')
       




