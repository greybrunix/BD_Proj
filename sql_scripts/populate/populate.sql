USE mademoiselle_borges;

-- Inserção de funcionários
CALL register_new_employee("ADMIN00001", "Henrique Borges",
												 "382923812", "1968-12-24", "Rua do blah",
												 "Eventopolis", "1111-111", NULL, "+1111111111","henriquinho@borges.et");
CALL register_new_employee("ADMIN00002", "Maria Ivanovna Ivanova",
												 "129293919", "1999-04-13", "Rua do blah",
												 "Eventopolis", "1111-111", NULL, "+2222222222","miva2@iva.et");
CALL register_new_employee("ADMIN00003", "Herr Otto Mustermann",
								"198263843", "2002-07-19", "Rua do blah",
								"Eventopolis", "1111-111", NULL, "+33333333333","herr@motto.et");
CALL register_new_employee("JANIT00001", "Jacinto Ivanovich",
							 "192382742", "1979-04-13", "Rua do blah",
                           "Eventopolis", "1111-111", NULL, "+4444444444","orig@jacinto.et");
CALL register_new_employee("JANIT00002", "Jacinto Ivanovich Sr",
						   "192382743", "1959-04-13", "Rua do blah",
                           "Eventopolis", "1111-111", "JANIT00001", "+555553555","sen@jacinto.et");
CALL register_new_employee("JANIT00003", "Jacinto Ivanovich Jr",
						   "192382744", "1999-04-13", "Rua do blah",
                           "Eventopolis", "1111-111", "JANIT00001", "+6666666666","jr@jacinto.et");
CALL register_new_employee("MARKT00001", "Miguel Mata Migalhas",
						   "999999999", "1974-04-25", "Avenida dos Vampiros",
                           "Eventopolis", "5555-555", NULL, "+7777777777","mimami@mar.et");
CALL register_new_employee("MARKT00002", "Ruis Luis",
						   "444444444", "2004-04-04", "Rua da Praça Proibida",
                           "Lon Gedaki", "4444-444", "MARKT00001", "+8888888888","uiui@mar.et");
CALL register_new_employee("SALES00001", "Artur Doffensmirtz",
						   "333333333", "1979-03-03", "Rua do Ornitorrinco",
                           "Eventopolis", "1111-132", "MARKT00002", "+9999999999","doff@krr.et");
CALL register_new_employee("SALES00002", "Benilde Portas de Madeira",
						   "222222222", "1970-02-22", "Rua do Centro nº1, 5B",
                           "Eventopolis", "1111-221", "SALES00001", "+10101101010","bpm@sal.et");
CALL register_new_employee("SECUR00001", "José Carlos Malandro",
						   "111111111", "2000-11-11", "Rua do Centro nº1, 5A",
                           "Eventopolis", "1111-221", NULL, "+20202022020","jcm@secur.et");
CALL register_new_employee("JANIT00004", "Aknostr Grust Hings",
						   "666666666", "1996-01-29", "Trilho da Bananeira",
                           "Hsombra", "1169-111", "JANIT00001", "+303033030303","agh@jacinto.et");
CALL register_new_employee("SECUR00002", "Alice Grande Pequena",
						   "777777777", "1968-07-21", "Travessa da Lua",
                           "Ham Strong City", "7777-221", "SECUR00001", "+40404044404","agp@secur.et");
CALL register_new_employee("MARKT00003", "Bernardo Fernado Ferrari",
						   "888888888", "1988-08-15", "Rua da Boa Corrida",
                           "Eventopolis", "8888-111", "MARKT00001", "+5050505050","bff@mar.et");
CALL register_new_employee("SALES00003", "Ines Luis Grust Hings",
						   "666666661", "1996-01-11", "TRilho da Bananeira",
                           "Hsombra", "1169-111", "SALES00001", "+6060660606","ilu@sal.et");
