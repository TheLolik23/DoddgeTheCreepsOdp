extends CanvasLayer

## Skrypt interfejsu użytkownika (HUD - Heads-Up Display).
## Zarządza wyświetlaniem punktów, komunikatów na ekranie oraz przycisku rozpoczęcia gry.

## Sygnał informujący główny węzeł (Main) o wciśnięciu przycisku "Start".
signal start_game

## Wyświetla tymczasowy komunikat na ekranie.
## [param text] to treść wiadomości (ciąg znaków), która ma zostać pokazana.
func show_message(text: String) -> void:
	$Message.text = text
	$Message.show()
	$MessageTimer.start()

## Obsługuje sekwencję końca gry (Game Over) i przygotowuje ekran do nowej rundy.
func show_game_over() -> void:
	show_message("Game Over")
	
	# Zatrzymuje wykonywanie tej funkcji do momentu, aż MessageTimer zakończy odliczanie.
	await $MessageTimer.timeout
	
	# Przywrócenie domyślnego tekstu zachęcającego do gry.
	$Message.text = "Dodge the Creeps!"
	$Message.show()
	
	# Tworzy asynchroniczny, jednorazowy timer na 1 sekundę w drzewie sceny i czeka na jego koniec.
	await get_tree().create_timer(1.0).timeout
	$StartButton.show()

## Aktualizuje wynik wyświetlany na ekranie.
## [param score] to aktualna liczba punktów gracza (liczba całkowita).
func update_score(score: int) -> void:
	$ScoreLabel.text = str(score)

## Wywoływana po kliknięciu głównego przycisku Start.
func _on_start_button_pressed() -> void:
	$StartButton.hide() # Ukrywamy przycisk, aby nie przeszkadzał podczas gry.
	start_game.emit()

## Wywoływana, gdy upłynie czas wyświetlania wiadomości zdefiniowany w MessageTimer.
func _on_message_timer_timeout() -> void:
	$Message.hide()
