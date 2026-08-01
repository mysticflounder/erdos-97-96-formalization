#!/usr/bin/env python3
"""Read-only post-mining of Phase-3 survivor incidence records.

The input records contain selected shell supports, not coordinates.  This
script therefore limits itself to two declared incidence checks:

* singleton-center/support skew-Bollobas set-pair orientations; and
* a shared-support graph summary used only as an angular-midpoint prefilter.

Miquel/Clifford/bundle candidates are explicitly reported as unavailable: the
Phase-3 rows are ``exact=false`` and no certified cyclic-coordinate payload is
present.  No SAT clauses or production sources are modified.
"""

from __future__ import annotations

import argparse
import hashlib
import itertools
import json
from collections import Counter
from pathlib import Path
from typing import Any, Mapping


SCHEMA = "p97-phase3-postmine-motif-v1"
MANIFEST_SCHEMA = "p97-phase3-postmine-manifest-v1"
SURVIVOR_SCHEMA = "p97-phase3-structural-cegar-survivor-v1"
RESULT_SCHEMA = "p97-phase3-survivor-metric-result-v1"
N = 10
K = 4


def canonical_bytes(value: Any) -> bytes:
    return json.dumps(
        value, sort_keys=True, separators=(",", ":"),
        ensure_ascii=False, allow_nan=False,
    ).encode("utf-8")


def sha256_value(value: Any) -> str:
    return hashlib.sha256(canonical_bytes(value)).hexdigest()


