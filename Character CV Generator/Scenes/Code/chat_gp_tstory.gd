extends Node

# Listas de elementos narrativos
var generos = ["shōnen", "isekai", "romance", "mecha", "slice of life", "comedia"]
var contextos = ["moderno", "futurista", "postapocalíptico", "mágico", "alternativo"]
var protagonistas = ["estudiante tímido", "chica con poderes ocultos", "androide sin memoria", "espadachín errante"]
var objetivos = ["salvar el mundo", "encontrar su verdadero yo", "ganar un torneo", "revivir a un ser querido"]
var antagonistas = ["una organización secreta", "su propio reflejo del futuro", "un viejo amigo", "una IA corrupta"]
var giros = ["el aliado es el verdadero villano", "todo ocurre en una simulación", "el tiempo se reinicia", "es el villano sin saberlo"]


func generar_historia() -> String:
	var genero = generos.pick_random()
	var contexto = contextos.pick_random()
	var protagonista = protagonistas.pick_random()
	var objetivo = objetivos.pick_random()
	var antagonista = antagonistas.pick_random()
	var giro = giros.pick_random()

	var historia = "En un mundo " + contexto + " un/a " + protagonista + " descubre que debe " +  objetivo
	historia += " Sin embargo, se enfrenta a " + antagonista + " y todo cambia cuando " + giro
	historia += " Esta historia mezcla elementos de " + genero + " con mucha emoción."

	return historia

func GeneratePremise():
	var historia = generar_historia()
	%LOG.text = historia
