"""Phase-1/2 pruning-rule engine for the P97 counterexample search lane.

Implements ``census/p97_search/PHASE1-SPEC.md`` section 3 and
``census/p97_search/PHASE2-SPEC.md`` section 4.  A rule is
``(id, status, hypotheses, predicate, citation)``:

  - ``status in {ADMITTED, CANDIDATE}``.  ONLY ADMITTED rules may prune.
    CANDIDATE rules are implemented and unit-tested but the engine
    hard-refuses (``assert``, not a config flag) to use them in any
    pruning pass -- see ``prune_node`` / ``prune_annotated_node`` /
    ``apply_rule`` below.
  - ``hypotheses``: a static tag tuple recorded with every pruning event.
  - ``predicate(obj) -> bool`` where True means "violates the rule =
    prune".  Rules are tagged with a ``domain`` ("node", "annotated-node",
    or "cell") because different rules' predicates operate on different
    object shapes (spec section 3; "annotated-node" added Phase 2).

Phase-2 promotions (PHASE2-SPEC.md section 4): R-FIBER4 and R-CAPGE4
move CANDIDATE -> ADMITTED.  Registries are now split by domain:
``ADMITTED_RULES`` (node-domain: R-CIRC2), ``ADMITTED_ANNOTATED_RULES``
(annotated-node-domain: R-FIBER4), ``ADMITTED_CELL_RULES``
(cell-domain: R-CAPGE4), ``ADMITTED_CUT_MATRIX_RULES``
(cut-matrix-domain: R-P1, R-P2 -- spec section 4.4 amendment), plus
``ALL_RULES`` -- a single registry of every rule (all now ADMITTED)
used for the rule-bank hash (``iterate.py``'s ``rule_bank_hash``).
``CANDIDATE_RULES`` is now empty -- the only remaining
CANDIDATE-refusal test uses a synthetic rule (``R-TEST-CANDIDATE``)
that lives entirely in ``controls.py`` (spec section 4.3), never in
this module's registries.
"""

from __future__ import annotations

from dataclasses import dataclass
from itertools import combinations
from typing import Any, Callable, Sequence

from cells import Cell
from node import Node

__all__ = [
    "ADMITTED",
    "CANDIDATE",
    "Rule",
    "PruneResult",
    "FiberDefensivePredicateFired",
    "r_circ2_predicate",
    "r_fiber4_predicate",
    "r_fiber4_profile_violates",
    "r_capge4_predicate",
    "r_p1_predicate",
    "r_p2_predicate",
    "find_p1_occurrence",
    "find_p2_occurrence",
    "R_CIRC2",
    "R_FIBER4",
    "R_CAPGE4",
    "R_P1",
    "R_P2",
    "ADMITTED_RULES",
    "ADMITTED_ANNOTATED_RULES",
    "ADMITTED_CELL_RULES",
    "ADMITTED_CUT_MATRIX_RULES",
    "CANDIDATE_RULES",
    "ALL_RULES",
    "apply_rule",
    "prune_node",
    "prune_annotated_node",
    "prune_cut_matrix",
]

ADMITTED = "ADMITTED"
CANDIDATE = "CANDIDATE"
_STATUSES = (ADMITTED, CANDIDATE)
_DOMAINS = ("node", "annotated-node", "cell", "cut-matrix")


@dataclass(frozen=True)
class Rule:
    id: str
    status: str
    hypotheses: tuple[str, ...]
    predicate: Callable[[Any], bool]
    citation: str
    domain: str = "node"  # "node", "annotated-node", or "cell"

    def __post_init__(self) -> None:
        if self.status not in _STATUSES:
            raise ValueError(f"rule {self.id!r} has unknown status {self.status!r}")
        if self.domain not in _DOMAINS:
            raise ValueError(f"rule {self.id!r} has unknown domain {self.domain!r}")


@dataclass(frozen=True)
class PruneResult:
    pruned: bool
    fired: tuple[str, ...]
    hypotheses: frozenset[str]


# ---------------------------------------------------------------------------
# R-CIRC2 (ADMITTED).  Citation: two distinct circles meet in <= 2 points;
# concentric-same-center is impossible since p != q as centers.  Banked
# instances (audited 2026-07-28, see scratch/p97-search-lane/
# banked-pruning-inventory.md rows 15/17/18):
#   Problem97.U1CarrierInjection.inter_card_le_two (p97-rvol)
#   Problem97.U3ShortCapOverlapBound.cap_overlap_le_two (p97-rvol)
#   Problem97.FiniteEndpointShell.N8a_two_intersection_bound
#     (lean/Erdos9796Proof/P97/N8/N8aArcTwoCircle.lean:164)
# ---------------------------------------------------------------------------


