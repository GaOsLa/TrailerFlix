-- eliminamos la bbdd nombre trailerFlix si es que existe trailerflix exist

DROP SCHEMA IF EXISTS trailerflix;	-- < ATENCION>: la siguiente linea puede provocarle perdida de datos si existe una base de 
								    -- datos con el mismo nombre que el indicado en la linea 8 c. 15. Se recomienda tomar los recaudos 
                                    -- necesarios antes de ejecutar el presente script.

-- procedemos a crear nuestra propia bbdd
CREATE SCHEMA trailerFlix
DEFAULT CHARACTER SET utf8mb4;

USE trailerFlix;
-- iniciamos el proceso de creacion de tablas
CREATE TABLE `tbCategoria` (
	`idCategoria` INT NOT NULL AUTO_INCREMENT,
	`Categoria` varchar(25) NOT NULL,
	PRIMARY KEY (`idCategoria`)
);

CREATE TABLE `tbGenero` (
	`idGenero` INT NOT NULL AUTO_INCREMENT,
	`Genero` varchar(25) NOT NULL,
	PRIMARY KEY (`idGenero`)
);

CREATE TABLE `tbReparto` (
	`idReparto` INT NOT NULL AUTO_INCREMENT,
	`NombreCompleto` varchar(255) NOT NULL,
	`Notas` TEXT,
	PRIMARY KEY (`idReparto`)
);

CREATE TABLE `tbCatalogo` (
	`idCatalogo` INT NOT NULL AUTO_INCREMENT,
	`Titulo` varchar(255) NOT NULL,
	`idGenero` TEXT  ,
	`Resumen` TEXT  ,
	`idReparto` TEXT ,
	`Trailer` varchar(255),
	`Temporada` VARCHAR(30)  ,
	`Poster` varchar(255)  ,
	`Categoria` TEXT NOT NULL,
    `idCategoria` INTEGER,
	`Notas` TEXT,
	PRIMARY KEY (`idCatalogo`)
);

CREATE TABLE `tbCatalogoGenero` (
	`idCatGen` INT NOT NULL AUTO_INCREMENT,
	`idCatalogo` INT NOT NULL,
	`idGenero` INT NOT NULL,
	PRIMARY KEY (`idCatGen`)
);

CREATE TABLE `tbCatalogoReparto` (
	`idCatRep` INT NOT NULL AUTO_INCREMENT,
	`idCatalogo` INT NOT NULL,
	`idReparto` INT NOT NULL,
	PRIMARY KEY (`idCatRep`)
);

-- realizamos algunos ajustes a las tablas recientemente creadas
ALTER TABLE `tbCatalogoGenero` ADD CONSTRAINT `tbCatalogoGenero_fk0` FOREIGN KEY (`idCatalogo`) REFERENCES `tbCatalogo`(`idCatalogo`);
ALTER TABLE `tbCatalogoGenero` ADD CONSTRAINT `tbCatalogoGenero_fk1` FOREIGN KEY (`idGenero`) REFERENCES `tbGenero`(`idGenero`);
ALTER TABLE `tbCatalogoReparto` ADD CONSTRAINT `tbCatalogoReparto_fk0` FOREIGN KEY (`idCatalogo`) REFERENCES `tbCatalogo`(`idCatalogo`);
ALTER TABLE `tbCatalogoReparto` ADD CONSTRAINT `tbCatalogoReparto_fk1` FOREIGN KEY (`idReparto`) REFERENCES `tbReparto`(`idReparto`);
ALTER TABLE `tbCatalogo`	ADD CONSTRAINT `tbCatalogo_fk1` FOREIGN KEY (`idCategoria`) REFERENCES `tbCategoria`(`idCategoria`);

-- iniciamos con la carga de datos en el sistema
INSERT INTO `tbGenero`(`Genero`)
VALUES ('Ciencia Ficción'),  ('Fantasía'),  ('Drama'),  ('Ficción'),  ('Sucesos'),  ('Misterio'),
        ('Hechos verídicos'),  ('Crimen'),  ('Suspenso'),  ('Aventura'),  ('Comedia'),  ('Familia'),
        ('Western'),  ('Tecnología'),  ('Terror'),  ('Historia'),  ('Intriga'),  ('Acción');

INSERT INTO `tbCategoria`(`Categoria`)
VALUES ("Serie"), ("Película");

