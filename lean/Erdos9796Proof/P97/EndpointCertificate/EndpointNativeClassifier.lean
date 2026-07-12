/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.Census554.CapSelectedNativeClassifier

/-!
# Endpoint native placement checks (card-eleven extension lane)

The committed pinned-surplus classifier
(`Census554.CapSelectedNativeClassifier`) drives a finite ordered placement
search keyed off the fixed pinned row `{0, 7, 8, pinSource}` at center `1`.  The
endpoint leaf needs the same search keyed off the two endpoint escaped rows
instead:

* left family: escaped row `{7, 8, escapee, fourth}` at center `1`;
* right family: escaped row `{9, 10, escapee, fourth}` at center `2`.

This module reuses the committed search primitives verbatim
(`localCandidateOK`, `candidateRows`, `restrictDomain`, `allKilled`,
`hasPrefixCore`) and only swaps in the endpoint fixed row and the matching
variable-center domains.  No search code is forked.
-/

namespace Problem97

namespace EndpointCertificate

namespace EndpointNativeClassifier

open Census554.CapSelectedNativeClassifier

/-- The fixed left-endpoint escaped row `{7, 8, escapee, fourth}` at center `1`.
Mirrors `fixedPinnedRow` but with the escaped support (Moser apex `0` absent). -/
def fixedEndpointLeftRow (escapee fourth : Nat) : Row :=
  { center := 1
    support := 2 ^ 7 + 2 ^ 8 + 2 ^ escapee + 2 ^ fourth }

/-- The fixed right-endpoint escaped row `{9, 10, escapee, fourth}` at center
`2`, the `O1 ↔ O2` mirror. -/
def fixedEndpointRightRow (escapee fourth : Nat) : Row :=
  { center := 2
    support := 2 ^ 9 + 2 ^ 10 + 2 ^ escapee + 2 ^ fourth }

/-- Variable centers for the right family: every center except the fixed row's
center `2`.  (The left family reuses the committed `variableCenters`, which
already excludes center `1`.) -/
def variableCentersRight : List Nat := [0, 1, 3, 4, 5, 6, 7, 8, 9, 10]

/-- Right-family analog of `exactPinnedOffCircleCore`.  The committed detector
hard-codes the pinned-row center literal `1` in its two `edgesEqual` slots; the
right endpoint escaped row sits at center `2`, so this copy uses `2` there.  All
other structure is identical. -/
def exactEndpointOffCircleCoreAt2 (roots : Array Nat) (pinned : RowMask) : Bool :=
  labels.any fun onCircle =>
    has pinned onCircle && labels.any fun offCircle =>
      !has pinned offCircle && edgesEqual roots 2 onCircle 2 offCircle

/-- Right-family prefix-core detector.  Keys the off-circle detector to the
center-`2` escaped row (`find? (·.center == 2)`) and applies
`exactEndpointOffCircleCoreAt2`; the duplicate-center, perpendicular-bisector,
and convex-five-point detectors are the committed ones, unchanged. -/
def hasPrefixCoreRight (rows : List Row) : Bool :=
  let roots := normalizedRoots (equalityClosure rows)
  let pinned := rows.find? (fun row => row.center == 2)
  duplicateCenterCore roots ||
    (match pinned with
      | some row => exactEndpointOffCircleCoreAt2 roots row.support
      | none => false) ||
    perpendicularBisectorCore roots ||
    convexFivePointCore roots

/-- Right-family search driver: a copy of `allKilled` that calls
`hasPrefixCoreRight` at every node instead of `hasPrefixCore`. -/
def allKilledRight : Nat -> List Row -> List Domain -> Bool
  | 0, assigned, _ => hasPrefixCoreRight assigned
  | fuel + 1, assigned, domains =>
      if hasPrefixCoreRight assigned then
        true
      else
        match sortDomains domains with
        | [] => false
        | domain :: rest =>
            domain.rows.all fun row =>
              if compatibleWith assigned row then
                let nextAssigned := row :: assigned
                let nextDomains := rest.map (restrictDomain nextAssigned)
                if nextDomains.any fun next => next.rows.isEmpty then
                  true
                else
                  allKilledRight fuel nextAssigned nextDomains
              else
                true

/-- Left-endpoint placement check.  Exact analog of `placementCheck` with the
fixed pinned row replaced by the fixed left-endpoint escaped row. -/
def endpointLeftPlacementCheck (escapee fourth deleted : Nat) : Bool :=
  let fixed := fixedEndpointLeftRow escapee fourth
  if !localCandidateOK fixed.center deleted fixed.support then
    false
  else
    let assigned := [fixed]
    let domains := variableCenters.map fun center =>
      restrictDomain assigned { center, rows := candidateRows center deleted }
    if domains.any fun domain => domain.rows.isEmpty then
      true
    else
      allKilled variableCenters.length assigned domains

/-- Right-endpoint placement check, the `O1 ↔ O2` mirror.  Uses the right-family
search driver (`allKilledRight`, keyed to the center-`2` escaped row) and the
right variable centers, since center `1` is a variable center here and the
committed center-`1` off-circle detector would fire on rows the downstream
soundness transport cannot consume. -/
def endpointRightPlacementCheck (escapee fourth deleted : Nat) : Bool :=
  let fixed := fixedEndpointRightRow escapee fourth
  if !localCandidateOK fixed.center deleted fixed.support then
    false
  else
    let assigned := [fixed]
    let domains := variableCentersRight.map fun center =>
      restrictDomain assigned { center, rows := candidateRows center deleted }
    if domains.any fun domain => domain.rows.isEmpty then
      true
    else
      allKilledRight variableCentersRight.length assigned domains

end EndpointNativeClassifier

end EndpointCertificate

end Problem97
