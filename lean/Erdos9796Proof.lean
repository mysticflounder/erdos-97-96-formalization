import Erdos9796Proof.P97.UpstreamBridge
import Erdos9796Proof.P96.UpstreamBridge

/-!
# Erdős Problems 97 & 96 — proof-library root (public extract)

This root imports the two upstream-vocabulary bridge theorems
(`Problem97.erdos97_rhs` and `Problem96.erdos96_rhs`).  Everything the
two published claims depend on is transitively imported from here, so the
build checks the entire proof down to the single remaining `sorry`
(`Problem97.RemovableVertexOfLarge`).
-/
