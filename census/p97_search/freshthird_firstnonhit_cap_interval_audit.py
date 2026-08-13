"""Finite cap-interval augmentation of the FreshThird six-point order audit.

This is a diagnostic independence check, not a geometric realization and not
a Lean proof.  It asks whether the cap fields currently exposed by the two
geometric ``FreshThirdCapSourceInteraction`` constructors distinguish any of
the 40 source-alternating six-role words.

Three triangle markers divide a cyclic boundary into strict interiors
``I0,I1,I2``.  A role may lie at a marker or in an interior.  The prescribed
left-row remainder ``C`` lies in ``I0``.  The two interaction arms require
either distinct strict interiors for ``B,F`` or one common strict interior
whose closed cap contains ``A`` or ``D``.
"""

from __future__ import annotations

import argparse
import copy
import hashlib
import itertools
import json
from collections.abc import Iterable, Mapping, Sequence
from pathlib import Path
from typing import Any

from census.p97_search import (
    freshthird_firstnonhit_six_point_order_audit as order_audit,
)

DEFAULT_SOURCE_ARTIFACT = order_audit.DEFAULT_ARTIFACT
DEFAULT_ARTIFACT = Path(
    "certificates/p97_freshthird_firstnonhit/cap_interval_audit.json"
)

ROLES = order_audit.ROLES
LOCATION_NAMES = ("T0", "I0", "T1", "I1", "T2", "I2")
MARKER_CODES = (0, 2, 4)
INTERIOR_CODES = (1, 3, 5)


class AuditError(ValueError):
    """Raised when the cap-interval audit or its source is malformed."""


def _json_bytes(value: Any) -> bytes:
    return json.dumps(
        value,
        ensure_ascii=False,
        allow_nan=False,
        sort_keys=True,
        separators=(",", ":"),
    ).encode("utf-8")


def _sha256(value: Any) -> str:
    return hashlib.sha256(_json_bytes(value)).hexdigest()


def _sha256_file(path: Path) -> str:
    digest = hashlib.sha256()
    with path.open("rb") as stream:
        for block in iter(lambda: stream.read(1024 * 1024), b""):
            digest.update(block)
    return digest.hexdigest()


def _cyclic_embedding(codes: Sequence[int]) -> bool:
    """Whether distinct roles can occupy these marker/interior locations."""

    if len(codes) != len(ROLES) or any(code not in range(6) for code in codes):
        return False
    # Distinct roles cannot both coincide with one triangle vertex.
    if any(codes.count(marker) > 1 for marker in MARKER_CODES):
        return False
    # Reading from the anchored role may cross the T2/T0 cut at most once.
    return sum(
        codes[index] > codes[(index + 1) % len(codes)]
        for index in range(len(codes))
    ) <= 1


def _strict_cap(code: int) -> int | None:
    return (code - 1) // 2 if code in INTERIOR_CODES else None


def _closed_cap_contains(code: int, cap: int) -> bool:
    return code in {(2 * cap) % 6, (2 * cap + 1) % 6, (2 * (cap + 1)) % 6}


def _role_locations(order: Sequence[str], codes: Sequence[int]) -> dict[str, int]:
    return dict(zip(order, codes, strict=True))


def _is_distinct_cap_extension(locations: Mapping[str, int]) -> bool:
    cap_b = _strict_cap(locations["B"])
    cap_f = _strict_cap(locations["F"])
    return cap_b is not None and cap_f is not None and cap_b != cap_f


def _is_same_cap_extension(locations: Mapping[str, int]) -> bool:
    cap_b = _strict_cap(locations["B"])
    cap_f = _strict_cap(locations["F"])
    return (
        cap_b is not None
        and cap_b == cap_f
        and (
            _closed_cap_contains(locations["A"], cap_b)
            or _closed_cap_contains(locations["D"], cap_b)
        )
    )


def _uses_same_cap_endpoint(locations: Mapping[str, int]) -> bool:
    cap = _strict_cap(locations["B"])
    if cap is None or _strict_cap(locations["F"]) != cap:
        return False
    endpoints = {(2 * cap) % 6, (2 * (cap + 1)) % 6}
    return locations["A"] in endpoints or locations["D"] in endpoints


