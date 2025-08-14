extends Node

const CHUNK_SIZE := 4096
const LINE_WIDTH := 16

@onready var progress_bar = %OpenProgress
@onready var hex_grid_container = %HexGridContainer
@onready var rom_data = %Data.rom_bytes


func _ready():
	%OpenProgress.hide()

func _on_open_pressed():
	
	%OpenDialog.show()


func _on_open_dialog_file_selected(path):
	
	var file = FileAccess.open(path, FileAccess.READ)
	
	if file:
		%Data.rom_bytes = file.get_buffer(file.get_length())
		file.close()
		%OpenProgress.value = 0
		%OpenProgress.show()
		
		rom_data = %Data.rom_bytes
		
		_load_in_chunks()
		
		%OpenProgress.hide()
	else:
		%TextEdit.text = "Failed to open file!"
		

func _load_in_chunks():
	var total = rom_data.size()
	var loaded := 0
	var address_offset := 0
	var last_update := 0

	while loaded < total:
		var chunk_end = min(loaded + CHUNK_SIZE, total)
		var chunk = rom_data.slice(loaded, chunk_end)
		loaded = chunk_end
		
		for i in range(chunk.size()):
			# Create the Address Label (e.g., 0000, 0010, 0020...)
			var address_label = Label.new()
			address_label.text = "%04X" % address_offset

			# Create the Hex Label (e.g., 7F, 6A, 8B...)
			var hex_label = Label.new()
			hex_label.text = "%02X" % chunk[i]

			# Create the ASCII Label (printable chars or '.')
			var ascii_label = Label.new()
			ascii_label.text = String.chr(chunk[i]) if (chunk[i] >= 32 and chunk[i] <= 126) else "."

			# Add labels to the grid container
			hex_grid_container.add_child(address_label)
			hex_grid_container.add_child(hex_label)
			hex_grid_container.add_child(ascii_label)
			
			if i % LINE_WIDTH == LINE_WIDTH - 1:
				address_offset += LINE_WIDTH
		
		var progress = float(loaded) / total
		if progress - last_update >= 0.05:
			progress_bar.value = progress * 100
			last_update = progress
		
			await  get_tree().process_frame
	
	progress_bar.value = 100.0
