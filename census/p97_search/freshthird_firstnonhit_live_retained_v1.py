"""Live retained-arm abstraction for ``false_of_freshThird_firstNonHit``.

This module is deliberately independent of the downstream exact-three
Q-fiber packet.  It records the raw NonHit/Interaction constructors, the live
aligned-retained fields, and the carrier-wide escaping row exported by
``originIncidenceCases``.  SAT is theorem-mining data.  UNSAT is only an
UNSAT result for this finite projection until a Lean coverage theorem and an
independently replayed certificate are wired.
"""

from __future__ import annotations

import argparse
import hashlib
import itertools
import json
from collections.abc import Mapping, Sequence
from pathlib import Path

import z3

SCHEMA = "p97-freshthird-firstnonhit-live-retained/v1"
RESULT_SCHEMA = "p97-freshthird-firstnonhit-live-retained-result/v1"
PROVENANCE_SCHEMA = "p97-freshthird-firstnonhit-live-retained-provenance/v1"
SOLVER_TIMEOUT_MS = 30_000
PRODUCTION_LAUNCH_ENABLED = False

NONHIT_BRANCHES = ("sameBlocker", "sourceRowOmission")
INTERACTION_BRANCHES = (
    "sameBlocker",
    "sourceRowOmission",
    "distinctBlockersDifferentCaps",
    "sameCapWithInternalFiberSource",
)
ORIGIN_BRANCHES = ("P", "P_rho", "Q")

SYNCHRONIZATION_PREDICATES = (
    {
        "id": "common_p_omission",
        "meaning": "one P endpoint is omitted from both retained source rows",
    },
    {
        "id": "common_p_rho_omission",
        "meaning": "one P-rho endpoint is omitted from both retained source rows",
    },
    {
        "id": "retained_centers_equal",
        "meaning": "the two retained actual-blocker row centers are equal",
    },
    {
        "id": "retained_support_overlap_ge_two",
        "meaning": "the two retained actual-blocker supports overlap in at least two points",
    },
    {
        "id": "retained_cross_center_membership",
        "meaning": "one retained actual-blocker center belongs to the other retained support",
    },
)
COUNTERFACTUAL_CONTRACT = (
    "forced/refuted means one polarity is UNSAT in this finite packet only; "
    "base SAT signatures are observed-model data"
)

FALSE_CLAIMS = {
    "source_entitlement": False,
    "source_total": False,
    "constructor_realization": False,
    "coverage": False,
    "theorem": False,
    "universal": False,
    "lean": False,
    "euclidean_realizability": False,
    "terminal_unsat": False,
}

REPO_ROOT = Path(__file__).resolve().parents[2]
SOURCE_FILES = (
    (
        "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/"
        "TwoSourceFreshThirdResidual.lean"
    ),
    (
        "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/"
        "TwoSourceCanonicalSurface.lean"
    ),
    ("lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/TwoSourceFreshThirdFiber.lean"),
    (
        "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/"
        "TwoSourceFreshThirdRetainedProducer.lean"
    ),
    (
        "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/"
        "TwoSourceTripleShellEscape.lean"
    ),
    "lean/Erdos9796Proof/P97/ATail/MinimalDeletionCore.lean",
    "lean/Erdos9796Proof/P97/ATail/BlockerMultiplicityGeometry.lean",
    "lean/Erdos9796Proof/P97/ATail/TwoCollisionGlobalProducer.lean",
    (
        "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/"
        "FreshThirdPinnedFanPacket.lean"
    ),
    (
        "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/"
        "FreshThirdQFiberThreeBoundary.lean"
    ),
    "lean/Erdos9796Proof/P97/ATail/FirstApexInteriorPairGeometry.lean",
    "lean/Erdos9796Proof/P97/ATail/GlobalMinimalDeletion.lean",
    "lean/Erdos9796Proof/P97/ATail/SelectedFourGeometry.lean",
    "lean/Erdos9796Proof/P97/ATail/TwoTripleRowSixPointEuclideanObstruction.lean",
    "lean/Erdos9796Proof/P97/Census554/ZeroCutBoundaryIndexing.lean",
)
SOURCE_THEOREMS = (
    "TwoCapSourceThirdCanonicalRowSurface",
    "CapSourceThirdCanonicalRowWitness",
    "FreshThirdBlockerFiber",
    "FreshThirdCapSourceNonHit",
    "FreshThirdCapSourceInteraction",
    "FreshThirdAlignedRetainedConsumerPacket",
    "FreshThirdAlignedFixedDeletionCorePacket",
    "FirstCapMultiPointRadiiRetained",
    "CrossPairDeletionView",
    "crossPairDeletionSurvival_iff_selectedSupportOmission",
    ("exists_freshThird_selectedRow_escape_tripleShellSeed_originIncidenceCases"),
    "MinimalDeletionCore.shellAt_selectedClass_eq",
    "MinimalDeletionCore.shellAt_capInteriorByIndex_card_ge_two",
    "MinimalDeletionCore.shellAt_support_eq_selectedClass_of_dist_eq",
    (
        "Problem97.ATailFrontierLiveClosure.TwoSourceExactCollisionRowsTerminal."
        "exists_q_tripleShellEscape_qRow_overlap_card_le_two"
    ),
)

P_SUPPORT = ("p0", "p1", "pb2", "pb3")
P_RHO_SUPPORT = ("r0", "r1", "rb2", "rb3")
P_RADIUS_SUPPORT = ("p0", "p1", "pr2", "pr3")
P_RHO_RADIUS_SUPPORT = ("r0", "r1", "rr2", "rr3")
FIRST_SUPPORT = ("firstSource", "a1", "a2", "a3")
SECOND_SUPPORT = ("secondSource", "b1", "b2", "b3")
Q_SUPPORT = ("q0", "q1", "q2", "q3")
CANDIDATE_SUPPORT = ("g0", "g1", "g2", "g3")
CAP_EIGHT = (
    "p0",
    "p1",
    "r0",
    "r1",
    "firstSource",
    "secondSource",
    "capExtra0",
    "capExtra1",
)

ROWS: dict[str, tuple[str, tuple[str, ...]]] = {
    "P": ("pBlockerCenter", P_SUPPORT),
    "P_rho": ("rhoBlockerCenter", P_RHO_SUPPORT),
    "P_radius": ("oppCenter", P_RADIUS_SUPPORT),
    "P_rho_radius": ("oppCenter", P_RHO_RADIUS_SUPPORT),
    "first": ("firstCenter", FIRST_SUPPORT),
    "second": ("secondCenter", SECOND_SUPPORT),
    "Q": ("qCenter", Q_SUPPORT),
    "Q_second": ("qCenter", Q_SUPPORT),
    "candidate": ("gCenter", CANDIDATE_SUPPORT),
}
TRIPLE_SEED = (*P_SUPPORT, *P_RHO_SUPPORT, *Q_SUPPORT)
CENTERS = tuple(dict.fromkeys(center for center, _support in ROWS.values()))
ROLES = tuple(
    dict.fromkeys(
        (
            *CENTERS,
            "otherOppCenter",
            "surplusApex",
            "capExtra0",
            "capExtra1",
            *(point for _center, support in ROWS.values() for point in support),
        )
    )
)


class LiveRetainedEncodingError(RuntimeError):
    """Raised when the packet or its replay contract is malformed."""


def _count(atoms: Sequence[z3.BoolRef]) -> z3.ArithRef:
    return z3.Sum([z3.If(atom, 1, 0) for atom in atoms])


def _sha256_file(path: Path) -> str:
    digest = hashlib.sha256()
    with path.open("rb") as stream:
        for chunk in iter(lambda: stream.read(1024 * 1024), b""):
            digest.update(chunk)
    return digest.hexdigest()


