# FreshThird live FirstNonHit retained ingress preflight (2026-08-15)

## Scope

Target only the retained arm of
`false_of_freshThird_firstNonHit`.  Do not reuse the downstream exact-three
v4 packet as live ingress: that packet assumes a common-radius surface and an
equal-center exact row, whereas the live theorem carries raw
`FreshThirdCapSourceNonHit` on its own `C.firstSource`.

## Reuse-search record

- Candidate: a source-entitled blocker-transport theorem turning the live
  retained packet plus raw NonHit/Interaction into either a three-point Q-row
  overlap at one distinct actual center or the equivalent blocked-deletion
  triple.
- Immediate consumers:
  `exists_selectedRow_overlap_card_ge_three_of_blocked_deletions` and
  `exists_blockedDeletionTriple_iff_exists_selectedRow_overlap_card_ge_three`.
- Bounded theorem-bank search: no existing noncircular producer was found.
  The indexed Lean corpus was at `0b53668c`; the working source had already
  advanced beyond that revision, so current source declarations were also
  audited directly.
- First missing antecedent: three Q-row deletions blocked at one *distinct
  actual* center.  The retained double-deletion packets and NonHit omissions
  instead provide K4 survival at the source centers, so their polarity is the
  opposite of this terminal contract.
- Circular declaration to exclude:
  `exists_freshThird_firstNonHit_selectedRow_overlap_card_ge_three` is derived
  by `False.elim` from the open target.

## Source-entitled predicates now available

1. `exists_freshThird_selectedRow_escape_tripleShellSeed_originCases`
   (`f64ee9af`) gives a carrier-wide selected K4 row whose center lies on the
   P row, Pρ row, or live source row, together with a point outside all three
   shells.
2. `exists_freshThird_selectedRow_escape_tripleShellSeed_originIncidenceCases`
   (`d31c9473`) additionally gives overlap at most two with the origin shell
   and at least two new row points outside that shell.
3. `MinimalDeletionCore.shellAt_selectedClass_eq` and
   `shellAt_capInteriorByIndex_card_ge_two` (`72aa5acc`) expose each retained
   core shell as an exact ambient row with at least two strict opposite-cap
   points.
4. `MinimalDeletionCore.shellAt_support_eq_selectedClass_of_dist_eq`
   (`29a3e6bb`) identifies a core shell with a named retained-radius class.
   These retained-radius rows share the two source endpoints with the actual
   P/Pρ blocker rows, but they generally have different centers and are not
   the same rows.  The finite model must represent both roles and link each
   blocker/radius pair by its exact two-point source overlap.
5. `exists_q_tripleShellEscape_qRow_overlap_card_le_two`, promoted into
   `TwoSourceTripleShellEscape.lean` at `8e4867ca`, shows that every supplied
   global escape row overlaps the Q row in at most two points.
   This makes the escape row an anti-landing for the desired three-overlap
   terminal; the discovery objective is therefore a new producer predicate,
   not direct reuse of the escaping row as the terminal witness.

## Minimal live finite packet

Use independent cell dimensions rather than one product clause:

- first NonHit constructor: 2 arms;
- second Interaction constructor: 4 arms;
- global escaping-row origin: 3 arms, on the P, Pρ, or Q row;
- retained endpoint choices for each live source: 4 arms per source, encoded
  by witnesses rather than multiplied into the static cell count.

The finite vocabulary needs the exact P row, Pρ row, both live C rows, the
exact Q row, and one global escaping row.  Its triple-shell seed and third
origin arm are the Q row, not the retained first C row.  It must include:

- raw center equality/support equality or source-row omission for NonHit;
- all four positive Interaction constructors, including exact two-point
  overlaps and one-hot cap-index witnesses (encoded by implication into cap
  membership, without asserting nonmembership in unchosen caps);
- retained endpoint omissions and double-deletion survival at both C centers;
- first-apex double-deletion blockage;
- the two named retained-radius rows, their disjointness, and their strict-cap
  incidence from the minimal-core API;
- the global row's three-way origin, escaped point, overlap-at-most-two, and
  two-points-outside-origin constraints;
- the global row's theorem-backed Q-row overlap-at-most-two constraint.

SAT remains abstraction data.  An UNSAT result is promotable only after the
Lean packet-to-assignment coverage theorem and certificate replay are wired.

The static discovery runner must archive every source/encoder/test file in the
snapshot, bind clean files to their blob at the captured Git commit, require
current bytes for replay, and verify the source-content digest before and after
the wave.  Its self-hashes are integrity links rather than signatures, and the
manifest must keep `promotion_ready`, theorem, Lean, source-entitlement, and
universal claims false.

One arbitrary SAT signature per cell is only observed-model data.  The bounded
wave therefore asks both `P` and `¬P` for exactly five retained-row
synchronization predicates:

1. a P endpoint omitted by both retained rows;
2. a Pρ endpoint omitted by both retained rows;
3. equality of the two retained actual-blocker centers;
4. retained-support overlap at least two;
5. one retained actual-blocker center lying in the other retained support.

Only a one-sided UNSAT result may be called forced true/false *in the finite
packet*.  Two SAT polarities are undetermined.  Neither classification is a
Lean theorem until a source-level producer is proved.

The escaping `K : SelectedFourClass D.A center` is not the canonical actual
blocker row selected at the carrier point `center`.  The anti-landing theorem
only bounds `K`'s overlap with Q.  This wave does not represent or mine a
target-shaped actual row at the escaped center, and assumes no incidence link
between `K` and that row.

## Immediate implementation target

Build a new live-retained encoder/validator.  Reuse the authenticated static
runner and low-level exact-row/congruence machinery from the exact-three v4
lane, but do not inherit its role table, common-radius packet, equal-center
row, boundary fan, or exact-three pinned-fan assumptions.
