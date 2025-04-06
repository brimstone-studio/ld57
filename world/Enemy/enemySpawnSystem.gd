extends Node2D

@export var enemyScene: PackedScene
@export var spawnRadius: float = 800
@export var enemiesAmmount: int = 30
@export var roundDuration: float = 180
@export var submarine: Node2D

var enemiesSpawned: int = 0
var spawningInterval: float = 0.0
var spawnTimer: float = 0.0

func _ready():
    spawningInterval = roundDuration / enemiesAmmount

func _process(delta):
    if enemiesSpawned >= enemiesAmmount:
        return; #End of the round -> Gamestate Change
    
    spawnTimer += delta
    if spawnTimer >= spawningInterval:
        spawnTimer = 0.0
        spawnEnemy()

func spawnEnemy():
    var spawnPosition = getRandomSpawnPosition()
    var enemy = enemyScene.instantiate()
    enemy.target = submarine  # Assign player reference (adjust based on your enemy script)
    enemy.position = spawnPosition
    get_parent().add_child(enemy)  # Spawn in the parent scene
    enemiesSpawned += 1

func getRandomSpawnPosition():
    var angle = randf()*2*PI
    return submarine.position + Vector2(cos(angle), sin(angle)) * spawnRadius