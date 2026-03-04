extends RigidBody2D

## Skrypt przeciwnika (moba).
## Odpowiada za losowanie wyglądu podczas pojawiania się na scenie
## oraz usuwanie obiektu, gdy opuści on ekran.

## Wywoływana automatycznie na starcie, gdy węzeł wejdzie do drzewa sceny.
func _ready() -> void:
	# Pobieranie listy dostępnych animacji z węzła AnimatedSprite2D.
	# Zmienna mob_types jest typowana jako Array dla lepszej czytelności.
	var mob_types: Array = Array($AnimatedSprite2D.sprite_frames.get_animation_names())
	
	# Losowanie jednej z dostępnych animacji ("walk", "swim", "fly" itp.) i jej uruchomienie.
	$AnimatedSprite2D.animation = mob_types.pick_random()
	$AnimatedSprite2D.play()

## Wywoływana w każdej klatce. 
## Zmienna '_delta' ma prefiks podłogi, co informuje silnik, że celowo jej nie używamy w tej funkcji.
func _process(_delta: float) -> void:
	pass

## Wywoływana, gdy obiekt VisibleOnScreenNotifier2D zgłosi, że przeciwnik zniknął z ekranu.
func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	# Bezpieczne usunięcie obiektu z pamięci (aby nie zużywał zasobów działając w tle).
	queue_free()