INSERT INTO tbReparto (nombreCompleto)
VALUES 
("Anthony Hopkins"), ("Colin Farrell"), ("Toby Jones"), ("Omar Epps"), ("Jay Ryan"), ("Matt Damon"), ("Amy Manson"),
("Laurence Fishburne"), ("O.T. Fagbenle"), ("Sean Bean"), ("Bryce Dallas Howard"), ("Charlie Tahan"), ("Kyle Chandler"),
("Pedro Pascal"), ("Emmy Raver-Lampman"), ("Moses Ingram"), ("Mädchen Amick"), ("Henry Cavill"), ("Frances Conroy"),
("Jeremy Renner"), ("Carlos Valdes"), ("Simon Helberg"), ("Matthew Perry"), ("Gillian Anderson"), ("Emily Watson"),
("Thandie Newton"), ("Common"), ("Dwayne Johnson"), ("Angus Macfadyen"), ("Chadwick Boseman"), ("Caitriona Balfe"),
("Luke Allen-Gale"), ("Jude Law"), ("Rachel Weisz"), ("Kate Mara"), ("Chris Pratt"), ("Dash Mihok"), ("Corey Stoll"),
("Carl Weathers"), ("Robert Sheehan"), ("Chloe Pirrie"), ("Claire Fox"), ("Sam Claflin"), ("Brett Cullen"), ("Emilia Clarke"),
("Danielle Panabaker"), ("Kunal Nayyar"), ("Matt LeBlanc"), ("David Duchovny"), ("Paul Ritter"), ("Jeffrey Wright"),
("Geena Davis"), ("Kevin Hart"), ("Jorja Fox"), ("Michael B. Jordan"), ("Josh Lucas"), ("Nina Bergman"), ("Kate Winslet"),
("William Hurt"), ("Alicia Vikander"), ("Irrfan Khan"), ("Salli Richardson-Whitfield"), ("Patrick Fugit"), ("Misty Rosas"),
("Aidan Gallagher"), ("Janina Elkin"), ("Olivia Colman"), ("Helena Bonham Carter"), ("Shea Whigham"), ("Lena Headey"),
("Candice Patton"), ("Melissa Rauch"), ("Amybeth McNulty"), ("Mitch Pileggi"), ("Jessie Buckley"), ("Tessa Thompson"),
("Ioan Gruffudd"), ("Jack Black"), ("Enver Gjokaj"), ("Lupita Nyong'o"), ("Noah Jupe"), ("Dominic Mafham"), ("Jennifer Ehle"),
("Ray Winstone"), ("Domhnall Gleeson"), ("Vincent D'Onofrio"), ("Willow Smith"), ("John Boyega"), ("Chris Bartlett"),
("Elliot Page"), ("Lili Reinhart"), ("Matt Smith"), ("Louis Partridge"), ("Robert Downey Jr."), ("Sophie Turner"),
("Jesse L. Martin"), ("Mayim Bialik"), ("Geraldine James"), ("Robert Patrick"), ("Adam Nagaitis"), ("Ed Harris"),
("Stacy Martin"), ("Karen Gillan"), ("Bill Skarsgård"), ("Danai Gurira"), ("Jon Bernthal"), ("James Weber Brown"),
("Gwyneth Paltrow"), ("Oscar Isaac"), ("Omar Sy"), ("Emma Thompson"), ("Scott Eastwood"), ("Rio Hackford"), ("Anya Taylor-Joy"),
("Casey Cott"), ("Tobias Menzies"), ("Adeel Akhtar"), ("Chris Evans"), ("Kit Harington"), ("Tom Cavanagh"), ("Jennifer Aniston"),
("R. H. Thomson"), ("Tom Braidwood"), ("Luke Hemsworth"), ("Rhona Mitra"), ("Awkwafina"), ("Jessica Chastain"), ("Martin Freeman"),
("Génesis Rodríguez"), ("Lorina Kamburova"), ("Scarlett Johansson"), ("Sonoya Mizuno"), ("Nick Robinson"), ("Ryan Gosling"),
("Cailee Spaeny"), ("Giancarlo Esposito"), ("Thomas Brodie-Sangster"), ("Camila Mendes"), ("Vanesa Kirby"), ("Joaquin Phoenix"),
("Mark Ruffalo"), ("Peter Dinklage"), ("Jim Parsons"), ("Courteney Cox"), ("Corrine Koslo"), ("Bruce Harwood"), ("Theo James"),
("Nick Jonas"), ("Bill Hader"), ("Daniel Kaluuya"), ("Vincent Piazza"), ("Marion Cotillard"), ("Florence Pugh"), ("Kristen Wiig"),
("Corey Johnson"), ("Judy Greer"), ("Claire Foy"), ("Jing Tian"), ("Tom Hopper"), ("Harry Melling"), ("Marisol Nichols"),
("Robert De Niro"), ("Chris Hemsworth"), ("Nikolaj Coster-Waldau"), ("Johnny Galecki"), ("Lisa Kudrow"), ("Dalila Bela"),
("Jared Harris"), ("John Malkovich"), ("Peter Ferdinando"), ("Miranda Cosgrove"), ("James McAvoy"), ("Christian Bale"),
("Benjamin Sokolow"), ("David Harbour"), ("Jeff Daniels"), ("Claire Selby"), ("Will Smith"), ("Jason Clarke"), ("Rinko Kikuchi"),
("David Castañeda"), ("Madelaine Petsch"), ("Millie Bobby Brown"), ("Zazie Beetz"), ("Grant Gustin"), ("Kaley Cuoco"),
("David Schwimmer"), ("Lucas Jade Zumann"), ("Stellan Skarsgård"), ("Lia Williams"), ("Kate Walsh"), ("Isaiah Mustafa"),
("Emily Bayiokos"), ("Michael Peña"), ("Gana Bayarsaikhan"), ("Alice Braga"), ("Burn Gorman");

