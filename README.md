# Gra "Dodge the Creeps" - Zadanie Programistyczne

Witaj! Twoim zadaniem na dzisiejszej lekcji jest naprawienie gry "Dodge the Creeps". Ktoś zepsuł kod i usunął kilka ważnych linijek! 

## Twój Cel
Odblokuj pełną funkcjonalność gry poprzez dopisanie brakującego kodu we wskazanych plikach. Znajdziesz w nich komentarze zaczynające się od słowa **TODO** (z ang. do zrobienia) oraz opis tego, co dokładnie trzeba zrobić.

Czas trwania zadania: około **15 minut**.

---

## 📍 Gdzie szukać zadań?
W plikach ze skryptami ukryto 5 zadań do naprawienia:
- **Zadanie 1 i 2** $\rightarrow$ `scripts/player.gd` (Ruch postaci)
- **Zadanie 3** $\rightarrow$ `scripts/main.gd` (Zliczanie punktów)
- **Zadanie 4** $\rightarrow$ `scripts/mob.gd` (Zarządzanie usuniętymi obiektami)
- **Zadanie 5** $\rightarrow$ `scripts/hud.gd` (Interfejs z napisami)

---

## 💡 Jak poruszać się po Godot Engine? (Podpowiedzi)

Nigdy wcześniej nie używałeś Godota? Bez obaw! Oto kilka najważniejszych skrótów i funkcji, które Ci pomogą:

### 1. Jak otworzyć plik ze skryptem (kodem)?
W dolnej części ekranu po lewej stronie znajdziesz panel **System plików (FileSystem)**. Składają się na niego różne foldery z ułożonymi plikami. Skrypty, których szukasz, mają rozszerzenie `.gd` i znajdują się w folderze `scripts/`. Kliknij dwa razy na wybrany plik, aby otworzyć edytor kodu i zobaczyć jego zawartość.

### 2. Jak przetestować grę?
Po wpisaniu kodu musisz sprawdzić, czy działa. 
Aby włączyć grę kliknij przycisk "Zagraj" (ikona **▶ Play**) w prawym górnym rogu okna Godota lub użyj skrótu klawiszowego:
- **F5** – Uruchamia główną scenę (całą grę).

### 3. Jak szybko znaleźć słowo "TODO"?
Będąc w edytorze kodu zapoznaj się ze skrótem wyszukiwania i ułatw sobie życie:
- Kliknij wewnątrz skryptu.
- Wciśnij **Ctrl + F**, po czym na pasku szukania wpisz słowo: `TODO`
- Możesz naciskać *ENTER* na pasku wyszukiwania (lub przyciski góra/dół obok niego), aby łatwo i szybko przeskakiwać pomiędzy wszystkimi ukrytymi zadaniami w danym pliku.

### 4. Co oznaczają błędy na czerwono?
Jeśli popełnisz błąd w kodzie, na dole ekranu pokaże się pasek na czerwono (zakładka Debugger). Zwróć uwagę, w której linijce kod jest problematyczny. Może zapomniałeś wcięcia na początku linii (klawisz Tab)? Zrobiłeś literówkę w zmiennej? Użyto złej nazwy metody? Ostrzeżenia na żółto przeważnie możesz zignorować.

### 5. Drobna wskazówka o osiach X i Y
Pamiętaj, że na ekranach monitorów (i w silnikach gier 2D, takich jak Godot) **oś Y zazwyczaj rośnie w kierunku do dołu**. Zero jest na samej górze. Aby poruszyć się w dół musisz użyć dodawania (np. `+ 1`)! Oś X (lewo/prawo) działa tak samo, jak w matematyce na matematyce w szkole!

Powodzenia! 🚀
