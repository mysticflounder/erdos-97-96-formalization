"""Pure conditional diagnostic for the exact-five hard source-swap residual.

This module deliberately does not invoke a solver.  It enumerates source-mapped
direct/mirror boundary cells, constructs exact rational row equalities and the
two strict Kalmanson forms for every ordered quadruple, and exposes replay
functions for later model and cancellation-certificate artifacts.  A separate
branch-4 API enumerates source-entitled equality partitions without constructing
any boundary order or linear constraint.

The v1 cells collapse the live surplus apex ``U`` onto the critical blocker
``c1`` and assume every remaining role symbol denotes a distinct point.  The
source proves neither condition, so these cells do not cover a live branch.
Their immediate zero Kalmanson form is retained as a regression for this
conditional collapse, not as closure evidence.
"""

from __future__ import annotations

import hashlib
import itertools
import json
import math
from collections.abc import Iterable, Iterator, Mapping, Sequence
from dataclasses import dataclass
from fractions import Fraction
from typing import Any, Literal

SCHEMA = "p97-exactfive-c1-surplus-apex-collapse-order-equality/v1"
CELL_SCHEMA = "p97-exactfive-c1-surplus-apex-collapse-order-cell/v1"
QUOTIENT_SCHEMA = "p97-exactfive-c1-surplus-apex-collapse-row-symmetry/v1"
ALIAS_PROFILE_SCHEMA = "p97-exactfive-branch4-source-alias-profile/v1"
SEMANTIC_STATUS = "conditional_diagnostic_c1_eq_surplusApex_globally_distinct"
PROMOTION_ELIGIBLE = False
FALSE_CLAIMS = {
    "lean_theorem": False,
    "rank3_closure": False,
    "euclidean_realizability": False,
    "source_ingress": False,
    "coverage": False,
    "solver_verdict": False,
    "promotion": False,
    "complete_live_branch_census": False,
}

BRANCH_FOUR = "firstCenter_not_mem_secondRow"
BRANCH_THREE = "robustCenter_not_mem_secondRow"
BRANCH_ORDER = (BRANCH_FOUR, BRANCH_THREE)
ORIENTATIONS = ("direct", "mirror")
BLOCKS = ("oppInterior1", "surplusInterior", "oppInterior2")
LIVE_SEPARATOR_ROLES = ("U", "O", "c2")
COLLAPSED_SEPARATOR_ROLES = ("O", "c1", "c2")
BRANCH_FOUR_SYMMETRY_GROUPS = (
    ("p", "q"),
    ("s", "t"),
    ("u", "v"),
    ("x", "y"),
)

ALIAS_COLLAPSED = "c1_eq_surplusApex"
ALIAS_SEPARATE = "c1_ne_surplusApex"
ALIAS_REGIMES = (ALIAS_COLLAPSED, ALIAS_SEPARATE)
ALIAS_ROLES = (
    "U",
    "O",
    "c1",
    "c2",
    "a",
    "d",
    "p",
    "q",
    "s",
    "t",
    "u",
    "v",
    "e",
    "x",
    "y",
)
_P_ROLES = ("p", "q")
_S_ROLES = ("s", "t")
_V_ROLES = ("u", "v")
_REPLACEMENT_EXTRAS = ("e", "x", "y")
_BASE_ALIAS_ROLES = (*_P_ROLES, *_S_ROLES, *_V_ROLES)
_PRE_REPLACEMENT_ROLES = tuple(
    role for role in ALIAS_ROLES if role not in _REPLACEMENT_EXTRAS
)

type Edge = tuple[str, str]


class HardSourceSwapGridError(ValueError):
    """The order cell, exact valuation, or replay certificate is malformed."""


def _edge(left: str, right: str) -> Edge:
    if left == right:
        raise HardSourceSwapGridError("a distance edge needs two distinct roles")
    return tuple(sorted((left, right)))  # type: ignore[return-value]


def edge_name(edge: Edge) -> str:
    return "--".join(edge)


def _canonical_json_bytes(value: Any) -> bytes:
    return json.dumps(value, sort_keys=True, separators=(",", ":")).encode()


def _sha256_json(value: Any) -> str:
    return hashlib.sha256(_canonical_json_bytes(value)).hexdigest()


def _fraction_payload(value: Fraction) -> str:
    return str(value.numerator) if value.denominator == 1 else str(value)


def parse_fraction(value: int | str | Fraction) -> Fraction:
    if isinstance(value, Fraction):
        return value
    if isinstance(value, (int, str)):
        return Fraction(value)
    raise HardSourceSwapGridError(f"not an exact rational: {value!r}")


@dataclass(frozen=True)
class SignedForm:
    """A canonical exact linear form in undirected distance symbols."""

    terms: tuple[tuple[Edge, Fraction], ...]

    @classmethod
    def make(
        cls, terms: Iterable[tuple[Edge, int | str | Fraction]]
    ) -> SignedForm:
        combined: dict[Edge, Fraction] = {}
        for raw_edge, raw_coefficient in terms:
            edge = _edge(*raw_edge)
            combined[edge] = combined.get(edge, Fraction()) + parse_fraction(
                raw_coefficient
            )
        return cls(
            tuple(
                (edge, coefficient)
                for edge, coefficient in sorted(combined.items())
                if coefficient
            )
        )

    @classmethod
    def distance_difference(
        cls, left: Edge, right: Edge
    ) -> SignedForm:
        return cls.make(((left, 1), (right, -1)))

    def scale(self, coefficient: int | str | Fraction) -> SignedForm:
        factor = parse_fraction(coefficient)
        return SignedForm.make((edge, factor * value) for edge, value in self.terms)

    def plus(self, other: SignedForm) -> SignedForm:
        return SignedForm.make((*self.terms, *other.terms))

    def evaluate(self, values: Mapping[Edge, Fraction]) -> Fraction:
        try:
            return sum(
                (coefficient * values[edge] for edge, coefficient in self.terms),
                Fraction(),
            )
        except KeyError as exc:
            raise HardSourceSwapGridError(
                f"missing distance value for {edge_name(exc.args[0])}"
            ) from exc

    def payload(self) -> list[dict[str, str]]:
        return [
            {"edge": edge_name(edge), "coefficient": _fraction_payload(coefficient)}
            for edge, coefficient in self.terms
        ]


ConstraintKind = Literal["equality", "strict"]