CALL register_new_employee("MARKT00004", "Yuppi May Catrindottir Alavason",
						   "101010101", "2000-11-11", "Rua Doutor Felis Felizardo Felisberto",
                           "Eventopolis", "1010-101", "MARKT00001", "+707707700707","ymca@mar.et");


                           
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

-- Inserçao de funcionarios associados a um dado evento

CALL assign_employee_event(1, "SALES00001"); 
CALL assign_employee_event(1, "SALES00002");
CALL assign_employee_event(1, "SALES00003");
CALL assign_employee_event(1, "JANIT00001"); 
CALL assign_employee_event(1, "JANIT00002");
CALL assign_employee_event(1, "JANIT00003");
CALL assign_employee_event(1, "JANIT00004");
CALL assign_employee_event(1, "JANIT00004");
CALL assign_employee_event(1, "SECUR00001");
CALL assign_employee_event(1, "SECUR00002");
CALL assign_employee_event(1, "MARKT00001");
CALL assign_employee_event(1, "MARKT00002");
CALL assign_employee_event(1, "MARKT00003");
CALL assign_employee_event(1, "MARKT00004");

CALL assign_employee_event(2, "SALES00001"); 
CALL assign_employee_event(2, "SALES00002");
CALL assign_employee_event(2, "SALES00003");
CALL assign_employee_event(2, "JANIT00001"); 
CALL assign_employee_event(2, "JANIT00002");
CALL assign_employee_event(2, "JANIT00003");
CALL assign_employee_event(2, "JANIT00004");
CALL assign_employee_event(2, "SECUR00001");
CALL assign_employee_event(2, "SECUR00002");
CALL assign_employee_event(2, "MARKT00001");
CALL assign_employee_event(2, "MARKT00002");
CALL assign_employee_event(2, "MARKT00003");
CALL assign_employee_event(2, "MARKT00004");

CALL assign_employee_event(3, "SALES00001"); 
CALL assign_employee_event(3, "SALES00002");
CALL assign_employee_event(3, "SALES00003");
CALL assign_employee_event(3, "JANIT00001"); 
CALL assign_employee_event(3, "JANIT00002");
CALL assign_employee_event(3, "JANIT00003");
CALL assign_employee_event(3, "JANIT00004");
CALL assign_employee_event(3, "SECUR00001");
CALL assign_employee_event(3, "SECUR00002");
CALL assign_employee_event(3, "MARKT00001");
CALL assign_employee_event(3, "MARKT00002");
CALL assign_employee_event(3, "MARKT00003");
CALL assign_employee_event(3, "MARKT00004");

CALL assign_employee_event(4, "SALES00001"); 
CALL assign_employee_event(4, "SALES00002");
CALL assign_employee_event(4, "SALES00003");
CALL assign_employee_event(4, "JANIT00001"); 
CALL assign_employee_event(4, "JANIT00002");
CALL assign_employee_event(4, "JANIT00003");
CALL assign_employee_event(4, "JANIT00004");
CALL assign_employee_event(4, "SECUR00001");
CALL assign_employee_event(4, "SECUR00002");
CALL assign_employee_event(4, "MARKT00001");
CALL assign_employee_event(4, "MARKT00002");
CALL assign_employee_event(4, "MARKT00003");
CALL assign_employee_event(4, "MARKT00004");

CALL assign_employee_event(5, "SALES00001"); 
CALL assign_employee_event(5, "SALES00002");
CALL assign_employee_event(5, "SALES00003");
CALL assign_employee_event(5, "JANIT00001"); 
CALL assign_employee_event(5, "JANIT00002");
CALL assign_employee_event(5, "JANIT00003");
CALL assign_employee_event(5, "JANIT00004");
CALL assign_employee_event(5, "SECUR00001");
CALL assign_employee_event(5, "SECUR00002");
CALL assign_employee_event(5, "MARKT00001");
CALL assign_employee_event(5, "MARKT00002");
CALL assign_employee_event(5, "MARKT00003");
CALL assign_employee_event(5, "MARKT00004");

