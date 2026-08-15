import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221FrozenV8PositiveCut
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221SourceOrderCoverage
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221SourceOrderTerminalBankConsumer
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221TerminalRupIngress

/-!
Generated from authenticated exact-12 terminal packet: /Users/adam/projects/math-projects/erdos-97-96-formalization/scratch/rigid221-sourceheavy-anchor/exact12-mixed-v3-terminal-bank-canary-20260808-v2/prepared
Receipt SHA-256: 91721ce408df784abf6f16f97e804bd26935fbea897ad6aca0aa4fa482feff7a
Terminal-bank manifest SHA-256: 47762d545ff1a841473ec2565b6686c5cdcf15c92ed6ee5f42005f50a36cc61a
Global record interval: 0..0

This shard materializes proof-carrying cuts only.  It is not an UNSAT,
aggregate-coverage, universal-lift, or live-theorem closure proof.
-/

namespace Problem97.ATailFrontierLiveClosure.ExactTwelveRigid221Ingress.GeneratedTerminalBankShards.Part_001

open Problem97.ATailFrontierLiveClosure.GenericRowNogoodCertificate
open Problem97.ATailFrontierLiveClosure.ExactTwelveRigid221Ingress
open Problem97.ATailFrontierLiveClosure.ExactTwelveRigid221Ingress.SourceOrderTerminalBankConsumer

abbrev Label := Fin 12

/-- Journal iteration None; certificate c247b4f7ce8a4b64b74360e1c8e4c3661d4ed107af73ad27ea7135d9c33cf409. -/
def record0 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 0, support := {1, 3, 4, 7} },
      { center := 1, support := {0, 2, 6, 8} },
      { center := 2, support := {0, 1, 10, 11} },
      { center := 3, support := {0, 1, 4, 5} },
      { center := 4, support := {0, 2, 3, 5} }
    ]
    data := {
      p := 0
      q := 1
      r := 4
      a := 2
      b := 3
      ap_aq := { first := (2, 0), steps := [.row 2 0 1], last := (2, 1) }
      ap_ar := { first := (2, 0), steps := [.row 2 0 1, .flip 2 1, .row 1 2 0, .flip 1 0, .row 0 1 4, .flip 0 4, .row 4 0 2, .flip 4 2], last := (2, 4) }
      bp_bq := { first := (3, 0), steps := [.row 3 0 1], last := (3, 1) }
      bp_br := { first := (3, 0), steps := [.row 3 0 4], last := (3, 4) } } }

def cut0 : SourceOrderPositiveNogood :=
  SourceOrderPositiveNogood.ofDuplicateCenter
    record0 (by native_decide)

def bank : List SourceOrderPositiveNogood :=
  [cut0]

end Problem97.ATailFrontierLiveClosure.ExactTwelveRigid221Ingress.GeneratedTerminalBankShards.Part_001
