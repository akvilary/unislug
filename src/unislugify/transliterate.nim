import std/[unicode, tables]

let transliterationTable* = block:
  var t = initTable[Rune, string]()

  # Cyrillic - Russian
  t[Rune(0x0410)] = "A"    # А
  t[Rune(0x0411)] = "B"    # Б
  t[Rune(0x0412)] = "V"    # В
  t[Rune(0x0413)] = "G"    # Г
  t[Rune(0x0414)] = "D"    # Д
  t[Rune(0x0415)] = "E"    # Е
  t[Rune(0x0416)] = "Zh"   # Ж
  t[Rune(0x0417)] = "Z"    # З
  t[Rune(0x0418)] = "I"    # И
  t[Rune(0x0419)] = "J"    # Й
  t[Rune(0x041A)] = "K"    # К
  t[Rune(0x041B)] = "L"    # Л
  t[Rune(0x041C)] = "M"    # М
  t[Rune(0x041D)] = "N"    # Н
  t[Rune(0x041E)] = "O"    # О
  t[Rune(0x041F)] = "P"    # П
  t[Rune(0x0420)] = "R"    # Р
  t[Rune(0x0421)] = "S"    # С
  t[Rune(0x0422)] = "T"    # Т
  t[Rune(0x0423)] = "U"    # У
  t[Rune(0x0424)] = "F"    # Ф
  t[Rune(0x0425)] = "Kh"   # Х
  t[Rune(0x0426)] = "Ts"   # Ц
  t[Rune(0x0427)] = "Ch"   # Ч
  t[Rune(0x0428)] = "Sh"   # Ш
  t[Rune(0x0429)] = "Shch" # Щ
  t[Rune(0x042A)] = ""     # Ъ
  t[Rune(0x042B)] = "Y"    # Ы
  t[Rune(0x042C)] = ""     # Ь
  t[Rune(0x042D)] = "E"    # Э
  t[Rune(0x042E)] = "Yu"   # Ю
  t[Rune(0x042F)] = "Ya"   # Я

  t[Rune(0x0430)] = "a"    # а
  t[Rune(0x0431)] = "b"    # б
  t[Rune(0x0432)] = "v"    # в
  t[Rune(0x0433)] = "g"    # г
  t[Rune(0x0434)] = "d"    # д
  t[Rune(0x0435)] = "e"    # е
  t[Rune(0x0436)] = "zh"   # ж
  t[Rune(0x0437)] = "z"    # з
  t[Rune(0x0438)] = "i"    # и
  t[Rune(0x0439)] = "j"    # й
  t[Rune(0x043A)] = "k"    # к
  t[Rune(0x043B)] = "l"    # л
  t[Rune(0x043C)] = "m"    # м
  t[Rune(0x043D)] = "n"    # н
  t[Rune(0x043E)] = "o"    # о
  t[Rune(0x043F)] = "p"    # п
  t[Rune(0x0440)] = "r"    # р
  t[Rune(0x0441)] = "s"    # с
  t[Rune(0x0442)] = "t"    # т
  t[Rune(0x0443)] = "u"    # у
  t[Rune(0x0444)] = "f"    # ф
  t[Rune(0x0445)] = "kh"   # х
  t[Rune(0x0446)] = "ts"   # ц
  t[Rune(0x0447)] = "ch"   # ч
  t[Rune(0x0448)] = "sh"   # ш
  t[Rune(0x0449)] = "shch" # щ
  t[Rune(0x044A)] = ""     # ъ
  t[Rune(0x044B)] = "y"    # ы
  t[Rune(0x044C)] = ""     # ь
  t[Rune(0x044D)] = "e"    # э
  t[Rune(0x044E)] = "yu"   # ю
  t[Rune(0x044F)] = "ya"   # я

  t[Rune(0x0401)] = "Yo"   # Ё
  t[Rune(0x0451)] = "yo"   # ё

  # Cyrillic - Ukrainian extras
  t[Rune(0x0490)] = "G"    # Ґ
  t[Rune(0x0491)] = "g"    # ґ
  t[Rune(0x0404)] = "Ye"   # Є
  t[Rune(0x0454)] = "ye"   # є
  t[Rune(0x0406)] = "I"    # І
  t[Rune(0x0456)] = "i"    # і
  t[Rune(0x0407)] = "Yi"   # Ї
  t[Rune(0x0457)] = "yi"   # ї

  # Latin diacritics
  t[Rune(0x00C0)] = "A"    # À
  t[Rune(0x00C1)] = "A"    # Á
  t[Rune(0x00C2)] = "A"    # Â
  t[Rune(0x00C3)] = "A"    # Ã
  t[Rune(0x00C4)] = "Ae"   # Ä
  t[Rune(0x00C5)] = "A"    # Å
  t[Rune(0x00C6)] = "AE"   # Æ
  t[Rune(0x00C7)] = "C"    # Ç
  t[Rune(0x00C8)] = "E"    # È
  t[Rune(0x00C9)] = "E"    # É
  t[Rune(0x00CA)] = "E"    # Ê
  t[Rune(0x00CB)] = "E"    # Ë
  t[Rune(0x00CC)] = "I"    # Ì
  t[Rune(0x00CD)] = "I"    # Í
  t[Rune(0x00CE)] = "I"    # Î
  t[Rune(0x00CF)] = "I"    # Ï
  t[Rune(0x00D0)] = "D"    # Ð
  t[Rune(0x00D1)] = "N"    # Ñ
  t[Rune(0x00D2)] = "O"    # Ò
  t[Rune(0x00D3)] = "O"    # Ó
  t[Rune(0x00D4)] = "O"    # Ô
  t[Rune(0x00D5)] = "O"    # Õ
  t[Rune(0x00D6)] = "Oe"   # Ö
  t[Rune(0x00D8)] = "O"    # Ø
  t[Rune(0x00D9)] = "U"    # Ù
  t[Rune(0x00DA)] = "U"    # Ú
  t[Rune(0x00DB)] = "U"    # Û
  t[Rune(0x00DC)] = "Ue"   # Ü
  t[Rune(0x00DD)] = "Y"    # Ý
  t[Rune(0x00DE)] = "Th"   # Þ
  t[Rune(0x00DF)] = "ss"   # ß

  t[Rune(0x00E0)] = "a"    # à
  t[Rune(0x00E1)] = "a"    # á
  t[Rune(0x00E2)] = "a"    # â
  t[Rune(0x00E3)] = "a"    # ã
  t[Rune(0x00E4)] = "ae"   # ä
  t[Rune(0x00E5)] = "a"    # å
  t[Rune(0x00E6)] = "ae"   # æ
  t[Rune(0x00E7)] = "c"    # ç
  t[Rune(0x00E8)] = "e"    # è
  t[Rune(0x00E9)] = "e"    # é
  t[Rune(0x00EA)] = "e"    # ê
  t[Rune(0x00EB)] = "e"    # ë
  t[Rune(0x00EC)] = "i"    # ì
  t[Rune(0x00ED)] = "i"    # í
  t[Rune(0x00EE)] = "i"    # î
  t[Rune(0x00EF)] = "i"    # ï
  t[Rune(0x00F0)] = "d"    # ð
  t[Rune(0x00F1)] = "n"    # ñ
  t[Rune(0x00F2)] = "o"    # ò
  t[Rune(0x00F3)] = "o"    # ó
  t[Rune(0x00F4)] = "o"    # ô
  t[Rune(0x00F5)] = "o"    # õ
  t[Rune(0x00F6)] = "oe"   # ö
  t[Rune(0x00F8)] = "o"    # ø
  t[Rune(0x00F9)] = "u"    # ù
  t[Rune(0x00FA)] = "u"    # ú
  t[Rune(0x00FB)] = "u"    # û
  t[Rune(0x00FC)] = "ue"   # ü
  t[Rune(0x00FD)] = "y"    # ý
  t[Rune(0x00FE)] = "th"   # þ
  t[Rune(0x00FF)] = "y"    # ÿ

  # Polish
  t[Rune(0x0141)] = "L"    # Ł
  t[Rune(0x0142)] = "l"    # ł
  t[Rune(0x0143)] = "N"    # Ń
  t[Rune(0x0144)] = "n"    # ń
  t[Rune(0x015A)] = "S"    # Ś
  t[Rune(0x015B)] = "s"    # ś
  t[Rune(0x0179)] = "Z"    # Ź
  t[Rune(0x017A)] = "z"    # ź
  t[Rune(0x017B)] = "Z"    # Ż
  t[Rune(0x017C)] = "z"    # ż

  # Czech/Slovak
  t[Rune(0x010C)] = "C"    # Č
  t[Rune(0x010D)] = "c"    # č
  t[Rune(0x010E)] = "D"    # Ď
  t[Rune(0x010F)] = "d"    # ď
  t[Rune(0x011A)] = "E"    # Ě
  t[Rune(0x011B)] = "e"    # ě
  t[Rune(0x0147)] = "N"    # Ň
  t[Rune(0x0148)] = "n"    # ň
  t[Rune(0x0158)] = "R"    # Ř
  t[Rune(0x0159)] = "r"    # ř
  t[Rune(0x0160)] = "S"    # Š
  t[Rune(0x0161)] = "s"    # š
  t[Rune(0x0164)] = "T"    # Ť
  t[Rune(0x0165)] = "t"    # ť
  t[Rune(0x016E)] = "U"    # Ů
  t[Rune(0x016F)] = "u"    # ů
  t[Rune(0x017D)] = "Z"    # Ž
  t[Rune(0x017E)] = "z"    # ž

  # Turkish
  t[Rune(0x011E)] = "G"    # Ğ
  t[Rune(0x011F)] = "g"    # ğ
  t[Rune(0x0130)] = "I"    # İ
  t[Rune(0x0131)] = "i"    # ı
  t[Rune(0x015E)] = "S"    # Ş
  t[Rune(0x015F)] = "s"    # ş

  # Romanian
  t[Rune(0x0102)] = "A"    # Ă
  t[Rune(0x0103)] = "a"    # ă
  t[Rune(0x0218)] = "S"    # Ș
  t[Rune(0x0219)] = "s"    # ș
  t[Rune(0x021A)] = "T"    # Ț
  t[Rune(0x021B)] = "t"    # ț

  # Hungarian
  t[Rune(0x0150)] = "O"    # Ő
  t[Rune(0x0151)] = "o"    # ő
  t[Rune(0x0170)] = "U"    # Ű
  t[Rune(0x0171)] = "u"    # ű

  # Special characters
  t[Rune(0x0026)] = "and"  # &
  t[Rune(0x0040)] = "at"   # @
  t[Rune(0x00A9)] = "c"    # ©
  t[Rune(0x00AE)] = "r"    # ®
  t[Rune(0x2122)] = "tm"   # ™
  t[Rune(0x00B0)] = "deg"  # °
  t[Rune(0x00A3)] = "lb"   # £
  t[Rune(0x20AC)] = "eur"  # €
  t[Rune(0x00A5)] = "yen"  # ¥
  t[Rune(0x0024)] = "dollar" # $

  t
