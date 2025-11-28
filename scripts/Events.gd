extends Node

signal curtains_opened
signal room_lit

var current_room := 1

var timer_room1 = 0
var timer_room2 = 0
var timer_room3 = 0
var timer_room4 = 0

var hints_room1 = 0
var hints_room2 = 0
var hints_room3 = 0
var hints_room4 = 0
#-----------ROOM 1
var puzzle_solved = false
var can_curtains_open = false
#-----------ROOM 2
#-----------ROOM 3
#-----------ROOM 4
var virus = ""