CALL assign_employee_event(6, "SALES00001"); 
CALL assign_employee_event(6, "SALES00002");
CALL assign_employee_event(6, "SALES00003");
CALL assign_employee_event(6, "JANIT00001"); 
CALL assign_employee_event(6, "JANIT00002");
CALL assign_employee_event(6, "JANIT00003");
CALL assign_employee_event(6, "JANIT00004");
CALL assign_employee_event(6, "SECUR00001");
CALL assign_employee_event(6, "SECUR00002");
CALL assign_employee_event(6, "MARKT00001");
CALL assign_employee_event(6, "MARKT00002");
CALL assign_employee_event(6, "MARKT00003");
CALL assign_employee_event(6, "MARKT00004");

-- Inserçao de fornecedores
CALL register_supplier ("World of Books","ET493958654897440","Paper Valley, nº234","Calecornia","2710-008-ZZZ" , 
						"world-books@mdl.et", "+631854-677219");
CALL register_supplier ("Lorbeer und Lorbeer Materials Lda","GE905440777332294","Teller von Lachen, nº91, Piso 3","Inglostadt","4000-003", 
						"materialslul@matino.ge", "+68349-333-10102");
CALL register_supplier ("Badhiya Kapaas","IND66979302668492","Traayamph Skvaayar, nº124","Goa","4485-4432", 
						"fashionkapaas@badkap.in", "+222543296584-3");
CALL register_supplier ("AltaPelle Distributore","IT40330399569611111","Via Carlos Vallente, nº27","Piza","3-55-88895", 
						"altpe@dist.it", "+444-8599339-2111");
CALL register_supplier ("Edital Impressao","PT96797397339295","Alameda da Vitoria, n234","Guimarães","4800-234", 
						"editalimp@edital.pt", "+351252111116");
CALL register_supplier ("Diavges Sympan Lda","GR775588994433225566","Leoforos tou Mikrolameira, n123","Tebas","500-692-4", 
						"diasymp@ludico.gr", "+34002-995-033-869");
CALL register_supplier ("Kreativnyye Resheniya Importer","RU0020105889044430","Arkticheskiy prospekt, n94","Ufa","38948-222-01", 
						"kreat@imprt.ru", "+643333020-4-3111");
CALL register_supplier ("InovaPrint Solucciones Graficas","ES6854920492946841","Rua dela dama del dia, n20, Oficina I ","Mirallá","9000-009-AAA", 
						"inovaprint@inova.es", "+583920007-90");
CALL register_supplier ("Sangbeoggyuoppa Mungujeom","SCOR6695593388200060","jong-ijib geoli, n234","Jeju","2750-008", 
						"mungsbeog@psg.sc", "+25839443922204");
CALL register_supplier ("Páginas Vivas Publicações Inc.","BR99900299294958811","Rua Anita Carlota, n111","Curitiba","4740-081", 
						"paginasvivas@vivas.br", "+33335434890250-111");
CALL register_supplier ("Himno ng Kagalakan Ltda.","FP22294939205R8687853" ,"pinggan ng mga bulaklak, n001","Manila","747484-444", 
						"him@ltda.fp", "+3512521111121");
                        


-- Inserção de Produtos
CALL register_reservation_new_product ("Pacote Caneta Azul Bic",
									   "Pacote de 10 Canetas da Marca Bic, cor azul", 
                                       "3.89","3","2023-11-30 13:00:00",35,"2023-10-30 09:00:00");
CALL register_reservation_new_product ("Borracha Branca","2 Borrachas MAPPED",1.10,
										3,"2023-11-30 13:00:00",21,"2023-10-30 09:00:00");
CALL register_reservation_new_product ("Pacote Caneta Vermelha Bic","Pacote de 10 Canetas da Marca Bic, cor vermelha",3.89,
										3,"2023-11-30 13:00:00",30,"2023-10-30 09:00:00");