def _canonical_json(value: object) -> bytes:
    return (json.dumps(value, sort_keys=True, separators=(",", ":")) + "\n").encode()


def manifest() -> dict[str, object]:
    """Return the source-bound discovery manifest for the finite packet."""
    source_hashes = {
        relative: _sha256_file(REPO_ROOT / relative) for relative in SOURCE_FILES
    }
    value: dict[str, object] = {
        "schema": SCHEMA,
        "result_schema": RESULT_SCHEMA,
        "branches": {
            "nonhit": list(NONHIT_BRANCHES),
            "interaction": list(INTERACTION_BRANCHES),
            "origin": list(ORIGIN_BRANCHES),
        },
        "cell_count": (
            len(NONHIT_BRANCHES) * len(INTERACTION_BRANCHES) * len(ORIGIN_BRANCHES)
        ),
        "solver_timeout_ms": SOLVER_TIMEOUT_MS,
        "production_launch_enabled": PRODUCTION_LAUNCH_ENABLED,
        "roles": list(ROLES),
        "rows": {
            name: {"center": center, "support": list(support)}
            for name, (center, support) in ROWS.items()
        },
        "source_theorems": list(SOURCE_THEOREMS),
        "source_files": source_hashes,
        "provenance_schema": PROVENANCE_SCHEMA,
        "cell_provenance": _manifest_cell_provenance(),
        "false_claims": FALSE_CLAIMS,
        "synchronization_predicates": list(SYNCHRONIZATION_PREDICATES),
        "counterfactual_contract": COUNTERFACTUAL_CONTRACT,
        "abstraction_notes": [
            "SAT assignments are finite abstract valuations, not Lean constructor witnesses",
            "deletion-survival and opposite-blockage atoms remain source-owned opaque predicates",
            "minimal-deletion-core existence remains a source-owned opaque predicate",
            "the retained-radii universal is projected to every pair of named strict-cap roles",
            "opposite-radius labels preserve equality only and do not assert Euclidean realizability",
            "self-hashes provide integrity binding, not an external signature",
        ],
        "omitted_relaxations": [
            "anonymous carrier points outside the named projection",
            "complete cyclic order and metric realization",
            "common-radius right ingress arm",
            "general-cardinality coverage theorem",
        ],
    }
    value["manifest_sha256"] = hashlib.sha256(_canonical_json(value)).hexdigest()
    return value


