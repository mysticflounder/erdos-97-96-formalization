"""Fresh-namespaced CNF refinement for the FreshThird survivor-row packet.

The v1 structural CNF omitted the source-proved order-selected endpoint
survivor packet.  This module adds a Tseitin extension for all eight order
orientations, three row-cap choices, and two endpoint-deletion witnesses.  A
SAT result remains an abstraction witness and is always sent through the
existing fresh source replay.
"""

from __future__ import annotations

import hashlib
import itertools
from collections.abc import Mapping
from pathlib import Path

from census.p97_search.freshthird_qfiber_three_carrier_cnf_v1 import (
    CNF_CONSTRAINT_GROUPS as V1_CONSTRAINT_GROUPS,
)
from census.p97_search.freshthird_qfiber_three_carrier_cnf_v1 import (
    FreshThirdCarrierCnfEncoding,
    FreshThirdCarrierCnfError,
    SemanticReplay,
)
from census.p97_search.freshthird_qfiber_three_carrier_query_v1 import (
    FALSE_CLAIMS,
    REPO_ROOT,
    RESULT_SCHEMA,
    ROWS,
    SCHEMA,
    _canonical_json,
    replay_sat_result,
    source_manifest,
)

CNF_SCHEMA = "p97-freshthird-qfiber-three-carrier-order-refined-cnf/v2"
CNF_CONSTRAINT_GROUPS = (*V1_CONSTRAINT_GROUPS, "fresh_row_ordered_source_refinement")
SOURCE_THEOREMS = (
    "freshThird_canonicalDifferentCap_exists_orderSelectedEndpointSurvivingRow",
    "freshThird_orderSelectedEndpointSurvivingRow_capSplit",
)
REFINEMENT_TAG = "FRESH-ROW-ORDER"


