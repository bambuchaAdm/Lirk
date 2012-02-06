LIRK - Lisp in AVR with assembler Kernel
================

Wstęp
----------

Może nazwa troch miesza, ale ma (miała) być prosta
nastawka nad assembler. Rozpoczęta w ramach ćwieczeń z lispa.

Znane błędy i problemy (nad którymi będę pracował jak będzie czas)
----------
+Ładowanie
Jest to najbardziej problematyczna rzecz, gdyż w jakimkolwiek fragmencie
znajdują się symlinki do dwóch głownych plików projektu. 

Proponowane rozwiązanie ASDF ( by móc później użyć na nim qlispa)

+Defniowanie procedur niezależnych
Obecnie kod jest wykonywan na pałę. Dlatego też brak jest mechanizmów oszczędzania kodu programu.
Podstawowym probleme jest rozpoczęcie wczytywania tej cholery do pamięci oraz chodzenia po nim.

+"Logika" asemblerowa
Jestem w trakcie wymyślenia ulepszonego mechanizmu skoków warunkowych.
Jednak bez zarzadzania przestrzenią programu to się nie uda. Gdyż pojawienie się bardziej skomplikowanych tworów w kodzie będzie mymagało automatycznym zarządzaniem przepływu.