class LiveRetainedPacket:
    """One fixed NonHit/Interaction/origin cell."""

    def __init__(self, nonhit: str, interaction: str, origin: str) -> None:
        if nonhit not in NONHIT_BRANCHES:
            raise LiveRetainedEncodingError(f"unknown NonHit branch: {nonhit}")
        if interaction not in INTERACTION_BRANCHES:
            raise LiveRetainedEncodingError(
                f"unknown Interaction branch: {interaction}"
            )
        if origin not in ORIGIN_BRANCHES:
            raise LiveRetainedEncodingError(f"unknown origin branch: {origin}")
        self.nonhit = nonhit
        self.interaction = interaction
        self.origin = origin
        self.solver = z3.Solver()
        self.solver.set(timeout=SOLVER_TIMEOUT_MS)
        self.rank = {role: z3.Int(f"rank_{role}") for role in ROLES}
        self.in_cap = {
            (role, cap): z3.Bool(f"inCap_{role}_{cap}")
            for role in ROLES
            for cap in range(3)
        }
        self.interior = {
            (role, cap): z3.Bool(f"interior_{role}_{cap}")
            for role in ROLES
            for cap in range(3)
        }
        self.opp_radius_label = {
            role: z3.Int(f"oppRadiusLabel_{role}") for role in ROLES
        }
        self.source_cap = [z3.Bool(f"sourceCap_{cap}") for cap in range(3)]
        self.fresh_cap = [z3.Bool(f"freshCap_{cap}") for cap in range(3)]
        self.nonhit_deleted = [z3.Bool(f"nonhitDeleted_q{i}") for i in range(2)]
        self.interaction_deleted = [
            z3.Bool(f"interactionDeleted_q{i}") for i in range(2)
        ]
        self.deletion_survives = {
            "nonhit": z3.Bool("nonhitDeletionSurvives"),
            "interaction": z3.Bool("interactionDeletionSurvives"),
        }
        self.retained_x = {
            row: [z3.Bool(f"retained_{row}_x{i}") for i in range(2)]
            for row in ("first", "second")
        }
        self.retained_y = {
            row: [z3.Bool(f"retained_{row}_y{i}") for i in range(2)]
            for row in ("first", "second")
        }
        self.double_survives = {
            row: z3.Bool(f"retained_{row}_doubleSurvives")
            for row in ("first", "second")
        }
        self.opp_double_blocked = {
            row: z3.Bool(f"retained_{row}_oppDoubleBlocked")
            for row in ("first", "second")
        }
        self.minimal_core_nonempty = {
            row: z3.Bool(f"retained_{row}_minimalCoreNonempty")
            for row in ("first", "second")
        }
        self.cross_deletion_survives = {
            row: {
                endpoint: z3.Bool(f"retained_{row}_crossSurvives_{endpoint}")
                for endpoint in ("p0", "p1", "r0", "r1")
            }
            for row in ("first", "second")
        }
        self.first_cap_multi_radius_retained = z3.Bool(
            "firstCapMultiPointRadiiRetained"
        )
        self.cap_card_ge_eight = z3.Bool("firstCapCardGeEight")
        self.provenance: list[dict[str, object]] = []
        self.provenance_keys: set[str] = set()
        self._emit()

    def add(self, key: str, expression: z3.BoolRef, theorem: str) -> None:
        if key in self.provenance_keys:
            raise LiveRetainedEncodingError(f"duplicate clause key: {key}")
        self.solver.add(expression)
        self.provenance.append({"key": key, "source": theorem})
        self.provenance_keys.add(key)

    def same(self, left: str, right: str) -> z3.BoolRef:
        return self.rank[left] == self.rank[right]

    def member(self, role: str, row: str) -> z3.BoolRef:
        return z3.Or(*(self.same(role, slot) for slot in ROWS[row][1]))

    def row_intersection_count(self, left: str, right: str) -> z3.ArithRef:
        return _count([self.member(slot, right) for slot in ROWS[left][1]])

    def row_outside_count(self, left: str, right: str) -> z3.ArithRef:
        return _count([z3.Not(self.member(slot, right)) for slot in ROWS[left][1]])

    def _one_hot(self, key: str, atoms: Sequence[z3.BoolRef], source: str) -> None:
        self.add(key, _count(atoms) == 1, source)

    def _exact_row(self, name: str) -> None:
        center, support = ROWS[name]
        for left, right in itertools.combinations(support, 2):
            self.add(
                f"row.{name}.distinct.{left}.{right}",
                z3.Not(self.same(left, right)),
                "CriticalFourShell.support_card",
            )
        for role in support:
            self.add(
                f"row.{name}.center_not_support.{role}",
                z3.Not(self.same(center, role)),
                "SelectedFourClass.center_not_mem",
            )

    def _support_equal(self, left: str, right: str) -> z3.BoolRef:
        return z3.And(
            *(self.member(role, right) for role in ROWS[left][1]),
            *(self.member(role, left) for role in ROWS[right][1]),
        )

    def _emit_relational_base(self) -> None:
        bound = len(ROLES)
        for role in ROLES:
            self.add(
                f"rank.lower.{role}",
                self.rank[role] >= 0,
                "finite named-role projection",
            )
            self.add(
                f"rank.upper.{role}",
                self.rank[role] < bound,
                "finite named-role projection",
            )
        for name in ROWS:
            self._exact_row(name)
        for left, right in itertools.combinations(ROLES, 2):
            for cap in range(3):
                self.add(
                    f"alias.cap.{left}.{right}.{cap}",
                    z3.Implies(
                        self.same(left, right),
                        self.in_cap[left, cap] == self.in_cap[right, cap],
                    ),
                    "physical equality preserves cap membership",
                )
                self.add(
                    f"alias.interior.{left}.{right}.{cap}",
                    z3.Implies(
                        self.same(left, right),
                        self.interior[left, cap] == self.interior[right, cap],
                    ),
                    "physical equality preserves strict-cap membership",
                )
            self.add(
                f"alias.radius.{left}.{right}",
                z3.Implies(
                    self.same(left, right),
                    self.opp_radius_label[left] == self.opp_radius_label[right],
                ),
                "physical equality preserves first-apex distance",
            )
        for role in ROLES:
            for cap in range(3):
                self.add(
                    f"interior.subset_cap.{role}.{cap}",
                    z3.Implies(self.interior[role, cap], self.in_cap[role, cap]),
                    "SurplusCapPacket.capInteriorByIndex_subset_capByIndex",
                )
        for left, right in itertools.combinations(ROWS, 2):
            left_center = ROWS[left][0]
            right_center = ROWS[right][0]
            self.add(
                f"rows.distinct_centers_overlap.{left}.{right}",
                z3.Implies(
                    z3.Not(self.same(left_center, right_center)),
                    self.row_intersection_count(left, right) <= 2,
                ),
                "SelectedFourClass.inter_card_le_two",
            )

    def _emit_surface_packet(self) -> None:
        cap_eight_constraints: list[z3.BoolRef] = []
        for left, right in itertools.combinations(CAP_EIGHT, 2):
            distinct = z3.Not(self.same(left, right))
            cap_eight_constraints.append(distinct)
            self.add(
                f"surface.cap_eight.distinct.{left}.{right}",
                distinct,
                "cap_card_ge_eight materialized by eight closed-cap witnesses",
            )
        for role in CAP_EIGHT:
            member = self.in_cap[role, 0]
            cap_eight_constraints.append(member)
            self.add(
                f"surface.cap_eight.member.{role}",
                member,
                "TwoCapSourceThirdCanonicalRowSurface.cap_card_ge_eight",
            )
        self.add(
            "surface.cap_card_ge_eight_link",
            self.cap_card_ge_eight == z3.And(*cap_eight_constraints),
            "cap_card_ge_eight iff the finite projection carries eight distinct cap witnesses",
        )
        self.add(
            "surface.named_blockers_ne",
            z3.Not(self.same("pBlockerCenter", "rhoBlockerCenter")),
            "hblockersNe",
        )
        apices = ("oppCenter", "otherOppCenter", "surplusApex")
        for left, right in itertools.combinations(apices, 2):
            self.add(
                f"surface.apices_ne.{left}.{right}",
                z3.Not(self.same(left, right)),
                "SurplusCapPacket opposite-vertex inequalities",
            )
        for blocker in (
            "pBlockerCenter",
            "rhoBlockerCenter",
            "qCenter",
            "firstCenter",
            "secondCenter",
        ):
            for apex in apices:
                self.add(
                    f"surface.blocker_ne_apex.{blocker}.{apex}",
                    z3.Not(self.same(blocker, apex)),
                    "tri-apex deletion robustness blocker exclusion",
                )
        for center in ("firstCenter", "secondCenter"):
            for excluded in (
                "pBlockerCenter",
                "rhoBlockerCenter",
            ):
                self.add(
                    f"surface.{center}.ne.{excluded}",
                    z3.Not(self.same(center, excluded)),
                    "CapSourceThirdCanonicalRowWitness center inequalities",
                )
        self.add(
            "fresh.blocker_ne_first",
            z3.Not(self.same("qCenter", "pBlockerCenter")),
            "FreshThirdBlockerFiber.blocker_ne_first",
        )
        self.add(
            "fresh.blocker_ne_second",
            z3.Not(self.same("qCenter", "rhoBlockerCenter")),
            "FreshThirdBlockerFiber.blocker_ne_second",
        )
        self.add(
            "fresh.blockers_eq_support_eq",
            self._support_equal("Q", "Q_second"),
            "FreshThirdBlockerFiber.blockers_eq and selectedSupports_eq",
        )
        self.add(
            "fresh.source1_mem_source2_shell",
            self.member("q0", "Q_second"),
            "FreshThirdBlockerFiber.source₁_mem_source₂_shell",
        )
        self.add(
            "fresh.source2_mem_source1_shell",
            self.member("q1", "Q"),
            "FreshThirdBlockerFiber.source₂_mem_source₁_shell",
        )
        for source in Q_SUPPORT[:2]:
            for endpoint in ("p0", "p1", "r0", "r1"):
                self.add(
                    f"fresh.{source}.ne.{endpoint}",
                    z3.Not(self.same(source, endpoint)),
                    "FreshThirdBlockerFiber fresh-source inequalities",
                )

    def _emit_retained_packet(self) -> None:
        for role in P_RADIUS_SUPPORT[1:]:
            self.add(
                f"retained.radius_row.P.{role}",
                self.opp_radius_label[role] == self.opp_radius_label["p0"],
                "P selected-class support has radius",
            )
        for role in P_RHO_RADIUS_SUPPORT[1:]:
            self.add(
                f"retained.radius_row.P_rho.{role}",
                self.opp_radius_label[role] == self.opp_radius_label["r0"],
                "Pρ selected-class support has radius ρ",
            )
        self.add(
            "retained.named_radii_ne",
            self.opp_radius_label["p0"] != self.opp_radius_label["r0"],
            "hρne",
        )
        self.add(
            "retained.multi_point_radii.source_field",
            self.first_cap_multi_radius_retained,
            "FreshThirdAlignedRetainedConsumerPacket FirstCapMultiPointRadiiRetained field",
        )
        for left, right in itertools.combinations(ROLES, 2):
            self.add(
                f"retained.multi_point_radii.named_pair.{left}.{right}",
                z3.Implies(
                    self.first_cap_multi_radius_retained,
                    z3.Implies(
                        z3.And(
                            self.interior[left, 0],
                            self.interior[right, 0],
                            z3.Not(self.same(left, right)),
                            self.opp_radius_label[left] == self.opp_radius_label[right],
                        ),
                        z3.Or(
                            self.opp_radius_label[left] == self.opp_radius_label["p0"],
                            self.opp_radius_label[left] == self.opp_radius_label["r0"],
                        ),
                    ),
                ),
                "FirstCapMultiPointRadiiRetained named-role consequence",
            )
        for left in P_RADIUS_SUPPORT:
            for right in P_RHO_RADIUS_SUPPORT:
                self.add(
                    f"retained.radii.disjoint.{left}.{right}",
                    z3.Not(self.same(left, right)),
                    "hρne and SelectedClass radius separation",
                )
        self.add(
            "retained.P_blocker_radius_overlap",
            self.row_intersection_count("P", "P_radius") == 2,
            "shared P sources plus distinct-circle intersection bound",
        )
        self.add(
            "retained.P_rho_blocker_radius_overlap",
            self.row_intersection_count("P_rho", "P_rho_radius") == 2,
            "shared Pρ sources plus distinct-circle intersection bound",
        )
        first_cap_roles = (
            "p0",
            "p1",
            "r0",
            "r1",
            "firstSource",
            "secondSource",
        )
        for role in first_cap_roles:
            self.add(
                f"retained.first_cap.{role}",
                self.interior[role, 0],
                "retained singleton/strict first-cap slices",
            )
        for role in (*P_RADIUS_SUPPORT[2:], *P_RHO_RADIUS_SUPPORT[2:]):
            self.add(
                f"retained.outside_first_cap.{role}",
                z3.Not(self.interior[role, 0]),
                "hfrontierInteriorEq/hρInteriorEq exact first-cap slices",
            )
        self.add(
            "retained.sources.distinct",
            z3.Not(self.same("firstSource", "secondSource")),
            "TwoCapSourceThirdCanonicalRowSurface.sources_ne",
        )
        for source in ("firstSource", "secondSource"):
            for endpoint in (*P_RADIUS_SUPPORT[:2], *P_RHO_RADIUS_SUPPORT[:2]):
                self.add(
                    f"retained.source_off_endpoints.{source}.{endpoint}",
                    z3.Not(self.same(source, endpoint)),
                    "CapSourceThirdCanonicalRowWitness.source_not_mem_endpoints",
                )
        self.add(
            "retained.source_radii_ne",
            self.opp_radius_label["firstSource"]
            != self.opp_radius_label["secondSource"],
            "FreshThirdAlignedRetainedConsumerPacket first field",
        )
        for source in ("firstSource", "secondSource"):
            for role in ROLES:
                self.add(
                    f"retained.singleton_radius.{source}.{role}",
                    z3.Implies(
                        z3.And(
                            self.interior[role, 0],
                            self.opp_radius_label[role]
                            == self.opp_radius_label[source],
                        ),
                        self.same(role, source),
                    ),
                    "FreshThirdAlignedRetainedConsumerPacket singleton slice",
                )
        for row in ("first", "second"):
            for endpoint in ("p0", "p1", "r0", "r1"):
                self.add(
                    f"retained.{row}.cross_deletion.{endpoint}",
                    self.cross_deletion_survives[row][endpoint]
                    == z3.Not(self.member(endpoint, row)),
                    "cross_deletion_survives_iff_not_mem_selected_support",
                )
            for pair_name, endpoints in (
                ("P", ("p0", "p1")),
                ("P_rho", ("r0", "r1")),
            ):
                self.add(
                    f"retained.{row}.cross_pair_view.{pair_name}",
                    z3.Or(
                        *(self.cross_deletion_survives[row][role] for role in endpoints)
                    ),
                    "CapSourceThirdCanonicalRowWitness CrossPairDeletionView field",
                )
            self._one_hot(
                f"retained.{row}.x_choice",
                self.retained_x[row],
                "FreshThirdAlignedSourceDeletionCorePacket x witness",
            )
            self._one_hot(
                f"retained.{row}.y_choice",
                self.retained_y[row],
                "FreshThirdAlignedSourceDeletionCorePacket y witness",
            )
            for index, endpoint in enumerate(P_RADIUS_SUPPORT[:2]):
                self.add(
                    f"retained.{row}.x_omitted.{endpoint}",
                    z3.Implies(
                        self.retained_x[row][index],
                        z3.Not(self.member(endpoint, row)),
                    ),
                    "FreshThirdAlignedFixedDeletionCorePacket x omission",
                )
            for index, endpoint in enumerate(P_RHO_RADIUS_SUPPORT[:2]):
                self.add(
                    f"retained.{row}.y_omitted.{endpoint}",
                    z3.Implies(
                        self.retained_y[row][index],
                        z3.Not(self.member(endpoint, row)),
                    ),
                    "FreshThirdAlignedFixedDeletionCorePacket y omission",
                )
            self.add(
                f"retained.{row}.double_survives",
                self.double_survives[row],
                "FreshThirdAlignedFixedDeletionCorePacket source survival",
            )
            self.add(
                f"retained.{row}.opp_double_blocked",
                self.opp_double_blocked[row],
                "FreshThirdAlignedFixedDeletionCorePacket first-apex blockage",
            )
            self.add(
                f"retained.{row}.minimal_core_nonempty",
                self.minimal_core_nonempty[row],
                "FreshThirdAlignedFixedDeletionCorePacket MinimalDeletionCore field",
            )

    def _emit_nonhit(self) -> None:
        if self.nonhit == "sameBlocker":
            self.add(
                "nonhit.sameBlocker.center",
                self.same("firstCenter", "qCenter"),
                "FreshThirdCapSourceNonHit.sameBlocker.center_eq",
            )
            self.add(
                "nonhit.sameBlocker.support",
                self._support_equal("first", "Q"),
                "FreshThirdCapSourceNonHit.sameBlocker.support_eq",
            )
            return
        self._one_hot(
            "nonhit.omission.deleted_choice",
            self.nonhit_deleted,
            "FreshThirdCapSourceNonHit.sourceRowOmission.deleted_eq",
        )
        self.add(
            "nonhit.omission.survives",
            self.deletion_survives["nonhit"],
            "FreshThirdCapSourceNonHit.sourceRowOmission.deletion_survives",
        )
        for index, endpoint in enumerate(Q_SUPPORT[:2]):
            self.add(
                f"nonhit.omission.not_mem.{endpoint}",
                z3.Implies(
                    self.nonhit_deleted[index],
                    z3.Not(self.member(endpoint, "first")),
                ),
                "FreshThirdCapSourceNonHit.sourceRowOmission.deleted_not_mem",
            )

    def _emit_interaction(self) -> None:
        if self.interaction == "sameBlocker":
            self.add(
                "interaction.sameBlocker.center",
                self.same("secondCenter", "qCenter"),
                "FreshThirdCapSourceInteraction.sameBlocker.center_eq",
            )
            self.add(
                "interaction.sameBlocker.support",
                self._support_equal("second", "Q"),
                "FreshThirdCapSourceInteraction.sameBlocker.support_eq",
            )
            return
        if self.interaction == "sourceRowOmission":
            self._one_hot(
                "interaction.omission.deleted_choice",
                self.interaction_deleted,
                "FreshThirdCapSourceInteraction.sourceRowOmission.deleted_eq",
            )
            self.add(
                "interaction.omission.survives",
                self.deletion_survives["interaction"],
                "FreshThirdCapSourceInteraction.sourceRowOmission.deletion_survives",
            )
            for index, endpoint in enumerate(Q_SUPPORT[:2]):
                self.add(
                    f"interaction.omission.not_mem.{endpoint}",
                    z3.Implies(
                        self.interaction_deleted[index],
                        z3.Not(self.member(endpoint, "second")),
                    ),
                    "FreshThirdCapSourceInteraction.sourceRowOmission.deleted_not_mem",
                )
            return
        self.add(
            "interaction.positive.centers_ne",
            z3.Not(self.same("secondCenter", "qCenter")),
            "FreshThirdCapSourceInteraction positive centers_ne",
        )
        self.add(
            "interaction.positive.exact_overlap",
            z3.And(
                self.member("q0", "second"),
                self.member("q1", "second"),
                z3.Not(self.member("q2", "second")),
                z3.Not(self.member("q3", "second")),
            ),
            "FreshThirdCapSourceInteraction positive overlap_eq",
        )
        self._one_hot(
            "interaction.source_cap.one_hot",
            self.source_cap,
            "FreshThirdCapSourceInteraction sourceCap",
        )
        self._one_hot(
            "interaction.fresh_cap.one_hot",
            self.fresh_cap,
            "FreshThirdCapSourceInteraction freshCap",
        )
        for cap in range(3):
            self.add(
                f"interaction.source_cap.interior.{cap}",
                z3.Implies(self.source_cap[cap], self.interior["secondCenter", cap]),
                "FreshThirdCapSourceInteraction sourceCenter_mem",
            )
            self.add(
                f"interaction.fresh_cap.interior.{cap}",
                z3.Implies(self.fresh_cap[cap], self.interior["qCenter", cap]),
                "FreshThirdCapSourceInteraction freshCenter_mem",
            )
        if self.interaction == "distinctBlockersDifferentCaps":
            self.add(
                "interaction.distinct_caps",
                z3.Or(
                    *(
                        z3.And(self.source_cap[i], self.fresh_cap[j])
                        for i in range(3)
                        for j in range(3)
                        if i != j
                    )
                ),
                "FreshThirdCapSourceInteraction.distinctBlockersDifferentCaps.caps_ne",
            )
        else:
            self.add(
                "interaction.same_cap",
                z3.And(*(self.source_cap[i] == self.fresh_cap[i] for i in range(3))),
                "FreshThirdCapSourceInteraction.sameCapWithInternalFiberSource.capIndex",
            )
            self.add(
                "interaction.same_cap.fiber_source",
                z3.Or(
                    *(
                        z3.And(
                            self.source_cap[cap],
                            z3.Or(
                                self.in_cap["q0", cap],
                                self.in_cap["q1", cap],
                            ),
                        )
                        for cap in range(3)
                    )
                ),
                "FreshThirdCapSourceInteraction.sameCapWithInternalFiberSource.fiber_source_mem_cap",
            )

    def _emit_global_row(self) -> None:
        origin_support = ROWS[self.origin][1]
        self.add(
            "global.origin.center_mem",
            z3.Or(*(self.same("gCenter", role) for role in origin_support)),
            "originIncidenceCases center origin",
        )
        self.add(
            "global.escape.outside_seed",
            z3.And(*(z3.Not(self.same("g0", role)) for role in TRIPLE_SEED)),
            "originIncidenceCases escaped point",
        )
        self.add(
            "global.origin.overlap_le_two",
            self.row_intersection_count("candidate", self.origin) <= 2,
            "originIncidenceCases overlap bound",
        )
        self.add(
            "global.origin.outside_ge_two",
            self.row_outside_count("candidate", self.origin) >= 2,
            "originIncidenceCases outside bound",
        )
        self.add(
            "global.q_row.overlap_le_two",
            self.row_intersection_count("candidate", "Q") <= 2,
            (
                "Problem97.ATailFrontierLiveClosure."
                "TwoSourceExactCollisionRowsTerminal."
                "exists_q_tripleShellEscape_qRow_overlap_card_le_two"
            ),
        )

    def _emit(self) -> None:
        self._emit_relational_base()
        self._emit_surface_packet()
        self._emit_retained_packet()
        self._emit_nonhit()
        self._emit_interaction()
        self._emit_global_row()