INSERT INTO tbCatalogo(`idCatalogo`,`Titulo`, `idGenero`, `Resumen`, `idReparto`, `Trailer`, `Temporada`, `Poster`, `Categoria`, `Notas`)
VALUES
  ( 1,'The Crown', 'Drama, Hechos verídicos', 'Este drama narra las rivalidades políticas y el romance de la reina Isabel II, así como los sucesos que moldearon la segunda mitad del siglo XX.', '', '', 4, '/posters/1.jpg', 'Serie', ''),
  ( 2,'Riverdale', 'Drama, Misterio, Ficción', 'El paso a la edad adulta incluye sexo, romance, escuela y familia. Para Archie y sus amigos, también hay misterios oscuros.', '', '', 5, '/posters/2.jpg', 'Serie', ''),
  ( 3,'The Mandalorian', 'Ciencia Ficción, Fantasía', 'Ambientada tras la caída del Imperio y antes de la aparición de la Primera Orden, la serie sigue los pasos de un pistolero solitario en las aventuras que protagoniza en los confines de la galaxia, donde no alcanza la autoridad de la Nueva República.', '', 'https://www.youtube.com/embed/aOC8E8z_ifw', 2, '/posters/3.jpg', 'Serie', ''),
  ( 4,'The Umbrella Academy', 'Ciencia Ficción, Fantasía', 'La muerte de su padre reúne a unos hermanos distanciados y con extraordinarios poderes que descubren impactantes secretos y una amenaza que se cierne sobre la humanidad.', '', '', 1, '/posters/4.jpg', 'Serie', ''),
  ( 5,'Gambito de Dama', 'Drama, Ficción, Sucesos', 'En los cincuenta, una joven de un orfanato descubre que tiene un increíble don para el ajedrez y recorre el arduo camino a la fama mientras lucha contra las adicciones.', '', '', 1, '/posters/5.jpg', 'Serie', ''),
  ( 6,'Enola Holmes', 'Ficción, Drama, Misterio', 'La hermana menor de Sherlock, descubre que su madre ha desaparecido y se dispone a encontrarla. En su búsqueda, saca a relucir el sabueso que corre por sus venas y se encuentra con una conspiración que gira en torno a un misterioso lord, demostrando que su ilustre hermano no es el único talento en la familia.', '', '', 'N/A', '/posters/6.jpg', 'Película', ''),
  ( 7,'Guasón', 'Crimen, Suspenso, Drama', 'Arthur Fleck (Phoenix) es un hombre ignorado por la sociedad, cuya motivación en la vida es hacer reír. Pero una serie de trágicos acontecimientos le llevarán a ver el mundo de otra forma. Película basada en el popular personaje de DC Comics Joker, conocido como archivillano de Batman, pero que en este film tomará un cariz más realista y oscuro.', '', 'https://www.youtube.com/embed/zAGVQLHvwOY', 'N/A', '/posters/7.jpg', 'Película', ''),
  ( 8,'Avengers: End Game', 'Aventura, Ciencia Ficción, Acción', 'Después de los devastadores eventos de los Vengadores: Infinity War (2018), el universo está en ruinas. Con la ayuda de los aliados restantes, los Vengadores se reúnen una vez más para revertir las acciones de Thanos y restaurar el equilibrio del universo.', '', '', 'N/A', '/posters/8.jpg', 'Película', ''),
  ( 9,'Juego de tronos', 'Aventura, Fantasía, Drama', 'En un mundo fantástico y en un contexto medieval varias familias, relativas a la nobleza, se disputan el poder para dominar el territorio ficticio de Poniente (Westeros) y tomar el control de los Siete Reinos desde el Trono de Hierro, lugar donde el rey ejerce el poder.', '', '', '8', '/posters/9.jpg', 'Serie', ''),
  ( 10,'The Flash', 'Ciencia Ficción, Fantasía', 'Sigue las veloces aventuras de Barry Allen, un joven común y corriente con el deseo latente de ayudar a los demás. Cuando una inesperada partícula aceleradora golpea por accidente a Barry, de pronto se encuentra cargado de un increíble poder para moverse a increíbles velocidades. Mientras Barry siempre ha tenido el alma de un héroe, sus nuevos poderes le han dado la capacidad de actuar como tal.', '', '', '6', '/posters/10.jpg', 'Serie', ''),
  ( 11,'The Big Bang Theory', 'Comedia, Fantasía, Ficción', 'Leonard y Sheldon son dos físicos que comparten trabajo y apartamento. La serie comienza con la mudanza de Penny, su nueva y atractiva vecina, y hace hincapié en la dificultad de los físicos para relacionarse con personas fuera de su entorno para dar lugar a situaciones cómicas.', '', 'https://www.youtube.com/embed/WBb3fojgW0Q', '12', '/posters/11.jpg', 'Serie', ''),
  ( 12,'Friends', 'Comedia, Familia, Drama', "'Friends' narra las aventuras y desventuras de seis jóvenes de Nueva York: Rachel, Monica, Phoebe, Ross, Chandler y Joey. Ellos forman una unida pandilla de amigos que viven en Manhattan y que suelen reunirse en sus apartamentos o en su bar habitual cafetería, el Central Perk. A pesar de los numerosos cambios que se producen en sus vidas, su amistad es inquebrantable en la dura batalla por salir adelante en sus periplos profesionales y personales.", '', '', '10', '/posters/12.jpg', 'Serie', ''),
  ( 13,"Anne with an 'E'", 'Drama, Familia, Western', 'Anne Shirley es una niña huérfana que vive en un pequeño pueblo llamado Avonlea que pertenece a la Isla del Príncipe Eduardo, en el año 1890. Después de una infancia difícil, donde fue pasando de orfanato a hogares de acogida, es enviada por error a vivir con una solterona y su hermano. Cuando cumple 13 años, Anne va a conseguir transformar su vida y el pequeño pueblo donde vive gracias a su fuerte personalidad, intelecto e imaginación. Basada en la inolvidable novela.', '', '', '2', '/posters/13.jpg', 'Serie', ''),
  ( 14,"Expedientes Secretos 'X'", 'Drama, Ciencia Ficción', "Fox Mulder y Dana Scully son dos investigadores del FBI que investigan casos sin resolución ni explicación, ya sea por razones paranormales (espíritus, criaturas extrañas, aliens...) ya porque el gobierno se ha encargado de ocultar todo tipo de pruebas. Cuando Mulder tenía doce años, su hermana pequeña fue secuestrada por unos desconocidos, aunque él cree que, en realidad, fue abducida por extraterrestres. Tras acabar sus estudios en la universidad de Oxford, ingresó en la Academia de Quantico, donde se ganó el apodo de 'siniestro'", '', 'https://www.youtube.com/embed/KKziOmsJxzE', '11', '/posters/14.jpg', 'Serie', ''),
  ( 15,'Chernobyl', 'Drama, Hechos verídicos', 'Sigue «la verdadera historia de una de las peores catástrofes provocadas por el hombre y habla de los valientes hombres y mujeres que se sacrificaron para salvar a Europa de un desastre inimaginable. La miniserie se centra en el desgarrador alcance del desastre de la planta nuclear que ocurrió en Ucrania en abril de 1986, revelando cómo y por qué ocurrió, además contando las sorprendentes y notables historias de los héroes que lucharon y cayeron.', '', 'https://www.youtube.com/embed/s9APLXM9Ei8', '1', '/posters/15.jpg', 'Serie', ''),
  ( 16,'Westworld', 'Western, Ciencia Ficción', "'Westworld' es una oscura odisea acerca del amanecer de la conciencia artificial y la evolución del pecado. Situada en la intersección del futuro cercano y el pasado reimaginado, explora un mundo donde cada apetito humano, sin importar cuán noble o depravado, puede ser saciado. Está ambientada en un parque temático futurista dirigido por el Dr. Robert Ford (Anthony Hopkins). Las instalaciones cuentan con androides caracterizados del western americano, y gracias a ellos los visitantes pueden introducirse en cualquier tipo de fantasía por muy oscura que sea.", '', 'https://www.youtube.com/embed/qLFBcdd6Qw0', '3', '/posters/16.jpg', 'Serie', ''),
  ( 17,'Halt and Catch Fire', 'Ficción, Drama, Tecnología', 'Situada en los inicios de la década de 1980, un visionario ficticio, un ingeniero electrónico y una prodigiosa ingeniera, se alían a una programadora de software para confrontar con las corporaciones informáticas dominantes de la época. El Personal de la firma y sus socios de negocio, comenzarán una carrera que cambiará la cultura en el Estado de Texas, cuna de las empresas de tecnología, casi de la misma forma que lo es hoy Silicon Valey. Esta historia ficticia emula el trabajo realizado, en su momento, por la firma Compaq, cuando clonó el BIOS de las Computadoras Personales IBM, dando vida así al económico mercado de los clones. Mostrando también, a lo largo de sus 4 temporadas, el nacimiento de la arquitectura abierta de hardware, los videojuegos online, las salas de chat y de trueque de productos físicos, los BBS, y las primeras nubes computacionales, hasta la llegada de Internet (sin dejar afuera la guerra de los web browsers).', '', 'https://www.youtube.com/embed/pWrioRji60A', '4', '/posters/17.jpg', 'Serie', ''),
  ( 18,'Ava', 'Acción, Drama, Suspenso', 'Ava es una mortífera asesina a sueldo que trabaja para una organización de operaciones encubiertas, que viaja por todo el mundo acabando con aquellos objetivos que nadie más puede derribar. Cuando uno de sus encargos sale mal, Ava tendrá que luchar por una vida.', '', '', 'N/A', '/posters/18.jpg', 'Película', ''),
  ( 19,'Aves de presa y la fantabulosa emancipación de una Harley Quinn', 'Acción, Ficción, Comedia', 'Después de separarse de Joker, Harley Quinn y otras tres heroínas (Canario Negro, Cazadora y Renée Montoya) unen sus fuerzas para salvar a una niña (Cassandra Cain) del malvado rey del crimen Máscara Negra.', '', '', 'N/A', '/posters/19.jpg', 'Película', ''),
  ( 20,'Archivo', 'Acción, Ciencia Ficción, Suspenso', '2038: George Almore está trabajando en una verdadera IA equivalente a la humana. Su último prototipo está casi listo. Esta fase sensible también es la más arriesgada. Especialmente porque tiene un objetivo que debe ocultarse a toda costa: reunirse con su esposa muerta.', '', 'https://www.youtube.com/embed/VHSoCnDioAo', 'N/A', '/posters/20.jpg', 'Película', ''),
  ( 21,'Jumanji - The next level', 'Comedia, Ficción, Aventura', 'Las aventuras continúan en el fantástico mundo del video juego Jumanji, donde nada es lo que parece. En esta ocasión, los jugadores vuelven al juego, pero sus personajes se han intercambiado entre sí, lo que ofrece un curioso plantel: los mismos héroes con distinta apariencia y habilidades. Pero, ¿dónde está el resto de la gente?', '', 'https://www.youtube.com/embed/rBxcF-r9Ibs', 'N/A', '/posters/21.jpg', 'Película', ''),
  ( 22,'3022', 'Ciencia Ficción, Suspenso', 'La película está ambientada en una estación espacial en el futuro. La tripulación sufre un estrés traumático y considera abandonar su misión después de observar lo que creen que es la destrucción de la Tierra. La película se muestra como una serie de flashbacks y flash-forward.', '', 'https://www.youtube.com/embed/AGQ7OkmIx4Q', 'N/A', '/posters/22.jpg', 'Película', ''),
  ( 23,'IT - Capítulo 2', 'Terror, Suspenso, Fantasía', "En este segundo capitulo Han pasado 27 años desde que el 'Club de los Perdedores', formado por Bill, Berverly, Richie, Ben, Eddie, Mike y Stanley, se enfrentaran al macabro y despiadado Pennywise (Bill Skarsgård). En cuanto tuvieron oportunidad, abandonaron el pueblo de Derry, en el estado de Maine, que tantos problemas les había ocasionado. Sin embargo, ahora, siendo adultos, parece que no pueden escapar de su pasado. Todos deberán enfrentarse de nuevo al temible payaso para descubrir si de verdad están preparados para superar sus traumas de la infancia.", '', 'https://www.youtube.com/embed/hZeFeYSmBcg', 'N/A', '/posters/23.jpg', 'Película', ''),
  ( 24,'Pantera Negra', 'Acción, Aventura, Fantasía', 'T’Challa (Chadwick Boseman) regresa a su hogar en la apartada nación africana de Wakanda para servir como líder de su país. Tras suceder a su padre en el trono, pasa a convertirse en Pantera Negra, una sigilosa criatura de la noche, con agudos sentidos felinos y otras habilidades como súper fuerza e inteligencia, agilidad, estrategia o maestro del combate sin armas. Es bajo el liderazgo de T’Challa como Wakanda consigue convertirse en una de las naciones más ricas y tecnológicamente avanzadas del planeta.', '', 'https://www.youtube.com/embed/BE6inv8Xh4A', 'N/A', '/posters/24.jpg', 'Película', ''),
  ( 25,'Contra lo imposible (Ford versus Ferrari)', 'Drama, Historia, Aventura', 'Los ganadores del Premio de la Academia® Matt Damon y Christian Bale protagonizan CONTRA LO IMPOSIBLE, basada en la historia real del visionario diseñador americano de automóviles Carroll Shelby (Damon) y el intrépido piloto británico Ken Miles (Bale). Juntos construyen un nuevo coche de carreras para Ford Motor Company y así enfrentar a Enzo Ferrari en las 24 Horas de Le Mans en Francia en 1966.', '', 'https://www.youtube.com/embed/SOVb0-2g1Q0', 'N/A', '/posters/25.jpg', 'Película', ''),
  ( 26,'Centígrados', 'Drama, Suspenso, Intriga', 'Una joven pareja estadounidense viaja a las montañas árticas de Noruega. Después de detenerse durante una tormenta de nieve, se despiertan atrapados en su SUV, enterrados bajo capas de nieve y hielo.', '', '', 'N/A', '/posters/26.jpg', 'Película', ''),
  ( 27,'DOOM: Aniquilación', 'Acción, Ciencia Ficción, Terror', 'Doom: Aniquilación sigue a un grupo de marines espaciales que han respondido a una llamada de alerta de una base en la luna marciana, solo para descubrir que ha sido tomada por criaturas demoníacas que amenazan con desatar el infierno en la tierra.', '', 'https://www.youtube.com/embed/nat3u3gAVLE', 'N/A', '/posters/27.jpg', 'Película', ''),
  ( 28,'Contagio', 'Drama, Suspenso, Ficción', 'De repente, sin saber cuál es su origen, aunque todo hace sospechar que comienza con el viaje de una norteamericana a un casino de Hong Kong, un virus mortal comienza a propagarse por todo el mundo. En pocos días, la enfermedad empieza a diezmar a la población. El contagio se produce por mero contacto entre los seres humanos. Un thriller realista y sin efectos especiales sobre los efectos de una epidemia.', '', 'https://www.youtube.com/embed/4sYSyuuLk5g', 'N/A', '/posters/28.jpg', 'Película', ''),
  ( 29,'Viuda Negra', 'Drama, Acción, Aventura', 'Primera pelicula individual de la Viuda Negra en el universo cinematografico de Marvel, contando su historia desde que se inició como doble agente rusa, su niñez, sus misiones, y su actualidad, después de Avengers.', '', 'https://www.youtube.com/embed/BIn8iANwEog', 'N/A', '/posters/29.jpg', 'Película', ''),
  ( 30,'The Martian', 'Drama, Ciencia Ficción, Aventura', 'Durante una misión a Marte de la nave tripulada Ares III, una fuerte tormenta se desata dando por desaparecido y muerto al astronauta Mark Watney (Matt Damon), sus compañeros toman la decisión de irse pero él ha sobrevivido. Está solo y sin apenas recursos en el planeta. Con muy pocos medios deberá recurrir a sus conocimientos, su sentido del humor y un gran instinto de supervivencia para lograr sobrevivir y comunicar a la Tierra que todavía está vivo esperando que acudan en su rescate.', '', 'https://www.youtube.com/embed/XvB58bCVfng', 'N/A', '/posters/30.jpg', 'Película', ''),
  ( 31,'Ex-Machina', 'Drama, Ciencia Ficción, Suspenso', 'Un programador multimillonario selecciona a Caleb, un joven empleado de su empresa, para que pase una semana en un lugar remoto con el objetivo de que participe en un test en el que estará involucrada su última creación: un robot-mujer en el que inteligencia artificial lo es todo.', '', 'https://www.youtube.com/embed/XRYL5spvEcI', 'N/A', '/posters/31.jpg', 'Película', ''),
  ( 32,'Jurassic World', 'Suspenso, Aventura, Ficción', 'Veintidós años después de lo ocurrido en Jurassic Park, la isla Nublar ha sido transformada en un enorme parque temático, Jurassic Wold, con versiones «domesticadas» de algunos de los dinosaurios más conocidos. Cuando todo parece ir sobre ruedas y ser el negocio del siglo, un nuevo dinosaurio de especie desconocida, pues ha sido creado manipulando genéticamente su ADN, y que resulta ser mucho más inteligente de lo que se pensaba, se escapa de su recinto y comienza a causar estragos entre los visitantes del Parque.', '', '', 'N/A', '/posters/32.jpg', 'Película', ''),
  ( 33,'Soy leyenda', 'Drama, Terror, Ficción', 'Años después de que una plaga mate a la mayoría de la humanidad y transforme al resto en monstruos, el único superviviente en la ciudad de Nueva York lucha valientemente para encontrar una cura.', '', 'https://www.youtube.com/embed/dtKMEAXyPkg', 'N/A', '/posters/33.jpg', 'Película', ''),
  ( 34,'El primer hombre en la luna', 'Drama, Hechos verídicos', 'Cuenta la historia de la misión de la NASA que llevó al primer hombre a la luna, centrada en Neil Armstrong (interpretado por Ryan Gosling) y el periodo comprendido entre los años 1961 y 1969. Un relato en primera persona, basado en la novela de James R. Hansen, que explora el sacrificio y el precio que representó, tanto para Armstrong como para Estados Unidos, una de las misiones más peligrosas de la historia.', '', '', 'N/A', '/posters/34.jpg', 'Película', ''),
  ( 35,'Titanes del pacífico - La insurrección', 'Acción, Fantasía, Ciencia Ficción', 'Han pasado 10 años tras la primera invasión que sufrió la humanidad, pero la lucha aún no ha terminado. El planeta vuelve a ser asediado por los Kaiju, una raza de alienígenas colosales, que emergen desde un portal interdimensional con el objetivo de destruir a la raza humana. Ante esta nueva amenaza, los Jaegers, robots gigantes de guerra pilotados por dos personas para sobrellevar la inmensa carga neuronal que conlleva manipularlos, ya no están a la altura de lo que se les viene encima. Será entonces cuando los supervivientes de la primera invasión, además de nuevos personajes como el hijo de Pentecost, tendrán que idear la manera de sorprender al enorme enemigo, apostando por nuevas estrategias defensivas y de ataque. Con la Tierra en ruinas e intentando reconstruirse, esta nueva batalla puede ser decisiva para el futuro.', '', '', 'N/A', '/posters/35.jpg', 'Película', '');

