.\" T�umaczenie: Gwidon S. Naskrent (naskrent@hoth.amu.edu.pl), IX 1998
.\" {PTM/GSN/0.5/23-02-1999/"wypisz linie pasuj�ce do wzorca"}
.TH grep 1 "26 wrzesie� 1998" "GNU Project"
.SH OPIS
grep, egrep, fgrep \- wypisz linie pasuj�ce do wzorca
.SH SK�ADNIA
.B grep
[-[AB] NUM] [-CEFGVbchiLlnqsvwxyUu] [-e WZ�R | -f PLIK]
[--extended-regexp] [--fixed-strings] [--basic-regexp]
[--regexp=WZ�R] [--file=PLIK] [--ignore-case] [--word-regexp]
[--line-regexp] [--line-regexp] [--no-messages] [--revert-match]
[--version] [--help] [--byte-offset] [--line-number]
[--with-filename] [--no-filename] [--quiet] [--silent]
[--files-without-match] [--files-with-matcces] [--count]
[--before-context=NUM] [--after-context=NUM] [--context]
[--binary] [--unix-byte-offsets]
.I pliki...
.SH OPIS
.PP
.B grep
przeszukuje nazwane pliki wej�ciowe (lub standardowe wej�cie je�li
nie podano �adnych, lub podano nazw� pliku '\-'), szukaj�c linii
zawieraj�cych co� pasuj�cego do podanego wzoru.  Domy�lnie,
.B grep
wypisuje linie pasuj�ce.
.PP
Istniej� trzy g��wne warianty
.BR grepa ,
kontrolowane przez nast�puj�ce opcje:
.PD 0
.TP
.B \-G, --basic-regexp
Interpretuj
.I wz�r
jako podstawowe wyra�enie regularne (zobacz ni�ej).  Jest to zachowanie
domy�lne.
.TP
.B \-E, --extended-regexp
Interpretuj
.I wz�r
jako rozszerzone wyra�enie regularne (patrz ni�ej).
.TP
.B \-F, --fixed-strings
Interpretuj
.I wz�r
jako list� �a�cuch�w o sta�ej d�ugo�ci, oddzielonych znakami nowej
linii, kt�re nale�y dopasowa� ka�dy z osobna.
.LP
Dodatkowo dost�pne s� dwa programy wariantowe
.B egrep
i
.BR fgrep .
.B egrep
jest podobny (ale nie identyczny) do
.BR "grep\ \-E" ,
i jest kompatybilny z historycznym
.B egrep 
Unixowym.
.B Fgrep
jest tym samym co
.BR "grep\ \-F" .
.PD
.LP
Wszystkie warianty
.B grepa
rozumiej� nast�puj�ce opcje:
.PD 0
.TP
.BI \- NUM
Pasuj�ce linie zostan� wypisane z 
.I NUM
linii poprzedzaj�cego i nast�puj�cego kontekstu.
.B grep
jednak nie wypisze �adnej linii wi�cej ni� jeden raz.
.TP
.BI \-A " NUM" ", --after-context=" NUM
Wypisz
.I NUM
linii nast�puj�cego kontekstu po pasuj�cych liniach.
.TP
.BI \-B " NUM" ", --before-context=" NUM
Wypisz
.I NUM
linii poprzedzaj�cego kontekstu przed pasuj�cymi liniami.
.TP
.B \-C, --context
R�wnowa�ne
.BR \-2 .
.TP
.B \-V, --version
Wypisz numer wersji
.B grepa
na standardowy b��d.  �w numer wersji powinien zosta� za��czony do
wszystkich raport�w o b��dach (patrz ni�ej).
.TP
.B \-b, --byte-offset
Wypisz offset bajtowy w pliku wej�ciowym przed ka�d� lini� wyj�cia.
.TP
.B \-c, --count
Wy��cz normalne wyj�cie; zamiast niego wypisuj liczb� pasuj�cych linii
dla ka�dego pliku wej�ciowego.
Z opcj�
.B \-v, --revert-match
(patrz ni�ej), policz linie niepasuj�ce.
.TP
.BI \-e " WZ�R" ", --regexp=" WZ�R
U�yj
.I WZ�R
jako wzoru; u�yteczne do ochronienia wzor�w zaczynaj�cych si� od
.BR \- .
.TP
.BI \-f " PLIK" ", --file=" PLIK
Pobierz wzory z
.IR PLIK ,
po jednym z ka�dej linii.  Plik pusty zawiera zero wzor�w, nie pasuj�c
do niczego.
.TP
.B \-h, --no-filename
Wy��cz prefiksowanie nazw plik�w w wyj�ciu podczas przeszukiwania wielu
plik�w.
.TP
.B \-i, --ignore-case
Ignoruj ro�r�nienia w wielko�ci liter we
.I wz�r
oraz w plikach wej�ciowych.
.TP
.B \-L, --files-without-match
Wy��cz normalne wyj�cie; zamiast niego wypisz nazw� ka�dego pliku
z kt�rego normalnie nie wypisano by �adnego wyj�cia.  Przeszukiwanie
zako�czy si� na pierwszej pasuj�cej linii.
.TP
.B \-l, --files-with-matches
Wy��cz normalne wyj�cie; zamiast niego wypisz nazw� ka�dego pliku
z kt�rego normalnie wypisano by jakie� wyj�cie.  Przeszukiwanie
zako�czy si� na pierwszej pasuj�cej linii.
.TP
.B \-n, --line-number
Poprzed� ka�da lini� wyj�cia numerem linii w odpowiednim pliku
wej�ciowym.
.TP
.B \-q, --quiet
Po cichu; wy��cz normalne wyj�cie.  Przeszukiwanie zako�czy si� na
pierwszej pasuj�cej linii.
.TP
.B \-s, --silent
Wy��cz komunikaty b��d�w o plikach nieistniej�cych lub nie do odczytania.
.TP
.B \-v, --revert-match
Odwr�c sens dopasowania, wybieraj linie niepasuj�ce.
.TP
.B \-w, --word-regexp
Wybieraj tylko te linie kt�re zawieraj� wzory tworz�ce ca�e s�owa.
Test przeprowadzany polega na tym �e dopasowywany podci�g musi albo 
znajdowa� si� na pocz�tku linii, albo by� poprzedzony znakiem nie
tworz�cym s�owa.  Podobnie, musi albo znajdowa� si� na ko�cu linii,
albo musi nast�powa� po nim znak nie tworz�cy s�owa.  Znakami
tworz�cymi s�owa s� litery, cyfry i znak podkre�lenia.
.TP
.B \-x, --line-regexp
Wybierz tylko te dopasowania kt�re dok�adnie pasuj� do ca�ej linii.
.TP
.B \-y
Przestarza�y synonim
.BR \-i .
.TP
.B \-U, --binary
Potraktuj plik jako binarny.  Domy�lnie, w DOSie i MS Windows,
.BR grep
zgaduje typ pliku spogl�daj�c na zawarto�� pierwszych 32 kB przeczytanych
z pliku.  Je�li
.BR grep
zdecyduje �e plik jest tekstem, udziera znaki CR z oryginalnej zawarto�ci
pliku (po to �eby wyra�enia regularne z
.B ^
i
.B $
dzia�a�y poprawnie).  Podanie
.B \-U
wy��cza to zgadywanie, powoduj�c �e wszystkie pliki s� czytane i
przekazywane mechanizmowi dopasowywuj�cemu jak leci; je�li plik jest
plikiem tekstowym z parami CR/LF na ko�cu linii, spowoduje to �e 
niekt�re wyra�enia regularne nie zadzia�aj�.  Opcja ta jest dost�pna
tylko w DOSie i MS Windows.
.TP
.B \-u, --unix-byte-offsets
Raportuj offsety bajtowe w stylu Unixowym.  Prze��cznik ten powoduje ��
.B grep
raportuje offsety bajtowe tak jakby plik by� plikiem tekstowym w stylu
Unixowym, tj. z udartymi znakami CR.  Da to rezultaty identyczne z
uruchamianiem 
.B grepa
na maszynie Unixowej.  Opcja ta nie wywo�uje �adnego efektu, chyba �e u�yto
tak�e opcji
.BR \-b ;
dost�pna jest ona tylko w DOSie i MS Windows.
.PD
.SH "WYRA�ENIA REGULARNE"
.PP
Wyra�enie regularne to wz�r opisuj�cy zbi�r �a�cuch�w.  Wyra�enia
regularne s� zbudowane analogicznie do wyra�e� arytmetycznych,
u�ywaj�c r�nych operator�w do po��czenia mniejszych wyra�e�.
.PP
.B grep
rozumie dwie r�ne wersje sk�adni wyra�e� regularnych: "podstawow�"
i "z�o�on�".  W
.RB "GNU\ " grep ,
nie ma r�nicy w dost�pnej funkcjonalno�ci kiedy u�ywa si� jednej
ze sk�adni.  W innych implementacjach podstawowe wyra�enia regularne
s� mniej wszechstronne.  Poni�szy opis stosuje si� do rozszerzonych
wyra�e� regularnych; r�nice w stosunku do wyra�e� bazowych podsumowano
na ko�cu.
.PP
Fundamentalne "cegie�ki" to wyra�enia regularne pasuj�ce do pojedynczego
znaku.  Wi�kszo�� znak�w, w tym wszystkie litery i cyfry, to wyra�enia
regularne pasuj�ce do samych siebie.  Ka�dy metaznak maj�cy specjalne
znaczenie mo�e by� cytowany przez poprzedzenie go backslashem.
.PP
Lista znak�w zwarta mi�dzy
.B [
a
.B ]
pasuje do ka�dego pojedynczego znaku na tej li�cie; je�li pierwszym znakiem
listy jest daszek
.BR ^ ,
pasuje wtedy ona do ka�dego znaku
.I nie
znajduj�cego si� na li�cie.  Dla przyk�adu, wyra�enie regularne
.B [0123456789]
pasuje do ka�dej pojedynczej cyfry.  Zakres znak�w ASCII poda� mo�na
okre�laj�c znak pierwszy i ostatni, oddzielone my�lnikiem.
Niekt�re w ko�cu nazwane klasy znak�w s� predefiniowane.  Ich nazwy
m�wi� same za siebie, i s� to:
.BR [:alnum:] ,
.BR [:alpha:] ,
.BR [:cntrl:] ,
.BR [:digit:] ,
.BR [:graph:] ,
.BR [:lower:] ,
.BR [:print:] ,
.BR [:punct:] ,
.BR [:space:] ,
.BR [:upper:] ,
oraz
.BR [:xdigit:].
Na przyk�ad
.B [[:alnum:]]
oznacza
.BR [0-9A-Za-z] ,
z tym wyj�tkiem �e ta druga forma zale�y od kodowania znak�w ASCII, podczas
gdy format jest przeno�ny (zauwa� �e nawiasy w tych nazwach klas s�
cz�ci� nazw symbolicznych, i musz� by� za��czone, razem z nawiasami
ograniczaj�cymi list� w nawiasach).  Wi�kszo�� metaznak�w traci swoje
szczeg�lne znaczenie wewn�trz list.  Aby umie�ci� tam dos�owny
.BR ] ,
umie�� go jako pierwszy na li�cie.  Podobnie, aby umie�ci� dos�owny
.BR ^ ,
umie�� go gdziekolwiek poza pierwszym miejscem.  W ko�cu, aby umie�ci�
dos�owny
.BR \- ,
umie�� go na ostatku.
.PP
Kropka
.B .
pasuje do ka�dego pojedynczego znaku.
Symbol
.B \ew
to synonim
.B [[:alnum:]]
a
.B \eW
to synonim
.BR [^[:alnum]] .
.PP
Daszek
.B ^
oraz znak dolara
.B $
s� metaznakami kt�re pasuj� odpowiednio do �a�cucha pustego na pocz�tku
i na ko�cu linii.  Symbole
.B \e<
oraz
.B \e>
pasuj� odpowiednio do �a�cucha pustego na pocz�tku i na ko�cu s�owa.
Symbol
.B \eb
pasuje do �a�cucha pustego na kraw�dzi s�owa, za�
.B \eB
pasuje do pustego �a�cucha zak�adaj�c �e 
.I nie
jest on na kraw�dzi s�owa.
.PP
Po wyra�eniu regularnym mo�e nast�powa� jeden z kilku operator�w
powt�rzenia:
.PD 0
.TP
.B ?
Poprzedzaj�cy element jest opcjonalny i pasuje co najmniej raz.
.TP
.B *
Poprzedzaj�cy element b�dzie dopasowany zero lub wi�cej razy.
.TP
.B +
Poprzedzaj�cy element b�dzie dopasowany jeden lub wi�cej razy.
.TP
.BI { n }
Poprzedzaj�cy element pasuje dok�adnie 
.I n
razy.
.TP
.BI { n ,}
Poprzedzaj�cy element pasuje
.I n
lub wi�cej razy
.TP
.BI {, m }
Poprzedzaj�cy element jest opcjonalny i pasuje co najwy�ej
.I m
razy.
.TP
.BI { n , m }
Poprzedzaj�cy element pasuje co najmniej
.I n
razy, ale nie wi�cej ni�
.I m
razy.
.PD
.PP
Dwa wyra�enia regularne mo�na do siebie doda�; wynikowe wyra�enie
regularne pasuje do ka�dego ci�gu utworzonego poprzez dodanie
dowolnych dw�ch ci�g�w kt�re odpowiednio pasuj� do dodanych
podwyra�e�.
.PP
Dwa wyra�enia regularne mo�na po��czy� operatorem infiksowym
.BR | ;
wynikowe wyra�enie regularne pasuje do dowolnego ci�gu pasuj�cego
do jednego z podwyra�e�.
.PP
Powtarzanie bierze priorytet nad dodawaniem, kt�re z kolei bierze
g�r� nad przemienno�ci�.  Ca�e wyra�enie regularne mo�na uj��
w nawiasy, celem uniewa�nienia tych regu� priorytetowych.
.PP
Wsteczne odniesienie
.BI \e n\c
\&, gdzie
.I n
jest pojedyncz� cyfr�, pasuje do podci�gu poprzednio pasuj�cego do
.IR n \-tego
uj�tego w nawiasy podwyra�enia wyra�enia regularnego.
.PP
W podstawowych wyra�eniach regularnych metaznaki
.BR ? ,
.BR + ,
.BR { ,
.BR | ,
.BR ( ,
oraz
.BR )
trac� swoje szczeg�lne znaczenie; zamiast nich u�yj wersji z backslashem:
.BR \e? ,
.BR \e+ ,
.BR \e{ ,
.BR \e| ,
.BR \e( ,
oraz
.BR \e) .
.PP
W
.B egrepie
metaznak
.B {
traci swoje szczeg�lne znaczenie; u�yj zamiast niego
.BR \e{ .
.SH DIAGNOSTYKA
.PP
Normalnie status wyj�ciowy r�wna si� 0 je�li znaleziono dopasowania,
i 1 je�li nie znaleziono �adnych.  Opcja
.B \-v
odwraca sens statusu wyj�ciowego.  Status wyj�ciowy r�wna si� 2 je�li
wyst�pi�y b��dy sk�adniowe we wzorze, niedost�pne pliki wej�ciowe lub
inne b��dy systemowe.
.SH B��DY
.PP
Emailuj raporty o b��dach do
.BR bug-gnu-utils@gnu.org .
Upewnij si� �e umie�ci�e� s�owo "grep" gdzie� w polu "Subject:"
.PP
Du�e liczniki powt�rze� w konstrukcji
.BI { m , n }
mog� spowodowa� �e grep zu�yje mn�stwo pami�ci.  Dodatkowo, pewne
inne niejasne wyra�enia regularne wymagaj� czasu i przestrzeni
rosn�cej wyk�adnikowo, i mog� spowodowa� �e
.B grepowi
zabraknie pami�ci.
.PP
Wsteczne odwo�ania s� bardzo powolne, i mog� wymaga� czasu rosn�cego
wyk�adnikowo.