@dataclass(frozen=True)
class LinearConstraint:
    """An equality ``form = 0`` or strict inequality ``form > 0``."""

    constraint_id: str
    kind: ConstraintKind
    form: SignedForm
    source: str

    def payload(self) -> dict[str, Any]:
        return {
            "constraint_id": self.constraint_id,
            "kind": self.kind,
            "form": self.form.payload(),
            "source": self.source,
        }


@dataclass(frozen=True)
class CircleRow:
    name: str
    center: str
    support: tuple[str, ...]
    source: str


@dataclass(frozen=True)
class DistanceDisequality:
    left: Edge
    right: Edge
    source: str


@dataclass(frozen=True)
class BranchProfile:
    constructor: str
    roles: tuple[str, ...]
    rows: tuple[CircleRow, ...]
    fixed_blocks: tuple[tuple[str, tuple[str, ...]], ...]
    unresolved_roles: tuple[str, ...]
    omissions: tuple[str, ...]
    assumptions: tuple[str, ...]
    distance_disequalities: tuple[DistanceDisequality, ...]
    diagnostic_subcase: str

    def block_map(self) -> dict[str, tuple[str, ...]]:
        return dict(self.fixed_blocks)


COMMON_ROWS = (
    CircleRow(
        "T0",
        "O",
        ("a", "d", "c1", "p", "q"),
        "Problem97.FirstApexUniqueRadiusResidual."
        "FirstApexUniqueRadiusExactFiveDistinctObstructionCentersResidual."
        "class_card_eq_five + Problem97.ExactFiveDistinctThreeCenterContinuation."
        "ExactFiveDistinctThreeCenterNormalForm.firstApexClass_support_eq + "
        "unproved named-support identification",
    ),
    CircleRow(
        "K1",
        "c1",
        ("O", "a", "s", "t"),
        "Problem97.ExactFiveDistinctThreeCenterContinuation."
        "ExactFiveDistinctThreeCenterNormalForm.blockerClass",
    ),
)

BRANCH_FOUR_COLLAPSED_PROFILE = BranchProfile(
    constructor=BRANCH_FOUR,
    roles=("O", "c1", "c2", "a", "d", "e", "p", "q", "s", "t", "u", "v", "x", "y"),
    rows=COMMON_ROWS
    + (
        CircleRow(
            "K2",
            "c2",
            ("O", "a", "u", "v"),
            "Problem97.ExactFiveDistinctThreeCenterContinuation."
            "ExactFiveDistinctThreeCenterNormalForm.secondApexClass",
        ),
        CircleRow(
            "L",
            "c2",
            ("d", "e", "x", "y"),
            "Problem97.ExactFiveDistinctSecondApexSourceSwap."
            "ExactFiveDistinctSecondApexHardSourceSwap.replacement",
        ),
    ),
    fixed_blocks=(
        ("oppInterior1", ("a", "d")),
        ("surplusInterior", ("e",)),
        ("oppInterior2", ("u", "v", "x", "y")),
    ),
    unresolved_roles=("p", "q", "s", "t"),
    omissions=("c1 ∉ K2", "c1 ∉ L"),
    assumptions=(
        "conditional collapse c1 = U, where U is the surplus apex",
        "all displayed role symbols are globally distinct after that collapse",
        "a,d lie in oppInterior1",
        "e lies in the surplus adjacent interior",
        "u,v,x,y lie in oppInterior2",
        "K2 and L are full disjoint c2 classes at distinct positive radii",
    ),
    distance_disequalities=(
        DistanceDisequality(
            _edge("c2", "O"),
            _edge("c2", "d"),
            "ExactFiveDistinctSecondApexHardSourceSwap.radii_ne",
        ),
    ),
    diagnostic_subcase="c1 = U (surplus apex), with all displayed symbols distinct after collapse",
)

BRANCH_THREE_COLLAPSED_PROFILE = BranchProfile(
    constructor=BRANCH_THREE,
    roles=("O", "c1", "c2", "a", "d", "e", "p", "q", "s", "t", "u", "v", "w", "x", "y"),
    rows=COMMON_ROWS
    + (
        CircleRow(
            "K2",
            "c2",
            ("a", "u", "v", "w"),
            "Problem97.ExactFiveDistinctThreeCenterContinuation."
            "ExactFiveDistinctThreeCenterNormalForm.secondApexClass",
        ),
        CircleRow(
            "L",
            "c2",
            ("d", "e", "x", "y"),
            "Problem97.ExactFiveDistinctSecondApexSourceSwap."
            "ExactFiveDistinctSecondApexHardSourceSwap.replacement",
        ),
    ),
    fixed_blocks=(("oppInterior1", ("a", "d")), ("surplusInterior", ()), ("oppInterior2", ())),
    unresolved_roles=("e", "p", "q", "s", "t", "u", "v", "w", "x", "y"),
    omissions=("O ∉ K2",),
    assumptions=(
        "conditional collapse c1 = U, where U is the surplus apex",
        "all displayed role symbols are globally distinct after that collapse",
        "a,d lie in oppInterior1",
        "K2 and L are full disjoint c2 classes at distinct positive radii",
        "no exact-grid adjacent-cap identification is assumed",
    ),
    distance_disequalities=(
        DistanceDisequality(
            _edge("c2", "a"),
            _edge("c2", "d"),
            "ExactFiveDistinctSecondApexHardSourceSwap.radii_ne",
        ),
    ),
    diagnostic_subcase="c1 = U (surplus apex), with all displayed symbols distinct after collapse",
)

PROFILES = {
    BRANCH_FOUR: BRANCH_FOUR_COLLAPSED_PROFILE,
    BRANCH_THREE: BRANCH_THREE_COLLAPSED_PROFILE,
}

STRICT_KALMANSON_SOURCES = (
    "Problem97.CapCrossingKalmansonBridge.dist_add_dist_lt_diagonal_sum_of_ccw",
    "Problem97.CapCrossingKalmansonBridge.complementary_dist_add_dist_lt_diagonal_sum_of_ccw",
)

