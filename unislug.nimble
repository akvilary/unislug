# Package
version       = "0.1.0"
author        = "akvilary"
description   = "URL-safe slug generation from Unicode strings with transliteration"
license       = "MIT"
srcDir        = "src"

# Dependencies
requires "nim >= 2.0.0"

task test, "Run tests":
  exec "nim c -r tests/test_unislug.nim"