def provenance_binding(packet: LiveRetainedPacket) -> dict[str, object]:
    """Bind emitted clauses to their exact ordered source-provenance rows."""
    assertions = packet.solver.assertions()
    clause_count = len(packet.provenance)
    if len(assertions) < clause_count:
        raise LiveRetainedEncodingError("solver lost an emitted provenance clause")
    provenance_rows = [dict(row) for row in packet.provenance]
    clause_rows = [assertions[index].sexpr() for index in range(clause_count)]
    bound_rows = [
        {
            "key": provenance["key"],
            "source": provenance["source"],
            "assertion": assertion,
        }
        for provenance, assertion in zip(provenance_rows, clause_rows, strict=True)
    ]
    value: dict[str, object] = {
        "schema": PROVENANCE_SCHEMA,
        "clause_count": clause_count,
        "provenance_sha256": hashlib.sha256(
            _canonical_json(provenance_rows)
        ).hexdigest(),
        "clause_stream_sha256": hashlib.sha256(
            _canonical_json(clause_rows)
        ).hexdigest(),
        "bound_stream_sha256": hashlib.sha256(_canonical_json(bound_rows)).hexdigest(),
    }
    value["binding_sha256"] = hashlib.sha256(_canonical_json(value)).hexdigest()
    return value


def _manifest_cell_provenance() -> list[dict[str, object]]:
    rows: list[dict[str, object]] = []
    for nonhit, interaction, origin in itertools.product(
        NONHIT_BRANCHES, INTERACTION_BRANCHES, ORIGIN_BRANCHES
    ):
        packet = LiveRetainedPacket(nonhit, interaction, origin)
        rows.append(
            {
                "nonhit": nonhit,
                "interaction": interaction,
                "origin": origin,
                "binding": provenance_binding(packet),
            }
        )
    return rows


