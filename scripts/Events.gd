extends Node

signal curtains_opened
signal room_lit

var current_room := 1
var language
var is_dragging = false
var rooms = {
	"room1": {"time": 0, "wrong": 0, "hints": 0},
	"room2": {"time": 0, "wrong": 0, "hints": 0},
	"room3": {"time": 0, "wrong": 0, "hints": 0},
	"room4": {"time": 0, "wrong": 0, "hints": 0},
	"room5": {"time": 0, "wrong": 0, "hints": 0},
}
#-----------ROOM 1 sun
var puzzle_solved = false
var can_curtains_open = false
#-----------ROOM 2 ph
#-----------ROOM 3 virus
var virus = ""
#-----------ROOM 4 computer
var power_on = false