INSERT INTO `tbCatalogoGenero` (`idCatalogo`, `idGenero`)
VALUES (3, 2), (3, 1), (4, 2), (4, 1), (5, 3), (5, 4), (5, 5), (1, 3), (1, 7), (6, 4), (6, 3), (6, 6), 
	(7, 8), (7, 9), (7, 3), (8, 10), (8, 1), (8, 18),(2, 3), (2, 6), (2, 4), (9, 10), (9, 2), (9, 3), (10, 1), 
    (10, 2), (11, 11), (11, 2), (11, 4), (12, 11), (12, 12), (12, 3), (13, 3), (13, 12), (13, 13), (14, 3), 
    (14, 1), (15, 3), (15, 7), (16, 1), (17, 4), (17, 3), (17, 14), (18, 18), (18, 3), (18, 9), (19, 18), 
    (19, 4), (19, 11), (20, 18), (20, 1), (20, 9), (21, 11), (21, 4), (21, 10), (22, 1), (22, 9), (23, 15), 
    (23, 9), (23, 2), (24, 18), (24, 10), (24, 2), (25, 3), (25, 16), (25, 10), (26, 3), (26, 9), (26, 17),
    (27, 18), (27, 1), (27, 15), (28, 3), (28, 9), (28, 4), (29, 3), (29, 18), (29, 10), (30, 3), (30, 1), 
    (30, 10), (31, 3), (31, 1), (31, 9), (32, 9), (32, 10), (32, 4), (33, 3), (33, 15), (33, 4), (34, 3), 
    (34, 7), (35, 18), (35, 2), (35, 1);


