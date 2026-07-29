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
(cell-domain: R-CAPGE4), plus ``ALL_RULES`` -- a single registry of
every rule (all now ADMITTED) used for the rule-bank hash
(``iterate.py``'s ``rule_bank_hash``).  ``CANDIDATE_RULES`` is now empty
-- the only remaining CANDIDATE-refusal test uses a synthetic rule
(``R-TEST-CANDIDATE``) that lives entirely in ``controls.py`` (spec
section 4.3), never in this module's registries.
"""

from __future__ import annotations

from dataclasses import dataclass
from itertools import combinations
from typing import Any, Callable

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
    "R_CIRC2",
    "R_FIBER4",
    "R_CAPGE4",
    "ADMITTED_RULES",
    "ADMITTED_ANNOTATED_RULES",
    "ADMITTED_CELL_RULES",
    "CANDIDATE_RULES",
    "ALL_RULES",
    "apply_rule",
    "prune_node",
    "prune_annotated_node",
]

ADMITTED = "ADMITTED"
CANDIDATE = "CANDIDATE"
_STATUSES = (ADMITTED, CANDIDATE)
_DOMAINS = ("node", "annotated-node", "cell")


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
        "annotation EXISTENCE (every convex K4 configuration admits a "
        "B1-valid total blocker map with the intended geometric semantics), "
        "which is {{NEEDS_PROOF}} and is NOT part of this admission; "
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


ADMITTED_RULES: tuple[Rule, ...] = (R_CIRC2,)
ADMITTED_ANNOTATED_RULES: tuple[Rule, ...] = (R_FIBER4,)
ADMITTED_CELL_RULES: tuple[Rule, ...] = (R_CAPGE4,)
CANDIDATE_RULES: tuple[Rule, ...] = ()
ALL_RULES: tuple[Rule, ...] = (R_CIRC2, R_FIBER4, R_CAPGE4)


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