class FreshThirdCarrierOrderRefinedCnfEncoding(FreshThirdCarrierCnfEncoding):
    """v2 direct CNF with the source-proved fresh survivor-row packet."""

    def __init__(self, boundary_index: int) -> None:
        super().__init__(boundary_index)
        self.clause_counts[REFINEMENT_TAG] = 0
        self._emit_fresh_row_ordered()

    def _arm_literals(
        self, outside: str, between: str, arm: int
    ) -> tuple[tuple[int, ...], tuple[str, str]]:
        canonical = "canonicalSource"
        source_center = "sourceCenter"
        fresh_center = "freshCenter"
        boundary = "boundaryCenter"
        if arm == 0:
            return (
                (
                    self.before(outside, fresh_center),
                    self.before(fresh_center, between),
                    self.before(between, source_center),
                    self.before(source_center, canonical),
                    self.same(boundary, between),
                ),
                (canonical, outside),
            )
        if arm == 1:
            return (
                (
                    self.before(outside, fresh_center),
                    self.before(fresh_center, between),
                    self.before(between, canonical),
                    self.before(canonical, source_center),
                    self.same(boundary, outside),
                ),
                (canonical, between),
            )
        if arm == 2:
            return (
                (
                    self.before(canonical, source_center),
                    self.before(source_center, between),
                    self.before(between, fresh_center),
                    self.before(fresh_center, outside),
                    self.same(boundary, between),
                ),
                (canonical, outside),
            )
        if arm == 3:
            return (
                (
                    self.before(source_center, canonical),
                    self.before(canonical, between),
                    self.before(between, fresh_center),
                    self.before(fresh_center, outside),
                    self.same(boundary, outside),
                ),
                (canonical, between),
            )
        raise FreshThirdCarrierCnfError("fresh-row arm must be in range(4)")

    def _fresh_row_aux(self, orientation: int, arm: int, endpoint: int, cap: int) -> int:
        return self.var("fresh-row-order-aux", orientation, arm, endpoint, cap)

    def _emit_fresh_row_ordered(self) -> None:
        for orientation in range(2):
            for arm in range(4):
                for endpoint in range(2):
                    for cap in range(3):
                        self._new_var(
                            ("fresh-row-order-aux", orientation, arm, endpoint, cap),
                            semantic=False,
                        )

        auxiliaries: list[int] = []
        boundary_slots = ROWS["boundary"][1]
        orientations = (
            ("freshSourceOne", "freshSourceTwo"),
            ("freshSourceTwo", "freshSourceOne"),
        )
        for orientation, (outside, between) in enumerate(orientations):
            for arm in range(4):
                order_literals, deleted = self._arm_literals(outside, between, arm)
                for endpoint in range(2):
                    for cap in range(3):
                        auxiliary = self._fresh_row_aux(orientation, arm, endpoint, cap)
                        auxiliaries.append(auxiliary)
                        for literal in order_literals:
                            self._add(REFINEMENT_TAG, (-auxiliary, literal))
                        self._add(
                            REFINEMENT_TAG,
                            (-auxiliary, self.cap_choice("row", cap)),
                        )
                        self._add(
                            REFINEMENT_TAG,
                            (-auxiliary, self.in_cap("boundaryCenter", cap)),
                        )
                        self._add(
                            REFINEMENT_TAG,
                            (-auxiliary, -self.incident(deleted[endpoint], "boundary")),
                        )
                        for triple in itertools.combinations(boundary_slots, 3):
                            self._add(
                                REFINEMENT_TAG,
                                (-auxiliary, *( -self.in_cap(role, cap) for role in triple)),
                            )
        self._add(REFINEMENT_TAG, auxiliaries)

    def cnf_header_bytes(self, clause_count: int) -> bytes:
        return (
            f"c {CNF_SCHEMA} boundary-index={self.boundary_index}\n"
            f"p cnf {self.num_vars} {clause_count}\n"
        ).encode("ascii")

    def variable_map(self) -> dict[str, object]:
        value = super().variable_map()
        value["schema"] = CNF_SCHEMA
        value["source_theorems"] = list(SOURCE_THEOREMS)
        return value

    def encoding_manifest(self) -> dict[str, object]:
        encoder_path = Path(__file__).resolve()
        return {
            "schema": CNF_SCHEMA,
            "boundary_index": self.boundary_index,
            "source_manifest_sha256": hashlib.sha256(
                _canonical_json(source_manifest())
            ).hexdigest(),
            "encoder_source": str(encoder_path.relative_to(REPO_ROOT)),
            "encoder_source_sha256": hashlib.sha256(encoder_path.read_bytes()).hexdigest(),
            "cnf_sha256": hashlib.sha256(self.cnf_bytes()).hexdigest(),
            "variable_map_sha256": hashlib.sha256(
                _canonical_json(self.variable_map())
            ).hexdigest(),
            "num_variables": self.num_vars,
            "semantic_variables": len(self.semantic_vars),
            "num_clauses": len(self.clauses),
            "clause_counts": dict(self.clause_counts),
            "source_theorems": list(SOURCE_THEOREMS),
        }

    def result_from_assignment(self, assignment: Mapping[int, bool]) -> dict[str, object]:
        signature = self.model_signature(assignment)
        manifest = self.encoding_manifest()
        return {
            "schema": RESULT_SCHEMA,
            "query_schema": SCHEMA,
            "boundary_index": self.boundary_index,
            "source_manifest_sha256": hashlib.sha256(
                _canonical_json(source_manifest())
            ).hexdigest(),
            "constraint_groups": list(CNF_CONSTRAINT_GROUPS),
            "encoding_manifest": manifest,
            "encoding_manifest_sha256": hashlib.sha256(_canonical_json(manifest)).hexdigest(),
            "status": "SAT_ABSTRACTION",
            "model_signature": signature,
            "model_signature_sha256": hashlib.sha256(
                _canonical_json(signature)
            ).hexdigest(),
            "claims": FALSE_CLAIMS,
        }

    def _validate_result_metadata(self, result: Mapping[str, object]) -> None:
        if result.get("schema") != RESULT_SCHEMA:
            raise FreshThirdCarrierCnfError("result schema mismatch")
        if result.get("query_schema") != SCHEMA:
            raise FreshThirdCarrierCnfError("query schema mismatch")
        if result.get("status") != "SAT_ABSTRACTION":
            raise FreshThirdCarrierCnfError("result status mismatch")
        if result.get("claims") != FALSE_CLAIMS:
            raise FreshThirdCarrierCnfError("claims mismatch")
        if result.get("constraint_groups") != list(CNF_CONSTRAINT_GROUPS):
            raise FreshThirdCarrierCnfError("constraint groups mismatch")
        manifest = result.get("encoding_manifest")
        if type(manifest) is not dict:
            raise FreshThirdCarrierCnfError("missing encoding manifest")
        digest = hashlib.sha256(_canonical_json(manifest)).hexdigest()
        if result.get("encoding_manifest_sha256") != digest:
            raise FreshThirdCarrierCnfError("encoding manifest hash mismatch")
        if manifest != self.encoding_manifest():
            raise FreshThirdCarrierCnfError("encoding manifest content mismatch")

    def replay_result(
        self, result: Mapping[str, object], *, timeout_ms: int = 60_000
    ) -> SemanticReplay:
        try:
            self._validate_result_metadata(result)
            source_result = dict(result)
            source_result["constraint_groups"] = [
                "same_equivalence_canonical",
                "complete_exact_row_theory",
                "complete_relational_theory",
                "cap_cyclic_interval_theory",
                "cap_skolem_ranges",
                "pinned_source_theory",
                "carrier_source_theory",
            ]
            replay_sat_result(source_result, timeout_ms=timeout_ms)
        except (FreshThirdCarrierCnfError, ValueError) as exc:
            return SemanticReplay(False, str(exc))
        return SemanticReplay(True, "fresh-session model signature replay accepted")