CALL register_reservation_new_product ("Lápis de Cor Faber-Castell","Caixa com 36 lápis de cor vibrantes",29.99,
										3,"2023-11-30 13:00:00",13,"2023-10-30 09:00:00");
CALL register_reservation_new_product ("Livro para Colorir","Livro com imagens de locais e eventos importantes de Eventopolis para colorir ",6.00,
										1,"2023-12-10 08:30:00",7,"2023-11-10 19:00:00");
CALL register_reservation_new_product ("Livro 'Historia de Eventopolis, do século XV até modernidade'",
									   "Livro do autor Benedito Leão, onde ele escreve sobre vários eventos históricos da antiga cidade de Eventopolis",30.00,
										1,"2023-12-10 08:30:00",6,"2023-11-10 19:00:00");
CALL register_reservation_new_product ("Assinatura Mensal de Livros Locais",
									   "Receba mensalmente um livro de um autor local ou com temática da cidade",10.99,
										1,"2023-12-10 08:30:00",22,"2023-11-10 19:00:00");
CALL register_reservation_new_product ("Caderno Pautado","Caderno com 100 folhas pautadas",1.50,
										9,"2024-01-25 16:00:00",30,"2023-12-25 10:00:00");
CALL register_reservation_new_product ("Caderno Quadriculado","Caderno com 100 folhas quadriculadas",1.50,
										9,"2024-01-25 16:00:00",30,"2023-12-25 10:00:00");
CALL register_reservation_new_product ("Caneca 'I LOVE Eventopolis'","Caneca de ceramica com o slogan da cidade",7.50,
										2,"2023-11-30 14:45:00",20,"2023-10-30 17:00:00");
CALL register_reservation_new_product ("Jogo de Tabuleiro 'Descubra Eventopolis'",
									   "Jogo interativo para explorar a história e geografia de Eventopolis",24.55,
										11,"2023-12-10 13:00:00",5,"2023-11-10 11:11:11");
CALL register_reservation_new_product ("Livro de Receitas 'Sabores de Eventopolis'",
									   "Receitas locais e tradicionais da região copiladas pelo enigmatico chefe Roy Mustang",49.95,
										10,"2023-12-10 00:00:48",4,"2023-11-10 15:00:00");
CALL register_reservation_new_product ("Agenda Anual Gatos 2024",
									   "Agenda com páginas para cada dia do ano com imagens de vários felinos",12.99,
										4,"2024-03-18 09:30:00",100,"2024-02-18 14:00:00");
CALL register_reservation_new_product ("Conjunto de Postais de Eventopolis",
									   "Pacote com 10 postais ilustrados de vários monumentos da cidade, incluido a famosa estufa construida por Carlos Valente no inicio do seculo XX",9.99,
										5,"2023-12-10 13:00:00",23,"2023-11-10 12:45:00");
CALL register_reservation_new_product ("Guia Turístico de Eventopolis","Livro informativo com destinos, atrações e lendas da cidade",11.50,
										8,"2023-12-10 13:00:00",10,"2023-11-10 12:45:00");
                                        
CALL register_reservation_new_product ("T-shirt 'I LOVE EVENTOPOLIS'","Uma t-shirt de tamanho S com o famoso logo'",10.00,
									    2,"2024-03-20 11:00:00",30,"2023-11-16 10:00:00");                                        
CALL register_reservation_new_product ("Bloco de Notas de Couro","Bloco de notas elegante com capa de couro sintético",9.75,
									    7,"2024-03-20 08:00:00",12,"2023-11-16 19:45:00");
CALL register_reservation_new_product ("Livro 'A vida secreta de Carlos Valente'","Uma Biografia escrita por Maria Alves, acerca da escandalosa vida do mais importante arquiteto de Eventopolis",35.00,
									    1,"2024-03-19 08:30:00",9,"2023-11-10 19:00:00");