def r_circ2_predicate(node: Node) -> bool:
    """True (prune) iff some p != q have |S[p] ∩ S[q]| > 2."""

    for p, q in combinations(range(node.n), 2):
        if len(node.shells[p] & node.shells[q]) > 2:
            return True
    return False


R_CIRC2 = Rule(
    id="R-CIRC2",
    status=ADMITTED,
    hypotheses=(),
    predicate=r_circ2_predicate,
    citation=(
        "distinct circles meet in <= 2 points; p != q as centers rules out "
        "the concentric case. Banked: Problem97.U1CarrierInjection."
        "inter_card_le_two (p97-rvol), Problem97.U3ShortCapOverlapBound."
        "cap_overlap_le_two (p97-rvol), Problem97.FiniteEndpointShell."
        "N8a_two_intersection_bound (N8aArcTwoCircle.lean:164); see "
        "scratch/p97-search-lane/banked-pruning-inventory.md rows 15/17/18"
    ),
    domain="node",
)


# ---------------------------------------------------------------------------
# R-FIBER4 (ADMITTED, Phase 2).  Domain "annotated-node".  Admission basis
# -- mini-lemma, proved here (orchestrator, 2026-07-28, PHASE2-SPEC.md
# section 4.1):
#
#   For any B1-valid annotation c on (n, k, S) and any label d:
#   fiber(d) subseteq S[d], hence |fiber(d)| <= |S[d]|; in an exact-k cell
#   |fiber(d)| <= k.
#   Proof: x in fiber(d) means c(x) = d; B1 gives x in S[c(x)] = S[d].
#   Cardinality is monotone under subseteq. QED.
#
# This is the design-doc section 6 derivation (x in Sigma(c(x)) + shell
# size) stated for the census data structure; the numeric <= 4 form is
# the exact-k, k=4 instance.
#
# Two predicate forms, one rule id (spec section 4.1):
#   - r_fiber4_profile_violates(node, m): the motif-level form, licenses
#     cardinality constraints in Phase-3 encodings.
#   - r_fiber4_predicate(anode): the rule's wired predicate (domain
#     "annotated-node").  By the mini-lemma above it is provably False
#     for every constructible AnnotatedNode (B1 is enforced at
#     BlockerAnnotation construction); it is kept as a DEFENSIVE check --
#     if it ever fires, that is a bug in the annotation code, and
#     ``prune_annotated_node`` raises (``FiberDefensivePredicateFired``),
#     never prunes.
# ---------------------------------------------------------------------------


class FiberDefensivePredicateFired(RuntimeError):
    """Raised by ``prune_annotated_node`` if R-FIBER4's defensive
    node-form predicate ever returns True.  By the section-4.1 mini-lemma
    this is provably impossible for a constructible ``AnnotatedNode``
    (B1 is enforced at ``BlockerAnnotation`` construction), so a firing
    means the annotation code itself has a bug -- the engine raises
    rather than silently prunes (PHASE2-SPEC.md section 4.1 cell-mode
    caveat, and the "iterator RAISES" directive)."""


def r_fiber4_profile_violates(node: Node, m: dict[int, int]) -> bool:
    """Motif-level form: ``m`` is a candidate fiber-size map,
    ``label -> int`` with ``sum(m.values()) == n``.  True (prune the
    annotation-search branch) iff ``m[d] > len(S[d])`` for some d."""

    total = sum(m.values())
    if total != node.n:
        raise ValueError(
            f"r_fiber4_profile_violates: sum(m.values()) = {total} != n = {node.n}"
        )
    for d in range(node.n):
        if m.get(d, 0) > len(node.shell(d)):
            return True
    return False


def r_fiber4_predicate(anode: Any) -> bool:
    """Defensive node-form: True iff ``|fiber(d)| > |S[d]|`` for some d
    on a blocker-annotated ``AnnotatedNode``.  Provably False for every
    constructible ``AnnotatedNode`` (see the mini-lemma above); kept only
    as a defensive check consulted by ``prune_annotated_node``, which
    raises rather than prunes if this ever returns True.
    """

    blocker = anode.blocker
    if blocker is None:
        raise ValueError("r_fiber4_predicate requires a blocker-annotated AnnotatedNode")
    node = anode.node
    fibers = blocker.fibers()
    for d in range(node.n):
        if len(fibers.get(d, frozenset())) > len(node.shell(d)):
            return True
    return False