SOURCE_CLAUSE_LEDGER: tuple[dict[str, Any], ...] = (
    {
        "family": "branch-constructor",
        "status": "proved-source",
        "sources": [
            "Problem97.ATailFrontierLiveClosure.RobustApexFourIncidenceContinuation.firstCenter_not_mem_secondRow",
            "Problem97.ATailFrontierLiveClosure.RobustApexFourIncidenceContinuation.robustCenter_not_mem_secondRow",
        ],
    },
    {
        "family": "hard-source-swap",
        "status": "local-formalization-in-progress",
        "sources": [
            "Problem97.ExactFiveDistinctSecondApexSourceSwap.ExactFiveDistinctSecondApexHardSourceSwap",
            "Problem97.ExactFiveDistinctSecondApexSourceSwap.exactFiveDistinct_secondApex_physical_or_hardSourceSwap",
        ],
    },
    {
        "family": "branch-four-source-alias-constraints",
        "status": "proved-source-modeled-by-alias-profiler",
        "sources": [
            "firstCenter_not_mem_secondRow",
            "hard-source-swap support disjointness and named row support facts",
            (
                "Problem97.ExactFiveDistinctSecondApexSourceSwapCyclic."
                "HardSourceSwapExactGridRoles"
            ),
        ],
        "note": (
            "the alias profiler enforces c1 ∉ L, K1 ∩ K2 = {O,a}, "
            "the c2 host exclusions, U distinct from u,v,e,x,y, and "
            "distinctness inside each named row; it does not choose a cyclic order"
        ),
    },
    {
        "family": "direct-mirror-cap-blocks",
        "status": "documented-abstraction-assumption",
        "sources": [
            "Problem97.Census554.ZeroCutBoundaryIndexing.exists_with_capBlocks"
        ],
        "note": (
            "ZeroCutBoundaryIndexing orders U,O,c2; this conditional profile "
            "identifies the live blocker c1 with the surplus apex U"
        ),
    },
    {
        "family": "strict-kalmanson",
        "status": "proved-generic-source",
        "sources": list(STRICT_KALMANSON_SOURCES),
    },
)

UNPROVED_ABSTRACTION_ASSUMPTIONS: tuple[dict[str, Any], ...] = (
    {
        "assumption_id": "first-blocker-equals-surplus-apex",
        "scope": "conditional-collapsed-order-cells",
        "branches": list(BRANCH_ORDER),
        "content": "c1 = U, where U is the surplus apex separator",
        "enforced": False,
        "note": "the live source supplies c1 as a critical blocker, not as U",
    },
    {
        "assumption_id": "named-row-supports",
        "scope": "conditional-collapsed-order-cells",
        "branches": list(BRANCH_ORDER),
        "content": (
            "the abstract role names identify the displayed T0, K1, K2, and L "
            "supports; in particular e,x,y name the three non-d points of L"
        ),
        "enforced": False,
    },
    {
        "assumption_id": "replacement-cap-blocks",
        "scope": "conditional-collapsed-order-cells",
        "branches": [BRANCH_FOUR],
        "content": "e is in surplusInterior and x,y are in oppInterior2",
        "enforced": False,
    },
    {
        "assumption_id": "named-role-distinctness",
        "scope": "conditional-collapsed-order-cells",
        "branches": list(BRANCH_ORDER),
        "content": (
            "after collapsing U onto c1, all displayed role names denote "
            "pairwise distinct carrier points"
        ),
        "enforced": False,
        "note": (
            "cell validation checks symbols; live row supports may overlap, and "
            "their cross-row alias partitions are absent from this profile"
        ),
    },
    {
        "assumption_id": "cross-row-alias-partition-is-discrete",
        "scope": "conditional-collapsed-order-cells",
        "branches": list(BRANCH_ORDER),
        "content": "distinct row supports share only the roles displayed with the same name",
        "enforced": False,
        "note": "the live source permits additional overlap between row supports",
    },
    {
        "assumption_id": "full-selected-classes",
        "scope": "conditional-collapsed-order-cells",
        "branches": list(BRANCH_ORDER),
        "content": "K2 and L are the full selected classes at their radii",
        "enforced": False,
        "note": "the current system asserts their internal row equalities only",
    },
)


AliasRegime = Literal["c1_eq_surplusApex", "c1_ne_surplusApex"]


@dataclass(frozen=True)
class SourceAliasProfile:
    """One source-entitled equality partition before any cyclic-order choice."""

    regime: AliasRegime
    p_s_matching: tuple[tuple[str, str], ...]
    p_u_matching: tuple[tuple[str, str], ...]
    c2_host: tuple[str, ...] | None
    surplus_apex_host: tuple[str, ...] | None
    replacement_hosts: tuple[tuple[str, tuple[str, ...] | None], ...]
    classes: tuple[tuple[str, ...], ...]

    def payload(self) -> dict[str, Any]:
        body = {
            "schema": ALIAS_PROFILE_SCHEMA,
            "regime": self.regime,
            "p_s_matching": [list(pair) for pair in self.p_s_matching],
            "p_u_matching": [list(pair) for pair in self.p_u_matching],
            "c2_host": None if self.c2_host is None else list(self.c2_host),
            "surplus_apex_host": (
                None
                if self.surplus_apex_host is None
                else list(self.surplus_apex_host)
            ),
            "replacement_hosts": [
                {"role": role, "host": None if host is None else list(host)}
                for role, host in self.replacement_hosts
            ],
            "classes": [list(klass) for klass in self.classes],
            "claim_boundary": "source_alias_only_no_order_or_live_coverage",
        }
        return {**body, "profile_sha256": _sha256_json(body)}

    @property
    def profile_id(self) -> str:
        return self.payload()["profile_sha256"]


def _small_matchings(
    left: Sequence[str], right: Sequence[str]
) -> Iterator[tuple[tuple[str, str], ...]]:
    """The empty matching and every one-edge matching, in stable order."""

    yield ()
    for first in left:
        for second in right:
            yield ((first, second),)


def _canonical_partition(
    roles: Sequence[str], unions: Iterable[tuple[str, str]]
) -> tuple[tuple[str, ...], ...]:
    rank = {role: index for index, role in enumerate(ALIAS_ROLES)}
    parent = {role: role for role in roles}

    def find(role: str) -> str:
        if parent[role] != role:
            parent[role] = find(parent[role])
        return parent[role]

    for left, right in unions:
        left_root, right_root = find(left), find(right)
        if left_root != right_root:
            if rank[left_root] < rank[right_root]:
                parent[right_root] = left_root
            else:
                parent[left_root] = right_root
    classes: dict[str, list[str]] = {}
    for role in roles:
        classes.setdefault(find(role), []).append(role)
    canonical = [tuple(sorted(klass, key=rank.__getitem__)) for klass in classes.values()]
    return tuple(sorted(canonical, key=lambda klass: tuple(rank[role] for role in klass)))


