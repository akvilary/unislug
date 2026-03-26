# unislug

Nim library for generating URL-safe slugs from Unicode strings with transliteration support. Analogue of python-slugify, gosimple/slug (Go), cocur/slugify (PHP).

## Project info

- Language: Nim >= 2.0.0
- License: MIT
- Author: akvilary
- Status: initial development (v0.1.0)

## Architecture

```
src/
├── unislug.nim              # public API: slugify() proc, SlugifyOptions type
└── unislug/
    └── transliterate.nim       # transliteration tables (Rune → string mappings)
tests/
    └── test_unislug.nim     # unit tests
```

- Dependencies: only Nim stdlib (unicode, tables)
- `unislug.nim` — main module, exports `slugify()` proc and `SlugifyOptions`
- `unislug/transliterate.nim` — `Table[Rune, string]` with mappings for Cyrillic, Latin diacritics, special characters

## Build & test

```bash
nimble test
```

## API design

```nim
type
  SlugifyOptions* = object
    separator*: string          # default: "-"
    lowercase*: bool            # default: true
    maxLength*: int             # 0 = no limit
    transliterate*: bool        # default: true
    customReplacements*: seq[tuple[src, dst: string]]

proc slugify*(s: string, options: SlugifyOptions = default): string
proc slugify*(s: string, separator = "-"): string
```

Algorithm:
1. Apply customReplacements
2. Iterate runes: transliterate via table, non-ASCII-alphanumeric → separator
3. Lowercase if enabled
4. Collapse repeated separators
5. Trim separators from edges
6. Truncate to maxLength (on word boundary)

## Code style

- Idiomatic Nim
- Doc-comments in English
- No external dependencies
