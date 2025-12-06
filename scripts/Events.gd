extends Node

signal room_lit
signal show_crank
signal generator_powered
signal tube_clicked

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
#-----------ROOM 2 ph
var drink = 5 #since animation player is on 5 when scene starts
var ph = 1
#-----------ROOM 3 virus
var virus = ""
#-----------ROOM 4 computer
var energy
var straw_connected = false
var power_on = false
var dropable_states = {}
const REACTION_TABLE = {
	"Pyreon": {
		"Calmisol": "Low",
		"Endryl": "None",
		"Inertase": "None",
	},
	"Calmisol": {
		"Pyreon": "Low",
		"Endryl": "None",
		"Inertase": "High",
	},
	"Endryl": {
		"Pyreon": "None",
		"Calmisol": "None",
		"Inertase": "Low",
	},
	"Inertase": {
		"Pyreon": "None",
		"Calmisol": "High",
		"Endryl": "Low",
	}
}
#-----------ROOM 5
var current_stickynote = null
