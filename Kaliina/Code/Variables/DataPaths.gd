extends Node

@onready var BoulderManager 
@onready var OnagerManager 

@onready var Pacifica 
@onready var myGUI 
@onready var EnemyBullets 
@onready var HPCore 
@onready var MyCamera
@onready var TreeManager

@onready var startfinished : bool

func SetPaths(DataPaths):
	
	BoulderManager = DataPaths.BoulderManager
	OnagerManager = DataPaths.OnagerManager

	Pacifica = DataPaths.Pacifica
	myGUI = DataPaths.MyGUI
	EnemyBullets = DataPaths.EnemyBullets
	HPCore = DataPaths.HPCore
	MyCamera = DataPaths.MyCamera
	TreeManager = DataPaths.TreeManager
	
	startfinished = true

