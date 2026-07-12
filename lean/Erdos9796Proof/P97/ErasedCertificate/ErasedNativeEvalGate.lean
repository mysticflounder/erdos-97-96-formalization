/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.Census554.CapSelectedNativeClassifier

/-!
# ERASE card-11 native classifier — M1 eval gate

Milestone M1 of `scratch/erase-classifier-design/DESIGN.md` (§2.1, §6): the
parametric-seed generalization of the committed cap-selected/endpoint native
DFS, plus an `#eval` driver over the full ERASE card-11 seed domain
(DESIGN §1.2: P2 seeds at centers `{7,8,9,10}`, P4-S at `{3,4,5,6}`, P4-U at
`0`; 1203 seed placements, 4680 `(c₀, support, deleted)` searches).

This module is an **eval gate only**: it proves nothing and is imported by
nothing.  Any `false` cell is the R2 STOP condition (route to cut research,
not to code fixes).  An `#eval` run licenses no theorem claim; the
`native_decide` placement shards (M3) and the soundness transport (M4+) are
the only artifacts with proof value.

The search primitives (`localCandidateOK`, `candidateRows`, `compatibleWith`,
`restrictDomain`, `sortDomains`, equality closure, and the
duplicate-center / perpendicular-bisector / convex-five-point detector cores)
are the committed `Census554.CapSelectedNativeClassifier` code, reused
verbatim.  Only the seed-center-dependent pieces are forked, **once,
parametrically in `c₀`** (design risk R4): the committed `hasPrefixCore`
hard-codes the seed-row center literal `1` (and the endpoint copy `2`) in the
exact off-circle detector and in its `find?` key, so it must never be reused
when `1 ∈ variableCentersAt c₀`.  At `c₀ = 1` the parametric definitions below
agree definitionally with the committed `placementCheck` shape, and at
`c₀ = 2` with the committed `endpointRightPlacementCheck` shape.

No `unsafe`, no `@[implemented_by]`, no `@[extern]` anywhere in the evaluated
code (native_decide policy, applied early).
-/

namespace Problem97

namespace ErasedCertificate

namespace ErasedNativeEvalGate

open Census554.CapSelectedNativeClassifier

/-! ## §2.1 parametric definitions -/

/-- The ten variable centers of a seed placement at center `c₀`: every label
except `c₀`, in ascending order.  At `c₀ = 1` this is the committed
`variableCenters`; at `c₀ = 2` the committed `variableCentersRight`. -/
def variableCentersAt (c₀ : Nat) : List Nat :=
  labels.filter fun center => center != c₀

/-- Parametric exact off-circle detector: the committed
`exactPinnedOffCircleCore` with the seed-row center literal `1` replaced by
`c₀` in the two `edgesEqual` slots (the committed endpoint copy
`exactEndpointOffCircleCoreAt2` is this definition at `c₀ = 2`).  Fires iff
some point on the seed circle at `c₀` is forced equidistant with a point off
it. -/
def exactSeedOffCircleCoreAt (c₀ : Nat) (roots : Array Nat)
    (pinned : RowMask) : Bool :=
  labels.any fun onCircle =>
    has pinned onCircle && labels.any fun offCircle =>
      !has pinned offCircle && edgesEqual roots c₀ onCircle c₀ offCircle

/-- Parametric prefix-core detector: keys the off-circle detector to the seed
row (`find? (·.center == c₀)`) and applies `exactSeedOffCircleCoreAt c₀`; the
duplicate-center, perpendicular-bisector, and convex-five-point detectors are
the committed ones, unchanged. -/
def hasPrefixCoreAt (c₀ : Nat) (rows : List Row) : Bool :=
  let roots := normalizedRoots (equalityClosure rows)
  let pinned := rows.find? (fun row => row.center == c₀)
  duplicateCenterCore roots ||
    (match pinned with
      | some row => exactSeedOffCircleCoreAt c₀ roots row.support
      | none => false) ||
    perpendicularBisectorCore roots ||
    convexFivePointCore roots

/-- Parametric search driver: the committed `allKilled` with
`hasPrefixCoreAt c₀` at every node instead of the center-1-keyed
`hasPrefixCore`. -/
def allKilledAt (c₀ : Nat) : Nat → List Row → List Domain → Bool
  | 0, assigned, _ => hasPrefixCoreAt c₀ assigned
  | fuel + 1, assigned, domains =>
      if hasPrefixCoreAt c₀ assigned then
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
                  allKilledAt c₀ fuel nextAssigned nextDomains
              else
                true

