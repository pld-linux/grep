.\" T³umaczenie: Gwidon S. Naskrent (naskrent@hoth.amu.edu.pl), IX 1998
.\" {PTM/GSN/0.5/23-02-1999/"wypisz linie pasuj±ce do wzorca"}
.TH grep 1 "26 wrzesieñ 1998" "GNU Project"
.SH OPIS
grep, egrep, fgrep \- wypisz linie pasuj±ce do wzorca
.SH SK£ADNIA
.B grep
[-[AB] NUM] [-CEFGVbchiLlnqsvwxyUu] [-e WZÓR | -f PLIK]
[--extended-regexp] [--fixed-strings] [--basic-regexp]
[--regexp=WZÓR] [--file=PLIK] [--ignore-case] [--word-regexp]
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
przeszukuje nazwane pliki wej¶ciowe (lub standardowe wej¶cie je¶li
nie podano ¿adnych, lub podano nazwê pliku '\-'), szukaj±c linii
zawieraj±cych co¶ pasuj±cego do podanego wzoru.  Domy¶lnie,
.B grep
wypisuje linie pasuj±ce.
.PP
Istniej± trzy g³ówne warianty
.BR grepa ,
kontrolowane przez nastêpuj±ce opcje:
.PD 0
.TP
.B \-G, --basic-regexp
Interpretuj
.I wzór
jako podstawowe wyra¿enie regularne (zobacz ni¿ej).  Jest to zachowanie
domy¶lne.
.TP
.B \-E, --extended-regexp
Interpretuj
.I wzór
jako rozszerzone wyra¿enie regularne (patrz ni¿ej).
.TP
.B \-F, --fixed-strings
Interpretuj
.I wzór
jako listê ³añcuchów o sta³ej d³ugo¶ci, oddzielonych znakami nowej
linii, które nale¿y dopasowaæ ka¿dy z osobna.
.LP
Dodatkowo dostêpne s± dwa programy wariantowe
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
rozumiej± nastêpuj±ce opcje:
.PD 0
.TP
.BI \- NUM
Pasuj±ce linie zostan± wypisane z 
.I NUM
linii poprzedzaj±cego i nastêpuj±cego kontekstu.
.B grep
jednak nie wypisze ¿adnej linii wiêcej ni¿ jeden raz.
.TP
.BI \-A " NUM" ", --after-context=" NUM
Wypisz
.I NUM
linii nastêpuj±cego kontekstu po pasuj±cych liniach.
.TP
.BI \-B " NUM" ", --before-context=" NUM
Wypisz
.I NUM
linii poprzedzaj±cego kontekstu przed pasuj±cymi liniami.
.TP
.B \-C, --context
Równowa¿ne
.BR \-2 .
.TP
.B \-V, --version
Wypisz numer wersji
.B grepa
na standardowy b³±d.  Ów numer wersji powinien zostaæ za³±czony do
wszystkich raportów o b³êdach (patrz ni¿ej).
.TP
.B \-b, --byte-offset
Wypisz offset bajtowy w pliku wej¶ciowym przed ka¿d± lini± wyj¶cia.
.TP
.B \-c, --count
Wy³±cz normalne wyj¶cie; zamiast niego wypisuj liczbê pasuj±cych linii
dla ka¿dego pliku wej¶ciowego.
Z opcj±
.B \-v, --revert-match
(patrz ni¿ej), policz linie niepasuj±ce.
.TP
.BI \-e " WZÓR" ", --regexp=" WZÓR
U¿yj
.I WZÓR
jako wzoru; u¿yteczne do ochronienia wzorów zaczynaj±cych siê od
.BR \- .
.TP
.BI \-f " PLIK" ", --file=" PLIK
Pobierz wzory z
.IR PLIK ,
po jednym z ka¿dej linii.  Plik pusty zawiera zero wzorów, nie pasuj±c
do niczego.
.TP
.B \-h, --no-filename
Wy³±cz prefiksowanie nazw plików w wyj¶ciu podczas przeszukiwania wielu
plików.
.TP
.B \-i, --ignore-case
Ignoruj ro¿ró¿nienia w wielko¶ci liter we
.I wzór
oraz w plikach wej¶ciowych.
.TP
.B \-L, --files-without-match
Wy³±cz normalne wyj¶cie; zamiast niego wypisz nazwê ka¿dego pliku
z którego normalnie nie wypisano by ¿adnego wyj¶cia.  Przeszukiwanie
zakoñczy siê na pierwszej pasuj±cej linii.
.TP
.B \-l, --files-with-matches
Wy³±cz normalne wyj¶cie; zamiast niego wypisz nazwê ka¿dego pliku
z którego normalnie wypisano by jakie¶ wyj¶cie.  Przeszukiwanie
zakoñczy siê na pierwszej pasuj±cej linii.
.TP
.B \-n, --line-number
Poprzed¼ ka¿da liniê wyj¶cia numerem linii w odpowiednim pliku
wej¶ciowym.
.TP
.B \-q, --quiet
Po cichu; wy³±cz normalne wyj¶cie.  Przeszukiwanie zakoñczy siê na
pierwszej pasuj±cej linii.
.TP
.B \-s, --silent
Wy³±cz komunikaty b³êdów o plikach nieistniej±cych lub nie do odczytania.
.TP
.B \-v, --revert-match
Odwróc sens dopasowania, wybieraj linie niepasuj±ce.
.TP
.B \-w, --word-regexp
Wybieraj tylko te linie które zawieraj± wzory tworz±ce ca³e s³owa.
Test przeprowadzany polega na tym ¿e dopasowywany podci±g musi albo 
znajdowaæ siê na pocz±tku linii, albo byæ poprzedzony znakiem nie
tworz±cym s³owa.  Podobnie, musi albo znajdowaæ siê na koñcu linii,
albo musi nastêpowaæ po nim znak nie tworz±cy s³owa.  Znakami
tworz±cymi s³owa s± litery, cyfry i znak podkre¶lenia.
.TP
.B \-x, --line-regexp
Wybierz tylko te dopasowania które dok³adnie pasuj± do ca³ej linii.
.TP
.B \-y
Przestarza³y synonim
.BR \-i .
.TP
.B \-U, --binary
Potraktuj plik jako binarny.  Domy¶lnie, w DOSie i MS Windows,
.BR grep
zgaduje typ pliku spogl±daj±c na zawarto¶æ pierwszych 32 kB przeczytanych
z pliku.  Je¶li
.BR grep
zdecyduje ¿e plik jest tekstem, udziera znaki CR z oryginalnej zawarto¶ci
pliku (po to ¿eby wyra¿enia regularne z
.B ^
i
.B $
dzia³a³y poprawnie).  Podanie
.B \-U
wy³±cza to zgadywanie, powoduj±c ¿e wszystkie pliki s± czytane i
przekazywane mechanizmowi dopasowywuj±cemu jak leci; je¶li plik jest
plikiem tekstowym z parami CR/LF na koñcu linii, spowoduje to ¿e 
niektóre wyra¿enia regularne nie zadzia³aj±.  Opcja ta jest dostêpna
tylko w DOSie i MS Windows.
.TP
.B \-u, --unix-byte-offsets
Raportuj offsety bajtowe w stylu Unixowym.  Prze³±cznik ten powoduje ¿ê
.B grep
raportuje offsety bajtowe tak jakby plik by³ plikiem tekstowym w stylu
Unixowym, tj. z udartymi znakami CR.  Da to rezultaty identyczne z
uruchamianiem 
.B grepa
na maszynie Unixowej.  Opcja ta nie wywo³uje ¿adnego efektu, chyba ¿e u¿yto
tak¿e opcji
.BR \-b ;
dostêpna jest ona tylko w DOSie i MS Windows.
.PD
.SH "WYRA¯ENIA REGULARNE"
.PP
Wyra¿enie regularne to wzór opisuj±cy zbiór ³añcuchów.  Wyra¿enia
regularne s± zbudowane analogicznie do wyra¿eñ arytmetycznych,
u¿ywaj±c ró¿nych operatorów do po³±czenia mniejszych wyra¿eñ.
.PP
.B grep
rozumie dwie ró¿ne wersje sk³adni wyra¿eñ regularnych: "podstawow±"
i "z³o¿on±".  W
.RB "GNU\ " grep ,
nie ma ró¿nicy w dostêpnej funkcjonalno¶ci kiedy u¿ywa siê jednej
ze sk³adni.  W innych implementacjach podstawowe wyra¿enia regularne
s± mniej wszechstronne.  Poni¿szy opis stosuje siê do rozszerzonych
wyra¿eñ regularnych; ró¿nice w stosunku do wyra¿eñ bazowych podsumowano
na koñcu.
.PP
Fundamentalne "cegie³ki" to wyra¿enia regularne pasuj±ce do pojedynczego
znaku.  Wiêkszo¶æ znaków, w tym wszystkie litery i cyfry, to wyra¿enia
regularne pasuj±ce do samych siebie.  Ka¿dy metaznak maj±cy specjalne
znaczenie mo¿e byæ cytowany przez poprzedzenie go backslashem.
.PP
Lista znaków zwarta miêdzy
.B [
a
.B ]
pasuje do ka¿dego pojedynczego znaku na tej li¶cie; je¶li pierwszym znakiem
listy jest daszek
.BR ^ ,
pasuje wtedy ona do ka¿dego znaku
.I nie
znajduj±cego siê na li¶cie.  Dla przyk³adu, wyra¿enie regularne
.B [0123456789]
pasuje do ka¿dej pojedynczej cyfry.  Zakres znaków ASCII podaæ mo¿na
okre¶laj±c znak pierwszy i ostatni, oddzielone my¶lnikiem.
Niektóre w koñcu nazwane klasy znaków s± predefiniowane.  Ich nazwy
mówi± same za siebie, i s± to:
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
Na przyk³ad
.B [[:alnum:]]
oznacza
.BR [0-9A-Za-z] ,
z tym wyj±tkiem ¿e ta druga forma zale¿y od kodowania znaków ASCII, podczas
gdy format jest przeno¶ny (zauwa¿ ¿e nawiasy w tych nazwach klas s±
czê¶ci± nazw symbolicznych, i musz± byæ za³±czone, razem z nawiasami
ograniczaj±cymi listê w nawiasach).  Wiêkszo¶æ metaznaków traci swoje
szczególne znaczenie wewn±trz list.  Aby umie¶ciæ tam dos³owny
.BR ] ,
umie¶æ go jako pierwszy na li¶cie.  Podobnie, aby umie¶ciæ dos³owny
.BR ^ ,
umie¶æ go gdziekolwiek poza pierwszym miejscem.  W koñcu, aby umie¶ciæ
dos³owny
.BR \- ,
umie¶æ go na ostatku.
.PP
Kropka
.B .
pasuje do ka¿dego pojedynczego znaku.
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
s± metaznakami które pasuj± odpowiednio do ³añcucha pustego na pocz±tku
i na koñcu linii.  Symbole
.B \e<
oraz
.B \e>
pasuj± odpowiednio do ³añcucha pustego na pocz±tku i na koñcu s³owa.
Symbol
.B \eb
pasuje do ³añcucha pustego na krawêdzi s³owa, za¶
.B \eB
pasuje do pustego ³añcucha zak³adaj±c ¿e 
.I nie
jest on na krawêdzi s³owa.
.PP
Po wyra¿eniu regularnym mo¿e nastêpowaæ jeden z kilku operatorów
powtórzenia:
.PD 0
.TP
.B ?
Poprzedzaj±cy element jest opcjonalny i pasuje co najmniej raz.
.TP
.B *
Poprzedzaj±cy element bêdzie dopasowany zero lub wiêcej razy.
.TP
.B +
Poprzedzaj±cy element bêdzie dopasowany jeden lub wiêcej razy.
.TP
.BI { n }
Poprzedzaj±cy element pasuje dok³adnie 
.I n
razy.
.TP
.BI { n ,}
Poprzedzaj±cy element pasuje
.I n
lub wiêcej razy
.TP
.BI {, m }
Poprzedzaj±cy element jest opcjonalny i pasuje co najwy¿ej
.I m
razy.
.TP
.BI { n , m }
Poprzedzaj±cy element pasuje co najmniej
.I n
razy, ale nie wiêcej ni¿
.I m
razy.
.PD
.PP
Dwa wyra¿enia regularne mo¿na do siebie dodaæ; wynikowe wyra¿enie
regularne pasuje do ka¿dego ci±gu utworzonego poprzez dodanie
dowolnych dwóch ci±gów które odpowiednio pasuj± do dodanych
podwyra¿eñ.
.PP
Dwa wyra¿enia regularne mo¿na po³±czyæ operatorem infiksowym
.BR | ;
wynikowe wyra¿enie regularne pasuje do dowolnego ci±gu pasuj±cego
do jednego z podwyra¿eñ.
.PP
Powtarzanie bierze priorytet nad dodawaniem, które z kolei bierze
górê nad przemienno¶ci±.  Ca³e wyra¿enie regularne mo¿na uj±æ
w nawiasy, celem uniewa¿nienia tych regu³ priorytetowych.
.PP
Wsteczne odniesienie
.BI \e n\c
\&, gdzie
.I n
jest pojedyncz± cyfr±, pasuje do podci±gu poprzednio pasuj±cego do
.IR n \-tego
ujêtego w nawiasy podwyra¿enia wyra¿enia regularnego.
.PP
W podstawowych wyra¿eniach regularnych metaznaki
.BR ? ,
.BR + ,
.BR { ,
.BR | ,
.BR ( ,
oraz
.BR )
trac± swoje szczególne znaczenie; zamiast nich u¿yj wersji z backslashem:
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
traci swoje szczególne znaczenie; u¿yj zamiast niego
.BR \e{ .
.SH DIAGNOSTYKA
.PP
Normalnie status wyj¶ciowy równa siê 0 je¶li znaleziono dopasowania,
i 1 je¶li nie znaleziono ¿adnych.  Opcja
.B \-v
odwraca sens statusu wyj¶ciowego.  Status wyj¶ciowy równa siê 2 je¶li
wyst±pi³y b³êdy sk³adniowe we wzorze, niedostêpne pliki wej¶ciowe lub
inne b³êdy systemowe.
.SH B£ÊDY
.PP
Emailuj raporty o b³êdach do
.BR bug-gnu-utils@gnu.org .
Upewnij siê ¿e umie¶ci³e¶ s³owo "grep" gdzie¶ w polu "Subject:"
.PP
Du¿e liczniki powtórzeñ w konstrukcji
.BI { m , n }
mog± spowodowaæ ¿e grep zu¿yje mnóstwo pamiêci.  Dodatkowo, pewne
inne niejasne wyra¿enia regularne wymagaj± czasu i przestrzeni
rosn±cej wyk³adnikowo, i mog± spowodowaæ ¿e
.B grepowi
zabraknie pamiêci.
.PP
Wsteczne odwo³ania s± bardzo powolne, i mog± wymagaæ czasu rosn±cego
wyk³adnikowo.
