﻿# RimWorld-Hungarian

Official Hungarian translation of RimWorld. // A Rimworld hivatalos magyar fordítása.

[Így segíthetsz a fordításban](https://ludeon.com/forums/index.php?topic=2933.msg27450#msg27450)

## Translators:
- pluhi
- mosszo
- Malvern (gorrt)
- Kanco09

Some text used from the old partial translation created by:
- Jamesgt
- SjoCi
- Moredoor
- Laoka25

Verzió: 1.5.4243 (64bit) 
Kiadva: 2024-10-09

## Tools
A tools mappában találsz egy scriptet, amit pl. Git Bash segítségével futtathatsz. 
Ez lehetővé teszi, hogy ne a játék saját telepített könyvtárában dolgozz a fordításon, hanem akárhol másol a gépeden. 
A .env fájlban írd át az abszolút elérési útját a telepített játékodnak (pl. /c/SteamLibrary/steamapps/common/RimWorld) 
és két módon is tesztelheted az elékészült csomagodat a munkapéldányodból.

Az alábbi közvetlenül frissíti a játék nyelvi xml fájljait a telepített játék alatt, 
amivel a "Fordítási fájlok tisztításához" tudsz előkészülni. 
Ennek feltétele, hogy a tömörített magyar nyelvi fájlok ne legyenek a játék telepítési mappájában.
(a script megcsinálja)

```bash
./rim-trans.sh -u
```

Az alábbi elkészíti a tar állományokat a munkapéldányodból és telepíti azt a játék alá, 
mintha a Ludeontól érkezett volna a hivatalos módon. 
Ezzel a kiadásra szánt verzió működését tesztelheted.
(a kicsomagolt könyvtárakat törli a játék alól)

```bash
./rim-trans.sh -t
```

Az alábbi kapcsolóval a fordítási tisztázásra készülhetsz fel. 
Törli az eddigi nyelvi könyvtárakat, majd a frissen kapott tar fájlokat kicsomagolja a helyükre.
Ez után futtathatod a "Fordítási fájlok tisztázása" funkciót, ami elvégzi a módosításokat a nyelvi fájlokon. 

```bash
./rim-trans.sh -e
```

Az alábbi kapcsolóval a fordítási tisztázás után tudod visszamásolni a munkapéldányodba a megváltozott fájlokat.

```bash
./rim-trans.sh --sync
```

Az alábbi kapcsolóval a súgót érheted el.

```bash
./rim-trans.sh -h
```

## Megjegyzések:
1. Sok helyen generált a szöveg. Az angol remek nyelv erre, a magyar nagyon nem. Próbáltam kerülni a ragozást, ahol csak lehetett. A szobrok témájának leírása sok helyen tartalmaz egymásba ágyazott változókat. Kifejezésekből és szavakból így generál a játék tagmondatokat, ezekből mondatokat. A végeredmény angolul csak tartalmilag vicces, magyarul sokszor formailag is.

2. Sok helyen a helyesírás és a fordítás minőségének kárára kellett módosítanom a tartalmat, főleg helyhiány miatt.

Jó szórakozást!

pluhi & Kanco09