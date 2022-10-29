RimWorld-Hungarian
==================

Official Hungarian translation of RimWorld. // A Rimworld hivatalos magyar fordítása.

[Így segíthetsz a fordításban](https://ludeon.com/forums/index.php?topic=2933.msg27450#msg27450)

Translators:
---------------------
- pluhi
- mosszo
- gorrt (Malvern)
- Kanco09

Some text used from the old partial translation created by:
- Jamesgt
- SjoCi
- Moredoor
- Laoka25

Verzió: 1.4.3531 (64bit) 
Kiadva: 2022-10-28

Tools
---------------------
A tools mappában találsz egy scriptet, amit pl. Git Bash segítségével futtathatsz. Ez lehetővé teszi, hogy ne a játék saját telepített könyvtárában dolgozz a fordításon, hanem akárhol másol a gépeden. 
A .env fájlban írd át az abszolút elérési útját a telepített játékodnak (pl. /c/SteamLibrary/steamapps/common/RimWorld) és két módon is tesztelheted az elékészült csomagodat a munkapéldányodból:

```bash
./rim-trans.sh -u
```

Ez közvetlenül frissíti a játék nyelvi xml fájljait a telepített játék alatt, amivel a Fordítási fájlok tisztításához tudsz előkészülni. Ennek feltétele, hogy a tömörített magyar nyelvi fájlok ne legyenek a játék telepítési mappájában.

```bash
./rim-trans.sh -t
```

Ez elkészíti a tar állományokat a munkapéldányodból és telepíti azt a játék alá, mintha a Ludaontól érkezett volna a hivatalos módon. Ezzel a kiadásra szánt verzió működését tesztelheted.

```bash
./rim-trans.sh -h
```
Ez meg a súgó az egyéb kapcsolókhoz.



Megjegyzések:
---------------------
1. Sok helyen generált a szöveg. Az angol remek nyelv erre, a magyar nagyon nem. Próbáltam kerülni a ragozást, ahol csak lehetett. A szobrok témájának leírása sok helyen tartalmaz egymásba ágyazott változókat. Kifejezésekből és szavakból így generál a játék tagmondatokat, ezekből mondatokat. A végeredmény angolul csak tartalmilag vicces, magyarul sokszor formailag is.

2. Sok helyen a helyesírás és a fordítás minőségének kárára kellett módosítanom a tartalmat, főleg helyhiány miatt.

3. Hibákat és egyebeket küldjétek ide: tothmarci.03@gmail.com
4. Az 1.0 óta a magyarítások kissé el vannak maradva a frissítésektől, de elkezdtem dolgozni a hiányzó DLC-k és az alap játék újrafordításán, illetve beemeltem egy "gorrt" által készített fordítást is, amit csinosítgatok majd még. Remélem a Biotech DLC előtt sikerül eleget haladni a dologgal, addig mindenkinek a türelmét/segítségét kérem.

Jó szórakozást!

pluhi & Kanco09