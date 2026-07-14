#!/usr/bin/env python3
"""Card-12 finite-shadow preflight for ATAIL-PAIR-SECOND-CENTER Q-C.

This reuses the checked global-confinement row solver and current ATAIL
candidate inventory.  It searches one explicit named-label placement in each
card-12 cap profile.  A SAT result is incidence-only and is independently
checked by ``validator.py``.
"""

from __future__ import annotations

import argparse
import json
from collections import defaultdict
from pathlib import Path
from typing import Mapping, Sequence

from census.global_confinement import shadow
from census.multi_center import multi_center_census as mc

from validator import (
    CASE_SCHEMA,
    canonical_sha256,
    cap_sets,
    load_manifest,
    validate_artifact,
)


HERE = Path(__file__).resolve().parent
MAX_NODES = 100_000

# These are explicit first-admitted placements, not orbit representatives.
# Their only purpose is to ask whether the encoded finite shadow can evade Q-C.
CASE_SEEDS = (
    {
        "profile": (4, 5, 6),
        "surplus_cap": "O1",
        "second_large_cap": "O2",
        "labels": {"p": 0, "q": 5, "t1": 3, "t2": 1, "t3": 4, "u": 2},
    },
    {
        "profile": (5, 5, 5),
        "surplus_cap": "S",
        "second_large_cap": "O1",
        "labels": {"p": 0, "q": 3, "t1": 2, "t2": 1, "t3": 4, "u": 5},
    },
)


def row_choice_candidates(
    frame: mc.Frame,
    candidates: Mapping[int, Sequence[frozenset[int]]],
    *,
    source: int,
) -> tuple[shadow.RowChoice, ...]:
    return tuple(
        shadow.RowChoice(center, support)
        for center in range(frame.n)
        if center != source
        for support in candidates[center]
        if source in support
    )


def _row_record(
    row: shadow.ClassRow,
    *,
    kind: str,
    source: int | None = None,
    role: str | None = None,
) -> dict:
    record = {
        "name": row.name,
        "kind": kind,
        "center": row.center,
        "support": sorted(row.support),
        "exact": row.exact,
    }
    if source is not None:
        record["source"] = source
    if role is not None:
        record["role"] = role
    return record


def _eligible_blockers(
    frame: mc.Frame,
    base_rows: Sequence[shadow.ClassRow],
    source: int,
) -> list[int]:
    by_center: dict[int, list[shadow.ClassRow]] = defaultdict(list)
    for row in base_rows:
        by_center[row.center].append(row)
    return [
        center
        for center in range(frame.n)
        if center != source
        and any(row.name.startswith("global:") for row in by_center[center])
        and all(source in row.support for row in by_center[center])
    ]


