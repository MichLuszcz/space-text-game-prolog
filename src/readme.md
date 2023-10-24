

### Konwencja gry
Predykat lokalizacji gracz:
i_am_at(lokacja)

Predykat lokalizacji elementu:
at(element, location)

Predykat ścieżki:
path(source, direction, destination)

Predykaty przejścia (jak adventure):
go(destination) - [n. s. w. e.]
oraz poruszanie [n. s. w. e.]

Predykat końca (jak adventure):
finish.

Predykat posiadania w ekwipunku:
have(item)

Podział elementów:
NPC - talk to
Item - pickable(bool), take(item), drop(item)



##### Funckje:
use(source_item, dest_item2)
open(element), etc.
inspect(element),
check_inventory.

talkable()
pickable()
usable()
locked()



###
w opisach pokojów używamy formatu *doslowna_nazwa_przedmiotu*


###
podział:
Jędrek - początek
Olek - środek
Michał - koniec