def synchronization_predicates(
    packet: LiveRetainedPacket,
) -> dict[str, z3.BoolRef]:
    """Return the bounded retained-row predicate panel for P/not-P queries."""
    common_p = z3.Or(
        *(
            z3.And(
                z3.Not(packet.member(endpoint, "first")),
                z3.Not(packet.member(endpoint, "second")),
            )
            for endpoint in P_RADIUS_SUPPORT[:2]
        )
    )
    common_p_rho = z3.Or(
        *(
            z3.And(
                z3.Not(packet.member(endpoint, "first")),
                z3.Not(packet.member(endpoint, "second")),
            )
            for endpoint in P_RHO_RADIUS_SUPPORT[:2]
        )
    )
    predicates = {
        "common_p_omission": common_p,
        "common_p_rho_omission": common_p_rho,
        "retained_centers_equal": packet.same("firstCenter", "secondCenter"),
        "retained_support_overlap_ge_two": (
            packet.row_intersection_count("first", "second") >= 2
        ),
        "retained_cross_center_membership": z3.Or(
            packet.member("firstCenter", "second"),
            packet.member("secondCenter", "first"),
        ),
    }
    expected = [row["id"] for row in SYNCHRONIZATION_PREDICATES]
    if list(predicates) != expected:
        raise LiveRetainedEncodingError("synchronization predicate order drifted")
    return predicates


