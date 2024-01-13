USE mademoiselle_borges;

-- Inserção de funcionários
CALL register_new_employee("ADMIN00001", "Henrique Borges",
                           "382923812", "1968-12-24", "Rua do blah",
                           "Eventopolis", "1111-111", NULL);

CALL register_new_employee("ADMIN00002", "Maria Ivanovna Ivanova",
                           "129293919", "1999-04-13", "Rua do blah",
                           "Eventopolis", "1111-111", NULL);

CALL register_new_employee("JANIT00001", "Jacinto Ivanovich",
						   "192382742", "1999-04-13", "Rua do blah",
                           "Eventopolis", "1111-111", "ADMIN00001");
CALL register_new_employee("JANIT00002", "Jacinto Ivanovich Sr",
						   "192382743", "1999-04-13", "Rua do blah",
                           "Eventopolis", "1111-111", "ADMIN00001");
CALL register_new_employee("JANIT00003", "Jacinto Ivanovich Jr",
						   "192382744", "1999-04-13", "Rua do blah",
                           "Eventopolis", "1111-111", "ADMIN00002");
-- Inserção de Eventos
CALL register_new_event("Christmas Booksale - Mademoiselle Borges",
                        "Let us honor the memory blah blah blah",
                        "2023-12-19 15:30:00", "2024-01-02 01:59:59",
                        0, "Christmas Booksale Ticket", "5.2");
CALL register_new_event ("Sueca Tournament",
						 "Tournament of the famous card game called 'Sueca'",
                         "2024-02-02 21:30:00","2024-02-04 15:00:00",
                         50,"Ticket for the Tournament","3.0");
CALL register_new_event ("Theater Piece: 'The Hiding Madame'",
						 "Just a Good Theater Piece about the Trust Issues of a Madame",
                         "2023-12-15 18:30:00","2023-12-15 20:30:00",
                         150,"The Madame's Ticket","4.5");
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
									   "Livro do autor Benedito Leão, onde ele escreve sobre vários eventos históricos da antiga cidade de Eventopolis",
                                        30.00,
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
