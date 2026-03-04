extends Area2D

## Skrypt głównej postaci gracza.
## Odpowiada za ruch, obsługę wejścia (sterowanie), animacje oraz detekcję kolizji.

## Sygnał emitowany, gdy gracz zderzy się z innym obiektem (np. przeciwnikiem).
signal hit

## Szybkość poruszania się gracza wyrażona w pikselach na sekundę.
@export var speed: float = 400.0

## Przechowuje rozmiar okna gry, używany do blokowania wyjścia gracza poza ekran.
var screen_size: Vector2


## Wywoływana automatycznie na starcie gry, zanim węzły zaczną aktywnie działać.
func _ready() -> void:
	hide()
	screen_size = get_viewport_rect().size


## Aktualizuje stan gracza co klatkę.
## [param delta] to czas, jaki upłynął od poprzedniej klatki (w sekundach).
func _process(delta: float) -> void:
	# Wektor kierunku ruchu gracza w bieżącej klatce.
	var velocity := Vector2.ZERO 
	
	# Weryfikacja wejścia od użytkownika (wciśnięte klawisze/przyciski).
	if Input.is_action_pressed("move_right"):
		velocity.x += 1
	if Input.is_action_pressed("move_left"):
		velocity.x -= 1
	if Input.is_action_pressed("move_down"):
		# TODO: Zadanie 1 - Zmodyfikuj prędkość w osi Y (velocity.y), aby postać poruszała się w dół. Podpowiedź: w Godot oś Y rośnie w dół, więc dodaj 1.
		pass
	if Input.is_action_pressed("move_up"):
		# TODO: Zadanie 2 - Zmodyfikuj prędkość w osi Y (velocity.y), aby postać poruszała się w górę. Podpowiedź: odejmij 1 od velocity.y.
		pass

	# Jeśli gracz się porusza, normalizujemy wektor ruchu i włączamy animację.
	if velocity.length() > 0:
		# Normalizacja zapobiega szybszemu poruszaniu się po przekątnej.
		velocity = velocity.normalized() * speed
		$AnimatedSprite2D.play()
	else:
		# Zatrzymanie animacji, gdy gracz stoi w miejscu.
		$AnimatedSprite2D.stop()
		
	# Aktualizacja pozycji na ekranie.
	position += velocity * delta
	# Ograniczenie pozycji (clamp), aby gracz nie opuścił widocznego obszaru gry.
	position = position.clamp(Vector2.ZERO, screen_size)
	
	# Zmiana odpowiednich animacji w zależności od osi ruchu.
	if velocity.x != 0:
		$AnimatedSprite2D.animation = "walk"
		$AnimatedSprite2D.flip_v = false
		# Odwrócenie duszka (odbicie lustrzane) w poziomie, jeśli idzie w lewo.
		$AnimatedSprite2D.flip_h = velocity.x < 0
	elif velocity.y != 0:
		$AnimatedSprite2D.animation = "up"
		# Odwrócenie duszka w pionie, jeśli porusza się w dół.
		$AnimatedSprite2D.flip_v = velocity.y > 0


## Inicjalizuje gracza do nowych ustawień startowych (np. przy restarcie gry).
## [param pos] to wektor określający początkową pozycję na ekranie.
func start(pos: Vector2) -> void:
	position = pos
	show()
	$CollisionShape2D.disabled = false


## Wywoływana automatycznie, gdy inne fizyczne ciało wejdzie w obszar gracza.
func _on_body_entered(_body: Node2D) -> void:
	hide() # Ukrycie gracza natychmiast po trafieniu.
	hit.emit()
	
	# Wyłączenie kolizji musi być opóźnione (set_deferred).
	# Silnik fizyczny Godota nie pozwala na zmianę stanu fizycznego węzłów 
	# bezpośrednio w trakcie wykonywania obliczeń kolizji (callbacku fizyki).
	$CollisionShape2D.set_deferred("disabled", true)