insert into `tbCatalogoReparto` (`idCatRep`, `idCatalogo`, `idReparto`)
values
(1, 1, 42), (2, 1, 67), (3, 1, 92), (4, 1, 116), (5, 1, 139), (6, 1, 68), (7, 2, 91), (8, 2, 115), (9, 2, 138), (10, 2, 161), (11, 2, 182), (12, 2, 17), (13, 3, 14),
(14, 3, 39), (15, 3, 64), (16, 3, 89), (17, 3, 113), (18, 3, 136), (19, 4, 159), (20, 4, 181), (21, 4, 15), (22, 4, 40), (23, 4, 65), (24, 4, 90), (25, 5, 114), (26, 5, 137),
(27, 5, 160),(28, 5, 16),(29, 5, 41),(30, 5, 66),(31, 6, 183),(32, 6, 18),(33, 6, 43),(34, 6, 68),(35, 6, 93),(36, 6, 117),(37, 7, 140),(38, 7, 162),
(39, 7, 184), (40, 7, 19), (41, 7, 44), (42, 7, 69), (43, 8, 94), (44, 8, 118), (45, 8, 141), (46, 8, 163), (47, 8, 131), (48, 8, 20), (49, 9, 45), (50, 9, 70), (51, 9, 95), (52, 9, 119),
(53, 9, 142), (54, 9, 164), (55, 10, 185), (56, 10, 21), (57, 10, 46), (58, 10, 71), (59, 10, 96), (60, 10, 120), (61, 11, 143), (62, 11, 165), (63, 11, 186), (64, 11, 22), (65, 11, 47),
(66, 11, 72), (67, 11, 97), (68, 12, 121), (69, 12, 144), (70, 12, 166), (71, 12, 187), (72, 12, 23), (73, 12, 48), (74, 13, 73), (75, 13, 98), (76, 13, 122), (77, 13, 145), (78, 13, 167), 
(79, 13, 188), (80, 14, 24), (81, 14, 49), (82, 14, 74), (83, 14, 99), (84, 14, 123), (85, 14, 146), (86, 15, 168), (87, 15, 189), (88, 15, 25), (89, 15, 50), (90, 15, 75), (91, 15, 100),
(93, 16, 26), (94, 16, 51), (95, 16, 76), (96, 16, 101), (97, 16, 124), (104, 18, 127), (105, 18, 169), (106, 18, 2), (107, 18, 27), (108, 18, 52), (109, 18, 77), (116, 20, 102), (117, 20, 125),
(118, 20, 147), (119, 20, 170), (120, 20, 190), (121, 20, 3), (122, 21, 28), (123, 21, 53), (124, 21, 78), (125, 21, 103), (126, 21, 126), (127, 21, 148), (128, 22, 171), (129, 22, 191), (130, 22, 4),
(131, 22, 29), (132, 22, 54), (133, 22, 79), (134, 23, 104), (135, 23, 127), (136, 23, 149), (137, 23, 172), (138, 23, 192), (139, 23, 5), (140, 24, 30), (141, 24, 55), (142, 24, 80),
(143, 24, 105), (144, 24, 128), (145, 24, 150), (146, 25, 173), (147, 25, 6), (148, 25, 31), (149, 25, 56), (150, 25, 81), (151, 25, 106), (152, 26, 129), (153, 26, 151), (154, 26, 174), (155, 26, 193),
(156, 27, 7), (157, 27, 32), (158, 27, 57), (159, 27, 82), (160, 27, 107), (161, 27, 130), (162, 28, 152), (163, 28, 6), (164, 28, 8), (165, 28, 33), (166, 28, 58), (167, 28, 83), (168, 28, 108),
(169, 29, 131), (170, 29, 153), (171, 29, 175), (172, 29, 9), (173, 29, 34), (174, 29, 59), (175, 29, 84), (176, 30, 6), (177, 30, 127), (178, 30, 154), (179, 30, 176), (180, 30, 194), (181, 30, 10),
(182, 30, 35), (183, 31, 60), (184, 31, 85), (185, 31, 109), (186, 31, 132), (187, 31, 155), (188, 31, 177), (189, 31, 195), (190, 32, 11), (191, 32, 36), (192, 32, 61), (193, 32, 86), (194, 32, 110),
(195, 32, 133), (196, 32, 156), (197, 33, 178), (198, 33, 196), (199, 33, 12), (200, 33, 37), (201, 33, 62), (202, 33, 87), (203, 33, 111), (204, 34, 134), (205, 34, 157), (206, 34, 179), (207, 34, 13), 
(208, 34, 38), (209, 35, 88), (210, 35, 112), (211, 35, 135), (212, 35, 158), (213, 35, 180), (214, 35, 197);  

