/* Inserir dados*/
Insert into beauty.Enderecos(Id_end, Rua, Num, Bairro, Cidade, Estado)
Values(1, 'Rua das flores', 24, 'Alto do campo', 'Jardim do Serido', 'RN'),
	(2, 'Rua das estrelas', 30, 'Vila lua', 'Parelhas', 'RN'),
	(3, 'Rua dos cristais', 46, 'Minerais', 'Parelhas', 'RN');

Insert into beauty.Usuarios(Cpf, Nome, Email, Id_end)
Values(123, 'Alinne', 'alinne@gmail', 1),
	(456, 'Danyella', 'dany@gmail', 3),
	(789, 'Denyse', 'denys@gmail', 2);

Insert into beauty.Produtos(Id_prod, Nome, Preco)
Values (1, 'Shampoo antiqueda vichy', 100.00),
		(2, 'Condicionador antiqueda vichy', 90.00),
		(3, 'Máscara de hidratação vichy', 110.00);
	
Insert into beauty.Categorias(Id_categoria, Nome)
Values (1, 'Shampoo'), (2, 'Condicionador'), (3, 'Máscara');

Insert into beauty.ProdutoCategoria(Id_prod, Id_categoria)
Values (1, 1), (2, 2), (3, 3);

Insert into beauty.Vendas(Cpf, Id_prod, Data, Horario)
Values (123, 3, '2024-01-03', '09:27:00'),
	(456, 2, '2024-01-03', '09:28:00'),
	(789, 1, '2024-01-03', '09:29:00');

/* Selecionar um produto de uma categoria especifica (condicionador) com o preço abaixo ou igual a 100 */
select nome from beauty.Produtos where id_prod in(
	Select id_categoria from beauty.ProdutoCategoria where id_prod in 
		(select id_prod from beauty.Produtos where preco <= 100) and id_categoria in
		(select id_categoria from beauty.Categorias where nome ilike('Condicionador')));
		
/*Atualizar o preco dos produtos de determinada categoria (Shampoo)*/
update beauty.Produtos
set preco = preco * 1.15
where id_prod in (
	select id_prod from beauty.ProdutoCategoria where id_categoria in(
		select id_categoria from beauty.Categorias where nome ilike('Shampoo')))
		
select * from beauty.Usuarios

/* Deletar usuarios de determinada cidade */
delete from beauty.Usuarios
where id_end in (
	select id_end from beauty.Enderecos where cidade ilike('%Jardim do Serido'))