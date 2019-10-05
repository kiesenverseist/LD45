extends TileMap

func _ready():
	pass

func free_tile(grid_pos : Vector2) -> bool:
	return bool(get_cellv(grid_pos))