R_FIBER4 = Rule(
    id="R-FIBER4",
    status=ADMITTED,
    hypotheses=("blocker-annotated",),
    predicate=r_fiber4_predicate,
    citation=(
        "PHASE2-SPEC.md section 4.1 mini-lemma (orchestrator, 2026-07-28): "
        "x in fiber(d) means c(x) = d; B1 (x in S[c(x)]) gives x in S[d]; "
        "so fiber(d) subseteq S[d] and |fiber(d)| <= |S[d]|. Design doc "
        "docs/p97-counterexample-search-design-2026-07-28.md section 6, "
        "'Blocker fibers' paragraph. Cell-mode caveat: a cell run in "
        "blocker-annotated mode publishes claims conditional on "
        "annotation EXISTENCE. BARE-B1 existence (x in S[c(x)], c(x) != x) "
        "is RESOLVED for the lane-level [9,N] non-existence target by "
        "scratch/p97-search-lane/blocker-annotation-existence.md Theorem C "
        "(AUDITED-WITH-PATCHES 2026-07-28; composition via minimality over "
        "full-range census coverage, not a per-cell hypothesis). A single "
        "cell's per-cell claim (every convex K4 configuration realizing "
        "this exact node admits a B1-valid map with the INTENDED GEOMETRIC "
        "semantics of the blocker) remains {{NEEDS_PROOF}} and is NOT part "
        "of this admission -- the note's own standing rule (its section 5 "
        "item 1) forbids assuming more than BARE-B1 without a new proof; "
        "iterate_cell tags such runs 'blocker-annotated' unconditionally."
    ),
    domain="annotated-node",
)


# ---------------------------------------------------------------------------
# R-CAPGE4 (ADMITTED, Phase 2).  Profile floor: in a (k=4, n, profile)
# cell, every closed cap size >= 4.  Predicate operates on the Cell
# descriptor, not a Node (unchanged from Phase 1).  Audit chain complete
# (orchestrator, 2026-07-28, PHASE2-SPEC.md section 4.2):
#
#   - Frame producer: Problem97.MEC.nonempty_surplusCapPacket_of_K4
#     (lean/Erdos9796Proof/P97/CapBridgeFromK4.lean:98) -- from
#     A.Nonempty, ConvexIndep A, HasNEquidistantProperty 4 A, 9 < A.card
#     produces a SurplusCapPacket (no minimality anywhere in the chain).
#   - Cap floor: capTriple_caps_card_ge_four
#     (lean/Erdos9796Proof/P97/U1OppositeCapLowerBounds.lean:446) -- all
#     three CLOSED caps have >= 4 points; hypotheses all frame-supplied.
#   - Cap-partition/sum (the previously open sub-audit):
#     SurplusCapPacket.capSum
#     (lean/Erdos9796Proof/P97/Cap/PartitionFromMEC.lean:397) gives
#     |surplus| + |opp1| + |opp2| = |A| + 3, via
#     CapTriple.cap_sum_identity (Cap/Structure.lean:251) and
#     Problem97.cap_sum_identity (Cap/Partition.lean:86), which is pure
#     counting from the CapPartition fields; nonmoser_in_one is a
#     CapTriple structure field and moser_in_two is derived from the nine
#     explicit membership fields (Cap/Structure.lean:213). Closed-cap
#     convention throughout -- consistent with the annotations.py
#     CapAnnotation and the Cell profile definition.
#
# Kernel gate: SATISFIED 2026-07-28 (orchestrator). `proof-blueprint
# axioms` on nonempty_surplusCapPacket_of_K4,
# capTriple_caps_card_ge_four, AND Problem97.SurplusCapPacket.capSum
# each report exactly {propext, Classical.choice, Quot.sound} -- no
# sorryAx, no custom axioms, no ofReduceBool. Published per-cell
# non-existence claims are no longer blocked on this gate.
#
# Note (no rule needed): for n > 9 the profile sum n + 3 > 12 forces one
# closed cap >= 5 automatically, so the surplus fact adds no pruning
# content over R-CAPGE4 at profiled cells.
# ---------------------------------------------------------------------------


def r_capge4_predicate(cell: Cell) -> bool:
    """True (prune) iff ``cell`` is a k=4 profiled cell with a cap < 4.

    FRAMELESS cells (``cell.profile is None``) carry no profile
    constraint (spec section 4) and this predicate does not apply to
    them; it returns False rather than asserting, since "no profile" is
    not itself a rule violation.
    """

    if cell.profile is None:
        return False
    return any(size < 4 for size in cell.profile)


