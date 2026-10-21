class_name Master

const NAME_LIMIT: int = 16

enum GENERO { MUJER, HOMBRE }
const NAME_GENERO := ["Mujer", "Hombre"]

enum ORIENTACION { HETEROSEX, HOMOSEX, BISEX }
const NAME_ORIENTACION := ["Heterosex", "Homosex", "Bisex"]

enum PIEL { ARIA, BLANCA, MESTIZA, CANELA, NEGRA }
const NAME_PIEL := ["Aria", "Blanca", "Mestiza", "Canela", "Negra"]

enum ELEMENTO { NINGUNO, AIRE, AGUA, TIERRA, FUEGO }
const NAME_ELEMENTO := ["Ninguno", "Aire", "Agua", "Tierra", "Fuego"]

enum TRAJE { CONJUNTO, UNIFORME }
const NAME_TRAJE := ["Conjunto", "Uniforme"]

enum COLOR {
	BLANCO,
	GRIS,
	NEGRO,
	AMARILLO,
	NARANJA,
	ROJO,
	LIMON,
	VERDE,
	PINO,
	AQUA,
	AZUL,
	REY,
	CAQUI,
	CAFE,
	MARRON,
	ROSADO,
	FUCSIA,
	MORADO
}
const NAME_COLOR := [
	"Blanco",
	"Gris",
	"Negro",
	"Amarillo",
	"Naranja",
	"Rojo",
	"Limón",
	"Verde",
	"Pino",
	"Aguamarina",
	"Azul",
	"Azul Rey",
	"Caqui",
	"Café",
	"Marrón",
	"Rosado",
	"Fucsia",
	"Morado"
]
const COLOR_RGB := {
	COLOR.BLANCO: Color(0.675, 0.675, 0.675, 1.0),
	COLOR.GRIS: Color(0.359, 0.359, 0.359, 1.0),
	COLOR.NEGRO: Color(0.115, 0.115, 0.115, 1.0),
	COLOR.AMARILLO: Color(0.731, 0.742, 0.306, 1.0),
	COLOR.NARANJA: Color(0.781, 0.501, 0.2, 1.0),
	COLOR.ROJO: Color(0.692, 0.226, 0.177, 1.0),
	COLOR.LIMON: Color(0.555, 0.702, 0.318, 1.0),
	COLOR.VERDE: Color(0.348, 0.594, 0.278, 1.0),
	COLOR.PINO: Color(0.149, 0.295, 0.072, 1.0),
	COLOR.AQUA: Color(0.383, 0.669, 0.79, 1.0),
	COLOR.AZUL: Color(0.199, 0.424, 0.797, 1.0),
	COLOR.REY: Color(0.125, 0.168, 0.545, 1.0),
	COLOR.CAQUI: Color(0.566, 0.494, 0.324, 1.0),
	COLOR.CAFE: Color(0.33, 0.279, 0.167, 1.0),
	COLOR.MARRON: Color(0.252, 0.122, 0.059, 1.0),
	COLOR.ROSADO: Color(0.695, 0.493, 0.579, 1.0),
	COLOR.FUCSIA: Color(0.796, 0.299, 0.658, 1.0),
	COLOR.MORADO: Color(0.49, 0.116, 0.676, 1.0)
}

enum TORSO_M {
	NADA,
	BUFANDA,
	PAYASA,
	CAMISA,
	CAMISON,
	CAMISILLA,
	ESQUELETO,
	CHALECO,
	PONCHO,
	SEDA,
	LANA,
	ANORAK,
	CHAMARRA,
	ABRIGO,
	ARMADURA,
	CORBATIN
}
const NAME_TORSO_M := [
	"Nada",
	"Bufanda",
	"Payasa",
	"Camisa",
	"Camisión",
	"Camisilla",
	"Esqueleto",
	"Chaleco",
	"Poncho",
	"De Seda",
	"De Lana",
	"Anorak",
	"Chamarra",
	"Abrigo",
	"Armadura",
	"Corbatín"
]

