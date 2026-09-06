# Exact-five global source cut

## Preamble: exact intermediate target

**Claim.** Let A be a finite convex-independent carrier with global K4,
minimal in cardinality among nonempty convex-independent global-K4 carriers,
and suppose |A| > 9. Let O,V be fully single-deletion robust carrier centers,
and let bq,bw be two distinct actual critical blocker centers. Then there
exist c,t in A and a positive radius whose full ambient class K at c has
exactly four points, such that:

- c differs from O,V,bq,bw;
- t belongs to K and is either fully single-deletion robust, bq, or bw;
- deleting any member of K destroys every K4 witness at c.

This is an intermediate global-source statement for the exact-five physical
residual, not its `False` conclusion. Section 3 gives a complete pen-and-paper
proof. It supplies an actual critical row across a different cut, but does
not supply the strict freshness, cap position, or metric decrease required
by the existing physical consumers. The physical target remains open.

## 1. Definitions and source custody

K4 at a center means that some positive-radius class has at least four
carrier points; global K4 means this at every carrier center. A center is
**robust** when K4 survives deletion of every single carrier point. An
**actual blocker of t** is a carrier center different from t at which
deleting t destroys K4 at every positive radius. Write N for the carrier's
nonrobust centers. A rich class is a positive-radius class of size at least
four. Classes at distinct radii of one center are disjoint.

In the live exact-five source, global minimality is `R.minimal`, |A| > 9 is
`R.carrier_card_gt_nine`, O and V are `S.oppApex1` and `S.oppApex2`, and
their robustness comes from R and the normal form. The centers bq,bw are
the two distinct `H.centerAt` values in `R.obstructionCenters_ne`.
`H.no_qfree_at` supplies their actual criticality. The proof does not replace
global minimality by minimum-pair evidence.

For comparison with the previous cut, put E = SelectedClass A O radius,
B = the retained blocker's selected row, L = the preserved second-apex row,
and U = E ∪ B ∪ L. The original strict-fresh source lies outside U:
it omits E.erase deleted and differs from deleted, so it omits E, and the
packet supplies its B and L omissions. This witness makes U proper in A;
E makes U nonempty.
Since the retained endpoint belongs to E ∩ B and the row sizes are 5,4,4,
|U| ≤ 12. The separate source fields `R.class_card_eq_five` and
`R.unique_fourClass_radius` make E the unique rich class at O.

**Correction to the Pro request.** The request asserted that all of E lies
in the first-cap interior. The inspected source provides at least three
interior members, including q,w, not full containment of E.
`firstApex_cardFive_interior_card_ge_three` and the interior frontier fields
are the relevant statements. No argument below assumes full containment.
The earlier 27-point control's full containment was a property of that
particular construction.

## 2. Audit of the first global cut

The [retained Pro response](../references/exactfive-source-geometry-2026-09-05/global-source-cut-pro-response-2026-09-06.md)
is the exact response to `01M1TWK4EP57RK85782ETSAFR4`, received as message
`#16570`. Its SHA-256 is
`ed8f1d5c24bc5cbb2eec5bf3ae4cd4af95aa4c549792e5ef1f706fc402000020`.
It is external research input; the proofs here are the audited deductions.

**Lemma 1 — PROVEN, pen-and-paper.** For any nonempty proper deletion set
U ⊆ A with A ∖ U nonempty, global minimality supplies z in A ∖ U and a
nonempty J ⊆ U such that deleting J destroys K4 at z, while restoring any
single member of J restores K4 there.

**Proof.** A ∖ U inherits convex independence and has smaller cardinality.
It cannot have global K4, by minimality. Choose a center z in A ∖ U where
K4 fails. Among the subsets of U whose deletion destroys K4 at z, choose
one of minimum cardinality, J. The family is finite and contains U.
J is nonempty because ambient K4 holds at z. Deleting J with one of its
members removed from the deletion set restores K4 by this minimum choice. ∎

**Lemma 2 — PROVEN, pen-and-paper.** In Lemma 1, write Cρ for the full
ambient class at z and radius ρ, and Λ = {dist(z,s) : s ∈ J}. Then Λ is
exactly the set of rich radii, and for each ρ ∈ Λ,
|Cρ ∖ J| = 3 and |Cρ| = 3 + |Cρ ∩ J|. If |J| = 1, z has exactly one rich
class, of size four. If |J| ≥ 2, z is robust.

**Proof.** All radii in Λ are positive because z is outside J. Restoring
s ∈ J adds only s to A ∖ J. A witnessing radius must be dist(z,s), since
any other radius has the same class before and after the restoration.
Failure before and success after adding one point force the old class size
to be exactly three. Partitioning the ambient class into its J and non-J
parts proves the formula. A rich ambient radius outside Λ is untouched by
deleting J, contradicting failure, while every radius in Λ is rich by the
formula. For singleton J the formula gives one class of size four. If J
has two members at one radius, that class has size at least five and survives
every singleton deletion. If no radius contains two J members and |J| ≥ 2,
there are at least two disjoint rich four-classes; deleting one point leaves
at least one of them intact. These two cases exhaust |J| ≥ 2. ∎

Consequently a multi-point J does not produce an ambient actual blocker at
z. Robustness contradicts any proposed singleton deletion failure there.
The criticality in a restored carrier must not be substituted for ambient
actual-blocker criticality.

