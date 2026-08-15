# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>

"""Source-total cyclic-cap encoding for the FreshThird carrier quotient.

The v2 CEGAR runner learned one source-proved ``NoAlternatingCap`` instance at
a time.  This Class-C successor encodes the complete quantified family up
front.  For each cap, every named role receives one of three monotone phases;
cap membership alternates exactly when the phase crosses 0->1 or 1->2.  This
is equivalent, on a finite total preorder, to excluding every increasing
four-role ``in/out/in/out`` or ``out/in/out/in`` subsequence.

This module owns only the compact encoding and its dry-run manifest.  It does
not launch a solver or import a learned v2 certificate stream.
"""

from __future__ import annotations

import hashlib
import itertools
import math
from collections.abc import Mapping, Sequence
from pathlib import Path

from census.p97_search.freshthird_qfiber_three_carrier_cnf_v1 import (
    CNF_CONSTRAINT_GROUPS,
    CNF_SCHEMA,
    FreshThirdCarrierCnfEncoding,
    FreshThirdCarrierCnfError,
    SemanticReplay,
    _canonical_json,
)
from census.p97_search.freshthird_qfiber_three_carrier_query_v1 import (
    CONSTRAINT_GROUPS as SOURCE_CONSTRAINT_GROUPS,
)
from census.p97_search.freshthird_qfiber_three_carrier_query_v1 import (
    FALSE_CLAIMS,
    REPO_ROOT,
    RESULT_SCHEMA,
    ROLES,
    replay_sat_result,
    source_manifest,
)
from census.p97_search.freshthird_qfiber_three_carrier_query_v1 import (
    SCHEMA as QUERY_SCHEMA,
)

SCHEMA = "p97-freshthird-qfiber-three-carrier-source-total/v3"
PROFILE = "monotone-three-phase-no-alternating-cap/v1"
SOURCE_THEOREM = "FreshThirdQFiberThreeCarrierFiniteAssignment.noAlternatingCap_ofView"
CONSTRAINT_GROUPS = (*CNF_CONSTRAINT_GROUPS, "source_total_no_alternating_cap")
CLAUSE_TAGS = (
    "NOALT-PHASE-EXACT",
    "NOALT-MEMBERSHIP",
    "NOALT-SAME",
    "NOALT-MONOTONE",
)
PHASE_COUNT = 3
CAP_COUNT = 3


def direct_forbidden_instance_count(role_count: int = len(ROLES)) -> int:
    """Number of clauses in the naive ordered-quadruple expansion."""

    if role_count < 0:
        raise ValueError("role_count must be nonnegative")
    return CAP_COUNT * 2 * math.perm(role_count, 4)


def monotone_phase_witness(
    memberships: Sequence[bool],
) -> tuple[bool, tuple[int, ...]] | None:
    """Return the canonical three-run witness, or ``None`` if alternating.

    A binary word avoids both alternating subsequences of length four exactly
    when it has at most three nonempty runs.  The returned Boolean is the
    phase-zero membership and the phase tuple records the run index.
    """

    values = tuple(memberships)
    if not all(type(value) is bool for value in values):
        raise TypeError("memberships must contain only bool values")
    if not values:
        return False, ()
    phase = 0
    phases = [phase]
    for previous, current in itertools.pairwise(values):
        if current != previous:
            phase += 1
            if phase >= PHASE_COUNT:
                return None
        phases.append(phase)
    return values[0], tuple(phases)


