# G3 clause-family proof audit

Audit target: `G3ClauseFamilySemantics.lean`, current 640-line snapshot.
This is a read-only static audit.  Full-file diagnostics were unavailable
because Lean reports that imported oleans are out of date and must be rebuilt;
no rebuild was started while the main-owned file was changing.

## Elaboration and semantic findings

- The earlier `one_le_xVar center.isLt hindex` arity error has been fixed:
  `localEqHolds_of_selectedRow` now uses
  `one_le_xVar center.val candidateIndex`, matching the live source signature.
- `evalClauseD_of_positive_mem` and `evalClauseD_three_to_one` were separately
  elaborated against the stable `Census554.SinzSat` import.  No type error was
  found in either helper.  The latter's docstring should say “three Boolean
  premises” (the produced DIMACS clause has four literals).
- `localFourForwardClause_sat` is the minimal generic forward proof: after
  decoding the helper row, equality row, anchor, and support membership,
  `localFourHolds` gives the required local equality directly.
- `localFourReverseClause_sat` is the minimal generic reverse proof: exact
  decoding of the four-element support and its three anchor-equality rows
  proves `localFourHolds` by the four membership cases.
- `qDeletedPairForwardClause_sat` is the minimal generic forward proof.  Its
  incidence assumptions are exactly the witness fields of
  `qDeletedPairHolds`, and `localFourRow_mem_encoderLocalFourRows` supplies
  encoder membership.
- `qDeletedPairReverseClause_sat` is semantically correct at the generic
  boundary.  Its `hcomplete` hypothesis isolates the only non-semantic input:
  every admissible encoder local-four row must be represented by an index in
  the supplied witness list.

No further generic family wrapper is needed before exact family decoding.
The four theorem bodies are type-aligned with the live
`localFourHolds`/`qDeletedPairHolds` definitions, but this remains a static
assessment until the stale imports are rebuilt and the complete file
elaborates.

## Smallest next proofs

1. Define the exact 21-index witness list for each `qDeletedPairRow`.  A compact
   candidate is `List.finRange 2310` filtered by center equality, deleted-label
   absence, and membership of the row's first and second labels.
2. Prove the filtered list has length 21 and is complete:

   ```lean
   ∀ candidate ∈ encoderLocalFourRows,
     candidate.center = row.center →
     row.deleted ∉ candidate.support →
     row.first ∈ candidate.support →
     row.second ∈ candidate.support →
     ∃ localFour ∈ qDeletedPairWitnesses i,
       localFourRow localFour = candidate
   ```

   `List.get_of_mem` plus `encoderLocalFourRows_length` is the direct bridge
   from an arbitrary encoder-row witness to its `Fin 2310` index.
3. Prove order, not merely set equality.  The source family enumerates
   `Z = L \ {deleted, center, first, second}` and then the 21 pairs
   `(u,v) ∈ combinations(Z,2)`.  The filtered local-four indices must be shown
   to occur in that same order before using them in
   `qDeletedPairReverseClause`.
4. Add exact position decoders:
   local-four uses `helper = k / 4`, `branch = k % 4`; deleted-pair uses
   `helper = k / 22`, `branch = k % 22`.  Prove the first 3/21 branches equal
   the forward constructors and the terminal branch equals the reverse
   constructor with the authenticated ordered witness list.

## Remaining trust boundary

The current generic theorems prove that *a decoded clause of the stated shape*
is satisfied.  They do not yet authenticate the source family position,
decoded row indices, or the ordered 21-witness payload.  Closure of these two
families therefore depends on the exact decoder/equality lemmas above, followed
by a full-file elaboration and transitive axiom check.
