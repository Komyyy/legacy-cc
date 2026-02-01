import Lake
open Lake DSL

package "legacy-cc" where
  version := v!"1.0.0"
  keywords := #["math", "meta", "smt", "cc", "legacy"]
  leanOptions := #[
    ⟨`pp.unicode.fun, true⟩, -- pretty-prints `fun a ↦ b`
    ⟨`relaxedAutoImplicit, false⟩,
    ⟨`maxSynthPendingDepth, .ofNat 3⟩,
    ⟨`weak.linter.mathlibStandardSet, true⟩,
  ]
  testDriver := "LegacyCCTest"

require "leanprover-community" / "mathlib"

@[default_target]
lean_lib «LegacyCC» where
  leanOptions := #[⟨`linter.style.emptyLine, false⟩]

lean_lib LegacyCCTest where
  globs := #[.submodules `LegacyCCTest]