R_CAPGE4 = Rule(
    id="R-CAPGE4",
    status=ADMITTED,
    hypotheses=("k=4", "convex", "n>9", "profiled"),
    predicate=r_capge4_predicate,
    citation=(
        "Problem97.MEC.nonempty_surplusCapPacket_of_K4 "
        "(lean/Erdos9796Proof/P97/CapBridgeFromK4.lean:98): A.Nonempty, "
        "ConvexIndep A, HasNEquidistantProperty 4 A, 9 < A.card => "
        "Nonempty (SurplusCapPacket A), no minimality. "
        "Problem97.U1OppositeCapLowerBounds.capTriple_caps_card_ge_four "
        "(lean/Erdos9796Proof/P97/U1OppositeCapLowerBounds.lean:446): all "
        "three closed caps have >= 4 points, hypotheses all frame-supplied. "
        "SurplusCapPacket.capSum (lean/Erdos9796Proof/P97/Cap/"
        "PartitionFromMEC.lean:397) via CapTriple.cap_sum_identity "
        "(Cap/Structure.lean:251) and Problem97.cap_sum_identity "
        "(Cap/Partition.lean:86): |surplus|+|opp1|+|opp2| = |A|+3, pure "
        "counting from the CapPartition fields. Closed-cap convention "
        "throughout. PHASE2-SPEC.md section 4.2. Kernel gate "
        "(proof-blueprint axioms on nonempty_surplusCapPacket_of_K4 and "
        "capTriple_caps_card_ge_four) blocks published per-cell "
        "non-existence claims, not this admission; kernel-checked "
        "2026-07-28: proof-blueprint axioms on all three shows core "
        "axioms only (propext, Classical.choice, Quot.sound)."
    ),
    domain="cell",
)


# ---------------------------------------------------------------------------
# R-P1 / R-P2 (ADMITTED, spec section 4.4 amendment 2026-07-28).  Domain
# "cut-matrix": a rectangular 0-1 matrix whose rows are one side A of a
# cut of a strictly convex polygon in convex arc order, columns the
# other side B likewise, 1-cells marking pairs KNOWN to lie at ONE
# common distance delta (subset semantics), read in orientation
# convention C2 (opposed): the traversal listing rows in increasing
# order meets columns in decreasing index order
# (scratch/p97-search-lane/fr-pattern-lemma1.md, pinned 2026-07-28).
#
# The predicates are pure pattern scanners.  The SOUNDNESS burden of
# the matrix semantics (convex position, arc contiguity, C2
# orientation, same-delta 1-cells) sits with the consumer; the engine
# cannot detect a mis-oriented or mixed-radius matrix.  In particular
# NO shell-semantics generalization is admitted: S[p]-incidences at
# different centers carry different radii, and a pattern-shaped
# occurrence among mixed-radius cells is NOT killed by the audited
# theorems.  Phase 3 may construct these matrices only from
# same-delta certified cell sets.
#
# C2 is load-bearing for R-P2: under the aligned (C1) reading variant A
# is REALIZABLE (exact hexagon witness, fr-pattern-p2-proof-draft.md
# section 6), so consuming a C1-read matrix would over-prune.  R-P1 is
# orientation-neutral and needs only ONE side's arc contiguity
# (fr-pattern-lemma1.md P1 remarks).
# ---------------------------------------------------------------------------

_CutMatrix = Sequence[Sequence[int]]


def _validate_cut_matrix(matrix: _CutMatrix) -> tuple[tuple[int, ...], ...]:
    rows = tuple(tuple(row) for row in matrix)
    if rows:
        width = len(rows[0])
        for r, row in enumerate(rows):
            if len(row) != width:
                raise ValueError(
                    f"cut matrix is ragged: row 0 has {width} entries, row {r} has {len(row)}"
                )
            for c, entry in enumerate(row):
                if entry not in (0, 1):
                    raise ValueError(
                        f"cut matrix entry [{r}][{c}] = {entry!r} is not 0/1"
                    )
    return rows


