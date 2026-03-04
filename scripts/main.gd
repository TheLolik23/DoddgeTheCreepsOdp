extends Node

## Skrypt głównej sceny gry (Main).
## Zarządza stanem gry, instancjonowaniem przeciwników oraz wynikiem.

## Scena przeciwnika, która będzie tworzona w trakcie gry.
@export var mob_scene: PackedScene

## Aktualny wynik gracza.
var score: int
	
## Wywoływana w momencie przegranej (gdy gracz zderzy się z przeciwnikiem).
func game_over() -> void:
	$ScoreTimer.stop()
	$MobTimer.stop()
	$HUD.show_game_over()
	$Music.stop()
	$DeathSound.play()

## Przygotowuje i rozpoczyna nową grę.
func new_game() -> void:
	score = 0
	$Player.start($StartPosition.position)
	$StartTimer.start()
	$HUD.update_score(score)
	$HUD.show_message("Get Ready")
	# Usunięcie starych przeciwników z poprzedniej gry.
	get_tree().call_group("mobs", "queue_free")
	$Music.play()

## Wywoływana gdy upłynie czas na zdobycie kolejnego punktu.
func _on_score_timer_timeout() -> void:
	score += 1
	$HUD.update_score(score)

## Wywoływana po zakończeniu czasu przygotowania przed startem gry.
func _on_start_timer_timeout() -> void:
	$MobTimer.start()
	$ScoreTimer.start()

## Wywoływana regularnie w celu stworzenia nowego przeciwnika.
func _on_mob_timer_timeout() -> void:
	# Tworzy nową instancję sceny przeciwnika (Mob).
	var mob = mob_scene.instantiate()

	# Wybiera losową lokację na ścieżce Path2D.
	var mob_spawn_location = $MobPath/MobSpawnLocation
	mob_spawn_location.progress_ratio = randf()

	# Ustawia pozycję przeciwnika na wylosowaną lokację.
	mob.position = mob_spawn_location.position

	# Ustawia kierunek przeciwnika prostopadle do kierunku ścieżki.
	var direction = mob_spawn_location.rotation + PI / 2

	# Dodaje trochę losowości do kierunku.
	direction += randf_range(-PI / 4, PI / 4)
	mob.rotation = direction

	# Wybiera prędkość dla przeciwnika.
	var velocity = Vector2(randf_range(150.0, 250.0), 0.0)
	mob.linear_velocity = velocity.rotated(direction)

	# Pojawia przeciwnika poprzez dodanie go do głównej sceny.
	add_child(mob)

## Wywoływana, gdy interfejs (HUD) zasygnalizuje rozpoczęcie gry.
func _on_hud_start_game() -> void:
	new_game()
