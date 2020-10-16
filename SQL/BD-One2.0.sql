create database One_solutions;

use One_solutions;

create table empresa (
idEmpresa int primary key auto_increment,
nome varchar(45),
CNPJ char(25),
email varchar(45),
telefone char(13),
ramal char(5),
CEP char(10),
logradouro varchar(100),
numero varchar(10),
bairro varchar(30)
);

create table usuario (
idUsuario int primary key auto_increment,
nome varchar(30),
data_nasc date,
CPF char(15),
email varchar(30),
senha varchar(30),
fkEmpresa int,
foreign key (fkEmpresa) references empresa (idEmpresa)
)auto_increment= 100;

create table sensor (
idSensor int primary key auto_increment,
status_sensor varchar (10),
check (status_sensor = "inativo" or status_sensor = "ativo" or status_sensor = "manutenção"),
fkLocal int,
foreign key (fkLocal) references local_sensor (idLocal),
fkEmpresa int,
foreign key (fkEmpresa) references empresa (idEmpresa)
);

create table registro (
idRegistro int primary key auto_increment,
data_temp datetime,
temperatura varchar(5),
umidade varchar(5),
fkSensor int,
foreign key (fkSensor) references sensor (idSensor)
);
desc registro;

create table local_sensor (
idLocal int primary key auto_increment,
andar char(3),
sala varchar(8),
quadrante varchar(10)
);

select * from empresa;
insert into empresa values 
(null, 'Vivo', '00. 011. 122/2333-45', 'vivo@gmail.com', '11988883232', '1202', '09313333', 'Alameda Santos', '1200', 'Jardim Paulista');

select * from usuario;
insert into usuario (nome, data_nasc, CPF, email, senha, fkEmpresa) values
('Luik', '2002-10-21', '382.919.328-92', 'luik@gmail.com', '12345', 1);
describe usuario;

select * from sensor;
insert into sensor values 
(null,'Ativo', 1,1);
desc sensor;

select * from registro;
insert into registro(Data_temp, Temperatura, Umidade, fkSensor) values 
(sysdate(), '25°', '50%', 1);
desc registro;

select * from local_sensor;
insert into local_sensor(andar, sala, quadrante) values 
('3', 'Sala 1', 'Central');
desc local_sensor;

