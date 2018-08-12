[![Maintenance](https://img.shields.io/badge/Maintained%3F-yes-green.svg)](https://https://github.com/rlaurentiu/BioMoveFix/commits/master)
[![Made with R!](https://img.shields.io/badge/made%20with-R-blue.svg)](https://github.com/rlaurentiu/BioMoveFix)
[![financed by](https://img.shields.io/badge/PN--III--P2--2.1--PED--2016--0568-UEFISCDI-brightgreen.svg)](http://ccmesi.ro/?page_id=47)
[![MIT license](https://img.shields.io/badge/License-MIT-blue.svg)](https://lbesson.mit-license.org/)

# Biomovefix
## Prelucrare și filtrare date localizare Argos Doppler

Pachetul se unelte pentru prelucrarea și filtrarea a datelor de localizare ARGOS Doppler:

1) **Scurtă introducere în R - script R**. Scriptul include câteva comenzi de bază pentru rularea pachetelor R prin intermediul RStudio pentru cei nefamiliarizați cu acest limbaj. După parcurgerea acestuia vă recomandăm să dedicați 3-4 ore pentru o mai bună asimilare urmând cursul gratuit [Datacamp](https://www.datacamp.com/courses/free-introduction-to-r). Datacamp are și un curs gratuit pentru RStudio care vă va învăța să lucrați eficient și să reproductibil.
2) **Tehnici de monitorizare a animalelor sălbatice - manual pdf**. Manualul prezintă informații privind tehnicile de analiză a mișcărilor animalelor sălbatice (radio VHF, GPS, Argos Doppler, geolocație prin nivel lumină), criterii de selectare a tehnologiei optime funcție de scopul cercetării și istoria naturală a speciei de interes, costurile estimative pentru fiecare metodă, producători principali, capturarea indivizilor în vederea atașării dispozitivelor de localizare, informații despre prelucrarea datelor brute de tip Argos Doppler, pachete software recomandate și literatura de bază pentru aprofundarea domeniului.
3) **Set de date obținut în condiții reale - script R**. Setul de date este obținut în cadrul proiectului BioMoveFix și poate fi folosit cu scriptul de prelucrare și filtrare date de tip Argos Doppler. Scriptul R include prelucrarea datelor prin curățarea bazei de date brute (descărcate din sistemul Argos) prin identificarea și ștergerea duplicatelor, a datelor fără localizare și fără marcă temporală, salvare ca fișier compatibil cu baza de date Movebank pentru prelucrări ulterioare (ex. filtrare prin algoritmul Douglas Argos Filter), reprezentarea spațială a datelor, filtrarea prin filtre distructive de clase de eroare, prin limită de viteză, etc. Utilizatorul va învăța să cotroleze datele și să aleagă cea mai bună metodă pentru a răspunde obiectivelor cercetării, păstrând în același timp reproductibilitatea cercetării. De asemenea, scriptul asigură prelucrarea datelor în formate compatibile cu cele mai importante pachete R de modelare a mișcării animalelor.

Aceaste resurse sunt realizate în cadrul proiectului [Aplicații ARGOS pentru monitorizarea în timp real a animalelor sălbatice din România](http://ccmesi.ro/?page_id=47), PN-III-P2-2.1-PED-2016-0568. Proiectul experimental demonstrativ (PED) este finanțat prin Planul National de Cercetare-Dezvoltare și Inovare III (PNCDI III) de Unitatea Executivă pentru Finanțarea Invățământului Superior, a Cercetării, Dezvoltării și Inovării (UEFISCDI).

În cazul în care întâmpinați dificultăți, nu ezitați să ne contactați.

Resursa pusă la dispoziției poate fi citată prin intermediul depozitarului Zenodo. 

[![DOI](https://zenodo.org/badge/123764206.svg)](https://zenodo.org/badge/latestdoi/123764206)