def _extension_payload(order: Sequence[str], codes: Sequence[int]) -> dict[str, Any]:
    locations = _role_locations(order, codes)
    return {
        "locations": {role: LOCATION_NAMES[locations[role]] for role in ROLES},
        "cyclic_location_codes": list(codes),
        "extra_first_cap_source": {
            "location": "I0",
            "representation": (
                "cap-membership metadata only; no cyclic order or physical "
                "distinctness from A-F is inferred here"
            ),
        },
    }


def extensions(order: Sequence[str]) -> dict[str, Any]:
    """Enumerate all cap-marker extensions of one six-role cyclic word."""

    distinct: list[tuple[int, ...]] = []
    same: list[tuple[int, ...]] = []
    endpoint: list[tuple[int, ...]] = []
    for codes in itertools.product(range(6), repeat=len(ROLES)):
        if not _cyclic_embedding(codes):
            continue
        locations = _role_locations(order, codes)
        # The new source-clean ingress prescribes C as the second cap source.
        if locations["C"] != 1:
            continue
        if _is_distinct_cap_extension(locations):
            distinct.append(codes)
        if _is_same_cap_extension(locations):
            same.append(codes)
        if _uses_same_cap_endpoint(locations):
            endpoint.append(codes)
    return {
        "distinct_cap_count": len(distinct),
        "same_cap_closed_source_count": len(same),
        "same_cap_endpoint_count": len(endpoint),
        "distinct_cap_witness": _extension_payload(order, distinct[0]) if distinct else None,
        "same_cap_closed_source_witness": _extension_payload(order, same[0]) if same else None,
        "same_cap_endpoint_witness": _extension_payload(order, endpoint[0]) if endpoint else None,
    }


def build_audit(source_path: Path = DEFAULT_SOURCE_ARTIFACT) -> dict[str, Any]:
    source = order_audit.replay_artifact(source_path)
    source_records = [
        record
        for record in source["orders"]
        if record["shared_pair_alternating"]
    ]
    records = []
    for record in source_records:
        order = tuple(record["order"])
        records.append(
            {
                "order": list(order),
                "source_status": record["status"],
                **extensions(order),
            }
        )
    survivor_records = [
        record for record in records if record["source_status"] == "RATIONAL_WITNESS"
    ]
    kernel_records = [
        record
        for record in records
        if record["source_status"] == "LEAN_KERNEL_SCHEMA_MATCH"
    ]
    counts = {
        "source_alternating_words": len(records),
        "rational_survivor_words": len(survivor_records),
        "kernel_schema_words": len(kernel_records),
        "survivors_with_distinct_cap_extension": sum(
            record["distinct_cap_count"] > 0 for record in survivor_records
        ),
        "survivors_with_same_cap_closed_source_extension": sum(
            record["same_cap_closed_source_count"] > 0 for record in survivor_records
        ),
        "survivors_with_same_cap_endpoint_extension": sum(
            record["same_cap_endpoint_count"] > 0 for record in survivor_records
        ),
        "kernel_words_with_both_cap_extensions": sum(
            record["distinct_cap_count"] > 0
            and record["same_cap_closed_source_count"] > 0
            for record in kernel_records
        ),
        "words_excluded_by_current_cap_fields": sum(
            record["distinct_cap_count"] == 0
            and record["same_cap_closed_source_count"] == 0
            for record in records
        ),
    }
    payload = {
        "format": "p97_freshthird_firstnonhit_cap_interval_audit_v1",
        "diagnostic_status": (
            "FINITE_COMBINATORIAL_EXTENSION_NOT_GEOMETRIC_REALIZATION_OR_LEAN_CLOSURE"
        ),
        "source_artifact": {
            "path": str(source_path),
            "file_sha256": _sha256_file(source_path),
            "authenticated_hashes": source["hashes"],
        },
        "lean_ingress": {
            "identity": (
                "Problem97.ATailFrontierLiveClosure."
                "freshThird_secondSource_prescribed_remainder_ingress_of_geometric_data"
            ),
            "role_projection": {
                "A": "Q.source1",
                "B": "second cap-source selected-row center",
                "C": "second cap source, prescribed in I0",
                "D": "Q.source2",
                "E": "opposite-row remainder",
                "F": "Q selected-row center",
            },
        },
        "model": {
            "locations": list(LOCATION_NAMES),
            "cyclic_order": "T0,I0,T1,I1,T2,I2",
            "strict_caps": {"0": ["I0"], "1": ["I1"], "2": ["I2"]},
            "closed_caps": {
                "0": ["T0", "I0", "T1"],
                "1": ["T1", "I1", "T2"],
                "2": ["T2", "I2", "T0"],
            },
            "prescribed_remainder": "C lies in I0",
            "distinct_arm": "B and F lie in different strict cap interiors",
            "same_arm": (
                "B and F lie in one strict cap interior and A or D lies in its closed cap"
            ),
            "extra_cap_source": (
                "the first cap source is tracked only as lying in I0; this audit does not "
                "infer its cyclic order or physical identity relative to A-F"
            ),
            "marker_role_semantics": (
                "a role assigned Ti is physically coincident with that triangle marker; "
                "it is not an adjacent cyclic slot"
            ),
        },
        "premise_ledger": {
            "encoded": [
                "the 40 source-alternating six-role cyclic words",
                "three cyclic triangle markers and their strict/closed cap intervals",
                "the prescribed second cap source C in the distinguished strict interior I0",
                "the exact cap fields of both geometric interaction constructors",
                "closed-cap endpoint incidence for A or D in the same-cap arm",
            ],
            "omitted": [
                "Euclidean realizability of the marker augmentation",
                "metric relations to triangle vertices, apexes, or blocker centers beyond the two rows",
                "the first-source non-hit packet and its selected row",
                "carrier-wide K4, deletion-minimality, and no-M44 coupling",
                "a third selected row or reciprocal source-row incidence",
            ],
        },
        "conclusion": (
            "The currently exposed cap-placement fields alone exclude none of the 40 "
            "source-alternating words and none of the 28 exact-rational survivors."
        ),
        "counts": counts,
        "records": records,
    }
    artifact = copy.deepcopy(payload)
    artifact["hashes"] = {
        "records_sha256": _sha256(records),
        "payload_sha256": _sha256(payload),
    }
    return artifact


