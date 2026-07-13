/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ErasedCertificate.ErasedNativeClassifier

/-!
# ERASE card-11 native classifier — M1 eval gate

Milestone M1 of `scratch/erase-classifier-design/DESIGN.md` (§2.1, §6): the
parametric-seed generalization of the committed cap-selected/endpoint native
DFS, plus a compiled executable driver over the full ERASE card-11 seed domain
(DESIGN §1.2: P2 seeds at centers `{7,8,9,10}`, P4-S at `{3,4,5,6}`, P4-U at
`0`; the containment-specialized P4-U arm fixes rows `1` and `2`).

This module is an **eval gate only**: it proves nothing and is imported by
nothing.  Any `false` cell is the R2 STOP condition (route to cut research,
not to code fixes).  An eval-gate run licenses no theorem claim; the
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
when `1 ∈ variableCentersAt c₀`.  At `c₀ = 1` the imported parametric definitions
agree definitionally with the committed `placementCheck` shape, and at
`c₀ = 2` with the committed `endpointRightPlacementCheck` shape.

No `unsafe`, no `@[implemented_by]`, no `@[extern]` occurs in the evaluated
code (native_decide policy, applied early).

The complete compiled M1 run on 2026-07-12 passed all 4,543 cells in 845,205
ms: P4-U 47/47, P4-S 1,440/1,440, and P2 3,056/3,056.  This is empirical gate
evidence; proof value comes from the separate placement certificates.
-/

namespace Problem97

namespace ErasedCertificate

namespace ErasedNativeEvalGate

open Census554.CapSelectedNativeClassifier
open ErasedNativeClassifier

/-! ## M1 seed domain (DESIGN §1.2 superset)

One cell per `(family, c₀, support, deleted)` for P2/P4-S, with the
definitionally irrelevant P4-U deleted choice folded to one representative.
The domain is the pin-typed superset: no per-row signature dispatch, so every landed row of
`RemovableVertexAxiom/ErasedPinRowResiduals.lean` (all twenty have their
surplus-interior bucket ≥ 1) and both P4 holes are covered. -/

/-- Surplus-cap interior labels (`intS` of the census `Fin 11` vocabulary). -/
def intS : List Nat := intSNats

/-- All 4-point masks over the eleven labels. -/
def fourPointMasks : List Nat :=
  ErasedNativeClassifier.fourPointMasks

/-- One eval-gate cell: a seed placement plus a deleted-pivot choice. -/
structure Cell where
  family : String
  c₀ : Nat
  support : RowMask
  deleted : Nat
deriving Repr

/-- P4-U cells: seed center `0` (surplus-opposite apex).  The mask conditions
of `localCandidateOK 0 deleted s` are 4-count, `0 ∉ s`, `moserOneHitOK 0`,
and `deleted ∈ s`.  Containment additionally forces Moser-pair closure
(`1 ∈ s ↔ 2 ∈ s`), leaving 47 supports.  Because row `0` is fixed and
all remaining variable centers are nonzero, the DFS is independent of which
member of `s ∩ intS` is named `deleted`; one representative is sufficient. -/
def p4uCells : List Cell :=
  p4uSupports.flatMap fun s =>
    match intS.find? fun d => has s d with
    | some d => [{ family := "P4U", c₀ := 0, support := s, deleted := d }]
    | none => []

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

/-- The full M1 domain, interleaved by family so a hard prefix in
one family cannot monopolize the runtime task pool or hide early failures in
the other families. -/
def allCells : List Cell :=
  (List.range p2Cells.length).flatMap fun i =>
    [p4uCells[i]?, p4sCells[i]?, p2Cells[i]?].filterMap id

/-- A cell passes iff its parametric placement search is killed. -/
def checkCell (cell : Cell) : Bool :=
  if cell.family == "P4U" then
    erasedP4UPlacementCheck cell.support cell.deleted
  else
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
  let family? ← IO.getEnv "ERASE_M1_FAMILY"
  let log := fun (line : String) => do
    if let some h := progress? then
      h.putStrLn line
      h.flush
  let say := fun (line : String) => do
    IO.println line
    log line
  let cells := match family? with
    | some family => allCells.filter fun cell => cell.family == family
    | none => allCells
  say s!"ERASE M1 domain: P4U={p4uCells.length} P4S={p4sCells.length} \
      P2={p2Cells.length} active={cells.length}"
  let chunks := chunksOf chunkSize cells
  let t0 ← IO.monoMsNow
  let tasks := chunks.map fun chunk =>
    Task.spawn fun _ =>
      let bad := chunk.filter fun cell => !checkCell cell
      let signature := match chunk with
        | [cell] => cellSig cell
        | _ => s!"{chunk.length} cells"
      dbgTrace s!"[gate-worker] completed {signature}; {bad.length} false"
        (fun _ => bad)
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

end ErasedNativeEvalGate

end ErasedCertificate

end Problem97

/-- Compiled entry point for the M1 gate.  Built as the `erase_m1_gate`
`lean_exe`, its search primitives run as native code (the `#eval` interpreter
path is ~1-2 orders of magnitude slower and is not used).  `runGate 1` traces
every cell on completion (per-worker `dbgTrace`), so progress is visible and no
single hard cell can hide behind another. -/
def main : IO Unit :=
  Problem97.ErasedCertificate.ErasedNativeEvalGate.runGate 1
