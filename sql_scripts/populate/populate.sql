USE mademoiselle_borges;

CALL register_new_event("Christmas Booksale - Mademoiselle Borges",
                        "Let us honor the memory blah blah blah",
                        "2023-12-19 15:30:00", "2024-01-02 01:59:59",
                        0, "Christmas Booksale Ticket", "5.2");
                        
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