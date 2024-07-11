extends TileMap

enum layers {
	level0 = 0
}
const boundary_atlas_position = Vector2i(0, 1)
const tileset_source_id = 2
# Called when the node enters the scene tree for the first time.
func _ready():
	var offsets = [
		Vector2i(0, -1),
		Vector2i(0, 1),
		Vector2i(1, 0),
		Vector2i(-1, 0)
	]
	for cell in get_used_cells(layers.level0):
		for offset in offsets:
			_make_cell_boundary(cell + offset)
			
func _make_cell_boundary(cell: Vector2i):
		if get_cell_source_id(0, cell) == -1:
			set_cell(layers.level0, cell, tileset_source_id, boundary_atlas_position)