def solve_seed(seed: Mapping[str, object]) -> dict:
    profile = tuple(seed["profile"])
    labels = {name: int(value) for name, value in seed["labels"].items()}
    frame, candidates = mc.cached_candidate_lists(profile, set(mc.PROVEN_ROWS))
    assert candidates is not None
    p = labels["p"]
    dangerous = frozenset(labels[name] for name in ("q", "t1", "t2", "t3"))
    assert mc.candidate_ok(frame, set(mc.PROVEN_ROWS), p, dangerous)

    fixed = (
        shadow.ClassRow("supplied:t2", p, dangerous, exact=True),
    )
    choice_rows: list[shadow.ChoiceRow] = []
    for role in ("q", "t1", "t3", "u"):
        source = labels[role]
        choice_rows.append(
            shadow.ChoiceRow(
                f"supplied:{role}",
                row_choice_candidates(frame, candidates, source=source),
                exact=True,
            )
        )
    for center in range(frame.n):
        if center == p:
            continue
        choice_rows.append(
            shadow.ChoiceRow(
                f"global:{center}",
                tuple(
                    shadow.RowChoice(center, support)
                    for support in candidates[center]
                ),
                exact=True,
            )
        )

    caps = cap_sets(frame)
    p_caps = tuple(name for name in ("S", "O1", "O2") if p in caps[name])

    def q_c_prefix(rows: Sequence[shadow.ClassRow]) -> bool:
        for cap_name in p_caps:
            cap = caps[cap_name]
            outside = dangerous - cap
            for row in rows:
                if row.center != p and row.center in cap:
                    if len(row.support & outside) >= 2:
                        return False
        return True

    def critical_system_exists(rows: Sequence[shadow.ClassRow]) -> bool:
        # Add the p-centered dangerous row as the selected K4 row at p.
        base_rows = list(rows)
        base_rows.append(shadow.ClassRow("global:p-proxy", p, dangerous, True))
        return all(_eligible_blockers(frame, base_rows, source) for source in range(frame.n))

    result = shadow.solve_choice_rows(
        frame,
        set(mc.PROVEN_ROWS),
        fixed_rows=fixed,
        choice_rows=tuple(choice_rows),
        max_nodes=MAX_NODES,
        want_assignment=True,
        prefix_compatible=q_c_prefix,
        complete_compatible=critical_system_exists,
    )
    if result["status"] != "SAT":
        return {
            "schema": CASE_SCHEMA,
            "profile": list(profile),
            "solver": {
                "raw_status": result["status"],
                "reported_status": (
                    "INDETERMINATE_NODE_CAP"
                    if result["status"] == "INDETERMINATE"
                    else "INDETERMINATE_NOT_TARGET_FAITHFUL"
                ),
                "nodes": result["nodes"],
                "max_nodes": MAX_NODES,
            },
        }

    assignment = {
        name: shadow.ClassRow(
            name,
            int(record["center"]),
            frozenset(int(x) for x in record["support"]),
            bool(record["exact"]),
        )
        for name, record in result["assignment"].items()
    }
    assignment[f"global:{p}"] = shadow.ClassRow(
        f"global:{p}", p, dangerous, exact=True
    )

    supplied_records = []
    for role in ("q", "t1", "t2", "t3", "u"):
        supplied_records.append(
            _row_record(
                assignment[f"supplied:{role}"],
                kind="supplied",
                source=labels[role],
                role=role,
            )
        )
    global_records = [
        _row_record(assignment[f"global:{center}"], kind="global")
        for center in range(frame.n)
    ]
    base_rows = [
        assignment[f"supplied:{role}"]
        for role in ("q", "t1", "t2", "t3", "u")
    ] + [assignment[f"global:{center}"] for center in range(frame.n)]

    supplied_center_by_source = {
        labels[role]: assignment[f"supplied:{role}"].center
        for role in ("q", "t1", "t2", "t3", "u")
    }
    system_records = []
    blocker_map = {}
    for source in range(frame.n):
        eligible = _eligible_blockers(frame, base_rows, source)
        assert eligible
        supplied_center = supplied_center_by_source.get(source)
        preferred = [center for center in eligible if center != supplied_center]
        center = min(preferred or eligible)
        support = assignment[f"global:{center}"].support
        row = shadow.ClassRow(f"system:{source}", center, support, exact=True)
        system_records.append(_row_record(row, kind="system", source=source))
        blocker_map[str(source)] = center

    rows = sorted(
        supplied_records + global_records + system_records,
        key=lambda record: record["name"],
    )
    case = {
        "schema": CASE_SCHEMA,
        "profile": list(profile),
        "surplus_cap": seed["surplus_cap"],
        "second_large_cap": seed["second_large_cap"],
        "frame": {
            "n": frame.n,
            "cyclic_order": list(shadow.hull_order(frame)),
            "closed_caps": {
                name: sorted(points) for name, points in caps.items()
            },
            "cap_interiors": {
                name: list(frame.ints[name]) for name in ("S", "O1", "O2")
            },
        },
        "labels": labels,
        "dangerous_support": sorted(dangerous),
        "rows": rows,
        "critical_shell_blocker_map": blocker_map,
        "q_c": {
            "status": "NO_ENCODED_ROW_WITNESS",
            "checked_caps": list(p_caps),
        },
        "solver": {
            "raw_status": "SAT",
            "reported_status": "SAT_FINITE_SHADOW_ONLY",
            "nodes": result["nodes"],
            "max_nodes": MAX_NODES,
        },
    }
    case["witness_sha256"] = canonical_sha256(case)
    return case


def build_artifact() -> dict:
    manifest = load_manifest()
    cases = [solve_seed(seed) for seed in CASE_SEEDS]
    if any(case["solver"]["raw_status"] != "SAT" for case in cases):
        raise RuntimeError(f"preflight did not produce both witnesses: {cases}")
    artifact = {
        "schema": "p97-atail-pair-second-center-preflight-v1",
        "manifest_sha256": canonical_sha256(manifest),
        "epistemic_status": "SAT_FINITE_SHADOW_ONLY",
        "cases": cases,
    }
    validate_artifact(artifact)
    return artifact


def checkpoint_summary(artifact: Mapping[str, object]) -> dict:
    return {
        "schema": "p97-atail-pair-second-center-checkpoint-v1",
        "manifest_sha256": artifact["manifest_sha256"],
        "epistemic_status": artifact["epistemic_status"],
        "cases": [
            {
                "profile": case["profile"],
                "raw_status": case["solver"]["raw_status"],
                "reported_status": case["solver"]["reported_status"],
                "nodes": case["solver"]["nodes"],
                "row_count": len(case["rows"]),
                "witness_sha256": case["witness_sha256"],
                "q_c_status": case["q_c"]["status"],
            }
            for case in artifact["cases"]
        ],
        "all_witnesses_independently_validated": True,
        "target_faithful": False,
    }


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--full", action="store_true", help="print full witnesses")
    parser.add_argument("--check", action="store_true", help="compare checked-in checkpoint")
    args = parser.parse_args()
    artifact = build_artifact()
    summary = checkpoint_summary(artifact)
    if args.check:
        with (HERE / "checkpoint.json").open() as handle:
            expected = json.load(handle)
        assert summary == expected
    print(json.dumps(artifact if args.full else summary, indent=2, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
