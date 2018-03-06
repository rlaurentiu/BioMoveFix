setwd("E:/Dropbox/argos_errors/Bucuresti_mers")
require(SDLfilter) # first SDL and then dplyr!
require(dplyr)

# citeste fisier Argos (export csv din Argos CLS)
# exemplu fisier date Argos PTT Geotrack 23G SOLAR PTT
Argos_data <- read.csv(file="ArgosData.csv", 
                           header=TRUE, as.is=TRUE)

# vizualizeaza datele (tip variabila, nume coloana, etc)

glimpse(Argos_data)

# sterge datele duplicate. Argos csv include date duplicate pentru fiecare
# locatie

argos.dup <- distinct(Argos_data, Platform.ID.No., Pass.dur...s., Sat., Loc..date, .keep_all = TRUE)

# sterge datele cu NA la  in coloanele Loc..date, Longitude, Latitude)

argos.dup.1 <-   filter(argos.dup, !is.na(Loc..date))
argos.dup.2 <-   filter(argos.dup.1, !is.na(Longitude))
argos.dup.3 <-   filter(argos.dup.2, !is.na(Latitude))

# numarul de indivizi cu date PTT

count(argos.dup.3, Platform.ID.No.)

# selecteaza datele pentru cate fiecare PTT (i.e., fiecare animal)

argos.34400 <- filter(argos.dup.3, Platform.ID.No. == 34400)
argos.34403 <- filter(argos.dup.3, Platform.ID.No. == 34403)
argos.34406 <- filter(argos.dup.3, Platform.ID.No. == 34406)
argos.34407 <- filter(argos.dup.3, Platform.ID.No. == 34407)
argos.34418 <- filter(argos.dup.3, Platform.ID.No. == 34418)


# Export pentru Movebank pentru aplicare filtre (PTT 34400 ca exemplu).
# Atentie Movebank nu accepta fisiere cu date lipsa

glimpse(argos.34400)


argos.34400.movebank <- select(argos.34400, Platform.ID.No., Loc..date, 
                               Lat..sol..1, Long..1, Long..2, Lat..sol..2,
                               Loc..quality, Loc..idx, Msg, X....120.DB, Best.level,
                               Pass.dur...s., Nopc, Delta.freq., Altitude)

# creare fisier txt pentru upload in Movebank

write.table(argos.34400.movebank, file = "argos.34400.movebank.txt", sep = "\t",
            row.names = FALSE, col.names = TRUE)

# filtru calitatea locatie, PTT 34400

count(argos.34400, Loc..quality)

argos.34400.flq.1 <- filter(argos.34400, Loc..quality == 3 | Loc..quality == 2 | Loc..quality == 1)

glimpse(argos.34400.flq.1)

write.csv(argos.34400.flq.1, file = "argos.34400.lc321.csv")

# speed filter

# redeumire coloane pentru a putea lucra cu functiile SDL filter (vezi documentatie SDLfilter)

argos.34400.renamed <- rename(argos.34400, id = Platform.ID.No., lon = Longitude, lat = Latitude,
                              DateTime1 = Loc..date, qi = Msg)

# data in format POSIXct (atentie la formatul datei, modul de prezentare
# este influentat de setarile computerului. Daca este necesar modifica formatul)

argos.34400.renamed$DateTime <- as.POSIXct(paste(argos.34400.renamed$DateTime), 
                                          format = "%d-%m-%Y %H:%M:%OS")

glimpse(argos.34400.renamed)

# viteza maxima

maxvlp <- est.maxvlp(argos.34400.renamed)

# viteza maxima estimata pentru punctele cu mai mult de 7 mesaje PTT

vmax <- est.vmax(argos.34400.renamed, qi = 7, prob = 0.99)

# filtru viteza, viteza maxima 12 km/h, metoda 1 = se elimina punctele in care
# viteza de la punctul precedent sau catre punctul urmator depaseste vmax. Pt
# explicatia coloanelor adaugate consultati documentatie SDLfilter

argos.34400.fs <- ddfilter.speed(argos.34400.renamed, vmax = 16, method = 1)

argos.34400.fs

write.csv(argos.34400.fs, file = "argos.34400.fs.csv")

library(argosfilter)

# filtru viteza (algoritm argosfilter, spped in m/s)

argos.34400.fs1 <- vmask(argos.34400.renamed$lat,argos.34400.renamed$lon,argos.34400.renamed$DateTime,16)

argos.34400.fs1


argos.34400.fs2 <- mutate(argos.34400.renamed, argos.34400.fs1)

# unghiul dintre doua locatii succesive (degrees, O este nord)

argos.34400.unghi.depl <- bearingTrack(argos.34400.renamed$lat,argos.34400.renamed$lon)

write.csv(argos.34400.unghi.depl, file = "temp_unghi.34400.csv")

argos.34400.unghi.depl.1 <- read.csv(file="temp_unghi.34400.csv", header=TRUE)

colnames(argos.34400.unghi.depl.1) <- c("id","unghi")

argos.34400.unghi.depl.2 <- add_row(argos.34400.unghi.depl.1, id  = 0, unghi = 0, .before=1)

argos.34400.unghi.depl.3 <- mutate(argos.34400.renamed, unghi = argos.34400.unghi.depl.2$unghi)

argos.34400.unghi.depl.3

# distanta dintre doua locatii succesive (km)

argos.34400.dist <- distanceTrack(argos.34400.renamed$lat,argos.34400.renamed$lon)

write.csv(argos.34400.dist, file = "temp_dist.34400.csv")

argos.34400.dist.1 <- read.csv(file="temp_dist.34400.csv", header=TRUE)

colnames(argos.34400.dist.1) <- c("id","distance")

argos.34400.dist.2 <- add_row(argos.34400.dist.1, id  = 0, distance = 0, .before=1)

argos.34400.dist.3 <- mutate(argos.34400.renamed, distance = argos.34400.dist.2$distance)

argos.34400.dist.3 

# filtru Freitas et al 2008

date.filtrate <- sdafilter(argos.34400.renamed$lat, argos.34400.renamed$lon, 
          argos.34400.renamed$DateTime, lc=argos.34400.renamed$Loc..quality, vmax = 2, 
          ang = -1)

date.filtrate

argos.34400.filtru <- mutate(argos.34400.renamed, date.filtrate = date.filtrate)

argos.34400.filtru