def _class_map(classes: Sequence[tuple[str, ...]]) -> dict[str, tuple[str, ...]]:
    return {role: klass for klass in classes for role in klass}


def _eligible_c2_hosts(
    base_classes: Sequence[tuple[str, ...]],
) -> tuple[tuple[str, ...], ...]:
    return tuple(
        klass
        for klass in base_classes
        if set(klass) & {*_P_ROLES, *_S_ROLES}
        and not set(klass) & set(_V_ROLES)
    )


def _eligible_replacement_hosts(
    classes: Sequence[tuple[str, ...]],
) -> tuple[tuple[str, ...], ...]:
    forbidden = {"U", "c1", "O", "a", "u", "v", "c2", "d"}
    entitled = {*_P_ROLES, *_S_ROLES}
    return tuple(
        klass
        for klass in classes
        if not set(klass) & forbidden and set(klass) & entitled
    )


def _replacement_host_assignments(
    eligible: Sequence[tuple[str, ...]],
) -> Iterator[tuple[tuple[str, tuple[str, ...] | None], ...]]:
    options: tuple[tuple[str, ...] | None, ...] = (None, *eligible)
    for choices in itertools.product(options, repeat=len(_REPLACEMENT_EXTRAS)):
        concrete = [host for host in choices if host is not None]
        if len(concrete) != len(set(concrete)):
            continue
        yield tuple(zip(_REPLACEMENT_EXTRAS, choices, strict=True))


def iter_source_alias_profiles(
    regime: AliasRegime | None = None,
) -> Iterator[SourceAliasProfile]:
    """Enumerate corrected branch-4 alias partitions without constructing orders."""

    regimes = ALIAS_REGIMES if regime is None else (regime,)
    if any(item not in ALIAS_REGIMES for item in regimes):
        raise HardSourceSwapGridError(f"unknown alias regime: {regime}")
    for p_s_matching in _small_matchings(_P_ROLES, _S_ROLES):
        for p_u_matching in _small_matchings(_P_ROLES, _V_ROLES):
            if {pair[0] for pair in p_s_matching} & {
                pair[0] for pair in p_u_matching
            }:
                continue
            base_unions = (*p_s_matching, *p_u_matching)
            base_classes = _canonical_partition(_BASE_ALIAS_ROLES, base_unions)
            c2_options: tuple[tuple[str, ...] | None, ...] = (
                None,
                *_eligible_c2_hosts(base_classes),
            )
            for c2_host in c2_options:
                for current_regime in regimes:
                    if current_regime == ALIAS_COLLAPSED:
                        surplus_options: tuple[tuple[str, ...] | None, ...] = (
                            ("c1",),
                        )
                    else:
                        surplus_options = (
                            None,
                            *(
                                klass
                                for klass in base_classes
                                if klass != c2_host
                                and not set(klass) & set(_V_ROLES)
                            ),
                        )
                    for surplus_host in surplus_options:
                        pre_unions: list[tuple[str, str]] = list(base_unions)
                        if c2_host is not None:
                            pre_unions.extend(("c2", role) for role in c2_host)
                        if current_regime == ALIAS_COLLAPSED:
                            pre_unions.append(("U", "c1"))
                        elif surplus_host is not None:
                            pre_unions.extend(("U", role) for role in surplus_host)
                        pre_classes = _canonical_partition(
                            _PRE_REPLACEMENT_ROLES, pre_unions
                        )
                        eligible = _eligible_replacement_hosts(pre_classes)
                        for replacement_hosts in _replacement_host_assignments(eligible):
                            final_unions = list(pre_unions)
                            for replacement, host in replacement_hosts:
                                if host is not None:
                                    final_unions.append((replacement, host[0]))
                            profile = SourceAliasProfile(
                                regime=current_regime,  # type: ignore[arg-type]
                                p_s_matching=p_s_matching,
                                p_u_matching=p_u_matching,
                                c2_host=c2_host,
                                surplus_apex_host=surplus_host,
                                replacement_hosts=replacement_hosts,
                                classes=_canonical_partition(ALIAS_ROLES, final_unions),
                            )
                            validate_source_alias_profile(profile)
                            yield profile


