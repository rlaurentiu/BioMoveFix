# Inainte de rula un scrip trebuie declarat directorul de lucru, adica 
# directorul din care R va citi si in care va salva fisiere

setwd("C:/Yourdirectory/Data")

# Putem verifica in ce director va rula scriptul astfel

getwd()

# R atribuie nume la obiecte (liste, seturi de date, figuri, scripturi)
# folosind operatorul <-. Numele nu trebuie sa includa spatii

datele.mele <- 3+2

# Continutul obiectului il vizulizam prin apelarea numelui atribuit. Pentru apelare
# rulare, punem cursorul oriunde langa nume si apasam butonul Run

datele.mele

# Comanda rm(numeobiect) sterge obiectul rm(datele.mele) iar rm(all) sterge
# toate obiectele din R. Dupe ce va fi sters panoul, obiectul va disparea din
# panoul din dreapta GlobalEnvironment

rm(datele.mele)


# Operatorii speciali utili noua din R sunt NA (pentru lipsa de valori), 
# NULL (obiect gol, de exemplu lista), NaN (not a number)

12 + NA      

is.na(12+NA) 

0/0 # trebuie sa indice NaN (not a number), adica operatie imposibila

# Semnul diez indica comentariu, nu obiect ca cele doua exemple de mai jos

12 + 3 # verifica daca este 15

# verificat daca este 15

12 + 3

# Definirea vectorilor (exemplu liste) se face prin expresia c(1, 2, 3, 4), unde
# 1,2,3 si 4 sunt vectorii din lista de 4

vector1 <- c(1, 2, 3, 4)

vector1

vector2 <- c("Nord", "Sud", "Est", "Vest" # vector cu text

vector2 # o sa apara eroare Error: object 'vector2' not found deoarece

# nu am inchis paranteza dupa Vest

vector2 <- c("Nord", "Sud", "Est", "Vest")

vector2 # trebuie sa tipareasca "Nord" "Sud"  "Est"  "Vest"

# Vectorii numerici se pot combina cu cei text

vector3 <- c("Nord", "Sud", "Est", 12)

vector3

# Factorii reprezinta date categoriale (mic, mare, alb, negru, etc)
# Orice vector se poate declara ca factor

# vector text

lista.vector <- c("mic", "milociu", "mare", "foarte mare")

# lista factor

lista.factor <- factor(c("mare", "milociu", "mic", "foarte mare"))

lista.factor

# factor ordonat de la foarte mare la mic

lista.ordonata <- factor(c("foarte mare", "mare", "mijlociu", "mic"))

lista.ordonata

# putem citi nivelurile din factor

levels(lista.ordonata)
