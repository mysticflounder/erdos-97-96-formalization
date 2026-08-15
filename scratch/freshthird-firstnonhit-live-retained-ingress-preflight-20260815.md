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
   Consequently the retained core rows should reuse the P/Pρ row roles in a
   finite model; they are not anonymous extra rows.

## Minimal live finite packet

Use independent cell dimensions rather than one product clause:

- first NonHit constructor: 2 arms;
- second Interaction constructor: 4 arms;
- global escaping-row origin: 3 arms;
- retained endpoint choices for each live source: 4 arms per source, encoded
  by witnesses rather than multiplied into the static cell count.

The finite vocabulary needs the exact P row, Pρ row, both live C rows, the
exact Q row, and one global escaping row.  It must include:

- raw center equality/support equality or source-row omission for NonHit;
- all four positive Interaction constructors, including exact two-point
  overlaps and cap witnesses;
- retained endpoint omissions and double-deletion survival at both C centers;
- first-apex double-deletion blockage;
- the two named retained-radius rows, their disjointness, and their strict-cap
  incidence from the minimal-core API;
- the global row's three-way origin, escaped point, overlap-at-most-two, and
  two-points-outside-origin constraints.

SAT remains abstraction data.  An UNSAT result is promotable only after the
Lean packet-to-assignment coverage theorem and certificate replay are wired.

## Immediate implementation target

Build a new live-retained encoder/validator.  Reuse the authenticated static
runner and low-level exact-row/congruence machinery from the exact-three v4
lane, but do not inherit its role table, common-radius packet, equal-center
row, boundary fan, or exact-three pinned-fan assumptions.