def find_p1_occurrence(matrix: _CutMatrix) -> tuple[int, int, int, int] | None:
    """First (r1, r2, c1, c2) with all four cells 1 (a K_{2,2}), else None."""

    mat = _validate_cut_matrix(matrix)
    n_rows = len(mat)
    n_cols = len(mat[0]) if mat else 0
    for r1, r2 in combinations(range(n_rows), 2):
        for c1, c2 in combinations(range(n_cols), 2):
            if mat[r1][c1] and mat[r1][c2] and mat[r2][c1] and mat[r2][c2]:
                return (r1, r2, c1, c2)
    return None


# P2 variants as (row-index, col-index) offsets into (r1,r2,r3)x(c1,c2,c3),
# exactly the fr-pattern-lemma1.md cell sets:
#   variant A: {(r1,c1),(r1,c2),(r2,c3),(r3,c1),(r3,c3)}
#   variant B: {(r1,c1),(r1,c3),(r2,c1),(r3,c2),(r3,c3)}
_P2_VARIANT_A = ((0, 0), (0, 1), (1, 2), (2, 0), (2, 2))
_P2_VARIANT_B = ((0, 0), (0, 2), (1, 0), (2, 1), (2, 2))


def find_p2_occurrence(
    matrix: _CutMatrix,
) -> tuple[str, tuple[int, int, int], tuple[int, int, int]] | None:
    """First (variant, rows, cols) P2 occurrence ("A" or "B"), else None."""

    mat = _validate_cut_matrix(matrix)
    n_rows = len(mat)
    n_cols = len(mat[0]) if mat else 0
    for rows in combinations(range(n_rows), 3):
        for cols in combinations(range(n_cols), 3):
            for name, cells in (("A", _P2_VARIANT_A), ("B", _P2_VARIANT_B)):
                if all(mat[rows[ri]][cols[ci]] for ri, ci in cells):
                    return (name, rows, cols)
    return None


def r_p1_predicate(matrix: _CutMatrix) -> bool:
    """True (prune) iff the C2 cut matrix contains a 2x2 all-ones submatrix."""

    return find_p1_occurrence(matrix) is not None


def r_p2_predicate(matrix: _CutMatrix) -> bool:
    """True (prune) iff the C2 cut matrix contains a P2 variant-A or -B
    occurrence as a submatrix."""

    return find_p2_occurrence(matrix) is not None


R_P1 = Rule(
    id="R-P1",
    status=ADMITTED,
    hypotheses=("convex", "one-side-contiguous-arc", "same-distance-cells"),
    predicate=r_p1_predicate,
    citation=(
        "scratch/p97-search-lane/fr-pattern-lemma1.md P1 proof, PROVEN + "
        "AUDITED 2026-07-28 (math-skeptic audit, patches applied): no "
        "strictly convex polygon has distinct rows a, a' and columns b, b' "
        "with all four cross-cut distances equal (K_{2,2} forbidden). Uses "
        "only the row side's arc contiguity (transposition symmetry covers "
        "the other side); orientation-neutral; k-general (any single common "
        "distance). PHASE2-SPEC.md section 4.4."
    ),
    domain="cut-matrix",
)

R_P2 = Rule(
    id="R-P2",
    status=ADMITTED,
    hypotheses=("convex", "contiguous-cut", "same-distance-cells", "C2-orientation"),
    predicate=r_p2_predicate,
    citation=(
        "scratch/p97-search-lane/fr-pattern-p2-proof-draft.md Theorem 1 + "
        "Corollary via Lemma R, PROVEN + AUDITED 2026-07-28 (math-skeptic; "
        "blocking gap F1 patched same day): under convention C2 neither P2 "
        "variant is realizable in a strictly convex polygon with a "
        "contiguous cut and one common distance across the five cells. "
        "C2 is LOAD-BEARING: under the C1 reading variant A is realizable "
        "(exact hexagon witness, draft section 6 + "
        "p2_exact_witness_certificate.py), so a C1-read matrix would "
        "over-prune. PHASE2-SPEC.md section 4.4."
    ),
    domain="cut-matrix",
)


ADMITTED_RULES: tuple[Rule, ...] = (R_CIRC2,)
ADMITTED_ANNOTATED_RULES: tuple[Rule, ...] = (R_FIBER4,)
ADMITTED_CELL_RULES: tuple[Rule, ...] = (R_CAPGE4,)
ADMITTED_CUT_MATRIX_RULES: tuple[Rule, ...] = (R_P1, R_P2)
CANDIDATE_RULES: tuple[Rule, ...] = ()
ALL_RULES: tuple[Rule, ...] = (R_CIRC2, R_FIBER4, R_CAPGE4, R_P1, R_P2)


