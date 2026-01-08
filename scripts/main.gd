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
		"approved_results": [-10,15,-5,2],
		"disapproved_results": [0,0,0,0]
	},
	{
		"text": "Yo man, I need some moneyyyyyyy",
		"approved_results": [0,-5,0,2],
		"disapproved_results": [0,0,0,0]
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
	
func updateValues(values) -> void:
	resources += values[0]
	wealth += values[1]
	happiness += values[2]
	population += values[3]
		
	resources = clamp(resources, 0, 100)
	wealth = clamp(wealth, 0, 100)
	happiness = clamp(happiness, 0, 100)
	population = clamp(population, 0, 100)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if (resources <= 0 or wealth <= 0 or happiness <= 0 or population <= 0):
		prombt.text = "Game over"
		return
		
	resources_bar.value = resources
	wealth_bar.value = wealth
	happiness_bar.value = happiness
	population_bar.value = population

	
	
