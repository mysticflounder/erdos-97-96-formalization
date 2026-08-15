# Mandatory post-wave theorem search

Exactly one theorem-bank search was run after the solver/validator wave.  Its
query was derived from the realized motif: two distinct points in one exact
four-row, equal actual blocker and equal exact blocker support, distinct row
and blocker centers, an endpoint row-cap split, and the proposed common-cap
alignment.  The command and full query are preserved in
`theorem_search/metadata.json`; raw output is in
`theorem_search/raw_stdout.txt`.

The search returned two directly relevant existing consumers:

1. `false_of_selectedFourClass_common_actualCenter_pair_outside_cap`, at
   `lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/TriApexEndpointRetainedOmission.lean:4367-4382`.
   It proves `False` **if** one already supplies an index whose cap contains the
   row center and common blocker while both sources are outside.
2. `actualRow_center_eq_commonBlocker_of_sameCap_outside_sources`, at
   `lean/Erdos9796Proof/P97/ATail/RetainedCollisionCapLocalization.lean:285-311`.
   Under the same supplied-cap/outside hypotheses it identifies the two
   centers.

Neither theorem produces the required cap index, identifies `blockerCap` with
`rowCap`, or ties the repeated-blocker pair to the row's outside pair.  They are
downstream obstructions once alignment is known, not alignment producers.
Thus the search found no theorem that invalidates the exact witness or closes
the missing implication.