def fresh_row_ordered_holds(signature: Mapping[str, object]) -> bool:
    """Evaluate the complete source predicate on one decoded model signature."""

    points = signature.get("point_classes")
    order = signature.get("order")
    caps = signature.get("in_cap")
    witnesses = signature.get("cap_witnesses")
    if not all(type(value) is dict for value in (points, order, caps, witnesses)):
        raise FreshThirdCarrierCnfError("malformed signature for fresh-row predicate")

    def same(left: str, right: str) -> bool:
        return points.get(left) == points.get(right)

    def before(left: str, right: str) -> bool:
        return type(order.get(left)) is int and type(order.get(right)) is int and order[left] < order[right]

    def incident(role: str, row: str) -> bool:
        return any(same(role, slot) for slot in ROWS[row][1])

    row_cap = witnesses.get("row")
    if type(row_cap) is not int or row_cap not in range(3):
        raise FreshThirdCarrierCnfError("malformed row-cap witness")
    boundary_slots = ROWS["boundary"][1]
    if type(caps.get("boundaryCenter")) is not list:
        raise FreshThirdCarrierCnfError("malformed boundary-center cap data")
    if caps["boundaryCenter"][row_cap] is not True:
        return False
    inside = 0
    for role in boundary_slots:
        membership = caps.get(role)
        if type(membership) is not list or len(membership) != 3:
            raise FreshThirdCarrierCnfError("malformed boundary-row cap data")
        inside += membership[row_cap] is True
    if inside > 2 or len(boundary_slots) - inside < 2:
        return False

    canonical = "canonicalSource"
    source_center = "sourceCenter"
    fresh_center = "freshCenter"
    boundary = "boundaryCenter"
    for outside, between in (
        ("freshSourceOne", "freshSourceTwo"),
        ("freshSourceTwo", "freshSourceOne"),
    ):
        arms = (
            (
                (outside, fresh_center), (fresh_center, between),
                (between, source_center), (source_center, canonical),
                same(boundary, between), (canonical, outside),
            ),
            (
                (outside, fresh_center), (fresh_center, between),
                (between, canonical), (canonical, source_center),
                same(boundary, outside), (canonical, between),
            ),
            (
                (canonical, source_center), (source_center, between),
                (between, fresh_center), (fresh_center, outside),
                same(boundary, between), (canonical, outside),
            ),
            (
                (source_center, canonical), (canonical, between),
                (between, fresh_center), (fresh_center, outside),
                same(boundary, outside), (canonical, between),
            ),
        )
        for arm in arms:
            order_pairs = arm[:4]
            boundary_match = arm[4]
            first_deleted, second_deleted = arm[5]
            if (
                all(before(left, right) for left, right in order_pairs)
                and boundary_match
                and (not incident(first_deleted, "boundary") or not incident(second_deleted, "boundary"))
            ):
                return True
    return False
