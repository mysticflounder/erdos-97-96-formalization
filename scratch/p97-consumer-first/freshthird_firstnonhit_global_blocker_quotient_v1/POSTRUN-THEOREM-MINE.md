# Post-run theorem mine

Scope: only this completed wave (`freshthird_firstnonhit_global_blocker_quotient_v1`).
No solver wave, Lean build, production edit, or broad corpus search was run.

## Data examined

The source map, results, manifest, `SURVIVOR.json`, all six Z3/cvc5 readbacks,
the independent validators, and the generated QF_LIA constraints were read.
The quotient has no ambient-cardinality bound and names only the theorem-emitted
Q sources, retained pair, first/second sources, and (in the refined case) four
common off-shell sources.

The minimized `common_sameblocker` survivor has both constructor tags
`sameBlocker`, a four-element Q blocker fiber whose image is Q support, four
Q-support rows all blocked by `qCenter`, and a repeated-cap pair exiting by
same-actual-blocker collision.  Its retained pair has distinct centers,
mutual selected-row omissions, and Q overlaps `[0, 0]`.  The four common
off-shell sources are pairwise distinct, source-in-cap and off-Q, have blocker
centers distinct from `qCenter`, and selected-row Q overlaps `[0, 0, 0, 0]`.
Every named actual blocker has no fixed point.

## Candidate mine

The wave exposes these invariant/implication patterns, but each is already an
explicit source-map consumer or is too weak to be a new producer:

1. Equal actual blocker centers imply equal selected supports.  This is already
   `ATailSurvivalCover.selectedSupports_eq_of_actualBlockers_eq`.
2. A non-`qCenter` actual blocker has Q overlap at most two, while a
   `qCenter` blocker has overlap four.  This is the existing selected-row
   intersection bound plus the quotient's target negation, not a new
   cardinality-independent source theorem.
3. Q-fiber card four gives image/support equality and all four Q blockers equal
   `qCenter`; card at most three leaves a non-`qCenter` Q row.  These are the
   existing explicit-card fiber boundary declarations, and the survivor shows
   the card-four branch remains consistent with the target negation.
4. Repeated cap membership can exit through blocker collision, source-cap
   distinction, or a selected-row omission.  The survivor uses blocker
   collision; no arm forces three Q incidences at a distinct center.
5. Common-radius same-blocker gives four distinct off-Q strict-cap sources.
   Source cap membership is not blocker-center membership, so this does not
   imply any Q incidence at their distinct actual blockers.

There is therefore no concrete new cardinality-independent theorem candidate
from this wave and no bounded Lean reuse preflight is warranted. In particular,
the SAT models are discovery-quotient consistency models, not carrier or
Euclidean counterexamples and not proof producers.

## Exact missing producer

The next source-clean producer would need, under the live FirstNonHit
antecedents, an actual carrier source `s` with `H.centerAt s ≠ qCenter` and
three distinct Q-support points whose deletion is blocked/survives at that same
actual selected-row center, sufficient to establish all three points in
`selectedAt(s).support`. Relocating the retained packet, repeated-cap arms, or
the four off-shell sources without that same-center three-incidence conclusion
does not close the target.

## Validation

Existing readbacks were rechecked without invoking solvers:

```text
VALID retained z3/cvc5
VALID common z3/cvc5
VALID common_sameblocker z3/cvc5
VALID minimized semantic survivor
```

The pre-existing `SHA256SUMS` check also passed for the wave artifacts and
source hashes.  Final mine verdict: **NO NEW THEOREM; SAT obstruction only**.
