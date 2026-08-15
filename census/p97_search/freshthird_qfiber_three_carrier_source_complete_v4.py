"""Source-complete CNF for the FreshThird exact-three carrier query.

The predecessor v3 encoding made the complete no-alternating-cap theorem
static, but deliberately inherited the v1 structural relaxation.  This module
adds every remaining finite source packet used by the independent Z3 replay:
the exact-row intersection laws, predicate congruence, the pinned boundary and
blocker fan, and the second-order boundary fan.  SAT is still discovery data;
UNSAT is only an UNSAT result for this finite source theory until separately
promoted through the Lean query contract.

The predecessor vocabulary has no ternary radius atom for nonpinned centers.
That source field is realized by the canonical model-signature readback rather
than a raw DIMACS variable, so "source-complete" here means complete as a
finite projection plus replay contract, not a clause-for-clause transcription.
"""

from __future__ import annotations

import hashlib
import itertools
from collections.abc import Mapping
from pathlib import Path

from census.p97_search.freshthird_qfiber_three_carrier_cnf_v1 import (
    FreshThirdCarrierCnfError,
    _canonical_json,
)
from census.p97_search.freshthird_qfiber_three_carrier_query_v1 import (
    BOUNDARY_ROW_SOURCES,
    FALSE_CLAIMS,
    FAN_SOURCES,
    OLD_ROLES,
    Q_SOURCES,
    REPO_ROOT,
    RESULT_SCHEMA,
    ROLES,
    ROWS,
    SEED,
    source_manifest,
)
from census.p97_search.freshthird_qfiber_three_carrier_query_v1 import (
    CONSTRAINT_GROUPS as SOURCE_CONSTRAINT_GROUPS,
)
from census.p97_search.freshthird_qfiber_three_carrier_query_v1 import (
    SCHEMA as QUERY_SCHEMA,
)
from census.p97_search.freshthird_qfiber_three_carrier_source_total_v3 import (
    CONSTRAINT_GROUPS as PREDECESSOR_CONSTRAINT_GROUPS,
)
from census.p97_search.freshthird_qfiber_three_carrier_source_total_v3 import (
    PROFILE as PREDECESSOR_PROFILE,
)
from census.p97_search.freshthird_qfiber_three_carrier_source_total_v3 import (
    SCHEMA as PREDECESSOR_SCHEMA,
)
from census.p97_search.freshthird_qfiber_three_carrier_source_total_v3 import (
    SOURCE_THEOREM as NO_ALTERNATING_CAP_SOURCE_THEOREM,
)
from census.p97_search.freshthird_qfiber_three_carrier_source_total_v3 import (
    FreshThirdCarrierSourceTotalCnfEncoding,
)

SCHEMA = "p97-freshthird-qfiber-three-carrier-source-complete/v4"
PROFILE = "complete-finite-source-theory-plus-three-phase-cap/v1"
SOURCE_THEOREM = (
    "FreshThirdQFiberThreeCarrierFiniteView.completeSourceTheory_ofView"
)
SOURCE_THEOREMS = (SOURCE_THEOREM, NO_ALTERNATING_CAP_SOURCE_THEOREM)
CONSTRAINT_GROUPS = (
    *PREDECESSOR_CONSTRAINT_GROUPS,
    "source_complete_finite_theory",
)
CLAUSE_TAGS = (
    "SOURCE-ROW-OVERLAP",
    "SOURCE-ROW-CAP",
    "SOURCE-ROW-OUTSIDE-CAP",
    "SOURCE-HAS4-CONGRUENCE",
    "SOURCE-PINNED-OVERLAP",
    "SOURCE-PINNED-ORDER",
    "SOURCE-PINNED-ESCAPE",
    "SOURCE-PINNED-BLOCKER",
    "SOURCE-PINNED-NORMALIZED",
    "SOURCE-CARRIER-BOUNDARY",
    "SOURCE-CARRIER-FAN",
    "SOURCE-CARRIER-NORMALIZED",
)