enum TORSO_F {
	NADA,
	SOSTEN,
	PAYASA,
	MINIBLUSA,
	BLUSA,
	PECHERA,
	BLUSON,
	CAMISA,
	SEDA,
	LANA,
	EMPERADORA,
	ANORAK,
	CHAMARRA,
	ABRIGO,
	BRASIER,
	ESCOTADA
}
const NAME_TORSO_F := [
	"Nada",
	"Sostén",
	"Payasa",
	"Miniblusa",
	"Blusa",
	"Pechera",
	"Blusón",
	"Camisa",
	"De Seda",
	"De Lana",
	"Emperadora",
	"Anorak",
	"Chamarra",
	"Abrigo",
	"Brasier",
	"Escotada"
]

enum BAJO_M {
	NADA,
	CALZONCILLO,
	TAPARRABO,
	FALDON,
	FALDA,
	MEDIAFALDA,
	BOXER,
	GUERRERA,
	EXPlORADRA,
	SEDUCTORA,
	PANTALON,
	CAVERNARIA,
	LUCHADORA,
	TIRANTES,
	TRIVAL,
	VEGETAL
}
const NAME_BAJO_M := [
	"Nada",
	"Calzoncillo",
	"Taparrabo",
	"Faldón",
	"Falda",
	"Media Falda",
	"Bóxer",
	"Guerrera",
	"Exploradora",
	"Seductora",
	"Pantalón",
	"Cavernaria",
	"Luchadora",
	"Tirantes",
	"Tribal",
	"Vegetal"
]

enum BAJO_F {
	NADA,
	CALZON,
	TRIVAL,
	FALDON,
	FALDA,
	MEDIAFALDA,
	MINIFALDA,
	GUERRERA,
	EXPLORADORA,
	SEDUCTORA,
	BODY,
	PLAYERA,
	LANA,
	DEPORTIVA,
	CUCO,
	SOMBRILLA
}
const NAME_BAJO_F := [
	"Nada",
	"Calzón",
	"Tribal",
	"Faldón",
	"Falda",
	"Media Falda",
	"Minifalda",
	"Guerrera",
	"Exploradora",
	"Seductora",
	"Body",
	"Playera",
	"De Lana",
	"Deportiva",
	"Cuco",
	"Sombrilla"
]

enum UNIFORME_A {
	FEMENINO,
	ANGEL,
	POBRE,
	POLICIA,
	MAGO,
	SACERDOTE,
	ANIMAL,
	TROPICAL,
	ARTISTA,
	URBANO,
	DISCO,
	ANTIGUO,
	AZUL
}
const NAME_UNIFORME_A := [
	"Femenino",
	"Ángel",
	"Pobre",
	"Policía",
	"Mago",
	"Sacerdote",
	"Animal",
	"Tropical",
	"Artista",
	"Urbano",
	"Disco",
	"Antiguo",
	"Azul"
]

enum UNIFORME_B {
	MASCULINO,
	DEMONIO,
	NOBLE,
	LADRON,
	CIENTIFICO,
	BRUJO,
	VEGETAL,
	OSCURO,
	INGENIERO,
	CAMPESINO,
	CULTURAL,
	FUTURISTA,
	ROJO
}
const NAME_UNIFORME_B := [
	"Masculino",
	"Demonio",
	"Noble",
	"Ladrón",
	"Científico",
	"Brujo",
	"Vegetal",
	"Oscuro",
	"Ingeniero",
	"Campesino",
	"Cultural",
	"Futurista",
	"Rojo"
]

enum GRUPO { GRUPO_A, GRUPO_B }
const NAME_GRUPO := ["Grupo A", "Grupo B"]