def validate_source_alias_profile(profile: SourceAliasProfile) -> None:
    flattened = [role for klass in profile.classes for role in klass]
    if sorted(flattened) != sorted(ALIAS_ROLES) or len(flattened) != len(set(flattened)):
        raise HardSourceSwapGridError("alias classes do not partition the source roles")
    class_edges = itertools.chain.from_iterable(
        itertools.combinations(klass, 2) for klass in profile.classes
    )
    if profile.classes != _canonical_partition(ALIAS_ROLES, class_edges):
        raise HardSourceSwapGridError("alias classes are not in canonical order")
    classes = _class_map(profile.classes)

    def same(left: str, right: str) -> bool:
        return classes[left] == classes[right]

    if profile.regime == ALIAS_COLLAPSED:
        if profile.surplus_apex_host != ("c1",):
            raise HardSourceSwapGridError("collapsed surplus-apex host record is inconsistent")
        if not same("c1", "U") or classes["c1"] != ("U", "c1"):
            raise HardSourceSwapGridError("collapsed regime must identify exactly U and c1")
    elif profile.regime == ALIAS_SEPARATE:
        if same("c1", "U"):
            raise HardSourceSwapGridError("separate regime must keep U distinct from c1")
        surplus_others = tuple(
            role
            for role in classes["U"]
            if role != "U" and role not in _REPLACEMENT_EXTRAS
        )
        expected_surplus = (
            ()
            if profile.surplus_apex_host is None
            else profile.surplus_apex_host
        )
        if surplus_others != expected_surplus:
            raise HardSourceSwapGridError("surplus-apex host record is inconsistent")
        if set(surplus_others) - set(_BASE_ALIAS_ROLES):
            raise HardSourceSwapGridError("surplus apex has a non-source host")
        if set(surplus_others) & set(_V_ROLES):
            raise HardSourceSwapGridError("surplus apex cannot host a u/v class")
    else:
        raise HardSourceSwapGridError("unknown alias regime")

    distinct_groups = (
        ("O", "a", "d", "c1", "p", "q"),
        ("c1", "O", "a", "s", "t"),
        ("c2", "O", "a", "u", "v"),
        ("c2", "d", "e", "x", "y"),
        ("O", "c1", "c2"),
        ("U", "O", "c2"),
        ("U", "u", "v", "e", "x", "y"),
    )
    for group in distinct_groups:
        if len({classes[role] for role in group}) != len(group):
            raise HardSourceSwapGridError(f"source-distinct group collapsed: {group}")
    for old in ("O", "a", "u", "v"):
        for replacement in ("d", "e", "x", "y"):
            if same(old, replacement):
                raise HardSourceSwapGridError("K2 and L must be disjoint")
    if any(same("c1", role) for role in ("d", "e", "x", "y")):
        raise HardSourceSwapGridError("proved c1-not-in-L constraint failed")
    if any(same("c1", role) for role in ("O", "a", "u", "v")):
        raise HardSourceSwapGridError("branch c1-not-in-K2 constraint failed")

    observed_ps = tuple(
        (left, right)
        for left in _P_ROLES
        for right in _S_ROLES
        if same(left, right)
    )
    observed_pu = tuple(
        (left, right)
        for left in _P_ROLES
        for right in _V_ROLES
        if same(left, right)
    )
    if observed_ps != profile.p_s_matching or len(observed_ps) > 1:
        raise HardSourceSwapGridError("p/q-to-s/t matching record is inconsistent")
    if observed_pu != profile.p_u_matching or len(observed_pu) > 1:
        raise HardSourceSwapGridError("p/q-to-u/v matching record is inconsistent")
    if any(same(left, right) for left in _S_ROLES for right in _V_ROLES):
        raise HardSourceSwapGridError("K1 intersection K2 must be exactly O,a")

    c2_others = tuple(role for role in classes["c2"] if role != "c2")
    if c2_others != (() if profile.c2_host is None else profile.c2_host):
        raise HardSourceSwapGridError("c2 host record is inconsistent")
    if c2_others and not set(c2_others) & {*_P_ROLES, *_S_ROLES}:
        raise HardSourceSwapGridError("c2 host must be a p/q/s/t equivalence class")
    if set(c2_others) & set(_V_ROLES):
        raise HardSourceSwapGridError("c2 cannot host a class containing u/v")

    if tuple(role for role, _host in profile.replacement_hosts) != _REPLACEMENT_EXTRAS:
        raise HardSourceSwapGridError("replacement-host records are not canonical")
    for replacement, host in profile.replacement_hosts:
        other_roles = tuple(role for role in classes[replacement] if role != replacement)
        expected = () if host is None else host
        if other_roles != expected:
            raise HardSourceSwapGridError("replacement-host record is inconsistent")
        if set(other_roles) - {*_P_ROLES, *_S_ROLES}:
            raise HardSourceSwapGridError("replacement extra has a forbidden alias")
        if other_roles and not set(other_roles) & {*_P_ROLES, *_S_ROLES}:
            raise HardSourceSwapGridError("replacement extra lacks a source-entitled host")


def source_alias_profile_counts() -> dict[str, int]:
    counts = {regime: 0 for regime in ALIAS_REGIMES}
    for profile in iter_source_alias_profiles():
        counts[profile.regime] += 1
    counts["total"] = sum(counts.values())
    return counts


def profile_for(branch: str) -> BranchProfile:
    try:
        return PROFILES[branch]
    except KeyError as exc:
        raise HardSourceSwapGridError(f"unknown branch profile: {branch}") from exc


@dataclass(frozen=True)
class OrderCell:
    branch: str
    orientation: Literal["direct", "mirror"]
    blocks: tuple[tuple[str, tuple[str, ...]], ...]
    order: tuple[str, ...]

    def payload(self) -> dict[str, Any]:
        body = {
            "schema": CELL_SCHEMA,
            "branch": self.branch,
            "orientation": self.orientation,
            "blocks": {name: list(roles) for name, roles in self.blocks},
            "order": list(self.order),
        }
        return {**body, "cell_sha256": _sha256_json(body)}

    @property
    def cell_id(self) -> str:
        return self.payload()["cell_sha256"][:20]


def validate_cell(cell: OrderCell) -> None:
    profile = profile_for(cell.branch)
    if cell.orientation not in ORIENTATIONS:
        raise HardSourceSwapGridError("orientation must be direct or mirror")
    blocks = dict(cell.blocks)
    if tuple(blocks) != BLOCKS:
        raise HardSourceSwapGridError("cell blocks are not in canonical order")
    interior = tuple(itertools.chain.from_iterable(blocks.values()))
    if len(interior) != len(set(interior)):
        raise HardSourceSwapGridError("a role appears in more than one cap block")
    if set(interior) | set(COLLAPSED_SEPARATOR_ROLES) != set(profile.roles):
        raise HardSourceSwapGridError("cell does not place every profile role exactly once")
    for block, required in profile.fixed_blocks:
        if not set(required) <= set(blocks[block]):
            raise HardSourceSwapGridError(
                f"cell violates the conditional fixed membership of {block}"
            )
    expected = _order_from_blocks(cell.orientation, blocks)
    if cell.order != expected:
        raise HardSourceSwapGridError("cell order does not match its cap blocks")


def rename_cell_roles(cell: OrderCell, renaming: Mapping[str, str]) -> OrderCell:
    """Rename non-apex roles and revalidate the resulting order cell."""

    if any(role in renaming for role in COLLAPSED_SEPARATOR_ROLES):
        raise HardSourceSwapGridError("the three apex roles cannot be renamed")
    renamed = OrderCell(
        branch=cell.branch,
        orientation=cell.orientation,
        blocks=tuple(
            (name, tuple(renaming.get(role, role) for role in roles))
            for name, roles in cell.blocks
        ),
        order=tuple(renaming.get(role, role) for role in cell.order),
    )
    validate_cell(renamed)
    return renamed


def canonicalize_branch_four_collapsed_cell(cell: OrderCell) -> OrderCell:
    """Choose the orbit representative under the four row-internal swaps."""

    if cell.branch != BRANCH_FOUR:
        raise HardSourceSwapGridError("row-symmetry quotient v1 covers branch four only")
    validate_cell(cell)
    positions = {role: position for position, role in enumerate(cell.order)}
    renaming: dict[str, str] = {}
    for group in BRANCH_FOUR_SYMMETRY_GROUPS:
        encountered = sorted(group, key=positions.__getitem__)
        for old, canonical in zip(encountered, sorted(group), strict=True):
            renaming[old] = canonical
    return rename_cell_roles(cell, renaming)