-- en esta seccion realizamos algunas correcciones a las tablas generadas anteriormente
update tbCatalogo set idCategoria =1   where Categoria = "Serie";
update tbCatalogo set idCategoria =2  where Categoria = "Pelicula";
ALTER TABLE `tbCatalogo` DROP COLUMN `categoria`; 
ALTER TABLE `tbCatalogo` drop column `idGenero`;

-- esta view nos presenta de manera legible la union de las tablas tbCatalogo/tbGenero y tbCatalogoGenero
CREATE VIEW `vwCatalogoGenero` AS
SELECT 
	cg.idcatgen,
    cg.idCatalogo,
    c.titulo,
    cg.idgenero,
    g.genero,
    c.resumen,
    c.trailer,
    c.Temporada,
    c.Poster,
    c.idCategoria,
    ca.categoria,
    
	group_concat(DISTINCT r.nombrecompleto separator ', ') as Actores
FROM trailerflix.tbcatalogogenero cg
inner join tbcatalogo c on c.idcatalogo = cg.idcatalogo
inner join tbcatalogoreparto cr on cr.idCatalogo = cg.idcatalogo
inner join tbreparto r on r.idreparto = cr.idreparto
inner join tbgenero g on g.idGenero = cg.idGenero
inner join tbcategoria ca on ca.idCategoria = c.idcategoria

