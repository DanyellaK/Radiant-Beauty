Create table beauty.Enderecos(
	Id_end int primary key,
	Rua text,
	Num int,
	Bairro text,
	Cidade text,
	Estado text
);

Create table beauty.Usuarios(
	Cpf int primary key,
	Nome text,
	Email text,
	Id_end int references beauty.Enderecos(Id_end)
);

Create table beauty.Produtos(
	Id_prod int primary key,
	Nome text,
	Preco decimal(6,2)
);

Create table beauty.Categorias(
	Id_categoria int primary key,
	Nome text
);

Create table beauty.ProdutoCategoria(
	Id_prod int references beauty.Produtos(Id_prod) on delete cascade,
	Id_categoria int references beauty.Categorias(Id_categoria) on delete cascade
);

Create table beauty.Vendas(
	Cpf int references beauty.Usuarios(Cpf) on delete cascade,
	Id_prod int references beauty.Produtos(Id_prod),
	Data date,
	Horario time
);