def branch_four_collapsed_quotient_key(cell: OrderCell) -> str:
    canonical = canonicalize_branch_four_collapsed_cell(cell)
    payload = {
        "schema": QUOTIENT_SCHEMA,
        "symmetry_groups": [list(group) for group in BRANCH_FOUR_SYMMETRY_GROUPS],
        "canonical_cell": canonical.payload(),
    }
    return _sha256_json(payload)


def iter_branch_four_collapsed_quotient_cells(
    *, limit: int | None = None
) -> Iterator[OrderCell]:
    """Yield one canonical branch-four cell per row-internal symmetry orbit.

    This remains lazy and constructs no Kalmanson constraints.  A full traversal
    still walks the labeled generator, so reduced-constraint signature
    deduplication remains a separate launch gate.
    """

    if limit is not None and limit < 0:
        raise HardSourceSwapGridError("limit must be nonnegative")
    if limit == 0:
        return
    yielded = 0
    for cell in iter_order_cells(BRANCH_FOUR_COLLAPSED_PROFILE):
        if cell != canonicalize_branch_four_collapsed_cell(cell):
            continue
        yield cell
        yielded += 1
        if limit is not None and yielded >= limit:
            return


def branch_four_collapsed_quotient_cell_count() -> int:
    orbit_size = math.prod(
        math.factorial(len(group)) for group in BRANCH_FOUR_SYMMETRY_GROUPS
    )
    raw = order_cell_count(BRANCH_FOUR_COLLAPSED_PROFILE)
    if raw % orbit_size:
        raise AssertionError("branch-four symmetry action does not divide the cell count")
    return raw // orbit_size


def _order_from_blocks(
    orientation: str, blocks: Mapping[str, Sequence[str]]
) -> tuple[str, ...]:
    first = tuple(blocks["oppInterior1"])
    surplus = tuple(blocks["surplusInterior"])
    second = tuple(blocks["oppInterior2"])
    if orientation == "direct":
        return ("O", *second, "c2", *surplus, "c1", *first)
    if orientation == "mirror":
        return ("O", *first, "c1", *surplus, "c2", *second)
    raise HardSourceSwapGridError("orientation must be direct or mirror")


def iter_order_cells(
    profile: BranchProfile, *, limit: int | None = None
) -> Iterator[OrderCell]:
    """Yield cells complete only for the profile's conditional role universe."""

    if limit is not None and limit < 0:
        raise HardSourceSwapGridError("limit must be nonnegative")
    yielded = 0
    fixed = profile.block_map()
    for assignment in itertools.product(BLOCKS, repeat=len(profile.unresolved_roles)):
        pools = {block: list(fixed[block]) for block in BLOCKS}
        for role, block in zip(profile.unresolved_roles, assignment, strict=True):
            pools[block].append(role)
        for block_orders in _iter_block_permutations(pools):
            blocks = tuple(zip(BLOCKS, block_orders, strict=True))
            block_map = dict(blocks)
            for orientation in ORIENTATIONS:
                cell = OrderCell(
                    profile.constructor,
                    orientation,  # type: ignore[arg-type]
                    blocks,
                    _order_from_blocks(orientation, block_map),
                )
                validate_cell(cell)
                yield cell
                yielded += 1
                if limit is not None and yielded >= limit:
                    return


def _iter_block_permutations(
    pools: Mapping[str, Sequence[str]],
    index: int = 0,
    prefix: tuple[tuple[str, ...], ...] = (),
) -> Iterator[tuple[tuple[str, ...], ...]]:
    """Lazy cartesian product that does not materialize a factorial pool."""

    if index == len(BLOCKS):
        yield prefix
        return
    block = BLOCKS[index]
    for order in itertools.permutations(pools[block]):
        yield from _iter_block_permutations(pools, index + 1, (*prefix, order))


def order_cell_count(profile: BranchProfile) -> int:
    """Count a conditional profile universe without materializing its cells."""

    fixed_sizes = {block: len(profile.block_map()[block]) for block in BLOCKS}
    total = 0
    for assignment in itertools.product(BLOCKS, repeat=len(profile.unresolved_roles)):
        sizes = dict(fixed_sizes)
        for block in assignment:
            sizes[block] += 1
        total += math.prod(math.factorial(sizes[block]) for block in BLOCKS)
    return len(ORIENTATIONS) * total


def row_equalities(profile: BranchProfile) -> tuple[LinearConstraint, ...]:
    constraints: list[LinearConstraint] = []
    for row in profile.rows:
        reference = _edge(row.center, row.support[0])
        for point in row.support[1:]:
            constraints.append(
                LinearConstraint(
                    f"row:{row.name}:{row.support[0]}={point}",
                    "equality",
                    SignedForm.distance_difference(
                        _edge(row.center, point), reference
                    ),
                    row.source,
                )
            )
    return tuple(constraints)


KalmansonKind = Literal["main", "complementary"]


def kalmanson_constraint(
    kind: KalmansonKind, i: str, j: str, k: str, ell: str
) -> LinearConstraint:
    diagonal = ((_edge(i, k), 1), (_edge(j, ell), 1))
    if kind == "main":
        subtracted = ((_edge(j, k), -1), (_edge(i, ell), -1))
        source_index = 0
    elif kind == "complementary":
        subtracted = ((_edge(i, j), -1), (_edge(k, ell), -1))
        source_index = 1
    else:
        raise HardSourceSwapGridError(f"unknown Kalmanson kind: {kind}")
    return LinearConstraint(
        f"kal:{kind}:{i}:{j}:{k}:{ell}",
        "strict",
        SignedForm.make((*diagonal, *subtracted)),
        STRICT_KALMANSON_SOURCES[source_index],
    )


def kalmanson_constraints(cell: OrderCell) -> tuple[LinearConstraint, ...]:
    validate_cell(cell)
    constraints: list[LinearConstraint] = []
    for i, j, k, ell in itertools.combinations(cell.order, 4):
        constraints.append(kalmanson_constraint("main", i, j, k, ell))
        constraints.append(kalmanson_constraint("complementary", i, j, k, ell))
    return tuple(constraints)


def constraints_for_cell(cell: OrderCell) -> tuple[LinearConstraint, ...]:
    return row_equalities(profile_for(cell.branch)) + kalmanson_constraints(cell)


