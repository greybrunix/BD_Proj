USE mademoiselle_borges;

-- Inserção de funcionários
CALL register_new_employee("ADMIN00001", "Henrique Borges",
                           "382923812", "1968-12-24", "Rua do blah",
                           "Eventopolis", "1111-111", NULL);
CALL register_new_employee("ADMIN00002", "Maria Ivanovna Ivanova",
                           "129293919", "1999-04-13", "Rua do blah",
                           "Eventopolis", "1111-111", NULL);
CALL register_new_employee("JANIT00001", "Jacinto Ivanovich",
						   "192382742", "1979-04-13", "Rua do blah",
                           "Eventopolis", "1111-111", "ADMIN00001");
CALL register_new_employee("JANIT00002", "Jacinto Ivanovich Sr",
						   "192382743", "1959-04-13", "Rua do blah",
                           "Eventopolis", "1111-111", "ADMIN00001");
CALL register_new_employee("JANIT00003", "Jacinto Ivanovich Jr",
						   "192382744", "1999-04-13", "Rua do blah",
                           "Eventopolis", "1111-111", "ADMIN00002");
CALL register_new_employee("JANIT00003", "Jacinto Ivanovich Jr",
						   "192382744", "1999-04-13", "Rua do blah",
                           "Eventopolis", "1111-111", "ADMIN00002");
CALL register_new_employee("FLADM00005", "Miguel Mata Migalhas",
						   "999999999", "1974-04-25", "Avenida dos Vampiros",
                           "Eventopolis", "5555-555", NULL);
CALL register_new_employee("FCADM00004", "Ruis Luis",
						   "444444444", "2004-04-04", "Rua da Praça Proibida",
                           "Lon Gedaki", "4444-444", NULL);
CALL register_new_employee("FIND-00003", "Artur Doffensmirtz",
						   "333333333", "1979-03-03", "Rua do Ornitorrinco",
                           "Eventopolis", "1111-132", NULL);
CALL register_new_employee("FADM-00002", "Benilde Portas de Madeira",
						   "222222222", "1970-02-22", "Rua do Centro nº1, 5B",
                           "Eventopolis", "1111-221", "FCADM00004");
CALL register_new_employee("EST-00001", "José Carlos Malandro",
						   "111111111", "2000-11-11", "Rua do Centro nº1, 5A",
                           "Eventopolis", "1111-221", "FADM-00002");
CALL register_new_employee("fl---00006", "Aknostr Grust Hings",
						   "666666666", "1996-29-01", "Trilho da Bananeira",
                           "Hsombra", "1169-111", "FLADM0005");
CALL register_new_employee("F----00007", "Alice Grande Pequena",
						   "777777777", "1968-07-21", "Travessa da Lua",
                           "Ham Strong City", "7777-221", "FADM-00002");
CALL register_new_employee("FADM-00008", "Bernardo Fernado Ferrari",
						   "888888888", "1988-08-15", "Rua da Boa Corrida"
                           "Eventopolis", "8888-111", "FCADM-00002");
CALL register_new_employee("EST-00009", "Ines Luis Grust Hings",
						   "6666666661", "1996-01-11", "TRilho da Bananeira",
                           "Hsombra", "1169-111", "FADM-00002");
CALL register_new_employee("F----00010", "Yuppi May Catrindottir Alavason",
						   "101010101", "2000-11-11", "Rua Doutor Felis Felizardo Felisberto",
                           "Eventopolis", "1010-101", "FADM-00008");


                           
-- Inserção de Eventos
CALL register_new_event("Christmas Booksale - Mademoiselle Borges",
                        "Discover a world of literary wonders at our Christmas Booksale, in honor of the memory of Lady Borges",
                        "2023-12-19 15:30:00", "2024-01-02 01:59:59",
                        0, "Christmas Booksale Ticket", "5.2");
CALL register_new_event ("Sueca Tournament",
						 "Tournament of a famous card game called 'Sueca'",
                         "2024-02-02 21:30:00","2024-02-04 15:00:00",
                         50,"Ticket for the Tournament","3.0");
CALL register_new_event ("Theater Piece: 'The Hidden Madame'",
						 "Attend a lively and entertainign theater performance about the Trust Issues of a certain Madame",
                         "2023-12-15 18:30:00","2023-12-15 20:30:00",
                         150,"The Madame's Ticket","4.5");
CALL register_new_event ("Festive Procession de Sao Celestino de Rabo de Peixe",
						 "Religious Festivity",
                         "2024-02-05 15:00:00","2024-02-06 19:30:00",
                         150,"The Religious Ticket","1.0");
CALL register_new_event ("Puppet Show: 'Red Ridding Hood'",
						 "Delight in a colourful puppet performance that will captivate both children and adults alike, bringing imaginative stories to life",
                         "2024-02-07 13:30:00","2024-02-07 20:30:00",
                         40,"The Puppet Ticket","2.0");
CALL register_new_event ("Arts and Crafts Fair",
						 "Explore local arts and crafts, where families can discover unique handmade creations and participate in creative workshops",
                         "2024-02-08 13:00:00","2024-02-09 20:30:00",
                         80,"The Artiste Ticket","8.0");

                         
-- Inserção de Produtos
CALL register_reservation_new_product ("Pacote Caneta Azul Bic",
									   "Pacote de 10 Canetas da Marca Bic, cor azul", 
                                       3.89,3,"2023-11-30 13:00:00",1,"2023-10-30 09:00:00");