def sha256_file(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def _record_hash(record: Mapping[str, Any]) -> tuple[bool, str | None]:
    stored = record.get("record_sha256")
    if not isinstance(stored, str):
        return False, "record_sha256 missing"
    payload = dict(record)
    payload.pop("record_sha256", None)
    if stored != sha256_value(payload):
        return False, "record_sha256 mismatch"
    return True, None


def _row_check(record: Mapping[str, Any]) -> tuple[bool, list[str], dict[int, set[int]]]:
    errors: list[str] = []
    rows = record.get("metric_rows")
    supports: dict[int, set[int]] = {}
    if not isinstance(rows, list) or len(rows) != N:
        return False, ["metric_rows must contain ten rows"], supports
    for expected, row in enumerate(rows):
        if not isinstance(row, Mapping) or set(row) != {"center", "support", "exact"}:
            errors.append(f"row {expected}: fields mismatch")
            continue
        center, support, exact = row["center"], row["support"], row["exact"]
        if center != expected or exact is not False:
            errors.append(f"row {expected}: center/exact mismatch")
            continue
        if (
            not isinstance(support, list)
            or len(support) != K
            or len(set(support)) != K
            or any(type(point) is not int or not 0 <= point < N for point in support)
            or center in support
            or support != sorted(support)
        ):
            errors.append(f"row {expected}: support shape mismatch")
            continue
        supports[center] = set(support)
    if len(supports) != N:
        errors.append("not all centers have validated supports")
    expected_hash = record.get("metric_rows_sha256")
    if isinstance(expected_hash, str):
        actual_hash = sha256_value(rows)
        if expected_hash != actual_hash:
            errors.append("metric_rows_sha256 mismatch")
    return not errors, errors, supports


def _skew_count(
    supports: Mapping[int, set[int]], orientation: str
) -> tuple[int, list[int] | None]:
    """Count ordered six-tuples satisfying the declared cross-intersection.

    ``center_in_later`` uses A_i={c_i}, B_i=S(c_i), hence c_i in S(c_j)
    for i<j.  ``support_in_later`` is the swapped A/B orientation.
    """

    if orientation not in {"center_in_later", "support_in_later"}:
        raise ValueError(orientation)
    count = 0
    first: list[int] | None = None

    def extend(prefix: list[int], available: set[int]) -> None:
        nonlocal count, first
        if len(prefix) == 6:
            count += 1
            if first is None:
                first = list(prefix)
            return
        for candidate in sorted(available):
            ok = True
            for previous in prefix:
                if orientation == "center_in_later":
                    ok = previous in supports[candidate]
                else:
                    ok = candidate in supports[previous]
                if not ok:
                    break
            if ok:
                extend(prefix + [candidate], available - {candidate})

    extend([], set(range(N)))
    return count, first


def _shared_support_graph(supports: Mapping[int, set[int]]) -> dict[str, Any]:
    adjacency = {center: set() for center in range(N)}
    edges: list[list[int]] = []
    for left, right in itertools.combinations(range(N), 2):
        if len(supports[left] & supports[right]) >= 2:
            adjacency[left].add(right)
            adjacency[right].add(left)
            edges.append([left, right])
    seen: set[int] = set()
    component_sizes: list[int] = []
    for start in range(N):
        if start in seen:
            continue
        stack = [start]
        seen.add(start)
        size = 0
        while stack:
            node = stack.pop()
            size += 1
            for neighbor in adjacency[node]:
                if neighbor not in seen:
                    seen.add(neighbor)
                    stack.append(neighbor)
        component_sizes.append(size)
    component_sizes.sort()
    components = len(component_sizes)
    cycle_rank = len(edges) - N + components
    return {
        "status": "PREFILTER_ONLY_SHARED_SUPPORT_GRAPH",
        "vertices": N,
        "edges": len(edges),
        "edge_list": edges,
        "component_count": components,
        "component_sizes": component_sizes,
        "cycle_rank": cycle_rank,
        "trust": "incidence heuristic; not an angular or geometric cycle certificate",
    }


def _source_record(raw: Mapping[str, Any]) -> tuple[Mapping[str, Any], str]:
    nested = raw.get("source_record")
    if isinstance(nested, Mapping):
        return nested, "nested_source_record"
    return raw, "direct_record"


def mine_file(path: Path) -> tuple[list[dict[str, Any]], dict[str, Any]]:
    source_hash = sha256_file(path)
    output: list[dict[str, Any]] = []
    source_schema_counts: Counter[str] = Counter()
    auth_failures = 0
    for line_index, line in enumerate(path.read_text().splitlines()):
        if not line.strip():
            continue
        raw = json.loads(line)
        if not isinstance(raw, Mapping):
            raise ValueError(f"{path}:{line_index + 1}: record is not an object")
        record, layout = _source_record(raw)
        source_schema = record.get("schema")
        source_schema_counts[str(source_schema)] += 1
        errors: list[str] = []
        if source_schema != SURVIVOR_SCHEMA:
            errors.append(f"unexpected source schema: {source_schema!r}")
        ok_hash, hash_error = _record_hash(record)
        if not ok_hash and hash_error is not None:
            errors.append(hash_error)
        rows_ok, row_errors, supports = _row_check(record)
        errors.extend(row_errors)
        auth_ok = not errors
        if not auth_ok:
            auth_failures += 1
        source_record_hash = record.get("record_sha256")
        metric_rows_hash = record.get("metric_rows_sha256")
        semantic = record.get("semantic_assignment")
        semantic_hash = sha256_value(semantic) if isinstance(semantic, Mapping) else None
        skew: dict[str, Any] = {}
        graph: dict[str, Any] | None = None
        if auth_ok:
            for orientation in ("center_in_later", "support_in_later"):
                count, first = _skew_count(supports, orientation)
                skew[orientation] = {
                    "candidate_count": count,
                    "first_witness": first,
                    "conditions": (
                        "A_i={center_i}, B_i=support(center_i), center_i in support(center_j) for i<j"
                        if orientation == "center_in_later"
                        else "A_i=support(center_i), B_i={center_i}, center_j in support(center_i) for i<j"
                    ),
                    "status": "INCIDENCE_CANDIDATE_ONLY",
                }
            graph = _shared_support_graph(supports)
        else:
            for orientation in ("center_in_later", "support_in_later"):
                skew[orientation] = {
                    "candidate_count": 0,
                    "first_witness": None,
                    "status": "SKIPPED_AUTH_FAILURE",
                }
        payload: dict[str, Any] = {
            "schema": SCHEMA,
            "source_file": str(path),
            "source_file_sha256": source_hash,
            "source_layout": layout,
            "source_schema": source_schema,
            "source_record_index": record.get("index", line_index),
            "source_record_sha256": source_record_hash,
            "metric_rows_sha256": metric_rows_hash,
            "semantic_assignment_sha256": semantic_hash,
            "authentication": {"ok": auth_ok, "errors": errors},
            "skew_bollobas": skew,
            "angular_midpoint_prefilter": graph
            or {
                "status": "SKIPPED_AUTH_FAILURE",
                "trust": "no geometric inference",
            },
            "miquel_clifford_bundle_prefilter": {
                "status": "PREFILTER_ONLY_ZERO_NO_COORDINATES",
                "candidate_count": 0,
                "reason": "metric_rows exact=false; no certified concyclicity/full-circle nonmembership or coordinates",
                "trust": "not a Miquel, Clifford, bundle, or geometric closure certificate",
            },
            "trust": (
                "Python hash/schema replay plus incidence enumeration; no SAT clauses, no coordinates, no Lean closure"
            ),
        }
        payload["record_sha256"] = sha256_value(payload)
        output.append(payload)
    summary = {
        "source_file": str(path),
        "source_file_sha256": source_hash,
        "record_count": len(output),
        "authentication_failures": auth_failures,
        "source_schema_counts": dict(sorted(source_schema_counts.items())),
        "skew_candidate_records": {
            orientation: sum(
                1
                for row in output
                if row["skew_bollobas"][orientation]["candidate_count"] > 0
            )
            for orientation in ("center_in_later", "support_in_later")
        },
    }
    return output, summary


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument(
        "--input", action="append", type=Path, dest="inputs",
        help="survivor JSONL input (repeatable)",
    )
    parser.add_argument(
        "--output", type=Path,
        default=Path("scratch/p97-distinct-distance-lane/phase3_postmine_motifs_20260731.jsonl"),
    )
    parser.add_argument(
        "--manifest", type=Path,
        default=Path("scratch/p97-distinct-distance-lane/phase3_postmine_motifs_20260731.manifest.json"),
    )
    args = parser.parse_args()
    inputs = args.inputs or [
        Path("scratch/p97-distinct-distance-lane/phase3_structural_cegar_10000_20260729/survivors.jsonl"),
        Path("scratch/p97-distinct-distance-lane/paused_projected_current_source_survivors_162_20260729/survivors.jsonl"),
    ]
    rows: list[dict[str, Any]] = []
    summaries: list[dict[str, Any]] = []
    for path in inputs:
        mined, summary = mine_file(path)
        rows.extend(mined)
        summaries.append(summary)
    args.output.parent.mkdir(parents=True, exist_ok=True)
    args.output.write_text("".join(json.dumps(row, sort_keys=True, separators=(",", ":")) + "\n" for row in rows))
    manifest: dict[str, Any] = {
        "schema": MANIFEST_SCHEMA,
        "script": str(Path(__file__)),
        "script_sha256": sha256_file(Path(__file__)),
        "output": str(args.output),
        "output_sha256": sha256_file(args.output),
        "record_count": len(rows),
        "input_summaries": summaries,
        "counts": {
            "authentication_failures": sum(item["authentication_failures"] for item in summaries),
            "skew_candidate_records": {
                orientation: sum(item["skew_candidate_records"][orientation] for item in summaries)
                for orientation in ("center_in_later", "support_in_later")
            },
            "angular_prefilter_records": len(rows),
            "miquel_clifford_bundle_sound_candidates": 0,
        },
        "trust_boundary": (
            "read-only Python post-miner; hash/schema authentication and incidence checks only; "
            "metric rows are exact=false; no angular, Miquel, Clifford, bundle, SAT, Lean, or P97 closure claim"
        ),
    }
    manifest["manifest_sha256"] = sha256_value(manifest)
    args.manifest.write_text(json.dumps(manifest, indent=2, sort_keys=True) + "\n")
    print(json.dumps({"output": str(args.output), "manifest": str(args.manifest), "records": len(rows), "counts": manifest["counts"]}, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