def build_packet(
    nonhit: str,
    interaction: str,
    origin: str,
    malformed: str | None = None,
) -> tuple[z3.Solver, LiveRetainedPacket]:
    """Build one fixed cell and optionally add a fail-closed negative control."""
    packet = LiveRetainedPacket(nonhit, interaction, origin)
    if malformed == "duplicate_q_support":
        packet.solver.add(packet.same("q0", "q1"))
    elif malformed == "escaped_point_in_seed":
        packet.solver.add(packet.same("g0", P_SUPPORT[0]))
    elif malformed == "origin_overlap_three":
        packet.solver.add(packet.row_intersection_count("candidate", origin) >= 3)
    elif malformed == "q_overlap_three":
        packet.solver.add(packet.row_intersection_count("candidate", "Q") >= 3)
    elif malformed == "retained_endpoint_not_omitted":
        packet.solver.add(packet.retained_x["first"][0])
        packet.solver.add(packet.member(P_RADIUS_SUPPORT[0], "first"))
    elif malformed == "fresh_alias_retained_endpoint":
        packet.solver.add(packet.same("q0", "p0"))
    elif malformed == "cap_witness_alias":
        packet.solver.add(packet.same("capExtra0", "capExtra1"))
    elif malformed == "blocker_alias":
        packet.solver.add(packet.same("pBlockerCenter", "rhoBlockerCenter"))
    elif malformed == "positive_source_cap_two_hot":
        if interaction not in (
            "distinctBlockersDifferentCaps",
            "sameCapWithInternalFiberSource",
        ):
            raise LiveRetainedEncodingError(
                "positive malformed control needs positive interaction"
            )
        packet.solver.add(packet.source_cap[0], packet.source_cap[1])
    elif malformed == "positive_overlap_not_exact":
        if interaction not in (
            "distinctBlockersDifferentCaps",
            "sameCapWithInternalFiberSource",
        ):
            raise LiveRetainedEncodingError(
                "positive malformed control needs positive interaction"
            )
        packet.solver.add(packet.member("q2", "second"))
    elif malformed == "positive_cap_implication_violation":
        if interaction not in (
            "distinctBlockersDifferentCaps",
            "sameCapWithInternalFiberSource",
        ):
            raise LiveRetainedEncodingError(
                "positive malformed control needs positive interaction"
            )
        packet.solver.add(
            z3.Or(
                *(
                    z3.And(
                        packet.source_cap[cap],
                        z3.Not(packet.interior["secondCenter", cap]),
                    )
                    for cap in range(3)
                )
            )
        )
    elif malformed == "nonhit_omission_survival_false":
        if nonhit != "sourceRowOmission":
            raise LiveRetainedEncodingError("NonHit malformed control needs omission")
        packet.solver.add(z3.Not(packet.deletion_survives["nonhit"]))
    elif malformed == "nonhit_omission_two_hot":
        if nonhit != "sourceRowOmission":
            raise LiveRetainedEncodingError("NonHit malformed control needs omission")
        packet.solver.add(*packet.nonhit_deleted)
    elif malformed == "interaction_omission_survival_false":
        if interaction != "sourceRowOmission":
            raise LiveRetainedEncodingError(
                "interaction malformed control needs omission"
            )
        packet.solver.add(z3.Not(packet.deletion_survives["interaction"]))
    elif malformed == "interaction_omission_two_hot":
        if interaction != "sourceRowOmission":
            raise LiveRetainedEncodingError(
                "interaction malformed control needs omission"
            )
        packet.solver.add(*packet.interaction_deleted)
    elif malformed == "retained_double_survival_false":
        packet.solver.add(z3.Not(packet.double_survives["first"]))
    elif malformed == "retained_opp_blocked_false":
        packet.solver.add(z3.Not(packet.opp_double_blocked["first"]))
    elif malformed == "retained_radius_equal":
        packet.solver.add(
            packet.opp_radius_label["firstSource"]
            == packet.opp_radius_label["secondSource"]
        )
    elif malformed == "retained_radius_row_label_mismatch":
        packet.solver.add(
            packet.opp_radius_label["p1"] != packet.opp_radius_label["p0"]
        )
    elif malformed == "retained_minimal_core_false":
        packet.solver.add(z3.Not(packet.minimal_core_nonempty["first"]))
    elif malformed == "retained_cross_pair_survival_false":
        packet.solver.add(
            z3.Not(packet.cross_deletion_survives["first"]["p0"]),
            z3.Not(packet.cross_deletion_survives["first"]["p1"]),
        )
    elif malformed == "retained_multi_radius_false":
        packet.solver.add(z3.Not(packet.first_cap_multi_radius_retained))
    elif malformed == "retained_multi_radius_violation":
        packet.solver.add(
            packet.interior["capExtra0", 0],
            packet.interior["capExtra1", 0],
            packet.opp_radius_label["capExtra0"]
            == packet.opp_radius_label["capExtra1"],
            packet.opp_radius_label["capExtra0"] != packet.opp_radius_label["p0"],
            packet.opp_radius_label["capExtra0"] != packet.opp_radius_label["r0"],
        )
    elif malformed is not None:
        raise LiveRetainedEncodingError(f"unknown malformed control: {malformed}")
    return packet.solver, packet


def _truth(model: z3.ModelRef, expression: z3.BoolRef) -> bool:
    return z3.is_true(model.eval(expression, model_completion=True))


def _rank(model: z3.ModelRef, packet: LiveRetainedPacket, role: str) -> int:
    value = model.eval(packet.rank[role], model_completion=True)
    if not isinstance(value, z3.IntNumRef):
        raise LiveRetainedEncodingError(f"noninteger role rank: {role}")
    return value.as_long()


