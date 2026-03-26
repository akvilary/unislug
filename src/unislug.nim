## URL-safe slug generation from Unicode strings with transliteration support.
##
## .. code-block:: nim
##   import unislug
##   echo slugify("Привет, мир!")  # "privet-mir"
##   echo slugify("Ärger mit Übung", separator = "_")  # "aerger_mit_uebung"

import std/[unicode, tables, strutils]
import unislug/transliterate

type
  SlugifyOptions* = object
    ## Options for slug generation.
    separator*: string          ## Separator character (default: "-")
    lowercase*: bool            ## Convert to lowercase (default: true)
    maxLength*: int             ## Maximum slug length; 0 = no limit (default: 0)
    transliterate*: bool        ## Enable transliteration (default: true)
    customReplacements*: seq[tuple[src, dst: string]] ## Custom string replacements applied before processing

proc defaultSlugifyOptions*(): SlugifyOptions =
  ## Returns default options for slugify.
  SlugifyOptions(
    separator: "-",
    lowercase: true,
    maxLength: 0,
    transliterate: true,
    customReplacements: @[],
  )

proc isAsciiAlphanumeric(r: Rune): bool =
  let c = int(r)
  (c >= ord('a') and c <= ord('z')) or
  (c >= ord('A') and c <= ord('Z')) or
  (c >= ord('0') and c <= ord('9'))

proc slugify*(s: string, options: SlugifyOptions): string =
  ## Generate a URL-safe slug from a Unicode string.
  var text = s

  # 1. Apply custom replacements
  for rep in options.customReplacements:
    text = text.replace(rep.src, rep.dst)

  # 2. Iterate runes: transliterate, keep ASCII alphanumeric, replace rest with separator
  var parts = newStringOfCap(text.len)
  var prevWasSep = true # start true to avoid leading separator

  for r in text.runes:
    if r.isAsciiAlphanumeric():
      parts.add($r)
      prevWasSep = false
    elif options.transliterate and r in transliterationTable:
      let mapped = transliterationTable[r]
      if mapped.len > 0:
        if not isAlpha(r):
          # Symbol transliteration (e.g. $ → dollar) — separate from surroundings
          if not prevWasSep:
            parts.add(options.separator)
          parts.add(mapped)
          parts.add(options.separator)
          prevWasSep = true
        else:
          # Letter transliteration (e.g. Cyrillic, diacritics) — inline
          parts.add(mapped)
          prevWasSep = false
      else:
        # Empty mapping (e.g. ъ, ь) — don't insert separator
        discard
    else:
      # Non-alphanumeric non-transliteratable → separator (collapse duplicates)
      if not prevWasSep:
        parts.add(options.separator)
        prevWasSep = true

  # 3. Lowercase
  if options.lowercase:
    parts = toLower(parts)

  # 4. Trim separator from edges
  var slug = parts
  while slug.startsWith(options.separator):
    slug = slug[options.separator.len .. ^1]
  while slug.endsWith(options.separator):
    slug = slug[0 ..< slug.len - options.separator.len]

  # 5. Truncate to maxLength on word boundary
  if options.maxLength > 0 and slug.len > options.maxLength:
    let full = slug
    slug = full[0 ..< options.maxLength]
    # Only cut on separator boundary if we truncated mid-word
    if options.maxLength < full.len and
       not full[options.maxLength .. ^1].startsWith(options.separator):
      let lastSep = slug.rfind(options.separator)
      if lastSep > 0:
        slug = slug[0 ..< lastSep]
    # Trim trailing separator
    while slug.endsWith(options.separator):
      slug = slug[0 ..< slug.len - options.separator.len]

  slug

proc slugify*(s: string, separator = "-", lowercase = true, maxLength = 0,
              transliterate = true,
              customReplacements: seq[tuple[src, dst: string]] = @[]): string =
  ## Convenience overload with keyword arguments.
  slugify(s, SlugifyOptions(
    separator: separator,
    lowercase: lowercase,
    maxLength: maxLength,
    transliterate: transliterate,
    customReplacements: customReplacements,
  ))