class FreshThirdCarrierSourceCompleteCnfEncoding(
    FreshThirdCarrierSourceTotalCnfEncoding
):
    """The v3 cap encoding plus the complete finite source theory."""

    def __init__(self, boundary_index: int) -> None:
        super().__init__(boundary_index)
        self.clause_counts.update({tag: 0 for tag in CLAUSE_TAGS})
        self._allocate_source_witnesses()
        self._emit_source_complete_clauses()

    def source_witness(self, family: str, *indices: int) -> int:
        return self.var("source-complete-witness", family, *indices)

    def _allocate_source_witnesses(self) -> None:
        for orientation in range(2):
            for arm in range(4):
                self._new_var(
                    ("source-complete-witness", "ordered", orientation, arm),
                    semantic=False,
                )
        for i in range(4):
            self._new_var(
                ("source-complete-witness", "fan-outside", i), semantic=False
            )
            self._new_var(
                ("source-complete-witness", "endpoint-outside", i),
                semantic=False,
            )
        self._new_var(
            ("source-complete-witness", "endpoint-support", 0), semantic=False
        )
        for prefix in ("pinned", "boundary"):
            for i in range(4):
                for cap in range(3):
                    self._new_var(
                        (
                            "source-complete-witness",
                            f"{prefix}-center",
                            i,
                            cap,
                        ),
                        semantic=False,
                    )
            self._new_var(
                ("source-complete-witness", f"{prefix}-fallback", 0),
                semantic=False,
            )
            for i in range(4):
                for j in range(4):
                    if i == j:
                        continue
                    for cap in range(3):
                        self._new_var(
                            (
                                "source-complete-witness",
                                f"{prefix}-repeated",
                                i,
                                j,
                                cap,
                            ),
                            semantic=False,
                        )
                    self._new_var(
                        (
                            "source-complete-witness",
                            f"{prefix}-mutual",
                            i,
                            j,
                        ),
                        semantic=False,
                    )

    def _emit_source_complete_clauses(self) -> None:
        self._emit_complete_row_theory()
        self._emit_has_four_congruence()
        self._emit_pinned_packet()
        self._emit_carrier_packet()

    def _emit_complete_row_theory(self) -> None:
        for left, right in itertools.combinations(ROWS, 2):
            left_center = ROWS[left][2]
            right_center = ROWS[right][2]
            same_center = self.same(left_center, right_center)
            for selected in itertools.combinations(ROWS[left][1], 3):
                self._add(
                    "SOURCE-ROW-OVERLAP",
                    (
                        same_center,
                        *(-self.incident(slot, right) for slot in selected),
                    ),
                )

        for _origin, slots, center in ROWS.values():
            for cap in range(3):
                center_in_cap = self.in_cap(center, cap)
                for selected in itertools.combinations(slots, 3):
                    self._add(
                        "SOURCE-ROW-CAP",
                        (
                            -center_in_cap,
                            *(-self.in_cap(slot, cap) for slot in selected),
                        ),
                    )

        for left, right in itertools.combinations(ROWS, 2):
            left_center = ROWS[left][2]
            right_center = ROWS[right][2]
            same_center = self.same(left_center, right_center)
            for cap in range(3):
                guards = (
                    -self.in_cap(left_center, cap),
                    -self.in_cap(right_center, cap),
                    same_center,
                )
                for first, second in itertools.combinations(ROWS[left][1], 2):
                    self._add(
                        "SOURCE-ROW-OUTSIDE-CAP",
                        (
                            *guards,
                            -self.incident(first, right),
                            self.in_cap(first, cap),
                            -self.incident(second, right),
                            self.in_cap(second, cap),
                        ),
                    )

    def _emit_has_four_congruence(self) -> None:
        for left, right in itertools.combinations(ROLES, 2):
            same_deleted = self.same(left, right)
            for center in self.row_centers:
                self._equate_under(
                    same_deleted,
                    self.has_four(left, center),
                    self.has_four(right, center),
                    "SOURCE-HAS4-CONGRUENCE",
                )
        for left, right in itertools.combinations(self.row_centers, 2):
            same_center = self.same(left, right)
            for deleted in ROLES:
                self._equate_under(
                    same_center,
                    self.has_four(deleted, left),
                    self.has_four(deleted, right),
                    "SOURCE-HAS4-CONGRUENCE",
                )

    def _emit_pinned_packet(self) -> None:
        self._exactly(
            tuple(self.incident(slot, "fresh") for slot in ROWS["source"][1]),
            2,
            "SOURCE-PINNED-OVERLAP",
        )
        self._emit_ordered_boundary_row()
        self._emit_pinned_escape_packet()
        self._emit_pinned_blocker_packet()
        self._emit_normalized_fan(prefix="pinned")

    def _emit_ordered_boundary_row(self) -> None:
        endpoints = ("freshSourceOne", "freshSourceTwo")
        witnesses: list[int] = []
        for orientation, (outside, between) in enumerate(
            (endpoints, tuple(reversed(endpoints)))
        ):
            c = "canonicalSource"
            c2 = "sourceCenter"
            fresh = "freshCenter"
            boundary = "boundaryCenter"
            arms = (
                (
                    (outside, fresh, between, c2, c),
                    between,
                    outside,
                ),
                (
                    (outside, fresh, between, c, c2),
                    outside,
                    between,
                ),
                (
                    (c, c2, between, fresh, outside),
                    between,
                    outside,
                ),
                (
                    (c2, c, between, fresh, outside),
                    outside,
                    between,
                ),
            )
            for arm_index, (chain, boundary_alias, second_deleted) in enumerate(
                arms
            ):
                witness = self.source_witness("ordered", orientation, arm_index)
                witnesses.append(witness)
                for left, right in itertools.pairwise(chain):
                    self._add(
                        "SOURCE-PINNED-ORDER",
                        (-witness, self.before(left, right)),
                    )
                self._add(
                    "SOURCE-PINNED-ORDER",
                    (-witness, self.same(boundary, boundary_alias)),
                )
                self._add(
                    "SOURCE-PINNED-ORDER",
                    (
                        -witness,
                        -self.incident(c, "boundary"),
                        -self.incident(second_deleted, "boundary"),
                    ),
                )
                for cap in range(3):
                    choice = self.cap_choice("row", cap)
                    self._add(
                        "SOURCE-PINNED-ORDER",
                        (
                            -witness,
                            -choice,
                            self.in_cap(boundary, cap),
                        ),
                    )
                    boundary_slots = ROWS["boundary"][1]
                    for selected in itertools.combinations(boundary_slots, 3):
                        self._add(
                            "SOURCE-PINNED-ORDER",
                            (
                                -witness,
                                -choice,
                                *(-self.in_cap(slot, cap) for slot in selected),
                            ),
                        )
        self._add("SOURCE-PINNED-ORDER", witnesses)

    def _emit_pinned_escape_packet(self) -> None:
        outside_witnesses: list[int] = []
        for i, source in enumerate(FAN_SOURCES):
            witness = self.source_witness("fan-outside", i)
            outside_witnesses.append(witness)
            for seed in SEED:
                self._add(
                    "SOURCE-PINNED-ESCAPE",
                    (-witness, -self.same(source, seed)),
                )
        self._add("SOURCE-PINNED-ESCAPE", outside_witnesses)

        endpoint_witnesses: list[int] = []
        for i, source in enumerate(ROWS["boundary"][1]):
            witness = self.source_witness("endpoint-outside", i)
            endpoint_witnesses.append(witness)
            self._add(
                "SOURCE-PINNED-ESCAPE",
                (-witness, -self.same("pinnedCenter", "boundaryCenter")),
            )
            for seed in SEED:
                self._add(
                    "SOURCE-PINNED-ESCAPE",
                    (-witness, -self.same(source, seed)),
                )

        support_witness = self.source_witness("endpoint-support", 0)
        endpoint_witnesses.append(support_witness)
        self._add(
            "SOURCE-PINNED-ESCAPE",
            (support_witness, *endpoint_witnesses[:-1]),
        )
        self._add(
            "SOURCE-PINNED-ESCAPE",
            (-support_witness, self.same("pinnedCenter", "boundaryCenter")),
        )
        for source in FAN_SOURCES:
            self._add(
                "SOURCE-PINNED-ESCAPE",
                (-support_witness, self.incident(source, "boundary")),
            )

    def _emit_pinned_blocker_packet(self) -> None:
        for i in range(4):
            center = f"blockerCenter{i}"
            source = f"fanSource{i}"
            row = f"blocker{i}"
            same_center = self.same("pinnedCenter", center)
            for cap in range(3):
                self._add(
                    "SOURCE-PINNED-BLOCKER",
                    (
                        -self.cap_choice(f"blocker-{i}", cap),
                        self.interior(center, cap),
                    ),
                )
            self._add(
                "SOURCE-PINNED-BLOCKER", (-self.has_four(source, center),)
            )
            self._add("SOURCE-PINNED-BLOCKER", (self.incident(source, row),))
            self._add(
                "SOURCE-PINNED-BLOCKER",
                (-same_center, self.nonrobust("pinnedCenter")),
            )
            for fan_source in FAN_SOURCES:
                self._add(
                    "SOURCE-PINNED-BLOCKER",
                    (-same_center, self.incident(fan_source, row)),
                )
            for selected in itertools.combinations(FAN_SOURCES, 3):
                self._add(
                    "SOURCE-PINNED-BLOCKER",
                    (
                        same_center,
                        *(-self.incident(role, row) for role in selected),
                    ),
                )
            for role in OLD_ROLES:
                has_four = self.has_four(role, center)
                incident = self.incident(role, row)
                self._add(
                    "SOURCE-PINNED-BLOCKER",
                    (incident, has_four),
                )
                self._add(
                    "SOURCE-PINNED-BLOCKER",
                    (-incident, -has_four),
                )
            for slot in ROWS[row][1]:
                self._add(
                    "SOURCE-PINNED-BLOCKER",
                    (-self.has_four(slot, center),),
                )

    def _emit_carrier_packet(self) -> None:
        for selected in itertools.combinations(Q_SOURCES, 3):
            self._add(
                "SOURCE-CARRIER-BOUNDARY",
                tuple(-self.incident(role, "boundaryBlocker") for role in selected),
            )

        for i in range(4):
            center = f"boundaryFanBlockerCenter{i}"
            row = f"boundaryFanBlocker{i}"
            same_center = self.same(center, "boundaryBlockerCenter")
            self._add(
                "SOURCE-CARRIER-FAN",
                (-same_center, self.nonrobust("boundaryBlockerCenter")),
            )
            for role in ROLES:
                self._equate_under(
                    same_center,
                    self.incident(role, row),
                    self.incident(role, "boundaryBlocker"),
                    "SOURCE-CARRIER-FAN",
                )
            for selected in itertools.combinations(BOUNDARY_ROW_SOURCES, 3):
                self._add(
                    "SOURCE-CARRIER-FAN",
                    (
                        same_center,
                        *(-self.incident(role, row) for role in selected),
                    ),
                )
        self._emit_normalized_fan(prefix="boundary")

    def _emit_normalized_fan(self, *, prefix: str) -> None:
        if prefix == "pinned":
            root_center = "pinnedCenter"
            centers = tuple(f"blockerCenter{i}" for i in range(4))
            sources = tuple(f"fanSource{i}" for i in range(4))
        elif prefix == "boundary":
            root_center = "boundaryBlockerCenter"
            centers = tuple(f"boundaryFanBlockerCenter{i}" for i in range(4))
            sources = tuple(f"boundaryRowSource{i}" for i in range(4))
        else:  # pragma: no cover - internal programming error
            raise FreshThirdCarrierCnfError(f"unknown normalized fan: {prefix}")

        repeated_witnesses: list[int] = []
        mutual_witnesses: list[int] = []
        tag = (
            "SOURCE-PINNED-NORMALIZED"
            if prefix == "pinned"
            else "SOURCE-CARRIER-NORMALIZED"
        )
        for i in range(4):
            for j in range(4):
                if i == j:
                    continue
                ci, cj = centers[i], centers[j]
                si, sj = sources[i], sources[j]
                for cap in range(3):
                    witness = self.source_witness(f"{prefix}-repeated", i, j, cap)
                    repeated_witnesses.append(witness)
                    self._add(tag, (-witness, self.interior(ci, cap)))
                    self._add(tag, (-witness, self.interior(cj, cap)))
                    self._add(
                        tag,
                        (
                            -witness,
                            self.same(ci, cj),
                            self.has_four(sj, ci),
                            self.has_four(si, cj),
                        ),
                    )
                mutual = self.source_witness(f"{prefix}-mutual", i, j)
                mutual_witnesses.append(mutual)
                self._add(tag, (-mutual, self.has_four(sj, ci)))
                self._add(tag, (-mutual, self.has_four(si, cj)))
                self._add(tag, (-mutual, -self.same(ci, cj)))

        center_witnesses: list[int] = []
        source_row = "fan" if prefix == "pinned" else "boundaryBlocker"
        for i, center in enumerate(centers):
            row = f"blocker{i}" if prefix == "pinned" else f"boundaryFanBlocker{i}"
            source_slots = ROWS[source_row][1]
            for cap in range(3):
                witness = self.source_witness(f"{prefix}-center", i, cap)
                center_witnesses.append(witness)
                self._add(tag, (-witness, self.same(root_center, center)))
                self._add(tag, (-witness, self.interior(center, cap)))
                self._add(tag, (-witness, -self.has_four(sources[i], center)))
                self._add(tag, (-witness, self.nonrobust(root_center)))
                for slot in source_slots:
                    self._add(tag, (-witness, self.incident(slot, row)))

        root_aliases = tuple(-self.same(root_center, center) for center in centers)
        fallback = self.source_witness(f"{prefix}-fallback", 0)
        for root_distinct in root_aliases:
            self._add(tag, (-fallback, root_distinct))
        self._add(tag, (-fallback, *repeated_witnesses))
        self._add(tag, (-fallback, *mutual_witnesses))
        self._add(tag, (*center_witnesses, fallback))

    def variable_map(self) -> dict[str, object]:
        value = super().variable_map()
        value.update(
            {
                "schema": SCHEMA,
                "predecessor_schema": PREDECESSOR_SCHEMA,
                "profile": PROFILE,
            }
        )
        return value

    def encoding_manifest(self) -> dict[str, object]:
        own_path = Path(__file__).resolve()
        predecessor_path = REPO_ROOT / (
            "census/p97_search/"
            "freshthird_qfiber_three_carrier_source_total_v3.py"
        )
        source_manifest_sha256 = hashlib.sha256(
            _canonical_json(source_manifest())
        ).hexdigest()
        return {
            "schema": SCHEMA,
            "predecessor_schema": PREDECESSOR_SCHEMA,
            "predecessor_profile": PREDECESSOR_PROFILE,
            "profile": PROFILE,
            "boundary_index": self.boundary_index,
            "source_theorem": SOURCE_THEOREM,
            "source_theorems": list(SOURCE_THEOREMS),
            "source_manifest_sha256": source_manifest_sha256,
            "encoder_source": str(own_path.relative_to(REPO_ROOT)),
            "encoder_source_sha256": hashlib.sha256(own_path.read_bytes()).hexdigest(),
            "predecessor_source": str(predecessor_path.relative_to(REPO_ROOT)),
            "predecessor_source_sha256": hashlib.sha256(
                predecessor_path.read_bytes()
            ).hexdigest(),
            "cnf_sha256": hashlib.sha256(self.cnf_bytes()).hexdigest(),
            "variable_map_sha256": hashlib.sha256(
                _canonical_json(self.variable_map())
            ).hexdigest(),
            "num_variables": self.num_vars,
            "semantic_variables": len(self.semantic_vars),
            "num_clauses": len(self.clauses),
            "clause_counts": dict(self.clause_counts),
            "source_fields_realized_by_canonical_readback": [
                "radius(center,left) = radius(center,right) for every named exact row",
            ],
            "canonical_readback_reason": (
                "the v1 semantic vocabulary has only pairwise pinned-radius-eq atoms; "
                "nonpinned row-center radii are read back as one equality class, while "
                "pinned aliases are guarded by the predecessor RADIUS-EQUIV clauses"
            ),
            "learned_stream_imported": False,
            "claim": (
                "source-complete finite projection and replay; "
                "no universal or Lean closure"
            ),
        }

    def result_from_assignment(
        self, assignment: Mapping[int, bool]
    ) -> dict[str, object]:
        result = super().result_from_assignment(assignment)
        manifest = self.encoding_manifest()
        result.update(
            {
                "constraint_groups": list(CONSTRAINT_GROUPS),
                "encoding_manifest": manifest,
                "encoding_manifest_sha256": hashlib.sha256(
                    _canonical_json(manifest)
                ).hexdigest(),
            }
        )
        return result

    def validate_source_complete_assignment(
        self, assignment: Mapping[int, bool]
    ) -> None:
        """Validate every v4 clause and the independent no-alternation readback."""

        self.validate_source_total_assignment(assignment)

    def _validate_result_metadata(self, result: Mapping[str, object]) -> None:
        if result.get("schema") != RESULT_SCHEMA:
            raise FreshThirdCarrierCnfError("result schema mismatch")
        if result.get("query_schema") != QUERY_SCHEMA:
            raise FreshThirdCarrierCnfError("query schema mismatch")
        if result.get("boundary_index") != self.boundary_index:
            raise FreshThirdCarrierCnfError("boundary index mismatch")
        expected_source_hash = hashlib.sha256(
            _canonical_json(source_manifest())
        ).hexdigest()
        if result.get("source_manifest_sha256") != expected_source_hash:
            raise FreshThirdCarrierCnfError("source manifest hash mismatch")
        if result.get("status") != "SAT_ABSTRACTION":
            raise FreshThirdCarrierCnfError("result status mismatch")
        if result.get("claims") != FALSE_CLAIMS:
            raise FreshThirdCarrierCnfError("claims mismatch")
        if result.get("constraint_groups") != list(CONSTRAINT_GROUPS):
            raise FreshThirdCarrierCnfError("constraint groups mismatch")
        signature = result.get("model_signature")
        if type(signature) is not dict:
            raise FreshThirdCarrierCnfError("missing model signature")
        if result.get("model_signature_sha256") != hashlib.sha256(
            _canonical_json(signature)
        ).hexdigest():
            raise FreshThirdCarrierCnfError("model signature hash mismatch")
        manifest = result.get("encoding_manifest")
        if type(manifest) is not dict:
            raise FreshThirdCarrierCnfError("missing encoding manifest")
        if result.get("encoding_manifest_sha256") != hashlib.sha256(
            _canonical_json(manifest)
        ).hexdigest():
            raise FreshThirdCarrierCnfError("encoding manifest hash mismatch")
        if manifest != self.encoding_manifest():
            raise FreshThirdCarrierCnfError("encoding manifest content mismatch")


def dry_run_manifest(boundary_index: int) -> dict[str, object]:
    encoding = FreshThirdCarrierSourceCompleteCnfEncoding(boundary_index)
    return {
        "schema": f"{SCHEMA}/dry-run-manifest/v1",
        "boundary_index": boundary_index,
        "encoding": encoding.encoding_manifest(),
        "launch_eligible": False,
        "blocked_on": [
            "independent clause-family differential audit",
            "static runner source-snapshot and phase-ingress validation",
        ],
    }


assert SOURCE_CONSTRAINT_GROUPS[-2:] == (
    "pinned_source_theory",
    "carrier_source_theory",
)