def validate_model(model: z3.ModelRef, packet: LiveRetainedPacket) -> dict[str, object]:
    """Independently replay the named finite invariants of a SAT assignment."""
    provenance_value = provenance_binding(packet)
    assertions = packet.solver.assertions()
    if len(assertions) < len(packet.provenance):
        raise LiveRetainedEncodingError("solver lost an emitted provenance clause")
    for provenance_row, assertion in zip(packet.provenance, assertions, strict=False):
        if not _truth(model, assertion):
            raise LiveRetainedEncodingError(
                f"emitted clause is false in model: {provenance_row['key']}"
            )
    ranks = {role: _rank(model, packet, role) for role in ROLES}
    radius_labels = {
        role: model.eval(packet.opp_radius_label[role], model_completion=True).as_long()
        for role in ROLES
    }
    if len({ranks[role] for role in CAP_EIGHT}) != 8:
        raise LiveRetainedEncodingError("cap-eight witnesses are not distinct")
    if any(not _truth(model, packet.in_cap[role, 0]) for role in CAP_EIGHT):
        raise LiveRetainedEncodingError("cap-eight witness misses the first cap")
    for name, (center, support) in ROWS.items():
        support_ranks = {ranks[role] for role in support}
        if len(support_ranks) != 4:
            raise LiveRetainedEncodingError(f"{name} support is not exact four")
        if ranks[center] in support_ranks:
            raise LiveRetainedEncodingError(f"{name} center lies in its support")
    seed_ranks = {ranks[role] for role in TRIPLE_SEED}
    if ranks["g0"] in seed_ranks:
        raise LiveRetainedEncodingError("escaped point lies in triple seed")
    origin_ranks = {ranks[role] for role in ROWS[packet.origin][1]}
    if ranks["gCenter"] not in origin_ranks:
        raise LiveRetainedEncodingError("candidate center misses origin support")
    candidate_ranks = {ranks[role] for role in CANDIDATE_SUPPORT}
    if len({ranks[role] for role in Q_SUPPORT}) != 4:
        raise LiveRetainedEncodingError("FreshThird Q row is not exact four")
    if (
        len(
            {ranks[role] for role in P_SUPPORT}
            & {ranks[role] for role in P_RADIUS_SUPPORT}
        )
        != 2
    ):
        raise LiveRetainedEncodingError("P blocker/radius rows do not overlap in two")
    if (
        len(
            {ranks[role] for role in P_RHO_SUPPORT}
            & {ranks[role] for role in P_RHO_RADIUS_SUPPORT}
        )
        != 2
    ):
        raise LiveRetainedEncodingError("Pρ blocker/radius rows do not overlap in two")
    overlap = len(candidate_ranks & origin_ranks)
    outside = len(candidate_ranks - origin_ranks)
    if overlap > 2 or outside < 2:
        raise LiveRetainedEncodingError("candidate/origin incidence failed")
    q_overlap = len(candidate_ranks & {ranks[role] for role in Q_SUPPORT})
    if q_overlap > 2:
        raise LiveRetainedEncodingError("candidate/Q-row overlap exceeds two")
    if not _truth(model, packet.cap_card_ge_eight):
        raise LiveRetainedEncodingError("cap-cardinality witness flag is false")
    if not _truth(
        model,
        packet.opp_radius_label["firstSource"]
        != packet.opp_radius_label["secondSource"],
    ):
        raise LiveRetainedEncodingError("retained source radii are not distinct")
    if any(radius_labels[role] != radius_labels["p0"] for role in P_RADIUS_SUPPORT):
        raise LiveRetainedEncodingError("P retained-radius row has mixed labels")
    if any(radius_labels[role] != radius_labels["r0"] for role in P_RHO_RADIUS_SUPPORT):
        raise LiveRetainedEncodingError("P-rho retained-radius row has mixed labels")
    if radius_labels["p0"] == radius_labels["r0"]:
        raise LiveRetainedEncodingError("the two named retained radii coincide")
    if not _truth(model, packet.first_cap_multi_radius_retained):
        raise LiveRetainedEncodingError("multi-point retained-radii field is false")
    for left, right in itertools.combinations(ROLES, 2):
        if (
            _truth(model, packet.interior[left, 0])
            and _truth(model, packet.interior[right, 0])
            and ranks[left] != ranks[right]
            and radius_labels[left] == radius_labels[right]
            and radius_labels[left] not in {radius_labels["p0"], radius_labels["r0"]}
        ):
            raise LiveRetainedEncodingError(
                "named strict-cap pair violates retained-radii universal"
            )
    for row in ("first", "second"):
        if not _truth(model, packet.double_survives[row]):
            raise LiveRetainedEncodingError(
                "retained double-deletion survival is false"
            )
        if not _truth(model, packet.opp_double_blocked[row]):
            raise LiveRetainedEncodingError("retained first-apex blockage is false")
        if not _truth(model, packet.minimal_core_nonempty[row]):
            raise LiveRetainedEncodingError("retained minimal core is empty")
        row_ranks = {ranks[role] for role in ROWS[row][1]}
        for endpoint in ("p0", "p1", "r0", "r1"):
            survives = _truth(model, packet.cross_deletion_survives[row][endpoint])
            if survives != (ranks[endpoint] not in row_ranks):
                raise LiveRetainedEncodingError(
                    "cross-deletion survival differs from support omission"
                )
        if not any(
            _truth(model, packet.cross_deletion_survives[row][endpoint])
            for endpoint in ("p0", "p1")
        ) or not any(
            _truth(model, packet.cross_deletion_survives[row][endpoint])
            for endpoint in ("r0", "r1")
        ):
            raise LiveRetainedEncodingError("cross-pair deletion view is absent")

    def selected_indices(atoms: Sequence[z3.BoolRef]) -> list[int]:
        return [index for index, atom in enumerate(atoms) if _truth(model, atom)]

    if packet.nonhit == "sourceRowOmission":
        deleted = selected_indices(packet.nonhit_deleted)
        if len(deleted) != 1:
            raise LiveRetainedEncodingError("NonHit deleted witness is not one-hot")
        if not _truth(model, packet.deletion_survives["nonhit"]):
            raise LiveRetainedEncodingError("NonHit omission survival is false")
        if ranks[Q_SUPPORT[deleted[0]]] in {ranks[role] for role in FIRST_SUPPORT}:
            raise LiveRetainedEncodingError(
                "NonHit deleted witness remains in source row"
            )
    if packet.interaction == "sourceRowOmission":
        deleted = selected_indices(packet.interaction_deleted)
        if len(deleted) != 1:
            raise LiveRetainedEncodingError(
                "Interaction deleted witness is not one-hot"
            )
        if not _truth(model, packet.deletion_survives["interaction"]):
            raise LiveRetainedEncodingError("Interaction omission survival is false")
        if ranks[Q_SUPPORT[deleted[0]]] in {ranks[role] for role in SECOND_SUPPORT}:
            raise LiveRetainedEncodingError(
                "Interaction deleted witness remains in source row"
            )
    if packet.interaction in (
        "distinctBlockersDifferentCaps",
        "sameCapWithInternalFiberSource",
    ):
        source_caps = selected_indices(packet.source_cap)
        fresh_caps = selected_indices(packet.fresh_cap)
        if len(source_caps) != 1 or len(fresh_caps) != 1:
            raise LiveRetainedEncodingError("positive cap witnesses are not one-hot")
        source_cap = source_caps[0]
        fresh_cap = fresh_caps[0]
        if not _truth(model, packet.interior["secondCenter", source_cap]):
            raise LiveRetainedEncodingError("source cap witness misses source center")
        if not _truth(model, packet.interior["qCenter", fresh_cap]):
            raise LiveRetainedEncodingError("fresh cap witness misses fresh center")
        second_q_intersection = {ranks[role] for role in SECOND_SUPPORT} & {
            ranks[role] for role in Q_SUPPORT
        }
        if second_q_intersection != {ranks["q0"], ranks["q1"]}:
            raise LiveRetainedEncodingError("positive Q/source overlap is not exact")
        if packet.interaction == "distinctBlockersDifferentCaps":
            if source_cap == fresh_cap:
                raise LiveRetainedEncodingError("distinct-cap witnesses coincide")
        else:
            if source_cap != fresh_cap:
                raise LiveRetainedEncodingError("same-cap witnesses differ")
            if not (
                _truth(model, packet.in_cap["q0", source_cap])
                or _truth(model, packet.in_cap["q1", source_cap])
            ):
                raise LiveRetainedEncodingError("same-cap fiber source is absent")
    retained_choices: dict[str, dict[str, int]] = {}
    for row in ("first", "second"):
        x_selected = selected_indices(packet.retained_x[row])
        y_selected = selected_indices(packet.retained_y[row])
        if len(x_selected) != 1 or len(y_selected) != 1:
            raise LiveRetainedEncodingError("retained endpoint witness is not one-hot")
        x_role = P_RADIUS_SUPPORT[x_selected[0]]
        y_role = P_RHO_RADIUS_SUPPORT[y_selected[0]]
        row_ranks = {ranks[role] for role in ROWS[row][1]}
        if ranks[x_role] in row_ranks or ranks[y_role] in row_ranks:
            raise LiveRetainedEncodingError("chosen retained endpoint was not omitted")
        retained_choices[row] = {"x": x_selected[0], "y": y_selected[0]}
    abstract_assignment = {
        "rank": ranks,
        "in_cap": {
            role: [_truth(model, packet.in_cap[role, cap]) for cap in range(3)]
            for role in ROLES
        },
        "interior": {
            role: [_truth(model, packet.interior[role, cap]) for cap in range(3)]
            for role in ROLES
        },
        "opp_radius_label": {role: radius_labels[role] for role in ROLES},
        "source_cap": [_truth(model, atom) for atom in packet.source_cap],
        "fresh_cap": [_truth(model, atom) for atom in packet.fresh_cap],
        "nonhit_deleted": [_truth(model, atom) for atom in packet.nonhit_deleted],
        "interaction_deleted": [
            _truth(model, atom) for atom in packet.interaction_deleted
        ],
        "deletion_survives": {
            family: _truth(model, atom)
            for family, atom in packet.deletion_survives.items()
        },
        "retained_x": {
            row: [_truth(model, atom) for atom in packet.retained_x[row]]
            for row in ("first", "second")
        },
        "retained_y": {
            row: [_truth(model, atom) for atom in packet.retained_y[row]]
            for row in ("first", "second")
        },
        "double_survives": {
            row: _truth(model, atom) for row, atom in packet.double_survives.items()
        },
        "opp_double_blocked": {
            row: _truth(model, atom) for row, atom in packet.opp_double_blocked.items()
        },
        "minimal_core_nonempty": {
            row: _truth(model, atom)
            for row, atom in packet.minimal_core_nonempty.items()
        },
        "cross_deletion_survives": {
            row: {endpoint: _truth(model, atom) for endpoint, atom in row_atoms.items()}
            for row, row_atoms in packet.cross_deletion_survives.items()
        },
        "first_cap_multi_radius_retained": _truth(
            model, packet.first_cap_multi_radius_retained
        ),
        "cap_card_ge_eight": _truth(model, packet.cap_card_ge_eight),
    }
    signature = {
        "schema": RESULT_SCHEMA,
        "nonhit": packet.nonhit,
        "interaction": packet.interaction,
        "origin": packet.origin,
        "point_classes": ranks,
        "candidate_support_classes": sorted(candidate_ranks),
        "triple_seed_classes": sorted(seed_ranks),
        "candidate_origin_overlap": overlap,
        "candidate_origin_outside": outside,
        "candidate_q_overlap": q_overlap,
        "retained_choices": retained_choices,
        "abstract_assignment": abstract_assignment,
        "clause_count": provenance_value["clause_count"],
        "provenance_binding": provenance_value,
        "false_claims": FALSE_CLAIMS,
    }
    signature["signature_sha256"] = hashlib.sha256(
        _canonical_json(signature)
    ).hexdigest()
    return signature