CALL register_reservation_new_product ("Bloco de Desenho A4","Bloco de papel para desenho tamanho A4, 50 folhas",12.95,
									    9,"2024-03-19 16:00:00",19,"2023-12-25 10:00:00");

SELECT * FROM Product;

-- Inserçao de produtos encomendados pelos respetivos fornecedores

CALL register_delivery_product (7,3,"2023-11-30 13:00:00", 1);
CALL register_delivery_product (8,3,"2023-11-30 13:00:00", 1);
CALL register_delivery_product (9,3,"2023-11-30 13:00:00", 1);
CALL register_delivery_product (10,3,"2023-11-30 13:00:00", 1);
CALL register_delivery_product (11,1,"2023-12-10 08:30:00", 1);
CALL register_delivery_product (12,1,"2023-12-10 08:30:00", 1);
CALL register_delivery_product (13,1,"2023-12-10 08:30:00", 1);
CALL register_delivery_product (14,9,"2024-01-25 16:00:00", 1);
CALL register_delivery_product (15,9,"2024-01-25 16:00:00", 1);
CALL register_delivery_product (16,2,"2023-11-30 14:45:00", 1);
CALL register_delivery_product (17,11,"2023-12-10 13:00:00", 1);
CALL register_delivery_product (18,10,"2023-12-10 00:00:48", 1);
CALL register_delivery_product (19,4,"2024-03-18 09:30:00", 1);
CALL register_delivery_product (20,5,"2023-12-10 13:00:00", 1);
CALL register_delivery_product (21,8,"2023-12-10 13:00:00", 1);
CALL register_delivery_product (22,2,"2024-03-20 11:00:00", 1);
CALL register_delivery_product (23,7,"2024-03-20 08:00:00", 1);
CALL register_delivery_product (24,1,"2024-03-19 08:30:00", 1);
CALL register_delivery_product (25,1,"2024-03-19 16:00:00", 1);

-- Inserçao de carrinho de compras (Participante novo)

CALL add_prod_new_shop_new_part("SALES00001", 1,
						"Ana Alves Aves",NULL,"Rua Antonio Malheiro","Atchim","4406-333","2000-10-03",
						1, "+351101092200", "aaa@machadinha.et");
SELECT * FROM Sale;
SELECT * FROM ParticipantPhone;
SELECT * FROM Product;
CALL add_prod_new_shop_new_part("SALES00001", 1,
						"Beto Bartolomeu Broa","500402204","Sitio do Pica-pau","Amarelo","5504-999","1960-01-03",
						1, "+351101092201", "bbb@tvi.et");
CALL add_prod_new_shop_new_part("SALES00001", 2,
						"Carlos Coentrao Cavaco",null,"Rua do Palhaco Mudo","Palhaca","1566-839","1970-05-04",
						1, "+351101092202", "ccc@cerpente.et");
CALL add_prod_new_shop_new_part("SALES00002", 2,
						"Diofantina Duarte Dias","295839290","Avenida da Real Virtualidade","Mato da Beira","0119-703","1990-11-11",
						1, "+351101092203", "ddd@nutmax.yp");
CALL add_prod_new_shop_new_part("SALES00002", 3,
						"Eduardo Ernesto","667438290","Travessa Entre-Riachos","Puarto","7777-431","2003-08-30",
						1, "+351101092204", "ee@hehe.he");
CALL add_prod_new_shop_new_part("SALES00002", 4,
						"Fhatima Alkhashour",null,"Bairro do Gato Maltes","Pianno Valletta","4403-752","2013-12-25",
						1, "+351101092205", "fhaal@tapoporto.uz");
CALL add_prod_new_shop_new_part("SALES00003", 4,
						"Gilberto Gloria Gomes Galhardo","555444333","Praca of Alliances","En-Guardinton","6659-330","2010-03-02",
						1, "+351101092206", "gegegege@togeee.ge");