class _UnionFind:
    def __init__(self, labels: Iterable[Edge]) -> None:
        self.parent = {label: label for label in labels}

    def find(self, label: Edge) -> Edge:
        parent = self.parent[label]
        if parent != label:
            self.parent[label] = self.find(parent)
        return self.parent[label]

    def union(self, left: Edge, right: Edge) -> None:
        left_root, right_root = self.find(left), self.find(right)
        if left_root == right_root:
            return
        low, high = sorted((left_root, right_root))
        self.parent[high] = low


def equality_representatives(profile: BranchProfile) -> dict[Edge, Edge]:
    edges = tuple(_edge(a, b) for a, b in itertools.combinations(profile.roles, 2))
    closure = _UnionFind(edges)
    for row in profile.rows:
        reference = _edge(row.center, row.support[0])
        for point in row.support[1:]:
            closure.union(reference, _edge(row.center, point))
    return {edge: closure.find(edge) for edge in edges}


def reduce_by_row_equalities(
    profile: BranchProfile, form: SignedForm
) -> SignedForm:
    representatives = equality_representatives(profile)
    return SignedForm.make(
        (representatives[edge], coefficient) for edge, coefficient in form.terms
    )


def collapsed_surplus_apex_zero_kalmanson(cell: OrderCell) -> LinearConstraint:
    """Return the zero strict form forced by the collapsed separator order.

    This is a regression for the conditional ``c1 = U`` diagnostic, not a
    contradiction in the live branch where the blocker ``c1`` has no fixed
    separator slot.
    """

    if cell.branch != BRANCH_FOUR:
        raise HardSourceSwapGridError("zero-form regression covers branch four only")
    validate_cell(cell)
    if cell.orientation == "direct":
        constraint = kalmanson_constraint("complementary", "O", "c2", "c1", "a")
    else:
        constraint = kalmanson_constraint("main", "O", "a", "c1", "c2")
    reduced = reduce_by_row_equalities(BRANCH_FOUR_COLLAPSED_PROFILE, constraint.form)
    if reduced.terms:
        raise AssertionError("collapsed surplus-apex Kalmanson form no longer reduces to zero")
    return constraint


def _normalize_values(
    values: Mapping[Edge | str, int | str | Fraction]
) -> dict[Edge, Fraction]:
    normalized: dict[Edge, Fraction] = {}
    for raw_edge, value in values.items():
        if isinstance(raw_edge, str):
            parts = raw_edge.split("--")
            if len(parts) != 2:
                raise HardSourceSwapGridError(f"malformed edge name: {raw_edge}")
            edge = _edge(parts[0], parts[1])
        else:
            edge = _edge(*raw_edge)
        normalized[edge] = parse_fraction(value)
    return normalized


@dataclass(frozen=True)
class ReplayResult:
    ok: bool
    checked: int
    failures: tuple[str, ...]


def replay_constraint_model(
    constraints: Sequence[LinearConstraint],
    values: Mapping[Edge | str, int | str | Fraction],
    *,
    require_positive: Iterable[Edge] = (),
) -> ReplayResult:
    exact = _normalize_values(values)
    failures: list[str] = []
    for edge in require_positive:
        canonical = _edge(*edge)
        if canonical not in exact:
            failures.append(f"missing:{edge_name(canonical)}")
        elif exact[canonical] <= 0:
            failures.append(f"nonpositive:{edge_name(canonical)}")
    for constraint in constraints:
        try:
            result = constraint.form.evaluate(exact)
        except HardSourceSwapGridError:
            failures.append(f"missing-value:{constraint.constraint_id}")
            continue
        holds = result == 0 if constraint.kind == "equality" else result > 0
        if not holds:
            failures.append(f"failed:{constraint.constraint_id}:{result}")
    return ReplayResult(not failures, len(constraints), tuple(failures))


def replay_distance_disequalities(
    profile: BranchProfile,
    values: Mapping[Edge | str, int | str | Fraction],
) -> ReplayResult:
    exact = _normalize_values(values)
    failures: list[str] = []
    for disequality in profile.distance_disequalities:
        if disequality.left not in exact:
            failures.append(f"missing:{edge_name(disequality.left)}")
        elif disequality.right not in exact:
            failures.append(f"missing:{edge_name(disequality.right)}")
        elif exact[disequality.left] == exact[disequality.right]:
            failures.append(
                "equal-radii:"
                f"{edge_name(disequality.left)}={edge_name(disequality.right)}"
            )
    return ReplayResult(
        not failures, len(profile.distance_disequalities), tuple(failures)
    )


def replay_cell_model(
    cell: OrderCell, values: Mapping[Edge | str, int | str | Fraction]
) -> ReplayResult:
    profile = profile_for(cell.branch)
    all_edges = tuple(_edge(a, b) for a, b in itertools.combinations(profile.roles, 2))
    linear = replay_constraint_model(
        constraints_for_cell(cell), values, require_positive=all_edges
    )
    radii = replay_distance_disequalities(profile, values)
    return ReplayResult(
        linear.ok and radii.ok,
        linear.checked + radii.checked,
        (*linear.failures, *radii.failures),
    )


@dataclass(frozen=True)
class WeightedTerm:
    constraint_id: str
    coefficient: Fraction


@dataclass(frozen=True)
class CoreReplayResult:
    ok: bool
    strict_weight: Fraction
    residual: SignedForm
    failure: str | None = None


def replay_weighted_core(
    constraints: Sequence[LinearConstraint], terms: Sequence[WeightedTerm]
) -> CoreReplayResult:
    by_id = {constraint.constraint_id: constraint for constraint in constraints}
    if len(by_id) != len(constraints):
        return CoreReplayResult(False, Fraction(), SignedForm.make(()), "duplicate constraint id")
    total = SignedForm.make(())
    strict_weight = Fraction()
    for term in terms:
        try:
            constraint = by_id[term.constraint_id]
        except KeyError:
            return CoreReplayResult(False, strict_weight, total, f"unknown constraint: {term.constraint_id}")
        if not term.coefficient:
            return CoreReplayResult(False, strict_weight, total, "zero core coefficient")
        if constraint.kind == "strict":
            if term.coefficient < 0:
                return CoreReplayResult(False, strict_weight, total, "negative strict coefficient")
            strict_weight += term.coefficient
        total = total.plus(constraint.form.scale(term.coefficient))
    if strict_weight <= 0:
        return CoreReplayResult(False, strict_weight, total, "core has no positive strict term")
    if total.terms:
        return CoreReplayResult(False, strict_weight, total, "weighted forms do not cancel")
    return CoreReplayResult(True, strict_weight, total)