/-- Parametric placement check: the committed `placementCheck` shape with the
fixed seed row `⟨c₀, support⟩`.  Gates on `localCandidateOK c₀ deleted
support`, builds the restricted domains over the ten variable centers, then
runs the parametric search. -/
def erasedPlacementCheckAt (c₀ support deleted : Nat) : Bool :=
  let fixed : Row := { center := c₀, support := support }
  if !localCandidateOK fixed.center deleted fixed.support then
    false
  else
    let assigned := [fixed]
    let domains := (variableCentersAt c₀).map fun center =>
      restrictDomain assigned { center, rows := candidateRows center deleted }
    if domains.any fun domain => domain.rows.isEmpty then
      true
    else
      allKilledAt c₀ (variableCentersAt c₀).length assigned domains

/-! ## M1 seed domain (DESIGN §1.2 superset)

One cell per `(family, c₀, support, deleted)`.  The domain is the pin-typed
superset: no per-row signature dispatch, `deleted` ranging over the full
`intS` pivot alphabet, so every landed row of
`RemovableVertexAxiom/ErasedPinRowResiduals.lean` (all twenty have their
surplus-interior bucket ≥ 1) and both P4 holes are covered. -/

/-- Surplus-cap interior labels (`intS` of the census `Fin 11` vocabulary). -/
def intS : List Nat := [3, 4, 5, 6]

/-- All 4-point masks over the eleven labels. -/
def fourPointMasks : List Nat :=
  (List.range 2048).filter fun s => countPoints s labels == 4

/-- One eval-gate cell: a seed placement plus a deleted-pivot choice. -/
structure Cell where
  family : String
  c₀ : Nat
  support : RowMask
  deleted : Nat
deriving Repr

/-- P4-U cells: seed center `0` (surplus-opposite apex).  The mask conditions
of `localCandidateOK 0 deleted s` are 4-count, `0 ∉ s`, `moserOneHitOK 0`,
and `deleted ∈ s`; the deleted pivot additionally lives in `intS`, so
`deleted` ranges over `s ∩ intS` (every qualifying mask has ≥ 2 `intS`
members).  184 cells over 79 seed supports. -/
def p4uCells : List Cell :=
  fourPointMasks.flatMap fun s =>
    if !has s 0 && moserOneHitOK 0 s then
      (intS.filter fun d => has s d).map fun d =>
        { family := "P4U", c₀ := 0, support := s, deleted := d }
    else
      []

/-- P4-S cells: seed centers `intS = {3,4,5,6}` (surplus interior), supports
passing `localCandidateOK` with a surplus-interior member distinct from the
center (the pin `x`), deleted over the full `intS` pivot alphabet.  (The
`deleted` argument of `localCandidateOK` is inert at centers ≠ 0, so the
enumeration gate may use any value; each cell's actual `deleted` is re-gated
inside `erasedPlacementCheckAt`.)  4 × 90 × 4 = 1440 cells. -/
def p4sCells : List Cell :=
  intS.flatMap fun c₀ =>
    fourPointMasks.flatMap fun s =>
      if localCandidateOK c₀ 3 s && (intS.any fun q => q != c₀ && has s q) then
        intS.map fun d =>
          { family := "P4S", c₀ := c₀, support := s, deleted := d }
      else
        []

/-- P2 cells: seed centers `intO1 ∪ intO2 = {7,8,9,10}` (the non-surplus
opposite-cap interiors of the landed left/right row residuals), supports
passing `localCandidateOK` with a surplus-interior member (the pin `x`),
deleted over the full `intS` pivot alphabet.  4 × 191 × 4 = 3056 cells. -/
def p2Cells : List Cell :=
  [7, 8, 9, 10].flatMap fun c₀ =>
    fourPointMasks.flatMap fun s =>
      if localCandidateOK c₀ 3 s && (intS.any fun q => has s q) then
        intS.map fun d =>
          { family := "P2", c₀ := c₀, support := s, deleted := d }
      else
        []

/-- The full M1 domain: 4680 cells. -/
def allCells : List Cell := p4uCells ++ p4sCells ++ p2Cells

/-- A cell passes iff its parametric placement search is killed. -/
def checkCell (cell : Cell) : Bool :=
  erasedPlacementCheckAt cell.c₀ cell.support cell.deleted

/-! ## Smoke checks (domain sizes and the committed-literal parity point)

Timing note: the value under test is forced *inside* the measured window by
printing it there (a plain `let` gets inlined past the clock reads by the
compiler). -/