CALL add_prod_new_shop_new_part("SALES00003", 5,
						"Blake Edwards","448395907","Rua Pantera Cor-de-Rosa","Panan-Panan","3302-544","1994-09-22",
						1, "+351101092207", "hhh@aaaaa.tchin");
CALL add_prod_new_shop_new_part("SALES00003", 5,
						"Ivo Ilhas","200019776","Rua do Ivo","Ilhotas do Ivo","1111-000","1000-01-01",
						1, "+351101092208", "iilhas@dunas.dv");
CALL add_prod_new_shop_new_part("SALES00003", 6,
						"Anatoliyy Curie","559430210","Rua da Menina do Polonio","Eurehka","5077-496","2007-11-07",
						1, "+24199504421", "ak47@boom.cs");
CALL add_prod_new_shop_new_part("SALES00003", 6,
						"Hector Hernandez","604449622","Ruelha de la Pas","Bolicau","3019-301","2001-09-10",
						1, "+24199504422", "hhplus1@aaaaa.tchin");
CALL add_prod_new_shop_new_part("SALES00002", 1,
						"Pavel Nguissa","330209763","Avenida da Gritaria","Onda","1039-586","2004-02-29",
						1, "+24199504423", "sigmat@golo.afk");
CALL add_prod_new_shop_new_part("SALES00003", 2,
						"Jay Okocha","069411194","Travessa Costa Dourada","Praia de Matosinhos","7732-410","2016-07-10",
						1, "+24199504424", "jjayokoctha@psg.fr");
CALL add_prod_new_shop_new_part("SALES00003", 3,
						"Jasper Lindkrug","110097832","Rua Mas Marias","Gotland","6000-256","1936-05-23",
						1, "+24199504425", "jaspenkrug@ger.sw");
CALL add_prod_new_shop_new_part("SALES00002", 4,
						"Yang Lee-sang","559302119","Bairro Tia Ying-Yang","Principado de Qin","5094-333","2174-10-31",
						1, "+24199504426", "ylsneg@soc.pts");
CALL add_prod_new_shop_new_part("SALES00001", 5,
						"Mizutsuki Yamatora",null,"Baia de Oda","Wan Pice","6039-777","1953-04-16",
						1, "+24199504427", "WEAREONTHECRUISEEE@onepiece.oda");
                        
-- Inserção de carrinho que compras (Participantes existentes)
CALL add_prod_to_new_shopping_cart(1,"SALES00001", 10, 1);
CALL add_prod_to_new_shopping_cart(1,"SALES00001", 14, 1);
CALL add_prod_to_new_shopping_cart(1,"SALES00001", 24, 1);
CALL add_prod_to_new_shopping_cart(3,"SALES00002", 23, 1);
CALL add_prod_to_new_shopping_cart(3,"SALES00002", 11, 1);
CALL add_prod_to_new_shopping_cart(5,"SALES00003", 7, 1);
CALL add_prod_to_new_shopping_cart(5,"SALES00003", 8, 1);
CALL add_prod_to_new_shopping_cart(5,"SALES00003", 17, 1);
CALL add_prod_to_new_shopping_cart(5,"SALES00003", 12, 1);
CALL add_prod_to_new_shopping_cart(7,"SALES00001", 16, 1);
CALL add_prod_to_new_shopping_cart(9,"SALES00003", 20, 1);
CALL add_prod_to_new_shopping_cart(9,"SALES00003", 21, 1);
CALL add_prod_to_new_shopping_cart(9,"SALES00003", 25, 1);
CALL add_prod_to_new_shopping_cart(11,"SALES00002", 18, 1);
CALL add_prod_to_new_shopping_cart(13,"SALES00001", 9, 1);
CALL add_prod_to_new_shopping_cart(13,"SALES00001", 22, 1);
CALL add_prod_to_new_shopping_cart(13,"SALES00001", 19, 1);

-- Inserçao de vendas