def replay_signature(
    signature: Mapping[str, object],
    required_predicate: str | None = None,
    required_value: bool | None = None,
) -> dict[str, object]:
    """Rebuild a fresh solver, bind every abstract atom, and replay a model."""
    try:
        nonhit = str(signature["nonhit"])
        interaction = str(signature["interaction"])
        origin = str(signature["origin"])
        assignment = signature["abstract_assignment"]
    except KeyError as exc:
        raise LiveRetainedEncodingError("signature is missing replay fields") from exc
    if not isinstance(assignment, Mapping):
        raise LiveRetainedEncodingError("abstract_assignment must be an object")
    expected_assignment_fields = {
        "rank",
        "in_cap",
        "interior",
        "opp_radius_label",
        "source_cap",
        "fresh_cap",
        "nonhit_deleted",
        "interaction_deleted",
        "deletion_survives",
        "retained_x",
        "retained_y",
        "double_survives",
        "opp_double_blocked",
        "minimal_core_nonempty",
        "cross_deletion_survives",
        "first_cap_multi_radius_retained",
        "cap_card_ge_eight",
    }
    if set(assignment) != expected_assignment_fields:
        raise LiveRetainedEncodingError("abstract_assignment fields are malformed")
    solver, packet = build_packet(nonhit, interaction, origin)
    if signature.get("provenance_binding") != provenance_binding(packet):
        raise LiveRetainedEncodingError("signature provenance binding mismatch")
    if (required_predicate is None) != (required_value is None):
        raise LiveRetainedEncodingError("predicate replay requires a name and value")
    if required_predicate is not None:
        predicates = synchronization_predicates(packet)
        if required_predicate not in predicates:
            raise LiveRetainedEncodingError(
                f"unknown synchronization predicate: {required_predicate}"
            )
        predicate = predicates[required_predicate]
        solver.add(predicate if required_value else z3.Not(predicate))

    def mapping_field(name: str) -> Mapping[str, object]:
        value = assignment.get(name)
        if not isinstance(value, Mapping):
            raise LiveRetainedEncodingError(f"{name} must be an object")
        return value

    ranks = mapping_field("rank")
    radii = mapping_field("opp_radius_label")
    in_cap = mapping_field("in_cap")
    interior = mapping_field("interior")
    for role in ROLES:
        if role not in ranks or role not in radii:
            raise LiveRetainedEncodingError(f"missing scalar assignment for {role}")
        solver.add(packet.rank[role] == int(ranks[role]))
        solver.add(packet.opp_radius_label[role] == int(radii[role]))
        for field_name, field, atoms in (
            ("in_cap", in_cap, packet.in_cap),
            ("interior", interior, packet.interior),
        ):
            values = field.get(role)
            if not isinstance(values, Sequence) or len(values) != 3:
                raise LiveRetainedEncodingError(
                    f"{field_name}.{role} must have three booleans"
                )
            for cap, value in enumerate(values):
                if not isinstance(value, bool):
                    raise LiveRetainedEncodingError(
                        f"{field_name}.{role}.{cap} is not Boolean"
                    )
                solver.add(atoms[role, cap] == value)

    def bind_bool_list(name: str, atoms: Sequence[z3.BoolRef]) -> None:
        values = assignment.get(name)
        if not isinstance(values, Sequence) or len(values) != len(atoms):
            raise LiveRetainedEncodingError(f"{name} has the wrong length")
        for atom, value in zip(atoms, values, strict=True):
            if not isinstance(value, bool):
                raise LiveRetainedEncodingError(f"{name} contains a non-Boolean")
            solver.add(atom == value)

    bind_bool_list("source_cap", packet.source_cap)
    bind_bool_list("fresh_cap", packet.fresh_cap)
    bind_bool_list("nonhit_deleted", packet.nonhit_deleted)
    bind_bool_list("interaction_deleted", packet.interaction_deleted)

    for name, atoms in (
        ("deletion_survives", packet.deletion_survives),
        ("double_survives", packet.double_survives),
        ("opp_double_blocked", packet.opp_double_blocked),
        ("minimal_core_nonempty", packet.minimal_core_nonempty),
    ):
        values = mapping_field(name)
        for key, atom in atoms.items():
            value = values.get(key)
            if not isinstance(value, bool):
                raise LiveRetainedEncodingError(f"{name}.{key} is not Boolean")
            solver.add(atom == value)
    for name, atoms in (
        ("retained_x", packet.retained_x),
        ("retained_y", packet.retained_y),
    ):
        values = mapping_field(name)
        for row, row_atoms in atoms.items():
            row_values = values.get(row)
            if not isinstance(row_values, Sequence) or len(row_values) != 2:
                raise LiveRetainedEncodingError(f"{name}.{row} has wrong length")
            for atom, value in zip(row_atoms, row_values, strict=True):
                if not isinstance(value, bool):
                    raise LiveRetainedEncodingError(
                        f"{name}.{row} contains a non-Boolean"
                    )
                solver.add(atom == value)
    cross_values = mapping_field("cross_deletion_survives")
    for row, row_atoms in packet.cross_deletion_survives.items():
        row_values = cross_values.get(row)
        if not isinstance(row_values, Mapping) or set(row_values) != set(row_atoms):
            raise LiveRetainedEncodingError(
                f"cross_deletion_survives.{row} fields are malformed"
            )
        for endpoint, atom in row_atoms.items():
            value = row_values.get(endpoint)
            if not isinstance(value, bool):
                raise LiveRetainedEncodingError(
                    f"cross_deletion_survives.{row}.{endpoint} is not Boolean"
                )
            solver.add(atom == value)
    multi_radius = assignment.get("first_cap_multi_radius_retained")
    if not isinstance(multi_radius, bool):
        raise LiveRetainedEncodingError(
            "first_cap_multi_radius_retained is not Boolean"
        )
    solver.add(packet.first_cap_multi_radius_retained == multi_radius)
    cap_card = assignment.get("cap_card_ge_eight")
    if not isinstance(cap_card, bool):
        raise LiveRetainedEncodingError("cap_card_ge_eight is not Boolean")
    solver.add(packet.cap_card_ge_eight == cap_card)
    if solver.check() != z3.sat:
        raise LiveRetainedEncodingError("bound abstract assignment is not SAT")
    replayed = validate_model(solver.model(), packet)
    if replayed != signature:
        raise LiveRetainedEncodingError("replayed signature differs from source")
    return replayed


def smoke_wave() -> list[dict[str, object]]:
    """Solve and replay all 24 structural cells without claiming closure."""
    results: list[dict[str, object]] = []
    for nonhit, interaction, origin in itertools.product(
        NONHIT_BRANCHES, INTERACTION_BRANCHES, ORIGIN_BRANCHES
    ):
        solver, packet = build_packet(nonhit, interaction, origin)
        status = solver.check()
        if status == z3.sat:
            signature = validate_model(solver.model(), packet)
            result = "SAT_ABSTRACTION"
        elif status == z3.unsat:
            signature = None
            result = "UNSAT_RELAXATION"
        else:
            signature = None
            result = "UNKNOWN"
        results.append(
            {
                "nonhit": nonhit,
                "interaction": interaction,
                "origin": origin,
                "status": result,
                "signature": signature,
            }
        )
    return results


def main(argv: Sequence[str] | None = None) -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--smoke", action="store_true")
    parser.add_argument("--manifest", action="store_true")
    args = parser.parse_args(argv)
    if args.manifest:
        print(json.dumps(manifest(), sort_keys=True, indent=2))
        return 0
    if args.smoke:
        print(json.dumps(smoke_wave(), sort_keys=True, indent=2))
        return 0
    parser.error("choose --smoke or --manifest")


if __name__ == "__main__":
    raise SystemExit(main())
