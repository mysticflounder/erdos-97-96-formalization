#!/usr/bin/env python3
"""Independent validator for ATAIL-PAIR-SECOND-CENTER finite shadows.

The validator checks the serialized witness, not solver internals.  It is
deliberately fail-closed: a witness is accepted only as a finite incidence
shadow, and the nonempty manifest omission list prevents a target-faithful
verdict.
"""

from __future__ import annotations

import hashlib
import json
from collections import defaultdict
from pathlib import Path
from typing import Iterable, Mapping

from census.global_confinement import shadow
from census.multi_center import multi_center_census as mc


HERE = Path(__file__).resolve().parent
CASE_SCHEMA = "p97-atail-pair-second-center-case-v1"
ALLOWED_PROFILES = {(4, 5, 6), (5, 5, 5)}
SUPPLIED_ROLES = ("q", "t1", "t2", "t3", "u")
CAP_NAMES = ("S", "O1", "O2")


def canonical_sha256(value: object) -> str:
    payload = json.dumps(value, sort_keys=True, separators=(",", ":")).encode()
    return hashlib.sha256(payload).hexdigest()


def load_manifest() -> dict:
    with (HERE / "manifest.json").open() as handle:
        manifest = json.load(handle)
    assert manifest["scope"]["target_faithful"] is False
    assert manifest["unimplemented_fail_closed"]
    return manifest


def cap_sets(frame: mc.Frame) -> dict[str, frozenset[int]]:
    return {"S": frame.S, "O1": frame.O1, "O2": frame.O2}


def row_from_json(record: Mapping[str, object]) -> shadow.ClassRow:
    return shadow.ClassRow(
        str(record["name"]),
        int(record["center"]),
        frozenset(int(x) for x in record["support"]),
        bool(record["exact"]),
    )


def validate_qc_negation(
    frame: mc.Frame,
    *,
    p: int,
    dangerous: frozenset[int],
    rows: Iterable[shadow.ClassRow],
) -> tuple[str, ...]:
    """Check the row-witnessed negation of Q-C.

    This intentionally says nothing about an equal-distance pair which is not
    part of an encoded four-point row; that metric field is fail-closed in the
    manifest.
    """

    caps = cap_sets(frame)
    checked = tuple(name for name in CAP_NAMES if p in caps[name])
    assert checked, "p lies in no declared cap"
    for cap_name in checked:
        cap = caps[cap_name]
        outside = dangerous - cap
        assert len(outside) >= 2, (
            f"dangerous row has fewer than two points outside {cap_name}"
        )
        for row in rows:
            if row.center == p or row.center not in cap:
                continue
            common = row.support & outside
            assert len(common) < 2, (
                f"Q-C violation in {cap_name}: row {row.name} at center "
                f"{row.center} co-supports outside pair {sorted(common)}"
            )
    return checked


