#!/usr/bin/env python3
# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>
#
"""Replayable Phase-3 shared-pair cyclic-separation certificates.

This module is deliberately independent of the live Phase-3 CEGAR driver.  It
authenticates projected survivor records, reconstructs the 24 cyclic orders
allowed by their cap annotation, and certifies that every such order violates
at least one shared-pair separation core.

The concrete JSON ingress remains Python-checked.  The mathematical soundness
of each core is banked in Lean by
``Problem97.selectedFourClass_shared_pair_separated``.
"""

from __future__ import annotations

import argparse
import hashlib
import itertools
import json
from collections.abc import Mapping, Sequence
from pathlib import Path
from typing import Any

SCHEMA = "p97-phase3-shared-pair-cyclic-separation-certificate-v1"
MANIFEST_SCHEMA = "p97-phase3-shared-pair-cyclic-separation-manifest-v1"
SURVIVOR_SCHEMA = "p97-phase3-structural-cegar-survivor-v1"
N = 10
PROFILE = (4, 4, 5)
LEAN_CONSUMER = {
    "module": "Erdos9796Proof.P97.Phase3SharedPairSeparation",
    "theorem": "Problem97.selectedFourClass_shared_pair_separated",
}
TRUST_BOUNDARY = (
    "The finite JSON parsing, cap-order enumeration, and all-order coverage "
    "replay are Python-checked; the generic shared-pair geometric implication "
    "is Lean-kernel-checked."
)


class SharedPairSeparationError(ValueError):
    """A malformed source, certificate, or replay mismatch."""


def canonical_bytes(value: Any) -> bytes:
    return json.dumps(
        value, sort_keys=True, separators=(",", ":"), allow_nan=False
    ).encode("utf-8")


def sha256_value(value: Any) -> str:
    return hashlib.sha256(canonical_bytes(value)).hexdigest()


