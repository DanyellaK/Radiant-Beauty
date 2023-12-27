Create table Usuarios(
	Cpf int primary key,
	Nome text,
	Email text
);

Create table Enderecos(
	id_end int primary key,
	Rua text,
	num int,
	Bairro text,
	Cidade text,
	Estado text
);

Create table UsuarioEnd(
	Cpf int references Usuarios(Cpf),
	id_end int references Enderecos(id_end)
);

Create table Categorias(
	id_categoria int primary key,
	Nome text
);

Create table Produtos(
	id_prod int primary key,
	Nome text,
	Preco decimal(6,2)
);

Create table ProdutoCategoria(
	id_prod int references Produtos(id_prod),
	id_categoria int references Categorias(id_categoria)
);

Create table UsuarioProd(
	Cpf int references Usuarios(Cpf),
	id_prod int references Produtos(id_prod)
);