class FreshThirdCarrierSourceTotalCnfEncoding(FreshThirdCarrierCnfEncoding):
    """The v1 structural CNF plus the complete source-proved cap law."""

    def __init__(self, boundary_index: int) -> None:
        super().__init__(boundary_index)
        self.clause_counts.update({tag: 0 for tag in CLAUSE_TAGS})
        self._allocate_noalternating_variables()
        self._emit_noalternating_clauses()

    def cap_start(self, cap: int) -> int:
        return self.var("noalt-start", cap)

    def cap_phase(self, role: str, cap: int, phase: int) -> int:
        return self.var("noalt-phase", self.role_index[role], cap, phase)

    def _allocate_noalternating_variables(self) -> None:
        for cap in range(CAP_COUNT):
            self._new_var(("noalt-start", cap), semantic=False)
        for role in ROLES:
            for cap in range(CAP_COUNT):
                for phase in range(PHASE_COUNT):
                    self._new_var(
                        ("noalt-phase", self.role_index[role], cap, phase),
                        semantic=False,
                    )

    def _emit_noalternating_clauses(self) -> None:
        for cap in range(CAP_COUNT):
            start = self.cap_start(cap)
            for role in ROLES:
                phases = tuple(
                    self.cap_phase(role, cap, phase) for phase in range(PHASE_COUNT)
                )
                self._add("NOALT-PHASE-EXACT", phases)
                for left, right in itertools.combinations(phases, 2):
                    self._add("NOALT-PHASE-EXACT", (-left, -right))

                middle = phases[1]
                member = self.in_cap(role, cap)
                # member <-> (start xor middle)
                self._add("NOALT-MEMBERSHIP", (start, middle, -member))
                self._add("NOALT-MEMBERSHIP", (start, -middle, member))
                self._add("NOALT-MEMBERSHIP", (-start, middle, member))
                self._add("NOALT-MEMBERSHIP", (-start, -middle, -member))

            for left, right in itertools.permutations(ROLES, 2):
                before = self.before(left, right)
                for left_phase in range(PHASE_COUNT):
                    for right_phase in range(left_phase):
                        self._add(
                            "NOALT-MONOTONE",
                            (
                                -before,
                                -self.cap_phase(left, cap, left_phase),
                                -self.cap_phase(right, cap, right_phase),
                            ),
                        )

            for left, right in itertools.combinations(ROLES, 2):
                same = self.same(left, right)
                for phase in range(PHASE_COUNT):
                    self._equate_under(
                        same,
                        self.cap_phase(left, cap, phase),
                        self.cap_phase(right, cap, phase),
                        "NOALT-SAME",
                    )

    def cnf_bytes(self, extra_clauses: Sequence[Sequence[int]] = ()) -> bytes:
        if extra_clauses:
            raise FreshThirdCarrierCnfError(
                "source-total schema rejects iterative or external clauses"
            )
        return super().cnf_bytes()

    def variable_map(self) -> dict[str, object]:
        value = super().variable_map()
        value.update(
            {
                "schema": SCHEMA,
                "predecessor_schema": CNF_SCHEMA,
                "profile": PROFILE,
            }
        )
        return value

    def encoding_manifest(self) -> dict[str, object]:
        own_path = Path(__file__).resolve()
        predecessor_path = Path(
            FreshThirdCarrierCnfEncoding.__module__.replace(".", "/")
        )
        predecessor_path = REPO_ROOT / predecessor_path.with_suffix(".py")
        source_manifest_sha256 = hashlib.sha256(
            _canonical_json(source_manifest())
        ).hexdigest()
        return {
            "schema": SCHEMA,
            "predecessor_schema": CNF_SCHEMA,
            "profile": PROFILE,
            "boundary_index": self.boundary_index,
            "source_theorem": SOURCE_THEOREM,
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
            "logical_forbidden_instances": direct_forbidden_instance_count(),
            "learned_stream_imported": False,
            "claim": "source-total discovery encoding; no universal or Lean closure",
        }

    def result_from_assignment(
        self, assignment: Mapping[int, bool]
    ) -> dict[str, object]:
        signature = self.model_signature(assignment)
        manifest = source_manifest()
        encoding_manifest = self.encoding_manifest()
        return {
            "schema": RESULT_SCHEMA,
            "query_schema": QUERY_SCHEMA,
            "boundary_index": self.boundary_index,
            "source_manifest_sha256": hashlib.sha256(
                _canonical_json(manifest)
            ).hexdigest(),
            "constraint_groups": list(CONSTRAINT_GROUPS),
            "encoding_manifest": encoding_manifest,
            "encoding_manifest_sha256": hashlib.sha256(
                _canonical_json(encoding_manifest)
            ).hexdigest(),
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
            raise FreshThirdCarrierCnfError("result claims mismatch")
        if result.get("constraint_groups") != list(CONSTRAINT_GROUPS):
            raise FreshThirdCarrierCnfError("constraint groups mismatch")
        signature = result.get("model_signature")
        if type(signature) is not dict:
            raise FreshThirdCarrierCnfError("missing model signature")
        if (
            result.get("model_signature_sha256")
            != hashlib.sha256(_canonical_json(signature)).hexdigest()
        ):
            raise FreshThirdCarrierCnfError("model signature hash mismatch")
        manifest = result.get("encoding_manifest")
        if type(manifest) is not dict:
            raise FreshThirdCarrierCnfError("missing encoding manifest")
        if (
            result.get("encoding_manifest_sha256")
            != hashlib.sha256(_canonical_json(manifest)).hexdigest()
        ):
            raise FreshThirdCarrierCnfError("encoding manifest hash mismatch")
        if manifest != self.encoding_manifest():
            raise FreshThirdCarrierCnfError("encoding manifest content mismatch")

    def replay_result(
        self, result: Mapping[str, object], *, timeout_ms: int = 60_000
    ) -> SemanticReplay:
        try:
            self._validate_result_metadata(result)
            signature = result["model_signature"]
            if type(signature) is not dict:
                raise FreshThirdCarrierCnfError("missing model signature")
            if self.cap_alternation_refinement_from_signature(signature) is not None:
                raise FreshThirdCarrierCnfError(
                    "source-total replay found an alternating cap"
                )
            source_result = dict(result)
            source_result["constraint_groups"] = list(SOURCE_CONSTRAINT_GROUPS)
            replay_sat_result(source_result, timeout_ms=timeout_ms)
        except (FreshThirdCarrierCnfError, ValueError) as exc:
            return SemanticReplay(False, str(exc))
        return SemanticReplay(True, "fresh-session source-total replay accepted")

    def validate_source_total_assignment(self, assignment: Mapping[int, bool]) -> None:
        """Independently reject any model containing an alternating cap."""

        self.validate(assignment)
        signature = self.model_signature(assignment)
        if self.cap_alternation_refinement_from_signature(signature) is not None:
            raise FreshThirdCarrierCnfError(
                "source-total assignment still contains an alternating cap"
            )


def dry_run_manifest(boundary_index: int) -> dict[str, object]:
    """Build the authenticated schema manifest without invoking a solver."""

    encoding = FreshThirdCarrierSourceTotalCnfEncoding(boundary_index)
    return {
        "schema": f"{SCHEMA}/dry-run-manifest/v1",
        "boundary_index": boundary_index,
        "encoding": encoding.encoding_manifest(),
        "launch_eligible": False,
        "blocked_on": [
            "static one-shot runner validation",
            "independent source-total semantic launch audit",
        ],
    }
