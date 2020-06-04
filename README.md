Dies ist ein Template für große Dokumente.

Features:
 
-(partielles) Inhaltsverzeichnis

-Abbildungs-, Tabellen- und Literaturverzeichnis

-Index

-Glossar

-Liste der Theoreme, Liste der Codebloecke

-Kapitel und Unterkapitel in einzelne Ordner ausgelagert mit Beispielen

-Bilder, Code, Tabellen und Plots in seperaten Ordnern

-Anhang am Ende

-Abstract am Anfang

-Druckfertig
                                                                   

Anwendung: make ...

 all       : compiles main file twice
 
 force     : delete helper files, compiles, makes bibliography, 
             makes index, makes glossaries, compiles twice
             
 project   : compiles main file twice
 
 biber     : makes bibliography
 
 glossary  : makes glossaries
 
 index     : makes index
 
 clean     : deletes helper files
 
 realclean : deletes helper file and pdf

                                             
 texen im Editor nur von project.tex aus