enum EMOCION {
	NORMAL,
	PENSATIVO,
	FELIZ,
	RISAS,
	APENADO,
	GUINNO,
	COQUETO,
	PERSPICAZ,
	TRAVIESO,
	CONTENTO,
	SONROJADO,
	ENAMORADO,
	IMPACTADO,
	SORPRENDIDO,
	TIERNO,
	DESUBICADO,
	TRISTE,
	PREOCUPADO,
	LLOROSO,
	INCREDULO,
	ENOJADO,
	MALIGNO,
	LOCO,
	ABATIDO,
	MALO,
	GOLOSO,
	ASCO,
	CONGELADO,
	CULPABLE,
	INTERESADO,
	RETRAIDO,
	DORMIDO,
	ACABADO
}
const NAME_EMOCION := [
	"Normal",
	"Pensativo",
	"Felíz",
	"Carcajadas",
	"Apenado",
	"Guiño",
	"Coqueto",
	"Perspicaz",
	"Travieso",
	"Contento",
	"Sonrojado",
	"Enamorado",
	"Impactado",
	"Sorprendido",
	"Tierno",
	"Desubicado",
	"Triste",
	"Preocupado",
	"Lloroso",
	"Incrédulo",
	"Enojado",
	"Maligno",
	"Loco",
	"Abatido",
	"Malo",
	"Goloso",
	"Asqueado",
	"Congelado",
	"Culpable",
	"Interesado",
	"Retraído",
	"Dormido",
	"Acabado"
]

enum PELO_M {
	CALVO,
	MEDIANO,
	EMO,
	LARGO,
	MILITAR,
	AFRO,
	TRENZADO,
	MOTA,
	PUNK,
	HONGO,
	PATILLAS,
	CRESPO,
	RECOGIDO,
	INDIO,
	CRESTA,
	CORTO
}
const NAME_PELO_M := [
	"Calvo",
	"Mediano",
	"Emo",
	"Largo",
	"Militar",
	"Afro",
	"Trenzado",
	"Mota",
	"Punk",
	"Hongo",
	"Patillas",
	"Crespo",
	"Recogido",
	"Indio",
	"Cresta",
	"Corto"
]

enum PELO_F {
	TRENZA,
	MEDIANO,
	EMO,
	LARGO,
	COLA,
	AFRO,
	TRENZADO,
	MOTA,
	COLETAS,
	HONGO,
	LACIO,
	ONDULADO,
	RECOGIDO,
	INDIA,
	CRESTA,
	CASCO
}
const NAME_PELO_F := [
	"Trenza",
	"Mediano",
	"Emo",
	"Largo",
	"Cola",
	"Afro",
	"Trenzado",
	"Mota",
	"Coletas",
	"Hongo",
	"Lacio",
	"Ondulado",
	"Recogido",
	"India",
	"Cresta",
	"Casco"
]

enum ROL {
	NINGUNA,
	INFANTE,
	GUITARRA,
	LIBRO,
	BALON,
	COMIDA,
	CAJA,
	BASTON,
	BOTIQUIN,
	GUARO,
	CHOCOLATE,
	MALETA,
	PLANTA,
	BOLILLO,
	BOMBA,
	COMPUTADORA,
	ESCUDO,
	TELEFONO,
	MASCOTA,
	CUADERNO,
	VELA,
	CUCHILLO
}
const NAME_ROL := [
	"Ninguna",
	"Infante",
	"Guitarra",
	"Libro",
	"Balón",
	"Comida",
	"Caja",
	"Bastón",
	"Botiquín",
	"Guaro",
	"Chocolate",
	"Maleta",
	"Planta",
	"Bolillo",
	"Bomba",
	"Computadora",
	"Escudo",
	"Teléfono",
	"Mascota",
	"Cuaderno",
	"Vela",
	"Cuchillo"
]

enum CLASE {
	NADA,
	ESPADA,
	HACHA,
	PALO,
	BALLESTA,
	MAZO,
	TAMBOR,
	BACULO,
	MEDICINA
}
const NAME_CLASE := [
	"Explorador",
	"Guerrero",
	"Bárbaro",
	"Monje",
	"Cazador",
	"Defensor",
	"Bardo",
	"Mago",
	"Curandero"
]

enum HAB_EXTRA {
	
}
