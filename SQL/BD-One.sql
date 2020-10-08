create database One_solutions;

create table empresa (
idEmpresa int primary key auto_increment,
nome varchar(30),
CNPJ char(14),
Email varchar(30),
Telefone varchar(11),
fkEndereco int,
foreign key (fkEndereco) references endereco (idEndereco)
);
create table endereco(
idEndereco int primary key auto_increment,
CEP char(8),
Logradouro varchar(25),
Numero int,
Bairro varchar(25),
Cidade varchar(30),
Estado varchar(30)
);
create table usuario (
idUsuario int primary key auto_increment,
Nome varchar(30),
Data_nasc date,
CPF char(11),
Email varchar(30),
Senha varchar(30),
Telefone char(11),
fkEmpresa int,
foreign key (fkEmpresa) references empresa (idEmpresa)
)auto_increment= 100;
create table sensor (
idSensor int primary key auto_increment,
locais varchar(20),
status_sensor varchar (10),
check (status_sensor = "inativo" or status_sensor = "ativo" or status_sensor = "manutencao"),
fkEmpresa int,
foreign key (fkEmpresa) references empresa (idEmpresa)
);
create table registro (
idRegistro int primary key auto_increment,
Data_temp datetime default current_timestamp,
Temperatura float,
Umidade float,
fkSensor int,
foreign key (fkSensor) references sensor (idSensor)
);
desc registro;
insert into endereco values
(null,12345678,'Rua batata',12,'Centro','São Paulo','São Paulo');
insert into empresa values 
(null,'VIVO',01234567891011,'VIVO@gmail.com.br',11912345678,1);
insert into usuario values 
(null,'Luis Carlos',"1994-05-26",'12345678910','Luis@hotmail.com','Luis12345','11912365478',1);
insert sensor values 
(null,'Recepcao','ativo',1);
insert registro values 
(null,sysdate(),20,45,1);
select * from registro;

