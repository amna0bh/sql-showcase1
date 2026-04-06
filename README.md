security log analysis moj SQL Projekt

SQL projekt u kojem analiziram sumnjive pokušaje logina koristeći upite na bazi podataka.

## O projektu
Napravila sam ovo da vježbam SQL kroz realan scenarij a to je analiziranje login pokušaja kako bih otkrila moguće prijetnje kao što su brute force napadi, pokušaji hakiranja više naloga i prijave iz sumnjivih lokacija.

## Struktura baze podataka
Projekt koristi bazu podataka `security_log_analysis` koja ima sljedeće tabele:
- `users` — čuva korisničke naloge i usernamove
- `login_attempts` — bilježi svaki pokušaj prijave (uspio ili nije), IP adresu, državu i vrijeme
- `devices` — čuva informacije o uređajima koji su korišteni pri prijavi

## Šta rade upiti
- **Neuspjeli login pokušaji** — pronalazi naloge sa najviše neuspjelih prijava
- **Sumnjive IP adrese** — lista nepoznatih IP adresa koje su više puta pokušale login
- **Prijave po državama** — označava prijave iz rizičnih država kao što su Rusija i Kina
- **Analiza uređaja** — provjerava koje vrste uređaja napadači koriste
- **Otkrivanje brute force napada** — pronalazi naloge sa 2 ili više neuspjelih pokušaja
- **Prijave iz više država** — otkriva korisnike koji su se logovali iz više od jedne države
- **Otkrivanje credential stuffing napada** — pronalazi IP adrese koje ciljaju više različitih naloga

## Kako pokrenuti
1. Importaj šemu baze i podatke u MySQL ili PostgreSQL
2. Otvori SQL klijent (MySQL Workbench, DBeaver ili slično)
3. Pokreni upite iz fajla `queries.sql`

## Šta sam naučila!!!
- Pisanje JOIN upita između više povezanih tabela
- Korištenje GROUP BY, HAVING i ORDER BY za filtriranje i grupisanje podataka
- Otkrivanje sigurnosnih prijetnji kroz analizu podataka
- Strukturiranje baze podataka za sigurnosne logove