def replay_cell_core(cell: OrderCell, terms: Sequence[WeightedTerm]) -> CoreReplayResult:
    return replay_weighted_core(constraints_for_cell(cell), terms)


def positive_sat_fixture() -> tuple[tuple[LinearConstraint, ...], dict[Edge, Fraction]]:
    """Exact four-point convex metric satisfying both strict sign conventions."""

    order = ("A", "B", "C", "D")
    diagonal = ((_edge("A", "C"), 1), (_edge("B", "D"), 1))
    constraints = (
        LinearConstraint(
            "fixture:main",
            "strict",
            SignedForm.make((*diagonal, (_edge("B", "C"), -1), (_edge("A", "D"), -1))),
            "hand-checked rational convex metric",
        ),
        LinearConstraint(
            "fixture:complementary",
            "strict",
            SignedForm.make((*diagonal, (_edge("A", "B"), -1), (_edge("C", "D"), -1))),
            "hand-checked rational convex metric",
        ),
    )
    values = {
        _edge(left, right): Fraction(3, 2) if {left, right} in ({"A", "C"}, {"B", "D"}) else Fraction(1)
        for left, right in itertools.combinations(order, 2)
    }
    return constraints, values


def known_unsat_fixture() -> tuple[tuple[LinearConstraint, ...], tuple[WeightedTerm, ...]]:
    """A strict Kalmanson form canceled by two explicit row-style equalities."""

    first = SignedForm.distance_difference(_edge("A", "C"), _edge("B", "C"))
    second = SignedForm.distance_difference(_edge("B", "D"), _edge("A", "D"))
    constraints = (
        LinearConstraint("fixture:eq1", "equality", first, "hand-checked equality"),
        LinearConstraint("fixture:eq2", "equality", second, "hand-checked equality"),
        LinearConstraint("fixture:strict", "strict", first.plus(second), "hand-checked strict form"),
    )
    terms = (
        WeightedTerm("fixture:eq1", Fraction(-1)),
        WeightedTerm("fixture:eq2", Fraction(-1)),
        WeightedTerm("fixture:strict", Fraction(1)),
    )
    return constraints, terms


def descriptor() -> dict[str, Any]:
    alias_counts = source_alias_profile_counts()
    return {
        "schema": SCHEMA,
        "semantic_status": SEMANTIC_STATUS,
        "promotion_eligible": PROMOTION_ELIGIBLE,
        "false_claims": FALSE_CLAIMS,
        "branch_order": list(BRANCH_ORDER),
        "profile_subcases": {
            branch: profile.diagnostic_subcase for branch, profile in PROFILES.items()
        },
        "coverage_boundary": {
            "scope": "conditional-collapsed-order-cells",
            "complete_live_branch_census": False,
            "live_boundary_separators": list(LIVE_SEPARATOR_ROLES),
            "conditional_profile_separators": list(COLLAPSED_SEPARATOR_ROLES),
            "missing_live_source_roles": ["U"],
            "alias_profiler_includes_live_source_roles": ["U"],
            "conditional_identification": "c1 = U (surplus apex)",
            "omitted_live_case_families": [
                "c1 distinct from U with every possible cyclic placement",
                "other c1 equality cases allowed by the source",
                "cross-row alias partitions among separately named extras",
            ],
        },
        "source_clause_ledger": SOURCE_CLAUSE_LEDGER,
        "unproved_abstraction_assumptions": UNPROVED_ABSTRACTION_ASSUMPTIONS,
        "enforcement_boundary": {
            "scope": "conditional-collapsed-order-cells",
            "enforced_by_cells": [
                "symbol-level role uniqueness",
                "the profile's declared cap-block placements",
                "direct or mirror block order",
            ],
            "enforced_by_linear_replay": [
                "positive abstract distances",
                "displayed row equalities",
                "strict Kalmanson forms",
                "K2/L radius disequality",
            ],
            "metadata_only": [
                "source-proved c1 ∉ L (enforced separately by alias profiles)",
                "full-class claims",
                "pairwise distinctness of the represented carrier points",
                "Lean realization of the named e/x/y replacement roles",
            ],
            "unsat_status": "conditional_on_all_unproved_abstraction_assumptions",
        },
        "branch_four_source_alias_profiles": {
            "schema": ALIAS_PROFILE_SCHEMA,
            "claim_boundary": "source_alias_only_no_order_or_live_coverage",
            "solver_free": True,
            "constructs_order_cells": False,
            "regime_counts": {
                ALIAS_COLLAPSED: alias_counts[ALIAS_COLLAPSED],
                ALIAS_SEPARATE: alias_counts[ALIAS_SEPARATE],
            },
            "total_profiles": alias_counts["total"],
            "encoded_constraints": [
                "c1 ∉ L",
                "K1 ∩ K2 = {O,a}",
                "at most one p/q-to-s/t match and one p/q-to-u/v match",
                "the two matchings use disjoint p/q endpoints",
                "c2 is fresh or hosts one p/q/s/t class containing no u/v",
                "U is distinct from u/v/e/x/y",
                "e/x/y are fresh or injectively host source-entitled p/q/s/t classes containing no U",
                "c1 = U and c1 ≠ U are separate regimes",
            ],
            "omitted_layers": [
                "cyclic placement and order-cell generation",
                "cap-block membership",
                "Euclidean and minimum-enclosing-circle realizability",
                "Lean exhaustiveness theorem for these abstract alias rules",
            ],
        },
        "branch_four_collapsed_row_symmetry_quotient": {
            "schema": QUOTIENT_SCHEMA,
            "groups": [list(group) for group in BRANCH_FOUR_SYMMETRY_GROUPS],
            "raw_cells": order_cell_count(BRANCH_FOUR_COLLAPSED_PROFILE),
            "quotient_cells": branch_four_collapsed_quotient_cell_count(),
            "reduced_constraint_signature_dedup": False,
        },
        "conditional_zero_form_regression": {
            "scope": "c1_eq_surplusApex_collapsed_branch_four_only",
            "direct": "kal:complementary:O:c2:c1:a",
            "mirror": "kal:main:O:a:c1:c2",
            "row_reduced_form": [],
            "live_branch_consequence": False,
        },
        "excluded_layers": [
            "Euclidean coordinates and planar distance-matrix realizability",
            "minimum-enclosing-circle constraints",
            "CriticalShellSystem blocker/minimality/no-qfree constraints",
            "solver execution and verdict custody",
        ],
    }
