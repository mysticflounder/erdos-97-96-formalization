# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>
"""Authenticated v6 common-radius payload refinement of FirstNonHit v5.

The v5 CNF is retained byte-for-byte.  Its historical
``hingress/common_payload_free`` branch bit is definitionally rebound to a
live common-radius payload guard.  Under that guard, two independent ``Fin n``
one-hot selectors represent ``G.surface.firstSource`` and ``secondSource``;
the complete 30-field ``FirstNonHitFiniteCommonRadiusPayload`` contract is
then translated over the existing finite assignment.  The selectors are not
identified with either named canonical-source role of ``C``.

This is an emitter only.  It does not launch a solver, claim source-totality,
or promote a fixed-cardinality result to the universal Lean theorem.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import math
from collections import Counter
from collections.abc import Sequence
from itertools import combinations, product
from pathlib import Path

import census.p97_search.freshthird_firstnonhit_complete_finite_v2 as v2
import census.p97_search.freshthird_firstnonhit_overlap_v5 as v5

SCHEMA = "p97-freshthird-firstnonhit-common-payload-v6/cnf/v1"
MAP_SCHEMA = f"{SCHEMA}/map/v1"
SOURCE_SCHEMA = f"{SCHEMA}/sources/v1"
MANIFEST_SCHEMA = f"{SCHEMA}/manifest/v1"
PROVENANCE_SCHEMA = f"{SCHEMA}/provenance/v1"
MIN_CARRIER_CARD = v5.MIN_CARRIER_CARD

# Every source below is byte-identical at this repository commit.  The v5
# Python predecessor is separately authenticated by the v6 runner.
LEAN_COMMIT = "c8063884754baeef54dd64fae255b72f0e9d1d32"
SOURCE_TOTAL_CLAIM = False
PRODUCTION_LAUNCH_ENABLED = False
QUERY = v5.QUERY

BASE = v5.BASE
COMMON_PAYLOAD_SOURCE_FILE = f"{BASE}FirstNonHitCommonRadiusFinitePayload.lean"
HINGRESS_PAYLOAD_SOURCE_FILE = f"{BASE}FirstNonHitFiniteHingressPayload.lean"
COMMON_PAYLOAD_DECLARATION = "FirstNonHitFiniteCommonRadiusPayload"
COMMON_PAYLOAD_CONSTRUCTOR = "FirstNonHitFiniteCommonRadiusPayload.ofWitness"
HINGRESS_PAYLOAD_THEOREM = "firstNonHitFiniteHingressPayload_nonempty"
SOURCE_HASHES = {
    **v5.SOURCE_HASHES,
    COMMON_PAYLOAD_SOURCE_FILE: (
        "cea8d0d20cf10bc53aa541566c9ada6ad420a95738b4f2b801742d8714010f0b"
    ),
    HINGRESS_PAYLOAD_SOURCE_FILE: (
        "06ca4a180db7844daf6f2798e93449e7f2b0bceb962d9c64459145f4d80b6462"
    ),
}

PAYLOAD_FIELDS = (
    "commonSourceOne",
    "commonSourceTwo",
    "commonSource_ne",
    "commonSourceOne_firstCapInterior",
    "commonSourceTwo_firstCapInterior",
    "commonSourceOne_ne_firstRetainedSourceOne",
    "commonSourceOne_ne_firstRetainedSourceTwo",
    "commonSourceOne_ne_secondRetainedSourceOne",
    "commonSourceOne_ne_secondRetainedSourceTwo",
    "commonSourceTwo_ne_firstRetainedSourceOne",
    "commonSourceTwo_ne_firstRetainedSourceTwo",
    "commonSourceTwo_ne_secondRetainedSourceOne",
    "commonSourceTwo_ne_secondRetainedSourceTwo",
    "commonSourceOne_blocker_ne_first",
    "commonSourceOne_blocker_ne_second",
    "commonSourceTwo_blocker_ne_first",
    "commonSourceTwo_blocker_ne_second",
    "commonSourceOne_blocker_ne_firstApex_point",
    "commonSourceOne_blocker_ne_secondApex_point",
    "commonSourceTwo_blocker_ne_firstApex_point",
    "commonSourceTwo_blocker_ne_secondApex_point",
    "commonSourceOne_firstDeletion_survives",
    "commonSourceOne_secondDeletion_survives",
    "commonSourceTwo_firstDeletion_survives",
    "commonSourceTwo_secondDeletion_survives",
    "common_radius_eq",
    "common_radius_ne_firstRetainedSourceOne",
    "common_radius_ne_firstRetainedSourceTwo",
    "common_radius_ne_secondRetainedSourceOne",
    "common_radius_ne_secondRetainedSourceTwo",
)
PAYLOAD_FIELD_SOURCES = {
    field: (
        f"{COMMON_PAYLOAD_DECLARATION}.{field}; "
        f"constructor={COMMON_PAYLOAD_CONSTRUCTOR}; "
        f"source={COMMON_PAYLOAD_SOURCE_FILE}; "
        f"sha256={SOURCE_HASHES[COMMON_PAYLOAD_SOURCE_FILE]}"
    )
    for field in PAYLOAD_FIELDS
}

FAMILY_SOURCES = {
    **v5.FAMILY_SOURCES,
    "common_payload_guard": (
        f"{HINGRESS_PAYLOAD_THEOREM}, commonRadius arm; "
        f"source={HINGRESS_PAYLOAD_SOURCE_FILE}; "
        f"sha256={SOURCE_HASHES[HINGRESS_PAYLOAD_SOURCE_FILE]}"
    ),
    "common_payload_selectors": (
        f"{COMMON_PAYLOAD_DECLARATION}.commonSourceOne/commonSourceTwo; "
        "independent Fin n witnesses reindexed from G.surface; no G.surface=C bridge"
    ),
    "common_payload_blocker_mux": (
        "definitional CNF mux for A.blockerMap at each independent common-source selector"
    ),
    "common_payload_source_relations": (
        "FirstNonHitFiniteCommonRadiusPayload source distinctness and first-cap fields"
    ),
    "common_payload_blocker_relations": (
        "FirstNonHitFiniteCommonRadiusPayload blocker inequality fields"
    ),
    "common_payload_deletion_survival": (
        "FirstNonHitFiniteCommonRadiusPayload four deletion-survival disjunctions"
    ),
    "common_payload_radius_relations": (
        "FirstNonHitFiniteCommonRadiusPayload five first-apex radiusEq fields"
    ),
}
OMITTED_RELAXATIONS = v5.OMITTED_RELAXATIONS

PREDECESSOR_SCHEMA = v5.SCHEMA
PREDECESSOR_VARIABLES = 93_211
PREDECESSOR_CLAUSES = 560_926
PREDECESSOR_CNF_SHA256 = (
    "d863b87e923c8df36c88ecd7d6fa3e5db820fd1f231526f9c7845353dac75ce9"
)
PREDECESSOR_SOURCE_SHA256 = (
    "6bf562662f826a51eba2b56d555476faeb84a234603c06ecefac8874501c74c3"
)
PREDECESSOR_RUNNER_SHA256 = (
    "4603445de8f7cc087e4ebf132f003f9eaf284d124ebcb81981f688d9fce4bea4"
)

LEGACY_COMMON_GUARD_ROLE = "hingress/common_payload_free"
COMMON_GUARD_ROLE = "hingress/common_radius_payload"
COMMON_SIDES = ("one", "two")
RETAINED_ROLES = (v2.P1, v2.P2, v2.R1, v2.R2)
BLOCKER_REFERENCE_ROLES = (v2.P1, v2.R1)
APEX_ROLES = (v2.APEX, "second_apex")

EncodingError = v2.EncodingError
VariableRecord = v2.VariableRecord
ClauseRecord = v2.ClauseRecord
Encoding = v2.Encoding
Bundle = v2.Bundle
ROLES = v2.ROLES
Q1 = v2.Q1


def _canonical_json(value: object) -> bytes:
    return (
        json.dumps(
            value,
            allow_nan=False,
            ensure_ascii=True,
            sort_keys=True,
            separators=(",", ":"),
        )
        + "\n"
    ).encode()


def _sha256(data: bytes) -> str:
    return hashlib.sha256(data).hexdigest()


def _dimacs(encoding: Encoding) -> bytes:
    return v5._dimacs(encoding)


def _selector_role(side: str, index: int) -> str:
    return f"common_source/{side}/{index}"


def _blocker_role(side: str, center: int) -> str:
    return f"common_blocker/{side}/{center}"


def _new_variable_records(base: Encoding) -> tuple[VariableRecord, ...]:
    roles = [COMMON_GUARD_ROLE]
    roles.extend(
        _selector_role(side, index)
        for side in COMMON_SIDES
        for index in range(base.n)
    )
    roles.extend(
        _blocker_role(side, center)
        for side in COMMON_SIDES
        for center in range(base.n)
    )
    return tuple(
        VariableRecord(len(base.variables) + offset, role)
        for offset, role in enumerate(roles, 1)
    )


def _append_clause(
    rows: list[ClauseRecord], family: str, role: str, literals: Sequence[int]
) -> None:
    rows.append(ClauseRecord(PREDECESSOR_CLAUSES + len(rows) + 1, family, role,
                             tuple(literals)))


def _build_delta(base: Encoding, variables: Sequence[VariableRecord]) -> tuple[ClauseRecord, ...]:
    """Translate the 30 payload fields in deterministic source order."""

    n = base.n
    role_to_id = {row.role: row.id for row in variables}
    guard = role_to_id[COMMON_GUARD_ROLE]
    legacy = role_to_id[LEGACY_COMMON_GUARD_ROLE]
    rows: list[ClauseRecord] = []

    # The predecessor role name is historical.  Exact equivalence makes the
    # old common arm payload-bearing without touching the v5 prefix.
    _append_clause(rows, "common_payload_guard", "common_payload/guard/legacy_to_live",
                   (-legacy, guard))
    _append_clause(rows, "common_payload_guard", "common_payload/guard/live_to_legacy",
                   (legacy, -guard))

    selectors = {
        side: [role_to_id[_selector_role(side, index)] for index in range(n)]
        for side in COMMON_SIDES
    }
    blockers = {
        side: [role_to_id[_blocker_role(side, center)] for center in range(n)]
        for side in COMMON_SIDES
    }
    for side, field in zip(COMMON_SIDES, PAYLOAD_FIELDS[:2], strict=True):
        bits = selectors[side]
        _append_clause(rows, "common_payload_selectors",
                       f"common_payload/{field}/at_least_one", (-guard, *bits))
        for left, right in combinations(range(n), 2):
            _append_clause(
                rows,
                "common_payload_selectors",
                f"common_payload/{field}/at_most_one/{left}/{right}",
                (-guard, -bits[left], -bits[right]),
            )

    for side in COMMON_SIDES:
        for source, center in product(range(n), repeat=2):
            selector = selectors[side][source]
            common_blocker = blockers[side][center]
            source_blocker = role_to_id[f"blocker/{source}/{center}"]
            _append_clause(
                rows,
                "common_payload_blocker_mux",
                f"common_payload/blocker_mux/{side}/{source}/{center}/lr",
                (-guard, -selector, -common_blocker, source_blocker),
            )
            _append_clause(
                rows,
                "common_payload_blocker_mux",
                f"common_payload/blocker_mux/{side}/{source}/{center}/rl",
                (-guard, -selector, common_blocker, -source_blocker),
            )

    for index in range(n):
        _append_clause(
            rows,
            "common_payload_source_relations",
            f"common_payload/commonSource_ne/{index}",
            (-guard, -selectors["one"][index], -selectors["two"][index]),
        )
    for side in COMMON_SIDES:
        field = f"commonSource{side.title()}_firstCapInterior"
        for source in range(n):
            _append_clause(
                rows,
                "common_payload_source_relations",
                f"common_payload/{field}/{source}",
                (-guard, -selectors[side][source],
                 role_to_id[f"interior/{source}/1"]),
            )

    for side in COMMON_SIDES:
        prefix = f"commonSource{side.title()}"
        for retained in RETAINED_ROLES:
            field = f"{prefix}_ne_{_lean_retained_suffix(retained)}"
            for index in range(n):
                _append_clause(
                    rows,
                    "common_payload_source_relations",
                    f"common_payload/{field}/{index}",
                    (-guard, -selectors[side][index],
                     -role_to_id[f"role/{retained}/{index}"]),
                )

    for side in COMMON_SIDES:
        prefix = f"commonSource{side.title()}"
        for reference, suffix in zip(BLOCKER_REFERENCE_ROLES, ("first", "second"), strict=True):
            field = f"{prefix}_blocker_ne_{suffix}"
            for center in range(n):
                _append_clause(
                    rows,
                    "common_payload_blocker_relations",
                    f"common_payload/{field}/{center}",
                    (-guard, -blockers[side][center],
                     -role_to_id[f"named_blocker/{reference}/{center}"]),
                )
        for apex, suffix in zip(APEX_ROLES, ("firstApex_point", "secondApex_point"), strict=True):
            field = f"{prefix}_blocker_ne_{suffix}"
            for center in range(n):
                _append_clause(
                    rows,
                    "common_payload_blocker_relations",
                    f"common_payload/{field}/{center}",
                    (-guard, -blockers[side][center],
                     -role_to_id[f"role/{apex}/{center}"]),
                )

    deletion_pairs = ((v2.P1, v2.P2, "first"), (v2.R1, v2.R2, "second"))
    for side in COMMON_SIDES:
        prefix = f"commonSource{side.title()}"
        for left_role, right_role, suffix in deletion_pairs:
            field = f"{prefix}_{suffix}Deletion_survives"
            for center, left, right in product(range(n), repeat=3):
                _append_clause(
                    rows,
                    "common_payload_deletion_survival",
                    f"common_payload/{field}/{center}/{left}/{right}",
                    (
                        -guard,
                        -blockers[side][center],
                        -role_to_id[f"role/{left_role}/{left}"],
                        -role_to_id[f"role/{right_role}/{right}"],
                        role_to_id[f"has4/{left}/{center}"],
                        role_to_id[f"has4/{right}/{center}"],
                    ),
                )

    for apex, first, second in product(range(n), repeat=3):
        _append_clause(
            rows,
            "common_payload_radius_relations",
            f"common_payload/common_radius_eq/{apex}/{first}/{second}",
            (
                -guard,
                -role_to_id[f"role/{v2.APEX}/{apex}"],
                -selectors["one"][first],
                -selectors["two"][second],
                role_to_id[f"radius/{apex}/{first}/{second}"],
            ),
        )
    for retained in RETAINED_ROLES:
        field = f"common_radius_ne_{_lean_retained_suffix(retained)}"
        for apex, first, target in product(range(n), repeat=3):
            _append_clause(
                rows,
                "common_payload_radius_relations",
                f"common_payload/{field}/{apex}/{first}/{target}",
                (
                    -guard,
                    -role_to_id[f"role/{v2.APEX}/{apex}"],
                    -selectors["one"][first],
                    -role_to_id[f"role/{retained}/{target}"],
                    -role_to_id[f"radius/{apex}/{first}/{target}"],
                ),
            )
    return tuple(rows)


def _lean_retained_suffix(role: str) -> str:
    return {
        v2.P1: "firstRetainedSourceOne",
        v2.P2: "firstRetainedSourceTwo",
        v2.R1: "secondRetainedSourceOne",
        v2.R2: "secondRetainedSourceTwo",
    }[role]


def _expected_contract(base: Encoding) -> dict[str, object]:
    return {
        **base.semantic_contract,
        "predecessor": {
            "schema": PREDECESSOR_SCHEMA,
            "variables": PREDECESSOR_VARIABLES,
            "clauses": PREDECESSOR_CLAUSES,
            "cnf_sha256": PREDECESSOR_CNF_SHA256,
            "source_sha256": PREDECESSOR_SOURCE_SHA256,
        },
        "hingress_arms": ["retained", "common_radius_payload"],
        "common_radius_payload": {
            "branch_guard_role": COMMON_GUARD_ROLE,
            "legacy_guard_role": LEGACY_COMMON_GUARD_ROLE,
            "legacy_guard_exactly_equivalent": True,
            "independent_of_named_canonical_surface": True,
            "selector_domain": base.n,
            "selector_count": 2,
            "selectors_branch_guarded_one_hot": True,
            "payload_field_count": len(PAYLOAD_FIELDS),
            "payload_fields": list(PAYLOAD_FIELDS),
            "all_payload_relations_branch_guarded": True,
            "first_cap_index": 1,
            "first_apex_radius_center": v2.APEX,
        },
    }


def _delta_document(encoding: Encoding) -> dict[str, object]:
    n = encoding.n
    counts = {
        "guard_definition_clauses": 2,
        "selector_variables": 2 * n,
        "selector_cardinality_clauses": 2 * (1 + math.comb(n, 2)),
        "blocker_mux_variables": 2 * n,
        "blocker_mux_clauses": 4 * n * n,
        "source_distinct_clauses": n,
        "first_cap_interior_clauses": 2 * n,
        "retained_role_distinct_clauses": 8 * n,
        "retained_blocker_distinct_clauses": 4 * n,
        "apex_blocker_distinct_clauses": 4 * n,
        "deletion_survival_clauses": 4 * n**3,
        "common_radius_equal_clauses": n**3,
        "common_radius_unequal_clauses": 4 * n**3,
    }
    total_added_clauses = sum(
        value for key, value in counts.items() if key.endswith("_clauses")
    )
    return {
        "schema": f"{SCHEMA}/delta/v1",
        "predecessor_schema": PREDECESSOR_SCHEMA,
        "predecessor_cnf_sha256": PREDECESSOR_CNF_SHA256,
        "guard_variables": 1,
        **counts,
        "total_added_variables": 1 + 4 * n,
        "total_added_clauses": total_added_clauses,
        "payload_field_count": len(PAYLOAD_FIELDS),
        "query_unchanged": True,
        "canonical_surface_selector_mentions": 0,
        "ordering": (
            "guard equivalence; source selectors; blocker muxes; source relations; "
            "blocker relations; deletion disjunctions; radius relations"
        ),
    }


def _provenance_document(encoding: Encoding) -> dict[str, object]:
    start = PREDECESSOR_VARIABLES + 1
    n = encoding.n
    return {
        "schema": PROVENANCE_SCHEMA,
        "variable_source_ranges": [
            {
                "first_id": 1,
                "last_id": PREDECESSOR_VARIABLES,
                "source": (
                    f"authenticated predecessor {PREDECESSOR_SCHEMA}; "
                    f"cnf_sha256={PREDECESSOR_CNF_SHA256}; "
                    f"source_sha256={PREDECESSOR_SOURCE_SHA256}"
                ),
            },
            {
                "first_id": start,
                "last_id": start,
                "role_prefix": COMMON_GUARD_ROLE,
                "source": FAMILY_SOURCES["common_payload_guard"],
            },
            {
                "first_id": start + 1,
                "last_id": start + 2 * n,
                "role_prefix": "common_source/",
                "source": FAMILY_SOURCES["common_payload_selectors"],
            },
            {
                "first_id": start + 2 * n + 1,
                "last_id": start + 4 * n,
                "role_prefix": "common_blocker/",
                "source": FAMILY_SOURCES["common_payload_blocker_mux"],
            },
        ],
        "payload_field_sources": dict(PAYLOAD_FIELD_SOURCES),
        "aggregate_source_theorem": {
            "declaration": HINGRESS_PAYLOAD_THEOREM,
            "path": HINGRESS_PAYLOAD_SOURCE_FILE,
            "sha256": SOURCE_HASHES[HINGRESS_PAYLOAD_SOURCE_FILE],
        },
        "independence_boundary": {
            "producer_surface": "G.surface",
            "named_surface": "C",
            "identified": False,
            "canonical_selector_mentions_in_delta": 0,
        },
        "clause_family_sources": dict(sorted(FAMILY_SOURCES.items())),
        "variable_identity": "unique integer id plus unique semantic role",
        "clause_identity": "unique integer id plus unique semantic role",
        "clause_source_resolution": "exactly one family source plus unique role",
    }


def _guarded_exactly_one_holds(bits: Sequence[bool], guard: bool) -> bool:
    clauses = [not guard or any(bits)]
    clauses.extend(
        not guard or not bits[left] or not bits[right]
        for left, right in combinations(range(len(bits)), 2)
    )
    return all(clauses)


def _guarded_relation_holds(
    guard: bool, antecedents: Sequence[bool], conclusion: bool
) -> bool:
    return not guard or not all(antecedents) or conclusion


def run_encoding_controls() -> None:
    v5.run_encoding_controls()
    if len(PAYLOAD_FIELDS) != 30 or tuple(PAYLOAD_FIELD_SOURCES) != PAYLOAD_FIELDS:
        raise EncodingError("common payload 30-field inventory drift")
    for width in (2, 3, 4):
        for guard in (False, True):
            for bits in product((False, True), repeat=width):
                if _guarded_exactly_one_holds(bits, guard) != (
                    not guard or sum(bits) == 1
                ):
                    raise EncodingError("branch-guarded selector cardinality control failed")
    for guard, left, right, relation in product((False, True), repeat=4):
        if _guarded_relation_holds(guard, (left, right), relation) != (
            not guard or not (left and right) or relation
        ):
            raise EncodingError("guard polarity/relation implication control failed")


def encode(n: int) -> Encoding:
    """Return byte-identical v5 constraints plus the guarded common payload."""

    base = v5.encode(n)
    if (
        len(base.variables) != PREDECESSOR_VARIABLES
        or len(base.clauses) != PREDECESSOR_CLAUSES
        or _sha256(_dimacs(base)) != PREDECESSOR_CNF_SHA256
    ):
        raise EncodingError("authenticated v5 predecessor drift")
    variables = base.variables + _new_variable_records(base)
    clauses = base.clauses + _build_delta(base, variables)
    result = Encoding(n, variables, clauses, _expected_contract(base))
    _validate_semantic_encoding(result, base)
    return result


def _validate_semantic_encoding(encoding: Encoding, base: Encoding) -> None:
    expected_variables = base.variables + _new_variable_records(base)
    expected_delta = _build_delta(base, expected_variables)
    if encoding.variables != expected_variables:
        raise EncodingError("v6 common-payload variable inventory/order drift")
    if encoding.clauses[:PREDECESSOR_CLAUSES] != base.clauses:
        raise EncodingError("v5 clause prefix changed")
    if encoding.clauses[PREDECESSOR_CLAUSES:] != expected_delta:
        raise EncodingError("v6 common-payload clause delta drift")
    if [row.id for row in encoding.variables] != list(range(1, len(encoding.variables) + 1)):
        raise EncodingError("variable identifiers are not contiguous")
    if len({row.role for row in encoding.variables}) != len(encoding.variables):
        raise EncodingError("variable roles are not unique")
    if [row.id for row in encoding.clauses] != list(range(1, len(encoding.clauses) + 1)):
        raise EncodingError("clause identifiers are not contiguous")
    if len({row.role for row in encoding.clauses}) != len(encoding.clauses):
        raise EncodingError("clause roles are not unique")
    if any(row.family not in FAMILY_SOURCES for row in encoding.clauses):
        raise EncodingError("a clause family lacks exactly one source binding")
    if encoding.semantic_contract != _expected_contract(base):
        raise EncodingError("v6 semantic contract drift")
    if encoding.semantic_contract["omitted_relaxations"] != list(OMITTED_RELAXATIONS):
        raise EncodingError("omitted-family inventory drift")

    role_to_id = {row.role: row.id for row in encoding.variables}
    guard = role_to_id[COMMON_GUARD_ROLE]
    canonical_ids = {
        role_to_id[f"role/{name}/{index}"]
        for name in (v2.C1, v2.C2)
        for index in range(encoding.n)
    }
    for index, clause in enumerate(expected_delta):
        if index < 2:
            continue
        if not clause.literals or clause.literals[0] != -guard:
            raise EncodingError("common payload clause lost negative branch guard")
        if any(abs(literal) in canonical_ids for literal in clause.literals):
            raise EncodingError("common payload accidentally aliases named C selectors")
    if len(encoding.variables) != PREDECESSOR_VARIABLES + 1 + 4 * encoding.n:
        raise EncodingError("v6 variable count formula drift")
    if len(encoding.clauses) != PREDECESSOR_CLAUSES + _delta_document(encoding)["total_added_clauses"]:
        raise EncodingError("v6 clause count formula drift")


def validate_semantic_encoding(encoding: Encoding) -> None:
    if type(encoding.n) is not int or encoding.n < MIN_CARRIER_CARD:
        raise EncodingError("invalid carrier cardinality")
    base = v5.encode(encoding.n)
    if _sha256(_dimacs(base)) != PREDECESSOR_CNF_SHA256:
        raise EncodingError("v5 predecessor replay digest mismatch")
    _validate_semantic_encoding(encoding, base)


def _repo_root() -> Path:
    return Path(__file__).resolve().parents[2]


def source_snapshot() -> dict[str, object]:
    rows = []
    root = _repo_root()
    for path, expected in sorted(SOURCE_HASHES.items()):
        data = v2._read_source_without_links(root, path)
        actual = _sha256(data)
        if actual != expected:
            raise EncodingError(f"source drift for {path}: {actual} != {expected}")
        rows.append({"path": path, "sha256": actual, "size": len(data)})
    return {"schema": SOURCE_SCHEMA, "commit": LEAN_COMMIT, "files": rows}


def _map_document(encoding: Encoding) -> dict[str, object]:
    return {
        "schema": MAP_SCHEMA,
        "n": encoding.n,
        "variables": [{"id": row.id, "role": row.role} for row in encoding.variables],
        "clauses": [
            {
                "id": row.id,
                "family": row.family,
                "role": row.role,
                "literals": list(row.literals),
            }
            for row in encoding.clauses
        ],
        "provenance": _provenance_document(encoding),
        "semantic_contract": encoding.semantic_contract,
    }


def emit_bundle(n: int) -> Bundle:
    run_encoding_controls()
    encoding = encode(n)
    cnf = _dimacs(encoding)
    variable_map = _canonical_json(_map_document(encoding))
    sources = _canonical_json(source_snapshot())
    family_counts = Counter(row.family for row in encoding.clauses)
    manifest = {
        "schema": MANIFEST_SCHEMA,
        "n": encoding.n,
        "lean_commit": LEAN_COMMIT,
        "source_total": SOURCE_TOTAL_CLAIM,
        "launch_enabled": PRODUCTION_LAUNCH_ENABLED,
        "solver_run": False,
        "solver_verdict": None,
        "generic_cardinality_lift": False,
        "finite_encoding_emitted": True,
        "query_is_separate_assumption": True,
        "query": QUERY,
        "query_unchanged_from_predecessor": True,
        "omitted_relaxations": list(OMITTED_RELAXATIONS),
        "variables": len(encoding.variables),
        "clauses": len(encoding.clauses),
        "family_clause_counts": dict(sorted(family_counts.items())),
        "predecessor": encoding.semantic_contract["predecessor"],
        "clause_delta": _delta_document(encoding),
        "common_payload_field_count": len(PAYLOAD_FIELDS),
        "common_payload_complete": True,
        "common_surface_identified_with_c": False,
        "cnf_sha256": _sha256(cnf),
        "map_sha256": _sha256(variable_map),
        "sources_sha256": _sha256(sources),
    }
    manifest["manifest_sha256"] = _sha256(_canonical_json(manifest))
    bundle = Bundle(cnf, variable_map, sources, _canonical_json(manifest))
    validate_bundle(bundle)
    return bundle


def _strict_json(data: bytes, description: str) -> dict[str, object]:
    return v2._strict_json(data, description)


def validate_bundle(bundle: Bundle) -> dict[str, object]:
    manifest = _strict_json(bundle.manifest, "manifest")
    variable_map = _strict_json(bundle.variable_map, "map")
    sources = _strict_json(bundle.sources, "sources")
    if any(
        _canonical_json(value) != data
        for value, data in (
            (manifest, bundle.manifest),
            (variable_map, bundle.variable_map),
            (sources, bundle.sources),
        )
    ):
        raise EncodingError("bundle JSON is not canonical")
    if manifest.get("schema") != MANIFEST_SCHEMA or variable_map.get("schema") != MAP_SCHEMA:
        raise EncodingError("artifact schema mismatch")
    if sources != source_snapshot() or manifest.get("lean_commit") != LEAN_COMMIT:
        raise EncodingError("source snapshot/commit binding drift")
    if manifest.get("source_total") is not False or manifest.get("launch_enabled") is not False:
        raise EncodingError("audit gate flags must remain false")
    if manifest.get("solver_run") is not False or manifest.get("solver_verdict") is not None:
        raise EncodingError("emitter manifest falsely reports a solver run")
    if manifest.get("generic_cardinality_lift") is not False:
        raise EncodingError("generic cardinality lift must remain false")
    if manifest.get("query_is_separate_assumption") is not True or manifest.get("query") != QUERY:
        raise EncodingError("query contract drift")
    if manifest.get("query_unchanged_from_predecessor") is not True:
        raise EncodingError("query predecessor binding drift")
    if manifest.get("omitted_relaxations") != list(OMITTED_RELAXATIONS):
        raise EncodingError("manifest omission inventory drift")
    if manifest.get("common_payload_field_count") != 30 or manifest.get("common_payload_complete") is not True:
        raise EncodingError("common payload completeness metadata drift")
    if manifest.get("common_surface_identified_with_c") is not False:
        raise EncodingError("common surface alias boundary drift")
    if manifest.get("cnf_sha256") != _sha256(bundle.cnf):
        raise EncodingError("CNF digest mismatch")
    if manifest.get("map_sha256") != _sha256(bundle.variable_map):
        raise EncodingError("map digest mismatch")
    if manifest.get("sources_sha256") != _sha256(bundle.sources):
        raise EncodingError("sources digest mismatch")
    unsigned = dict(manifest)
    digest = unsigned.pop("manifest_sha256", None)
    if digest != _sha256(_canonical_json(unsigned)):
        raise EncodingError("manifest self-hash mismatch")

    lines = bundle.cnf.decode("ascii").splitlines()
    if not lines or not lines[0].startswith("p cnf "):
        raise EncodingError("missing DIMACS header")
    header = lines[0].split()
    if len(header) != 4:
        raise EncodingError("malformed DIMACS header")
    variable_count, clause_count = int(header[2]), int(header[3])
    if len(lines) - 1 != clause_count:
        raise EncodingError("DIMACS clause count mismatch")
    parsed: list[tuple[int, ...]] = []
    for line in lines[1:]:
        values = [int(value) for value in line.split()]
        if not values or values[-1] != 0 or 0 in values[:-1]:
            raise EncodingError("malformed DIMACS clause")
        if any(abs(value) > variable_count for value in values[:-1]):
            raise EncodingError("DIMACS literal out of range")
        parsed.append(tuple(values[:-1]))

    map_variables = variable_map.get("variables")
    map_clauses = variable_map.get("clauses")
    if type(map_variables) is not list or type(map_clauses) is not list:
        raise EncodingError("map rows must be lists")
    if len(map_variables) != variable_count or len(map_clauses) != clause_count:
        raise EncodingError("map count mismatch")
    if manifest.get("variables") != variable_count or manifest.get("clauses") != clause_count:
        raise EncodingError("manifest count mismatch")
    n = manifest.get("n")
    if type(n) is not int or n < MIN_CARRIER_CARD or variable_map.get("n") != n:
        raise EncodingError("manifest/map carrier mismatch")
    variables = tuple(
        VariableRecord(row["id"], row["role"])
        for row in map_variables
        if type(row) is dict and set(row) == {"id", "role"}
    )
    clauses = tuple(
        ClauseRecord(row["id"], row["family"], row["role"], literals)
        for row, literals in zip(map_clauses, parsed, strict=True)
        if type(row) is dict
        and set(row) == {"id", "family", "role", "literals"}
        and row.get("literals") == list(literals)
    )
    if len(variables) != variable_count or len(clauses) != clause_count:
        raise EncodingError("map rows do not replay CNF")
    contract = variable_map.get("semantic_contract")
    if type(contract) is not dict:
        raise EncodingError("semantic contract is missing")
    encoding = Encoding(n, variables, clauses, contract)
    validate_semantic_encoding(encoding)
    if variable_map.get("provenance") != _provenance_document(encoding):
        raise EncodingError("variable/clause provenance drift")
    family_counts = dict(sorted(Counter(row.family for row in clauses).items()))
    if manifest.get("family_clause_counts") != family_counts:
        raise EncodingError("family clause counts do not replay")
    if manifest.get("predecessor") != contract["predecessor"]:
        raise EncodingError("predecessor manifest drift")
    if manifest.get("clause_delta") != _delta_document(encoding):
        raise EncodingError("clause delta manifest drift")
    return manifest


def write_bundle(bundle: Bundle, output_dir: Path) -> tuple[Path, ...]:
    validate_bundle(bundle)
    output_dir.mkdir(parents=True, exist_ok=True)
    artifacts = (
        (output_dir / "problem.cnf", bundle.cnf),
        (output_dir / "problem.map.json", bundle.variable_map),
        (output_dir / "problem.sources.json", bundle.sources),
        (output_dir / "problem.manifest.json", bundle.manifest),
    )
    for path, data in artifacts:
        v2._write_exact(path, data)
    return tuple(path for path, _ in artifacts)


def main(argv: Sequence[str] | None = None) -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--n", type=int, default=17)
    parser.add_argument("--output-dir", type=Path)
    args = parser.parse_args(argv)
    bundle = emit_bundle(args.n)
    manifest = validate_bundle(bundle)
    if args.output_dir is not None:
        write_bundle(bundle, args.output_dir)
    print(json.dumps(manifest, allow_nan=False, sort_keys=True, separators=(",", ":")))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