CALL register_reservation_new_product ("Borracha Branca","2 Borrachas MAPPED",1.10,
										3,"2023-11-30 13:00:00",1,"2023-10-30 09:00:00");
CALL register_reservation_new_product ("Pacote Caneta Vermelha Bic","Pacote de 10 Canetas da Marca Bic, cor vermelha",3.89,
										3,"2023-11-30 13:00:00",1,"2023-10-30 09:00:00");
CALL register_reservation_new_product ("Lápis de Cor Faber-Castell","Caixa com 36 lápis de cor vibrantes",29.99,
										3,"2023-11-30 13:00:00",1,"2023-10-30 09:00:00");
CALL register_reservation_new_product ("Livro para Colorir","Livro com imagens de locais e eventos importantes de Eventopolis para colorir ",6.00,
										1,"2023-12-10 08:30:00",1,"2023-11-10 19:00:00");
CALL register_reservation_new_product ("Livro 'Historia de Eventopolis, do século XV até modernidade'",
									   "Livro do autor Benedito Leão, onde ele escreve sobre vários eventos históricos da antiga cidade de Eventopolis",30.00,
										1,"2023-12-10 08:30:00",1,"2023-11-10 19:00:00");
CALL register_reservation_new_product ("Assinatura Mensal de Livros Locais",
									   "Receba mensalmente um livro de um autor local ou com temática da cidade",10.99,
										1,"2023-12-10 08:30:00",1,"2023-11-10 19:00:00");
CALL register_reservation_new_product ("Caderno Pautado","Caderno com 100 folhas pautadas",1.50,
										9,"2024-01-25 16:00:00",1,"2023-12-25 10:00:00");
CALL register_reservation_new_product ("Caderno Quadriculado","Caderno com 100 folhas quadriculadas",1.50,
										9,"2024-01-25 16:00:00",1,"2023-12-25 10:00:00");
CALL register_reservation_new_product ("Caneca 'I LOVE Eventopolis'","Caneca de ceramica com o slogan da cidade",7.50,
										2,"2023-11-30 14:45:00",1,"2023-10-30 17:00:00");
CALL register_reservation_new_product ("Jogo de Tabuleiro 'Descubra Eventopolis'",
									   "Jogo interativo para explorar a história e geografia de Eventopolis",24.55,
										11,"2023-12-10 13:00:00",1,"2023-11-10 11:11:11");
CALL register_reservation_new_product ("Livro 'A vida secreta de Carlos Valente'",
									   "Uma Biografia escrita por Maria Alves, acerca da escandalosa vida do mais importante arquiteto de Eventopolis",30.00,
										0,"2023-12-10 13:00:00",1,"2023-11-10 11:11:11");
CALL register_reservation_new_product ("Bloco de Notas de Couro",
									   "Bloco de notas elegante com capa de couro sintético",9.75,
										0,"2023-12-10 13:00:00",1,"2023-11-10 11:11:11");
CALL register_reservation_new_product ("Livro de Receitas 'Sabores de Eventopolis'",
									   "Receitas locais e tradicionais da região copiladas pelo enigmatico chefe Roy Mustang",49.95,
										1,"2023-12-10 13:00:00",1,"2023-11-10 11:11:11");
CALL register_reservation_new_product ("Bilhete: Teatro Marionetas",
									   "ilhete necessário para usufruir de todos os beneficios do evento",4.00,
										40,"2023-12-10 13:00:00",1,"2023-11-10 11:11:11");
CALL register_reservation_new_product ("Bilhete: Feira Natalicia do Livro",
									   "Bilhete necessário para usufruir de todos os beneficios do evento",4.00,
										300,"2023-12-10 13:00:00",1,"2023-11-10 11:11:11");
CALL register_reservation_new_product ("Bilhete: Feira de Artesanato",
									   "Bilhete necessário para usufruir de todos os beneficios do evento",4.00,
										80,"2023-12-10 13:00:00",1,"2023-11-10 11:11:11");
CALL register_reservation_new_product ("Bilhete: Procissao Festiva de Sao Celestino de Rabo de Peixe",
									   "Bilhete necessário para usufruir de todos os beneficios do evento",4.00,
										150,"2023-12-10 13:00:00",1,"2023-11-10 11:11:11");
CALL register_reservation_new_product ("Bilhete: Peca de Teatro 'A Madame Escondida'",
									   "Bilhete necessário para usufruir de todos os beneficios do evento",4.00,
										150,"2023-12-10 13:00:00",1,"2023-11-10 11:11:11");
CALL register_reservation_new_product ("Agenda Anual Gatos 2024",
									   "Agenda com páginas para cada dia do ano com imagens de vários felinos",12.99,
										1,"2023-12-10 13:00:00",1,"2023-11-10 11:11:11");
CALL register_reservation_new_product ("Conjunto de Postais de Eventopolis",
									   "Pacote com 10 postais ilustrados de vários monumentos da cidade, incluido a famosa estufa construida por Carlos Valente no inicio do seculo XX",9.99,
										1,"2023-12-10 13:00:00",1,"2023-11-10 11:11:11");
CALL register_reservation_new_product ("Bloco de Desenho A4",
									   "BBloco de papel para desenho tamanho A4, 50 folhas",12.95,
										0,"2023-12-10 13:00:00",1,"2023-11-10 11:11:11");