group by
	cg.idcatgen,
    cg.idCatalogo,
    c.titulo,
    c.resumen,
    c.trailer,
    c.Temporada,
    c.Poster,
    c.idCategoria,
    cg.idgenero;
	 
-- esta view nos presenta de manera legible la union de las tablas tbCatalogo/tbReparto y tbCatalogoReparto
CREATE VIEW `vwCatalogoReparto` AS
SELECT CR.idCatRep,
		CR.idCatalogo,
        C.Titulo,
        CR.idReparto,
        R.NombreCompleto
FROM trailerflix.tbcatalogoReparto CR
	INNER JOIN
    trailerflix.tbcatalogo C on CR.idCatalogo = C.idCatalogo 
	INNER JOIN
	trailerflix.tbReparto R on CR.idReparto = R.idReparto;

-- Creamos una vista vwCatalogo para unificar la informacion a presentar en los get
create view `vwcatalogo` as
SELECT
	c.idcatalogo,
	c.titulo,
	c.resumen,
	c.trailer,
	c.temporada,
	c.poster,
    c.idcategoria,
	ca.categoria,
	GROUP_CONCAT(DISTINCT g.genero SEPARATOR ', ') AS Generos,
	group_concat(DISTINCT r.nombrecompleto separator ', ') as Actores
FROM
  tbcatalogo c
INNER JOIN tbcatalogogenero cg ON c.idcatalogo = cg.idcatalogo
INNER JOIN tbgenero g ON cg.idgenero = g.idgenero
inner join tbcatalogoreparto cr on c.idcatalogo = cr.idcatalogo
inner join tbreparto r on cr.idreparto = r.idreparto
INNER JOIN tbcategoria ca on c.idcategoria = ca.idcategoria
GROUP BY
  c.titulo,
  c.resumen,
  c.trailer,
  c.temporada,
  c.trailer,
  c.poster,
  c.idcatalogo,
  c.idcategoria,
  ca.categoria;