def apply_rule(rule: Rule, obj: Any) -> bool:
    """Evaluate one rule's predicate, hard-refusing non-ADMITTED rules.

    This is the single enforcement point for "ONLY ADMITTED rules may
    prune": the check is an ``assert`` (a hard invariant), not a
    caller-supplied config flag, per spec section 3.
    """

    assert rule.status == ADMITTED, (
        f"pruning engine hard-refuses to consult CANDIDATE rule {rule.id!r}; "
        "CANDIDATE rules may never be consulted for pruning (spec section 3)"
    )
    return rule.predicate(obj)


def prune_node(
    node: Node, rules: tuple[Rule, ...] = ADMITTED_RULES
) -> PruneResult:
    """Run ``node`` through ``rules`` (default: the fixed ADMITTED bank).

    Every rule consulted must be ADMITTED and node-domain; both are
    hard-refused (``assert``) rather than silently filtered, so passing a
    CANDIDATE or cell-domain rule here raises immediately instead of
    being quietly skipped.
    """

    fired: list[str] = []
    fired_hypotheses: set[str] = set()
    for rule in rules:
        assert rule.domain == "node", (
            f"prune_node hard-refuses non-node-domain rule {rule.id!r} "
            f"(domain={rule.domain!r})"
        )
        if apply_rule(rule, node):
            fired.append(rule.id)
            fired_hypotheses.update(rule.hypotheses)
    return PruneResult(
        pruned=bool(fired), fired=tuple(fired), hypotheses=frozenset(fired_hypotheses)
    )


def prune_cut_matrix(
    matrix: _CutMatrix, rules: tuple[Rule, ...] = ADMITTED_CUT_MATRIX_RULES
) -> PruneResult:
    """Run a C2-read same-distance cut matrix through ``rules`` (default:
    the fixed ADMITTED cut-matrix bank).  Mirrors ``prune_node`` with the
    same hard-refusal asserts: every rule consulted must be ADMITTED and
    cut-matrix-domain (spec section 4.4).  The caller owns the matrix
    semantics -- convex position, arc contiguity, C2 orientation, and
    one common distance across all 1-cells (see the R-P1/R-P2 block
    comment above).
    """

    fired: list[str] = []
    fired_hypotheses: set[str] = set()
    for rule in rules:
        assert rule.domain == "cut-matrix", (
            f"prune_cut_matrix hard-refuses non-cut-matrix-domain rule "
            f"{rule.id!r} (domain={rule.domain!r})"
        )
        if apply_rule(rule, matrix):
            fired.append(rule.id)
            fired_hypotheses.update(rule.hypotheses)
    return PruneResult(
        pruned=bool(fired), fired=tuple(fired), hypotheses=frozenset(fired_hypotheses)
    )


def prune_annotated_node(
    anode: Any, rules: tuple[Rule, ...] = ADMITTED_ANNOTATED_RULES
) -> PruneResult:
    """Run ``anode`` (an ``AnnotatedNode``) through ``rules`` (default: the
    fixed ADMITTED annotated-node bank).  Mirrors ``prune_node`` with the
    same hard-refusal asserts: every rule consulted must be ADMITTED and
    annotated-node-domain (spec section 4.3).

    R-FIBER4 special case (spec section 4.1): its defensive node-form
    predicate is provably False for every constructible ``AnnotatedNode``
    (B1 is enforced at ``BlockerAnnotation`` construction).  If it ever
    returns True anyway, that is a bug in the annotation code, not a
    legitimate prune -- this function raises
    ``FiberDefensivePredicateFired`` instead of recording a fired rule.
    """

    fired: list[str] = []
    fired_hypotheses: set[str] = set()
    for rule in rules:
        assert rule.domain == "annotated-node", (
            f"prune_annotated_node hard-refuses non-annotated-node-domain "
            f"rule {rule.id!r} (domain={rule.domain!r})"
        )
        if apply_rule(rule, anode):
            if rule.id == "R-FIBER4":
                raise FiberDefensivePredicateFired(
                    "R-FIBER4's defensive node-form predicate fired on an "
                    f"AnnotatedNode (digest={anode.digest()!r}); by the "
                    "section-4.1 mini-lemma this is provably impossible "
                    "for a B1-valid annotation, so this indicates a bug in "
                    "the annotation code, not a legitimate prune."
                )
            fired.append(rule.id)
            fired_hypotheses.update(rule.hypotheses)
    return PruneResult(
        pruned=bool(fired), fired=tuple(fired), hypotheses=frozenset(fired_hypotheses)
    )