/-- Run one cell with the verdict forced inside the timing window. -/
def timeCell (cell : Cell) : IO Unit := do
  let t0 ← IO.monoMsNow
  IO.println
    s!"{cell.family} c0={cell.c₀} mask={cell.support} \
      support={supportPoints cell.support} deleted={cell.deleted}: \
      {checkCell cell}"
  let t1 ← IO.monoMsNow
  IO.println s!"    ({t1 - t0} ms)"

-- Expected: `(184, 1440, 3056, 4680)` (prestage-verified domain sizes).
#eval (p4uCells.length, p4sCells.length, p2Cells.length, allCells.length)

set_option maxHeartbeats 0 in
-- Parity of the parametric fork at the committed literal `c₀ = 1`: the
-- committed `placementCheck 6 4` (the kernel-checked `placementCheck_p6_d4`
-- search) against `erasedPlacementCheckAt 1` on the same fixed row
-- `{0,7,8,6}` (mask `449`).  Both must print `true`.
#eval show IO Unit from do
  let t0 ← IO.monoMsNow
  IO.println s!"committed  placementCheck 6 4             = {placementCheck 6 4}"
  let t1 ← IO.monoMsNow
  IO.println s!"    ({t1 - t0} ms)"
  IO.println s!"parametric erasedPlacementCheckAt 1 449 4 = {erasedPlacementCheckAt 1 449 4}"
  let t2 ← IO.monoMsNow
  IO.println s!"    ({t2 - t1} ms)"

/-! ## The M1 gate driver

Evaluates every cell of the domain across the runtime task pool (the search
is pure; cells are independent).  Any `false` cell is printed with its full
signature and flips the verdict to STOP. -/

/-- Split a list into chunks of `n` (the last may be shorter). -/
def chunksOf (n : Nat) (xs : List α) : List (List α) :=
  (List.range ((xs.length + n - 1) / n)).map fun i => (xs.drop (i * n)).take n

/-- Render a cell's full signature (for failure reports). -/
def cellSig (cell : Cell) : String :=
  s!"{cell.family} c0={cell.c₀} mask={cell.support} \
    support={supportPoints cell.support} deleted={cell.deleted}"

/-- Run the full gate: spawn one task per chunk of cells, collect the failing
cells, report per-family tallies and the final verdict.

If the environment variable `ERASE_M1_PROGRESS_FILE` is set, per-chunk
progress and any failing-cell signatures are additionally appended (and
flushed) to that file as they arrive, so a killed run still leaves its
evidence; when unset no file is written. -/
def runGate (chunkSize : Nat) : IO Unit := do
  let progress? ← (← IO.getEnv "ERASE_M1_PROGRESS_FILE").mapM fun path =>
    IO.FS.Handle.mk path .write
  let log := fun (line : String) => do
    if let some h := progress? then
      h.putStrLn line
      h.flush
  let say := fun (line : String) => do
    IO.println line
    log line
  let cells := allCells
  say s!"ERASE M1 domain: P4U={p4uCells.length} P4S={p4sCells.length} \
      P2={p2Cells.length} total={cells.length}"
  let chunks := chunksOf chunkSize cells
  let t0 ← IO.monoMsNow
  let tasks := chunks.map fun chunk =>
    Task.spawn fun _ => chunk.filter fun cell => !checkCell cell
  let mut failures : Array Cell := #[]
  let mut done := 0
  let mut idx := 0
  for (chunk, task) in chunks.zip tasks do
    let bad := task.get
    done := done + chunk.length
    failures := failures ++ bad.toArray
    idx := idx + 1
    for cell in bad do
      log s!"FALSE {cellSig cell}"
    if idx % 10 == 0 || idx == chunks.length then
      let t ← IO.monoMsNow
      log s!"[gate] chunk {idx}/{chunks.length}: {done}/{cells.length} cells, \
          {failures.size} false, {t - t0} ms"
  let t1 ← IO.monoMsNow
  say s!"evaluated {done} cells in {t1 - t0} ms"
  for fam in ["P4U", "P4S", "P2"] do
    let famTotal := cells.countP (·.family == fam)
    let famBad := failures.filter (·.family == fam)
    say s!"  {fam}: {famTotal - famBad.size}/{famTotal} true"
  if failures.isEmpty then
    say s!"ERASE M1 EVAL GATE: PASS — all {cells.length} cells true"
  else
    say s!"ERASE M1 EVAL GATE: STOP — {failures.size} false cell(s):"
    for cell in failures.toList do
      say s!"  FALSE {cellSig cell}"

set_option maxHeartbeats 0 in
#eval runGate 10

end ErasedNativeEvalGate

end ErasedCertificate

end Problem97
