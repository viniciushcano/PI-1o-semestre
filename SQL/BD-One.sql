create database One_solutions;

use One_solutions;

create table empresa (
idEmpresa int primary key auto_increment,
nome varchar(45),
CNPJ char(14),
email varchar(45),
telefone char(11),
ramal char(5),
CEP char(8),
logradouro varchar(100),
numero varchar(10),
bairro varchar(30)
);

create table usuario (
idUsuario int primary key auto_increment,
Nome varchar(30),
Data_nasc date,
CPF char(11),
Email varchar(30),
Senha varchar(30),
fkEmpresa int,
foreign key (fkEmpresa) references empresa (idEmpresa)
)auto_increment= 100;

create table sensor (
idSensor int primary key auto_increment,
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

create table local_sensor (
idLocal int primary key auto_increment,
andar char(3),
sala varchar(5),
quadrante varchar(10),
fkSensor int,
fkEmpresa int,
foreign key (fkSensor) references sensor(idSensor),
foreign key (fkEmpresa) references empresa(idEmpresa)
);

select * from Empresa;
insert into Empresa values 
(null, 'Vivo', '00011122233345', 'vivo@gmail.com', '11988883232', '1202', '09313333', 'Alameda Santos', '1200', 'Jardim Paulista');

select * from usuario;
insert into usuario (Nome, Data_nasc, CPF, Email, Senha, fkEmpresa) values
('Luik', '2002-10-21', '38291932892', 'luik@gmail.com', '12345', 1);
describe usuario;

select * from sensor;
insert into sensor(status_sensor, fkEmpresa) values 
('Ativo', 1);
desc sensor;

insert into registro(Data_temp, Temperatura, Umidade, fkSensor) values 
(null, '2020-10-15 00:00:00', '25°', '50%', 1);
desc registro;

insert into local_sensor(andar, sala, quadrante, fkSensor, fkEmpresa) values 
('3', 'Sala 1', 'Central', 1, 1);
desc local_sensor;
