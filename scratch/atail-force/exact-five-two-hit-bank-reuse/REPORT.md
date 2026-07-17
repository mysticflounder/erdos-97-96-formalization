# Exact-five two-source continuation: theorem-bank reuse audit

Date: 2026-07-17

Status: **source-level route correction identified; no existing terminal bank consumer found**

## Question

Can the exact-five large-cap branch be closed by reusing an existing theorem
bank after the positive two-hit target is replaced by its sound complement?

The corrected complement is:

- the physical exact-five strict-cap class meets the unused source's actual
  critical support in at most one point;
- hence two distinct physical strict-cap points avoid that support; and
- deleting either point preserves K4 at both the unused source's actual
  blocker and the physical apex.

Thus the branch produces two origin-tagged
`CommonDeletionTwoCenterPacket`s with the same center pair and different
deleted sources.

## Mandatory bank preflight

The audit checked:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`, especially the
  sibling `p97-rvol` section;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`;
- `certificates/erdos_general_theorem_p97_mining.{md,json}`; and
- indexed Lean documentation searches for exact-five two-hit, paired
  common-deletion, shared-row, same-center, cross-deletion, and equal-support
  statements.

No inventory contains a source-valid theorem whose conclusion supplies the
original positive target: two physical exact-five strict-cap hits in the
unused source's critical support.

The closest sibling-bank result is
`Problem97.C5D3B.two_le_qAllowedSelected_inter_rowOffAnchors_card_of_sameSideTerminal`.
It consumes a `C5D3BSameSideTerminalPacket` and a
`U5QAllowedAuditSupport`; the decisive two-hit containment is already part of
that bounded-support audit packet.  It does not derive the missing
cross-incidence from the exact-five parent surface.  Moreover, the registry
marks the C5D3B source as stale against the current canonical dependencies.
The legacy banks contain only fixed-cardinality or scalar consumers with no
matching producer.

## Corrected producer surface

The checked scratch implementation
`exact-five-two-hit-producer-attempt/ExactFiveTwoHitProducerAttempt.lean`
expresses the corrected source-level deduction.  It derives two distinct
strict-cap points outside the unused actual critical support and produces two
common-deletion packets at the same actual blocker/physical-apex pair.  The
result has since been promoted to production as
`ATail/LargeCapUniqueFiveLowHit.lean` and passed the focused production build
and axiom gate.

The strongest canonical row description derivable from current production
APIs is:

1. both first-center rows may be chosen to be the unused source's same actual
   critical support;
2. after deleting physical points `x` and `y`, the second-center rows may be
   chosen as the physical exact-five class with `x` and `y` respectively
   removed; hence the two second rows share exactly the other three physical
   class points;
3. `x` and `y` are absent from the common first row and occur in each other's
   second row; and
4. each first-row/second-row intersection has cardinality at most one on the
   strict physical class, so the ordinary distinct-center overlap bound is
   not close to contradiction.

The row equalities use the current exact-support theorem
`CriticalShellSystem.selectedFourClass_support_eq_shell` together with the
profile's unique K4 radius and exact class cardinality five.  They are
derivable consequences, not a newly elaborated theorem in this audit.

## Paired-consumer audit

The repository already contains the structurally closest paired object in
`r-spent-entry-provenance-consumer/SpentEntryOriginalPairSharedRows.lean`:
two distinct deleted points preserve the same two exact row supports at the
same centers.  Its validated report records that this is nonterminal.  The
ordered-cap sink would need two distinct common support points outside the cap
containing the centers; the paired surface does not produce them.  Selecting
row points reduces to the existing two-by-two normal form rather than to
`False`.

The common-deletion expansion bank similarly handles one deleted source at a
time.  It yields another common deletion or an aligned prescribed critical
pair, and admits recursive cycles.  No theorem was found that consumes two
packets with different deleted sources but a shared center pair.

The large U5 bank does not directly combine these packets: its configuration
theorems fix one common dangerous deleted parameter `q`, while the two packets
here have different deleted sources `x` and `y`.  Their shared centers do not
supply the missing named dangerous-base and cross-row incidences.

## Exact remaining antecedent

The corrected exact-five branch is therefore a genuine continuation, not a
terminal contradiction.  To reach an existing sink it still needs one of the
following genuinely new facts:

1. **A terminal cross-row incidence from one deleted source's actual critical
   row.**  For example, the actual critical row at `x` or `y` must contain the
   other source or enough named points from the common/physical rows to fill
   an existing U5 or ordered-cap consumer.
2. **A two-common-point bridge for distinct centers.**  Produce two distinct
   points in the first-row/second-row intersection with the required cap
   placement.  This would feed
   `false_of_two_cap_center_rows_common_outside_pair`, but the current exact
   surface proves no such lower bound.
3. **A well-founded paired-continuation theorem.**  Use the two distinct,
   origin-tagged deletions simultaneously to rule out the recursive
   common-deletion successor cycle.  The current one-source expansion has no
   such progress measure.

The first item is the smallest local extension compatible with the existing
U5 consumers; the third is the natural parent-level direct-`False` route.
Neither antecedent is present in the audited theorem banks.

## Conclusion

Do not continue mining for the impossible positive two-hit producer.  Promote
the low-hit/two-common-deletion continuation if its focused build and axiom
gate pass, but do not label that promotion as closure.  The next mathematical
target must consume both origin-tagged deletions simultaneously or derive one
named actual-critical-row cross incidence.  No existing bank theorem closes
the exact-five branch from the corrected producer alone.