def validate_case(case: Mapping[str, object], manifest: Mapping[str, object]) -> dict:
    assert case["schema"] == CASE_SCHEMA
    profile = tuple(int(x) for x in case["profile"])
    assert profile in ALLOWED_PROFILES
    assert sum(profile) - 3 == 12
    frame, _candidates = mc.cached_candidate_lists(profile, set(mc.PROVEN_ROWS))
    assert frame.n == 12

    frame_json = case["frame"]
    assert frame_json["n"] == frame.n
    assert tuple(frame_json["cyclic_order"]) == shadow.hull_order(frame)
    caps = cap_sets(frame)
    assert {
        name: sorted(points) for name, points in caps.items()
    } == frame_json["closed_caps"]
    assert {
        name: list(frame.ints[name]) for name in CAP_NAMES
    } == frame_json["cap_interiors"]

    labels = {name: int(value) for name, value in case["labels"].items()}
    assert set(labels) == {"p", *SUPPLIED_ROLES}
    assert len(set(labels.values())) == 6
    assert all(0 <= value < frame.n for value in labels.values())
    p = labels["p"]
    q = labels["q"]
    dangerous = frozenset(int(x) for x in case["dangerous_support"])
    assert dangerous == frozenset(labels[name] for name in ("q", "t1", "t2", "t3"))
    assert p not in dangerous

    surplus = str(case["surplus_cap"])
    second = str(case["second_large_cap"])
    assert surplus in CAP_NAMES and second in CAP_NAMES and surplus != second
    assert q in frame.caps_int[surplus]
    assert q not in mc.MOSER_SET
    assert len(caps[surplus]) >= 5
    assert len(caps[second]) >= 5
    other_caps = [name for name in CAP_NAMES if name != surplus]
    assert not all(len(caps[name]) == 4 for name in other_caps)

    records = list(case["rows"])
    names = [str(record["name"]) for record in records]
    assert len(names) == len(set(names))
    by_name = {str(record["name"]): record for record in records}
    rows = tuple(row_from_json(record) for record in records)

    supplied_names = {f"supplied:{role}" for role in SUPPLIED_ROLES}
    global_names = {f"global:{center}" for center in range(frame.n)}
    system_names = {f"system:{source}" for source in range(frame.n)}
    assert set(names) == supplied_names | global_names | system_names

    for role in SUPPLIED_ROLES:
        record = by_name[f"supplied:{role}"]
        source = labels[role]
        assert record["kind"] == "supplied"
        assert int(record["source"]) == source
        assert bool(record["exact"])
        assert source in record["support"]
        assert int(record["center"]) != source
    dangerous_record = by_name["supplied:t2"]
    assert int(dangerous_record["center"]) == p
    assert frozenset(dangerous_record["support"]) == dangerous

    for center in range(frame.n):
        record = by_name[f"global:{center}"]
        assert record["kind"] == "global"
        assert int(record["center"]) == center
        assert bool(record["exact"]), "saved preflight chooses exact global rows"

    base_rows = tuple(
        row_from_json(record)
        for record in records
        if record["kind"] in {"supplied", "global"}
    )
    base_by_center: dict[int, list[shadow.ClassRow]] = defaultdict(list)
    for row in base_rows:
        base_by_center[row.center].append(row)

    blocker_map = {
        int(source): int(center)
        for source, center in case["critical_shell_blocker_map"].items()
    }
    assert set(blocker_map) == set(range(frame.n))
    for source in range(frame.n):
        record = by_name[f"system:{source}"]
        row = row_from_json(record)
        assert record["kind"] == "system"
        assert int(record["source"]) == source
        assert row.exact
        assert row.center != source
        assert blocker_map[source] == row.center
        assert source in row.support
        global_row = row_from_json(by_name[f"global:{row.center}"])
        assert row.support == global_row.support
        # Retained no-q-free consequence: every encoded selected class at the
        # chosen blocker center contains the deleted source.
        assert base_by_center[row.center]
        assert all(source in other.support for other in base_by_center[row.center])

    ok, reason = shadow.verify_assignment(
        frame, set(mc.PROVEN_ROWS), rows
    )
    assert ok, reason
    checked_caps = validate_qc_negation(
        frame, p=p, dangerous=dangerous, rows=rows
    )
    assert tuple(case["q_c"]["checked_caps"]) == checked_caps
    assert case["q_c"]["status"] == "NO_ENCODED_ROW_WITNESS"

    manifest_profiles = {
        tuple(int(x) for x in row) for row in manifest["scope"]["profiles"]
    }
    assert profile in manifest_profiles
    assert manifest["scope"]["target_faithful"] is False
    assert manifest["unimplemented_fail_closed"]
    return {
        "profile": list(profile),
        "row_count": len(rows),
        "supplied_row_count": len(supplied_names),
        "global_row_count": len(global_names),
        "system_row_count": len(system_names),
        "checked_caps": list(checked_caps),
        "status": "VALIDATED_SAT_FINITE_SHADOW_ONLY",
    }


def validate_artifact(artifact: Mapping[str, object]) -> dict:
    manifest = load_manifest()
    assert artifact["schema"] == "p97-atail-pair-second-center-preflight-v1"
    assert artifact["manifest_sha256"] == canonical_sha256(manifest)
    cases = list(artifact["cases"])
    assert {tuple(case["profile"]) for case in cases} == ALLOWED_PROFILES
    reports = [validate_case(case, manifest) for case in cases]
    for case in cases:
        unsigned = dict(case)
        witness_digest = unsigned.pop("witness_sha256")
        assert witness_digest == canonical_sha256(unsigned)
    assert all(case["solver"]["raw_status"] == "SAT" for case in cases)
    assert all(
        case["solver"]["reported_status"] == "SAT_FINITE_SHADOW_ONLY"
        for case in cases
    )
    return {
        "case_count": len(cases),
        "all_validated": True,
        "reports": reports,
    }
