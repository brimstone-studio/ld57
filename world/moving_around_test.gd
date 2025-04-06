# GameController.gd
extends Node2D

var selected_crewmates = []

func _unhandled_input(event):
    if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
        # Check if we didn't click on any crewmate (handled by their own _on_input_event)
        if not _was_crewmate_clicked(event):
            var world_click = get_global_mouse_position()
            for crewmate in get_tree().get_nodes_in_group("crewmates"):
                if crewmate.is_selected:
                    crewmate.target_position = world_click

func _was_crewmate_clicked(event):
    # Check if any crewmate was clicked
    for crewmate in get_tree().get_nodes_in_group("crewmates"):
        if crewmate.get_rect().has_point(crewmate.to_local(event.position)):
            return true
    return false