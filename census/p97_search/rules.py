"""Phase-1 pruning-rule engine for the P97 counterexample search lane.

Implements ``census/p97_search/PHASE1-SPEC.md`` section 3.  A rule is
``(id, status, hypotheses, predicate, citation)``:

  - ``status in {ADMITTED, CANDIDATE}``.  ONLY ADMITTED rules may prune.
    CANDIDATE rules are implemented and unit-tested but the engine
    hard-refuses (``assert``, not a config flag) to use them in any
    pruning pass -- see ``prune_node`` / ``apply_rule`` below.
  - ``hypotheses``: a static tag tuple recorded with every pruning event.
  - ``predicate(obj) -> bool`` where True means "violates the rule =
    prune".  Rules are tagged with a ``domain`` ("node" or "cell")
    because R-CAPGE4's predicate operates on a cell descriptor, not a
    node (spec section 3).

Phase-1 ADMITTED rules: R-CIRC2 only.
Phase-1 CANDIDATE rules: R-FIBER4 (NotImplementedError scaffold, no
blocker data exists on the Phase-1 node), R-CAPGE4 (cell-descriptor cap
floor, pending the closed-vs-strict-cap audit).
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
    "r_circ2_predicate",
    "r_fiber4_predicate",
    "r_capge4_predicate",
    "R_CIRC2",
    "R_FIBER4",
    "R_CAPGE4",
    "ADMITTED_RULES",
    "CANDIDATE_RULES",
    "apply_rule",
    "prune_node",
]

ADMITTED = "ADMITTED"
CANDIDATE = "CANDIDATE"
_STATUSES = (ADMITTED, CANDIDATE)


@dataclass(frozen=True)
class Rule:
    id: str
    status: str
    hypotheses: tuple[str, ...]
    predicate: Callable[[Any], bool]
    citation: str
    domain: str = "node"  # "node" or "cell"

    def __post_init__(self) -> None:
        if self.status not in _STATUSES:
            raise ValueError(f"rule {self.id!r} has unknown status {self.status!r}")
        if self.domain not in ("node", "cell"):
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
# R-FIBER4 (CANDIDATE).  Phase-2 placeholder over blocker-map annotations;
# the Phase-1 Node carries no blocker data (spec section 1: "NO blocker
# map in the Phase-1 node"), so the predicate is an intentional stub.
# ---------------------------------------------------------------------------


def r_fiber4_predicate(node: Node) -> bool:
    """Phase-2 stub: no blocker annotation exists on a Phase-1 Node."""

    raise NotImplementedError(
        "R-FIBER4 is a Phase-2 placeholder over blocker-map fiber data; "
        "the Phase-1 census node has no blocker annotation (design doc "
        "section 6: fiber <= 4 is derivable in one step from an "
        "N8ApexArcWitness-style apparatus but is not banked as a numeric "
        "cap and requires blocker data this node does not carry)."
    )


R_FIBER4 = Rule(
    id="R-FIBER4",
    status=CANDIDATE,
    hypotheses=("blocker-annotated",),
    predicate=r_fiber4_predicate,
    citation=(
        "design doc docs/p97-counterexample-search-design-2026-07-28.md "
        "section 6, 'Blocker fibers' paragraph: x in Sigma(c(x)) and "
        "|Sigma(c)| = 4 exactly give fiber(c) <= 4, but admission requires "
        "proving that mini-lemma over blocker data, which the Phase-1 "
        "node does not carry. PHASE1-SPEC.md section 3 (R-FIBER4)."
    ),
    domain="node",
)


# ---------------------------------------------------------------------------
# R-CAPGE4 (CANDIDATE).  Profile floor: in a (k=4, n, profile) cell, every
# closed cap size >= 4.  Predicate operates on the Cell descriptor, not a
# Node.  CANDIDATE pending orchestrator audit of capTriple_caps_card_ge_four
# (closed vs strict caps unresolved) -- banked-pruning-inventory.md row 8.
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
    status=CANDIDATE,
    hypotheses=("k=4", "profiled"),
    predicate=r_capge4_predicate,
    citation=(
        "Problem97.U1OppositeCapLowerBounds.capTriple_caps_card_ge_four "
        "(lean/Erdos9796Proof/P97/U1OppositeCapLowerBounds.lean:446): "
        "given CapTriple, convexity, non-collinear, K4, "
        "CircumscribedMECPacket => all three caps have >= 4 points. "
        "CANDIDATE pending orchestrator audit: closed vs strict caps "
        "unresolved (banked-pruning-inventory.md row 8). "
        "PHASE1-SPEC.md section 3 (R-CAPGE4)."
    ),
    domain="cell",
)


ADMITTED_RULES: tuple[Rule, ...] = (R_CIRC2,)
CANDIDATE_RULES: tuple[Rule, ...] = (R_FIBER4, R_CAPGE4)


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
