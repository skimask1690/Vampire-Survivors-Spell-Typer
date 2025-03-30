; Vampire Survivors Spell Typer
; Author: skimask1690
; An AutoIt script that automates the input of all Vampire Survivors spells/cheat codes.

Global $Paused
HotKeySet("{PAUSE}", "TogglePause")
HotKeySet("{ESC}", "Terminate")

Func TogglePause()
    $Paused = NOT $Paused
    While $Paused
        sleep(100)
        ToolTip('Press the Pause/Break key to toggle the script, or ESC to exit.',0,0)
    WEnd
EndFunc

Func Terminate()
    Exit 0
EndFunc

; Define the list of spells
Global $spells[] = [ _
    "noneladonna", "vivaladonna", "superladonna", "strongestcharacter", "faschiuma", "bioparco", "accidenti", _
    "crystalmakeup", "flymetothemoon", "thetwoassassins", "feldschlacht", "ifeellovevenus", "yattapanda", "carramba", _
    "reset", "languorino", "waitreaction", "quandolodicelui", "paradigmshift", "x-x1viiq", "exdashexoneviiq", "tramezzini", _
    "maybeimastallion", "igottagettotheedgeofsoul", "fettinepanate", "kalvasflam", "foldinthecheese", "iwillneverletyouforgetaboutme", _
    "lhovistoio", "pinociampino", "earrivatolarrotino", "rightninetyseven", "highfive", "secondevolution", "ablasphemousmockery", _
    "allatonce", "rescuefromtheshadows", "notsureitsthunder", "cygnusmagnus", "bimbumbam", "thegoodguy", "shesawit", _
    "blunderingfool", "whydithavetobebats", "shounenheroine", "youngatheart", "itsnotaneclipse", "vogue", "ionicoionico", "elamadonna", _
    "takeashower", "chevolano", "spellsomething", "spellwhatever", "spellwhichever", "animeismypassion", "oopsistoleoneagain", _
    "deusexmachina", "basicwitch", "theworldeater", "happybirthday", "souloftheparty", "redissus", "isaworangevent", _
    "foundyellowinmedical", "greenisredyouisme", "foundblueinstorage", "youaretheimpostor", "sciencepink", "haaayimpasta", "selfreport", _
    "runandrizer", "beanmachinegun", "alwaysarmednevershaved", "metallicbakedgoods", "amitheoriginal", "rdooeight", "battlefieldflower", _
    "morethanamechsuit", "protectorofgaluga", "badbetrayerbahamut", "chiefsalamander", "honouringmasato", "hardcorpshighspeed", _
    "lamentedgenesis", "legendmother", "wallchickenenjoyer", "firsttodoittwice", "peterdante", "fatefulfusion", "doesnthaveuno", _
    "omniavanitas", "actuallyquitenice", "nonplayercharacter", "beefbbq", "morissson", "stellarfan", "silverbullet", "technicallynotavampire", _
    "notinthisgame", "notachild", "bluecipher", "botheredbybrother", "polygonalbelnades", "notasuccubus", "alchemistslament", "enshrinedheart", _
    "thelizardqueen", "adrianfahrenheit", "upstartweakling", "lecardigan", "guiltydevil", "deckbrush", "bondedsoul", "nofreebies", _
    "holyglasses", "morningsun", "bigbrother", "mourned", "vladsbiggestfan", "timeorratherfate", "cardsharp", "emeryboard", _
    "pitiablemadman", "yourfaultforbeingsomean", "friendlevania", "forgemasterfriends", "azurecroissant", "hehhehheh", "rockingchair", _
    "whatwouldyouspenditon", "nospoilers", "jonathancharlotte", "etteolrahcnahtanoj", "twinnado", "cooltwin", "everyonesacritic", "prodigalson", _
    "aguniinagony", "menacinghaircut", "withlight", "umbraleclipse", "cantholdthemall", "itsallhisfault", "weepingmask", "dontdisturbdinner", _
    "chupacabra", "finalboss", "missaxalotl", "coldshoulder", "thatsnotlisa", "cauldronking", "gothangel", "bizarreshadeadventure", "karasuman", _
    "sewardzead", "sizematters", "petrifyinglyevil", "theothercount", "embracethereaper", "mathiascronqvist", "iiiiiiivvviviiviiiixxxixiixiiixivxvxvixviixviiixixxxxxi", _
    "entityofchaos", "horsedoor", "headsortails", "walkintothemirror", "kingoftheflies", "pieceoftime", "beastlybowels", "disobeyalucard", "readerspartita", _
    "isthiswhatamanis", "becomeanvampiyre", "candlebane", "kitchensink", "belnadesbookworm", "spellsthatstartwiths", "blackrockscroll", "greatuseoftime", _
    "draculasdungeon", "relaxenjoylife", "honesty", "dotgogreenacres", "rottingpizza", "peakgamedesign", "recycletheforest", "recyclethelibrary", _
    "recyclethetower", "buriedinthesnow", "jumptheshark", "divineassault", "thenextstopis", "apritisedano", _
    "thisshouldhavebeenunlockedbydefault", "thistooshouldhavebeenunlockedbydefault", "leadmetothecheese", "thankelrond", "timecompression", "eggseggseggs", _
    "teleportustomars", "ihaveseenitihaveseenitihaveseenitihaveseenitihaveseenitihaveseenitihaveseenit", "icanhearthecriesofcaptainplanet", "freezearrow", "dootdoot", _
    "tolovetoshine", "gottagofast", "coldwaterhotwater", "chapatribe", "tengillesbalm", "duraistruth", "haeralisploy", "lugrianstale", "randomazzami", _
    "darkassami", "ilmatto", "ilbagatto", "lapapessa", "limperatrice", "limperatore", "ilpapa", "randomazzami", "ilcarro", "laforza", "leremita", _
    "laruota", "lagiustizia", "lappeso", "lamorte", "latemperanza", "ildiavolo", "latorre", "lastella", "laluna", "ilsole", "ilgiudizio", "ilmondo", _
    "ottagabli", "darkassami", "atoural", "oseppal", "odnomli", "unblindimelda", "retirepoe", "starpupil", "everywhere", "everything", "spinnn"]

    ; spells that begin a stage (type these manually)
    ;"forbiddenbox", "spoopyseason", "popthecorn", "iwanttoseeitagain", "kamiki", "onjupiter", "andmars"

While 1
    TogglePause()
	
    ; Loop through the spells and type them
    For $i = 0 To UBound($spells) - 1

        ToolTip('Press the Pause/Break key to toggle the script, or ESC to exit.',0,0)
	
        For $j = 1 To StringLen($spells[$i])
            Send(StringMid($spells[$i], $j, 1))
    		Sleep(1)
        Next
	
    Next
WEnd