**Alias check — PROVEN, pen-and-paper.** If the retained blocker b is
outside U, Lemma 1 permits z = b and J = {retained}: criticality supplies
the deletion failure, and restoration returns the entire carrier.
If O is outside U, it permits z = O and any two distinct E members as J:
O has a unique rich class of size five, leaving three after both deletions
and four when either point is restored. Thus the cut does not force a new
center. Its globally valid existence theorem alone does not narrow the
physical residual.

## 3. A cut that forces an actual critical row

**Lemma 3 — PROVEN, pen-and-paper.** Each c ∈ N has exactly one rich
ambient radius and its full class Kc has size four. Every member of Kc is
critical for c. Moreover |A| ≤ 4|N|.

**Proof.** Nonrobustness gives a carrier point s whose deletion destroys
K4 at c. Every rich class at c must contain s; otherwise it survives.
Distinct radii cannot both contain s, so there is exactly one rich radius,
using ambient K4 for existence. Its class cannot have five points, since
then deleting s leaves four. Its size is therefore four. Deleting any
member leaves only three at that radius, and cannot enlarge any other
class, proving actual criticality at every member.

For each x ∈ A, the nonempty proper subset A ∖ {x} inherits convex
independence. By minimality it fails global K4 at some center c in that
subset. This c is nonrobust, and the preceding argument puts x in Kc.
Thus the classes Kc, c ∈ N, cover A. Counting their union gives
|A| ≤ Σ(c ∈ N)|Kc| = 4|N|. ∎

**Theorem — PROVEN, pen-and-paper: the preamble's claim.** Put
X = N ∖ {bq,bw}. Since |A| > 9 and |A| ≤ 4|N|, N has at least three
members; hence X is nonempty. Both original blockers are in N by actual
criticality. X is proper in A; in particular the robust carrier point O
does not belong to N.

If every Kc for c ∈ X were contained in X, every center of X would have a
four-point positive-radius class in X. Then X would itself have global K4.
It inherits convex independence from A, so its smaller cardinality would
contradict minimality. Therefore some c ∈ X and t ∈ Kc satisfy t ∉ X.
The center c differs from bq,bw by membership in X, and differs from O,V
because those two centers are robust. Since t ∈ A but t ∉ X, either t is
not in N and is robust, or t is bq or bw. Lemma 3 supplies the full ambient
four-class and actual criticality of each member, completing the claim. ∎

**Reselection consequence — PROVEN, pen-and-paper.** Given total H, choose
the just-proved row at c as the critical row for source t, leaving every
other source's choice fixed. The new choice has positive radius, contains t,
and deleting t destroys K4 at c; positivity also gives c ≠ t. It therefore
defines another total critical-shell system. This consequence does not
assert preservation of the dependent frontier, normal form, or physical
packet if t is one of their consumed sources.

## 4. Remaining geometric obligation

The new cut fixes one defect of the U cut: its escaping row is an actual
critical row, and its center differs from both original blockers and both
robust apices. It gives neither c ∈ U nor t ∉ U. In particular its source
may be one of the original blocker centers or a robust point already in U.
It also gives no pair incidence with q,w and no location in a particular
cap. The actual-fresh-row consumers cannot be applied without those facts.

The next source question is whether geometry forces a usable pair incidence
or a source outside U from this actual crossing row, treating both the
robust-source arm and the old-blocker-source arms. Any reselection must carry
the dependent residual hypotheses, and any iteration still needs a proved
decreasing measure. These obligations are **CONJECTURED / open**
(`{{NEEDS_PROOF}}`); no contradiction or terminal reduction is claimed.

## 5. Completion matrix and reuse preflight

| Obligation | Status and evidence |
| --- | --- |
| Minimality excludes a nonempty proper global-K4 subset | PROVEN, pen-and-paper, definition and inherited convex independence |
| Outside-center minimal blocking deletion | PROVEN, pen-and-paper, Lemma 1 |
| Ambient radial decomposition and robustness dichotomy | PROVEN, pen-and-paper, Lemma 2 |
| Old-center alias in the support cut | PROVEN, pen-and-paper, alias check |
| Unique four-classes and nonrobust-center cover bound | PROVEN, pen-and-paper, Lemma 3 |
| Actual crossing row after excluding both endpoint blockers | PROVEN, pen-and-paper, theorem in §3 |
| Total-shell override at its critical source | PROVEN, pen-and-paper, reselection consequence |
| Source geometry and dependent-state transport to a live consumer | CONJECTURED, open, §4 |
| Contradiction or termination for the physical residual | CONJECTURED, open |

The bounded reuse search used the project Lean corpus indexed at
`8e6f754f7`; the lane base is
`8e6f754f72a5c421a1c5c59308ee4bdd77f6913b`.
Relevant inspected implementations are
`ATailGlobalMinimalDeletion.exists_global_cardMinimal_blocking_subdeletion`,
`ATailMinimalUniqueFourCover.isUniqueFourCenter_of_not_fullyDeletionRobust`,
`card_le_four_mul_notRobustCenters`, and
`exists_center_all_selectedFourClass_escape_of_proper_subset` in
`P97/U1CarrierInjection.lean`. The latter is stronger than the one-row escape
used here. They identify possible formalization inputs; this note's evidence
is its self-contained paper proofs, not a new compilation or axiom audit.
No production Lean file or open physical theorem was changed.

The [independent skeptic audit](../skeptic-exactfive-global-source-cut-2026-09-06.md)
certifies the scoped paper deductions and the plan's evidence labels.
