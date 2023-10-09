# BD-Editora
<img src="https://img.shields.io/badge/Status-Em%20Desenvolvimento-yellow">

<h2>Projeto de Banco de Dados - Editora</h2>
O presente projeto é oriundo da disciplina de Banco de Dados II, ministrado pela Faculdade SENAC - Pernambuco.
O professor da disciplina nos forneceu alguns minimundos para que fosse escolhido apenas um para realizar o trabalho. Neste caso, escolhemos o minimundo da Editora.
Os dados descritivos do minimundo da Editora, fornecidos pelo professor está descrito abaixo:

<h3>Editora</h3>
Para  um  projeto  de  banco  de  dados  abrangente  para  uma  editora  de  livros,  é essencial considerar todas as informações e processos envolvidos. 
Abaixo, apresento nove entidades que podem ser parte do banco de dados:

<br>● <strong>Livros</strong>: Cada  livro  é  identificado  por  um  ISBN  único  (International  Standard Book Number). Inclui  informações  como  título,  autor,  editora,  data  de  publicação, gênero, número de páginas e descrição.
<br>● <strong>Autores</strong>: Cada autor é cadastrado com um ID único.oAs  informações  incluem  nome,  biografia,  nacionalidade,  data  de nascimento e obras escritas.
<br>● <strong>Departamentos</strong>: Os departamentos internos da editora são registrados.oInclui nome do departamento, responsável, e descrição das atividades 
desempenhadas.
<br>● <strong>Exemplares</strong>: Cada exemplar de livro tem um número de série único.oRegistra   informações   sobre   o   estado   (disponível,   reservado, danificado, etc.) e a localização física na editora.
<br>● <strong>Áreas de Conhecimento</strong>: As áreas de conhecimento nas quais os livros estão categorizados são mantidas.oInclui código da área e descrição.
<br>● <strong>Palavras-chave</strong>: Cada palavra-chave relevante para os livros é registrada.oInclui código da palavra-chave e descrição.
<br>● <strong>Funcionários</strong>: Os funcionários da editora são cadastrados com informações pessoais, como nome, cargo, telefone e endereço. Cada funcionário está associado a um departamento específico.
<br>● <strong>Pedidos e Vendas</strong>: Registra  os  pedidos  de  livros  feitos  por  clientes  e  os  registros  de vendas. Inclui informações sobre os clientes, datas das transações, status dos pedidos e detalhes de pagamento.
<br><br>● Este  sistema  de  banco  de  dados  permitirá  que  a  editora  de  livros  gerencie com eficiência todo o processo de publicação, distribuição e vendas, desde o cadastro de livros e autores até o controle de estoque e registros financeiros. Facilitará  a  tomada  de  decisões  estratégicas  e  o  atendimento  eficaz  aos clientes.

<h3>Modelo Entidade Relacionamento</h3>

A partir das informações prestadas pelo professor e exibidas acima, criamos o Modelo Entidade Relacionamento (exibido abaixo), utilizando o Br Modelo. Optamos por incluir algumas modificações de acordo com a nossa interpretação e análise de negócio.
<img src="">

<h3>Modelo Lógico</h3>

A partir do Modelo Entidade Relacionamento exibido acima, foi criado o modelo lógico, utilizando o MySQL Workbench 8.0. Confira abaixo:
<img src="">