def write_audit(
    path: Path = DEFAULT_ARTIFACT,
    source_path: Path = DEFAULT_SOURCE_ARTIFACT,
) -> dict[str, Any]:
    artifact = build_audit(source_path)
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_bytes(_json_bytes(artifact) + b"\n")
    return artifact


def replay_artifact(
    path: Path = DEFAULT_ARTIFACT,
    source_path: Path = DEFAULT_SOURCE_ARTIFACT,
) -> dict[str, Any]:
    try:
        artifact = json.loads(path.read_text(encoding="utf-8"))
    except (OSError, json.JSONDecodeError) as exc:
        raise AuditError(f"cannot read cap-interval artifact: {path}") from exc
    expected = build_audit(source_path)
    if artifact != expected:
        raise AuditError("cap-interval artifact differs from deterministic replay")
    payload = copy.deepcopy(artifact)
    hashes = payload.pop("hashes", None)
    if not isinstance(hashes, dict):
        raise AuditError("missing cap-interval hash ledger")
    if hashes.get("records_sha256") != _sha256(payload["records"]):
        raise AuditError("cap-interval record hash mismatch")
    if hashes.get("payload_sha256") != _sha256(payload):
        raise AuditError("cap-interval payload hash mismatch")
    return artifact


def main(argv: Iterable[str] | None = None) -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--source", type=Path, default=DEFAULT_SOURCE_ARTIFACT)
    parser.add_argument("--output", type=Path, default=DEFAULT_ARTIFACT)
    parser.add_argument("--replay", action="store_true")
    args = parser.parse_args(list(argv) if argv is not None else None)
    if args.replay:
        replay_artifact(args.output, args.source)
        print(f"replayed {args.output}")
    else:
        artifact = write_audit(args.output, args.source)
        print(json.dumps(artifact["counts"], sort_keys=True))
        print(f"wrote {args.output}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
