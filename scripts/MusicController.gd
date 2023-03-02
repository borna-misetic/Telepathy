extends Node

var menu_theme = load("res://audio/music/Gnossienne-No1.mp3")
var main_theme = load("res://audio/music/ClairDeLune.mp3")

var music_index = 0

func play_menu_music():
	$Music.stream = menu_theme
	$Music.play()

func play_main_music():
	$Music.stream = main_theme
	$Music.play()