def sha256_file(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def _is_sha256(value: Any) -> bool:
    return (
        isinstance(value, str)
        and len(value) == 64
        and all(character in "0123456789abcdef" for character in value)
    )


def _reject_duplicate_keys(
    pairs: list[tuple[str, Any]],
) -> dict[str, Any]:
    result: dict[str, Any] = {}
    for key, value in pairs:
        if key in result:
            raise SharedPairSeparationError(f"duplicate JSON key: {key}")
        result[key] = value
    return result


def _normalized_rows(value: Any) -> tuple[dict[str, Any], ...]:
    if not isinstance(value, list) or len(value) != N:
        raise SharedPairSeparationError("metric_rows must contain ten rows")
    rows: list[dict[str, Any]] = []
    for expected_center, raw in enumerate(value):
        if not isinstance(raw, dict) or set(raw) != {
            "center",
            "support",
            "exact",
        }:
            raise SharedPairSeparationError("metric row fields mismatch")
        center = raw["center"]
        support = raw["support"]
        if (
            type(center) is not int
            or center != expected_center
            or raw["exact"] is not False
            or not isinstance(support, list)
            or len(support) != 4
            or any(type(point) is not int for point in support)
        ):
            raise SharedPairSeparationError("metric row shape mismatch")
        normalized_support = sorted(support)
        if (
            normalized_support != support
            or len(set(support)) != 4
            or center in support
            or any(not 0 <= point < N for point in support)
        ):
            raise SharedPairSeparationError("metric row support is invalid")
        rows.append({"center": center, "support": normalized_support, "exact": False})
    return tuple(rows)


def _cap_facts(semantic_assignment: Any) -> tuple[tuple[int, int], ...]:
    if not isinstance(semantic_assignment, Mapping):
        raise SharedPairSeparationError("semantic_assignment is not an object")
    facts: list[tuple[int, int]] = []
    for label in range(3, N):
        hits = [
            cap
            for cap in range(3)
            if semantic_assignment.get(f"f[{label},{cap}]") is True
        ]
        if len(hits) != 1:
            raise SharedPairSeparationError(
                f"label {label} does not have one true cap atom"
            )
        facts.append((label, hits[0]))
    if sorted(
        sum(1 for _label, fact_cap in facts if fact_cap == cap) for cap in range(3)
    ) != [2, 2, 3]:
        raise SharedPairSeparationError("cap fibers do not have sizes (2,2,3)")
    return tuple(facts)


def cap_orders(
    facts: Sequence[tuple[int, int]],
) -> tuple[tuple[str, tuple[int, ...]], ...]:
    normalized = tuple(facts)
    if (
        any(
            not isinstance(fact, tuple)
            or len(fact) != 2
            or type(fact[0]) is not int
            or type(fact[1]) is not int
            for fact in normalized
        )
        or normalized != tuple(sorted(set(normalized)))
        or tuple(label for label, _cap in normalized) != tuple(range(3, N))
        or any(cap not in (0, 1, 2) for _label, cap in normalized)
    ):
        raise SharedPairSeparationError("cap facts are invalid or incomplete")
    fibers = tuple(
        tuple(label for label, cap in normalized if cap == index) for index in range(3)
    )
    if sorted(map(len, fibers)) != [2, 2, 3]:
        raise SharedPairSeparationError("cap fibers do not have sizes (2,2,3)")
    raw = sorted(
        {
            (0, *fiber2, 1, *fiber0, 2, *fiber1)
            for fiber2, fiber0, fiber1 in itertools.product(
                itertools.permutations(fibers[2]),
                itertools.permutations(fibers[0]),
                itertools.permutations(fibers[1]),
            )
        }
    )
    if len(raw) != 24 or any(sorted(order) != list(range(N)) for order in raw):
        raise SharedPairSeparationError("cap facts do not generate 24 orders")
    return tuple((f"order-{index:02d}", order) for index, order in enumerate(raw))


def shared_pair_cores(
    rows: Sequence[Mapping[str, Any]],
) -> tuple[dict[str, Any], ...]:
    cores: list[dict[str, Any]] = []
    for first_center in range(N):
        first = set(rows[first_center]["support"])
        for second_center in range(first_center + 1, N):
            common = sorted(first.intersection(rows[second_center]["support"]))
            if len(common) != 2:
                continue
            unsigned = {
                "first_center": first_center,
                "second_center": second_center,
                "first_point": common[0],
                "second_point": common[1],
            }
            cores.append({**unsigned, "core_sha256": sha256_value(unsigned)})
    if not cores:
        raise SharedPairSeparationError("rows have no shared-pair core")
    return tuple(cores)


def _between(order: Sequence[int], first: int, second: int, point: int) -> bool:
    positions = {label: index for index, label in enumerate(order)}
    left, right = sorted((positions[first], positions[second]))
    return left < positions[point] < right


def core_satisfied(order: Sequence[int], core: Mapping[str, Any]) -> bool:
    first = _between(
        order,
        core["first_center"],
        core["second_center"],
        core["first_point"],
    )
    second = _between(
        order,
        core["first_center"],
        core["second_center"],
        core["second_point"],
    )
    return first != second


def _coverage(
    orders: Sequence[tuple[str, tuple[int, ...]]],
    cores: Sequence[Mapping[str, Any]],
) -> tuple[dict[str, Any], ...]:
    coverage: list[dict[str, Any]] = []
    for order_id, order in orders:
        violating = next(
            (core for core in cores if not core_satisfied(order, core)), None
        )
        if violating is None:
            raise SharedPairSeparationError(
                f"{order_id} satisfies every shared-pair core"
            )
        coverage.append(
            {
                "order_id": order_id,
                "order": list(order),
                "order_sha256": sha256_value(list(order)),
                "violating_core_sha256": violating["core_sha256"],
            }
        )
    return tuple(coverage)


def _validate_source_record(
    record: Mapping[str, Any], previous: str | None
) -> tuple[tuple[dict[str, Any], ...], tuple[tuple[int, int], ...]]:
    payload = dict(record)
    claimed_record_hash = payload.pop("record_sha256", None)
    if payload.get("previous_record_sha256") != previous:
        raise SharedPairSeparationError("source survivor hash chain is broken")
    if (
        not isinstance(claimed_record_hash, str)
        or claimed_record_hash != sha256_value(payload)
        or record.get("schema") != SURVIVOR_SCHEMA
        or record.get("classification") != "STRUCTURALLY_UNRESOLVED"
    ):
        raise SharedPairSeparationError("source survivor identity mismatch")
    rows = _normalized_rows(record.get("metric_rows"))
    if record.get("metric_rows_sha256") != sha256_value(list(rows)):
        raise SharedPairSeparationError("source metric_rows hash mismatch")
    facts = _cap_facts(record.get("semantic_assignment"))
    return rows, facts


def build_certificate(
    record: Mapping[str, Any], previous: str | None
) -> dict[str, Any]:
    rows, facts = _validate_source_record(record, previous)
    cores = shared_pair_cores(rows)
    orders = cap_orders(facts)
    coverage = _coverage(orders, cores)
    unsigned = {
        "schema": SCHEMA,
        "n": N,
        "profile": list(PROFILE),
        "lean_consumer": LEAN_CONSUMER,
        "concrete_ingress_trust_boundary": TRUST_BOUNDARY,
        "source": {
            "record_sha256": record["record_sha256"],
            "assignment_sha256": record["assignment_sha256"],
            "metric_rows_sha256": record["metric_rows_sha256"],
        },
        "rows": list(rows),
        "cap_facts": [list(fact) for fact in facts],
        "cores": list(cores),
        "order_coverage": list(coverage),
        "summary": {
            "row_count": len(rows),
            "core_count": len(cores),
            "cap_order_count": len(orders),
            "rejected_order_count": len(coverage),
            "rows_sha256": sha256_value(list(rows)),
            "cap_facts_sha256": sha256_value([list(fact) for fact in facts]),
            "cores_sha256": sha256_value(list(cores)),
            "order_coverage_sha256": sha256_value(list(coverage)),
        },
    }
    certificate = {
        **unsigned,
        "certificate_payload_sha256": sha256_value(unsigned),
    }
    replay_certificate(certificate)
    return certificate


def replay_certificate(value: Any) -> dict[str, Any]:
    if not isinstance(value, dict):
        raise SharedPairSeparationError("certificate is not an object")
    expected_keys = {
        "schema",
        "n",
        "profile",
        "lean_consumer",
        "concrete_ingress_trust_boundary",
        "source",
        "rows",
        "cap_facts",
        "cores",
        "order_coverage",
        "summary",
        "certificate_payload_sha256",
    }
    if set(value) != expected_keys:
        raise SharedPairSeparationError("certificate fields mismatch")
    if (
        value["schema"] != SCHEMA
        or value["n"] != N
        or value["profile"] != list(PROFILE)
        or value["lean_consumer"] != LEAN_CONSUMER
        or value["concrete_ingress_trust_boundary"] != TRUST_BOUNDARY
    ):
        raise SharedPairSeparationError("certificate identity mismatch")
    source = value["source"]
    if (
        not isinstance(source, dict)
        or set(source) != {"record_sha256", "assignment_sha256", "metric_rows_sha256"}
        or any(not _is_sha256(source[name]) for name in source)
    ):
        raise SharedPairSeparationError("certificate source identity mismatch")
    rows = _normalized_rows(value["rows"])
    if source["metric_rows_sha256"] != sha256_value(list(rows)):
        raise SharedPairSeparationError("certificate source rows hash mismatch")
    raw_facts = value["cap_facts"]
    if not isinstance(raw_facts, list):
        raise SharedPairSeparationError("certificate cap facts are malformed")
    try:
        facts = tuple((fact[0], fact[1]) for fact in raw_facts)
    except (TypeError, IndexError) as exc:
        raise SharedPairSeparationError("certificate cap facts are malformed") from exc
    if [list(fact) for fact in facts] != raw_facts:
        raise SharedPairSeparationError("certificate cap facts are not normalized")
    orders = cap_orders(facts)
    expected_cores = shared_pair_cores(rows)
    if value["cores"] != list(expected_cores):
        raise SharedPairSeparationError("certificate core census mismatch")
    expected_coverage = _coverage(orders, expected_cores)
    if value["order_coverage"] != list(expected_coverage):
        raise SharedPairSeparationError("certificate order coverage mismatch")
    expected_summary = {
        "row_count": len(rows),
        "core_count": len(expected_cores),
        "cap_order_count": len(orders),
        "rejected_order_count": len(expected_coverage),
        "rows_sha256": sha256_value(list(rows)),
        "cap_facts_sha256": sha256_value([list(fact) for fact in facts]),
        "cores_sha256": sha256_value(list(expected_cores)),
        "order_coverage_sha256": sha256_value(list(expected_coverage)),
    }
    if value["summary"] != expected_summary:
        raise SharedPairSeparationError("certificate summary mismatch")
    unsigned = dict(value)
    claimed = unsigned.pop("certificate_payload_sha256")
    if claimed != sha256_value(unsigned):
        raise SharedPairSeparationError("certificate payload hash mismatch")
    return dict(value)


def replay_against_source(
    certificate: Any, record: Mapping[str, Any], previous: str | None
) -> dict[str, Any]:
    replayed = replay_certificate(certificate)
    expected = build_certificate(record, previous)
    if replayed != expected:
        raise SharedPairSeparationError(
            "certificate does not match authenticated source survivor"
        )
    return replayed


def read_survivors(path: Path) -> tuple[dict[str, Any], ...]:
    records: list[dict[str, Any]] = []
    previous: str | None = None
    with path.open(encoding="utf-8") as handle:
        for line_number, line in enumerate(handle, start=1):
            try:
                record = json.loads(line, object_pairs_hook=_reject_duplicate_keys)
            except (json.JSONDecodeError, SharedPairSeparationError) as exc:
                raise SharedPairSeparationError(
                    f"{path}:{line_number}: invalid JSON"
                ) from exc
            if not isinstance(record, dict):
                raise SharedPairSeparationError(
                    f"{path}:{line_number}: expected object"
                )
            _validate_source_record(record, previous)
            records.append(record)
            previous = record["record_sha256"]
    if not records:
        raise SharedPairSeparationError("source survivor stream is empty")
    return tuple(records)


def write_artifacts(source_path: Path, output_dir: Path) -> dict[str, Any]:
    records = read_survivors(source_path)
    certificates: list[dict[str, Any]] = []
    previous: str | None = None
    for record in records:
        certificate = build_certificate(record, previous)
        replay_against_source(certificate, record, previous)
        certificates.append(certificate)
        previous = record["record_sha256"]
    output_dir.mkdir(parents=True, exist_ok=False)
    certificates_path = output_dir / "certificates.jsonl"
    certificates_path.write_bytes(
        b"".join(canonical_bytes(certificate) + b"\n" for certificate in certificates)
    )
    core_counts: dict[str, int] = {}
    for certificate in certificates:
        count = str(certificate["summary"]["core_count"])
        core_counts[count] = core_counts.get(count, 0) + 1
    manifest_unsigned = {
        "schema": MANIFEST_SCHEMA,
        "source": str(source_path),
        "source_sha256": sha256_file(source_path),
        "certificates": str(certificates_path),
        "certificates_sha256": sha256_file(certificates_path),
        "certificate_count": len(certificates),
        "rejected_survivor_count": len(certificates),
        "cap_orders_per_survivor": 24,
        "core_count_histogram": core_counts,
        "certificate_schema": SCHEMA,
        "lean_consumer": LEAN_CONSUMER,
        "concrete_ingress_trust_boundary": TRUST_BOUNDARY,
    }
    manifest = {
        **manifest_unsigned,
        "manifest_payload_sha256": sha256_value(manifest_unsigned),
    }
    (output_dir / "manifest.json").write_bytes(canonical_bytes(manifest) + b"\n")
    return manifest


def _parser() -> argparse.ArgumentParser:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--survivors", required=True, type=Path)
    parser.add_argument("--output-dir", required=True, type=Path)
    return parser


def main(argv: Sequence[str] | None = None) -> int:
    args = _parser().parse_args(argv)
    manifest = write_artifacts(args.survivors, args.output_dir)
    print(json.dumps(manifest, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
