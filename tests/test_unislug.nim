import unittest
import unislug

suite "slugify":

  test "basic ASCII":
    check slugify("Hello World") == "hello-world"

  test "already a slug":
    check slugify("hello-world") == "hello-world"

  test "multiple spaces and punctuation":
    check slugify("  Hello,  World!  ") == "hello-world"

  test "numbers preserved":
    check slugify("Version 2.0 Release") == "version-2-0-release"

  test "empty string":
    check slugify("") == ""

  test "only special chars":
    check slugify("!@#%^*()") == "at"

  test "Cyrillic Russian":
    check slugify("Привет, мир!") == "privet-mir"

  test "Cyrillic with hard/soft signs":
    check slugify("Объявление") == "obyavlenie"
    check slugify("Большой") == "bolshoj"

  test "Cyrillic Ukrainian":
    check slugify("Київ") == "kiyiv"

  test "Latin diacritics French":
    check slugify("Crème brûlée") == "creme-brulee"

  test "Latin diacritics German":
    check slugify("Ärger mit Übung") == "aerger-mit-uebung"

  test "Latin diacritics Spanish":
    check slugify("Año nuevo") == "ano-nuevo"

  test "Polish":
    check slugify("Łódź") == "lodz"

  test "Czech":
    check slugify("Příliš žluťoučký") == "prilis-zlutoucky"

  test "mixed scripts":
    check slugify("Hello Мир world") == "hello-mir-world"

  test "custom separator":
    check slugify("Hello World", separator = "_") == "hello_world"

  test "no lowercase":
    check slugify("Hello World", lowercase = false) == "Hello-World"

  test "maxLength basic":
    check slugify("one two three four five", maxLength = 13) == "one-two-three"

  test "maxLength cuts on separator":
    let result = slugify("hello beautiful world", maxLength = 16)
    check result == "hello-beautiful"

  test "maxLength shorter than first word":
    check slugify("hello world", maxLength = 3) == "hel"

  test "transliterate disabled":
    check slugify("Привет мир", transliterate = false) == ""

  test "custom replacements":
    check slugify("Hello & World", customReplacements = @[("&", "and")]) == "hello-and-world"

  test "custom replacements before transliteration":
    check slugify("C++", customReplacements = @[("++", "pp")]) == "cpp"

  test "special characters":
    check slugify("price is 5$") == "price-is-5-dollar"
    check slugify("100€") == "100-eur"

  test "consecutive separators collapsed":
    check slugify("a---b") == "a-b"

  test "unicode whitespace":
    # non-breaking space U+00A0
    check slugify("hello\xC2\xA0world") == "hello-world"

  test "Ё/ё transliteration":
    check slugify("Ёжик в тумане") == "yozhik-v-tumane"

  test "long Cyrillic phrase":
    check slugify("Съешь ещё этих мягких французских булок") ==
      "sesh-eshchyo-etikh-myagkikh-frantsuzskikh-bulok"
