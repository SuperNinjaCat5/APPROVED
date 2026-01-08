extends Node

# Bars ----
@onready var resources_bar: ProgressBar = $resourcesBar
@onready var wealth_bar: ProgressBar = $wealthBar
@onready var happiness_bar: ProgressBar = $happinessBar
@onready var population_bar: ProgressBar = $populationBar

# misc ----
@onready var timeout: Timer = $timeout
@onready var prombt: Label = $prombt

var options = [ # [resources,wealth,happiness,population
	{
		"text": "Comrade, approval to build a new factory?",
		"results": [-10,15,-5,2]
	},
	{
		"text": "Yo man, I need some moneyyyyyyy",
		"results": [0,-5,0,2]
	}
]

var resources = 50
var wealth = 50
var happiness = 50
var population = 50

var random_question
 
func _ready() -> void:
	# Prombt init ----
	random_question = options.pick_random()
	
	prombt.text = random_question["text"]



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
