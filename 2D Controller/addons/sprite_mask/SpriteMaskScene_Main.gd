tool
extends Node2D

export var follow_mouse = true
#get the real size of the viewport
var root_size = Vector2(480,272)

#calculate black strip
var correction = (Vector2(1280,720) - root_size)/2.0

#we use fixed resolution of 1600 * 900
var ratio = Vector2(1600.0, 900.0)/root_size

var real_mouse_position = (get_viewport().get_mouse_position()-correction)*ratio

func _process(delta):
	print(OS.get_window_size())
	
	if follow_mouse:
		$MaskViewport/Mask.position = get_global_mouse_position()

func update_mask_texture(val):
	$MaskViewport/Mask.texture = val

func update_mask_layers(layers_to_show):
	$LightMask.range_item_cull_mask = layers_to_show

func update_mask_pos(val):
	$MaskViewport/Mask.position = val
	$MaskViewport/TrailMask.position = val

func update_mask_scale(val):
	$MaskViewport/Mask.scale = Vector2(val,val)
	$MaskViewport/TrailMask.process_material.scale = val

func update_follow_mouse(val):
	$MaskViewport/Mask.follow_mouse = val
	$MaskViewport/TrailMask.follow_mouse = val

func update_show_trail(val):
	$MaskViewport/TrailMask.emitting = val

func update_size(val):
	$MaskViewport.size = val
	$LightMask.offset = val/2

