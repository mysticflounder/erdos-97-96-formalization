#!/usr/bin/env python3
"""Build the authenticated cheap structural prefix from the cube19 bank.

The source bank is preserved.  Exactly the 508 structural-path records are
retained and rechained; the 45 selected-row Kalmanson records are recorded as
excluded because their production bootstrap replay is deliberately expensive.
"""

from __future__ import annotations

import hashlib
import json
import os
import sys
from collections import Counter
from pathlib import Path
from typing import Any

ROOT = Path(__file__).resolve().parents[2]
if str(ROOT) not in sys.path:
    sys.path.insert(0, str(ROOT))

from census.p97_search import phase3_structural_cegar as structural  # noqa: E402

LANE = ROOT / "scratch/p97-distinct-distance-lane"
SOURCE_DIR = (
    LANE / "phase3_structural_cegar_projected_static_v2_cube19_20260729"
)
SOURCE = SOURCE_DIR / "learned-certificates.jsonl"
SOURCE_MANIFEST = SOURCE_DIR / "manifest.json"
OUTPUT_DIR = (
    LANE / "phase3_projected_cube19_cheap_structural_bootstrap_508_20260729"
)

PINNED_SOURCE_COUNT = 553
PINNED_SOURCE_SHA256 = (
    "8e6009cca837253fad7fbce9db7669e862417f7eb8de6fe922c7a4554bb2f276"
)
PINNED_SOURCE_CHAIN_HEAD = (
    "ed74e466e100b8f93c3ae45b8ba41ceaecc2387c3c5bdf5ae2a5f651a75b19e8"
)
RETAIN_ORIGIN = "solver-structural-path-memberships"
EXCLUDE_ORIGIN = "solver-cap-order-selected-row-kalmanson"
EXPECTED_RETAINED = 508
EXPECTED_EXCLUDED = 45


class FilterError(RuntimeError):
    """A source authentication, policy, or publication failure."""


def canonical_bytes(value: Any) -> bytes:
    return json.dumps(
        value, allow_nan=False, separators=(",", ":"), sort_keys=True
    ).encode("utf-8")


def sha256_bytes(value: bytes) -> str:
    return hashlib.sha256(value).hexdigest()


def sha256_value(value: Any) -> str:
    return sha256_bytes(canonical_bytes(value))


def histogram(records: list[dict[str, Any]], field: str) -> dict[str, int]:
    return dict(sorted(Counter(str(record[field]) for record in records).items()))


def write_exclusive(path: Path, value: bytes) -> None:
    descriptor = os.open(path, os.O_WRONLY | os.O_CREAT | os.O_EXCL, 0o444)
    try:
        with os.fdopen(descriptor, "wb") as handle:
            handle.write(value)
            handle.flush()
            os.fsync(handle.fileno())
    except BaseException:
        try:
            path.unlink()
        except FileNotFoundError:
            pass
        raise


def materialize() -> dict[str, Any]:
    if OUTPUT_DIR.exists():
        raise FilterError(f"refusing to overwrite {OUTPUT_DIR}")
    source_bytes = SOURCE.read_bytes()
    source_manifest_bytes = SOURCE_MANIFEST.read_bytes()
    if sha256_bytes(source_bytes) != PINNED_SOURCE_SHA256:
        raise FilterError("source bank SHA-256 mismatch")
    records = structural._strict_json_lines(SOURCE)
    if len(records) != PINNED_SOURCE_COUNT:
        raise FilterError("source bank count mismatch")

    source_manifest = structural._strict_json(SOURCE_MANIFEST)
    unsigned_source_manifest = dict(source_manifest)
    claimed_manifest_hash = unsigned_source_manifest.pop("manifest_sha256", None)
    if claimed_manifest_hash != sha256_value(unsigned_source_manifest):
        raise FilterError("source manifest canonical hash does not replay")
    if (
        source_manifest.get("artifact_hashes", {}).get(
            "learned-certificates.jsonl"
        )
        != PINNED_SOURCE_SHA256
        or source_manifest.get("counts", {}).get("learned_core_count")
        != PINNED_SOURCE_COUNT
    ):
        raise FilterError("source manifest does not pin the requested bank")

    previous: str | None = None
    for index, record in enumerate(records):
        structural._validate_record_hash(
            record, previous, where=f"{SOURCE}:{index + 1}"
        )
        if (
            record.get("schema") != structural.PROJECTED_LEARNED_SCHEMA
            or record.get("index") != index
        ):
            raise FilterError(f"source learned record {index} identity mismatch")
        previous = record["record_sha256"]
    if previous != PINNED_SOURCE_CHAIN_HEAD:
        raise FilterError("source bank chain-head mismatch")

    unexpected = [
        record["origin"]
        for record in records
        if record.get("origin") not in {RETAIN_ORIGIN, EXCLUDE_ORIGIN}
    ]
    if unexpected:
        raise FilterError(f"unexpected source origins: {sorted(set(unexpected))}")
    retained = [record for record in records if record["origin"] == RETAIN_ORIGIN]
    excluded = [record for record in records if record["origin"] == EXCLUDE_ORIGIN]
    if len(retained) != EXPECTED_RETAINED or len(excluded) != EXPECTED_EXCLUDED:
        raise FilterError("filter policy count mismatch")

    output: list[dict[str, Any]] = []
    provenance_rows: list[dict[str, Any]] = []
    previous_output: str | None = None
    for output_index, record in enumerate(retained):
        source_index = int(record["index"])
        unsigned = dict(record)
        source_record_hash = unsigned.pop("record_sha256")
        unsigned.pop("previous_record_sha256")
        unsigned["index"] = output_index
        rewritten = structural._with_record_hash(unsigned, previous_output)
        structural._validate_record_hash(
            rewritten, previous_output, where=f"output record {output_index}"
        )
        output.append(rewritten)
        provenance_rows.append(
            {
                "output_index": output_index,
                "output_record_sha256": rewritten["record_sha256"],
                "source_index": source_index,
                "source_record_sha256": source_record_hash,
            }
        )
        previous_output = rewritten["record_sha256"]

    output_bytes = b"".join(canonical_bytes(record) + b"\n" for record in output)
    provenance_unsigned = {
        "schema": "p97-phase3-filtered-bootstrap-provenance-v1",
        "retained": provenance_rows,
        "excluded": [
            {
                "source_index": record["index"],
                "source_record_sha256": record["record_sha256"],
                "origin": record["origin"],
                "stage": record["stage"],
            }
            for record in excluded
        ],
    }
    provenance = {
        **provenance_unsigned,
        "provenance_payload_sha256": sha256_value(provenance_unsigned),
    }
    provenance_bytes = canonical_bytes(provenance) + b"\n"

    source_origin_histogram = histogram(records, "origin")
    source_stage_histogram = histogram(records, "stage")
    output_origin_histogram = histogram(output, "origin")
    output_stage_histogram = histogram(output, "stage")
    excluded_origin_histogram = histogram(excluded, "origin")
    excluded_stage_histogram = histogram(excluded, "stage")
    manifest_unsigned = {
        "schema": "p97-phase3-filtered-bootstrap-manifest-v1",
        "status": "AUTHENTICATED_FILTERED_BOOTSTRAP",
        "policy": {
            "retain_origin_exactly": RETAIN_ORIGIN,
            "exclude_origin_exactly": EXCLUDE_ORIGIN,
            "reason": (
                "retain the cheap structural path-membership replay and omit "
                "the expensive selected-row Kalmanson bootstrap replay"
            ),
            "semantic_claim": (
                "a reusable partial learned-clause bank only; omitted records "
                "and source search coverage are not claimed"
            ),
        },
        "source": {
            "path": str(SOURCE.relative_to(ROOT)),
            "record_count": len(records),
            "sha256": PINNED_SOURCE_SHA256,
            "record_chain_head_sha256": PINNED_SOURCE_CHAIN_HEAD,
            "manifest_path": str(SOURCE_MANIFEST.relative_to(ROOT)),
            "manifest_file_sha256": sha256_bytes(source_manifest_bytes),
            "manifest_payload_sha256": claimed_manifest_hash,
            "origin_histogram": source_origin_histogram,
            "stage_histogram": source_stage_histogram,
        },
        "output": {
            "path": "learned-certificates.jsonl",
            "record_count": len(output),
            "sha256": sha256_bytes(output_bytes),
            "record_chain_head_sha256": previous_output,
            "origin_histogram": output_origin_histogram,
            "stage_histogram": output_stage_histogram,
        },
        "excluded": {
            "record_count": len(excluded),
            "origin_histogram": excluded_origin_histogram,
            "stage_histogram": excluded_stage_histogram,
        },
        "provenance": {
            "path": "filter-provenance.json",
            "file_sha256": sha256_bytes(provenance_bytes),
            "payload_sha256": provenance["provenance_payload_sha256"],
        },
        "dependency_sha256": {
            "census/p97_search/phase3_structural_cegar.py": sha256_bytes(
                Path(structural.__file__).resolve().read_bytes()
            )
        },
    }
    manifest = {
        **manifest_unsigned,
        "manifest_payload_sha256": sha256_value(manifest_unsigned),
    }
    manifest_bytes = canonical_bytes(manifest) + b"\n"

    if SOURCE.read_bytes() != source_bytes or SOURCE_MANIFEST.read_bytes() != source_manifest_bytes:
        raise FilterError("source changed during filtering")

    staging = OUTPUT_DIR.with_name(f".{OUTPUT_DIR.name}.building-{os.getpid()}")
    staging.mkdir(mode=0o755)
    write_exclusive(staging / "learned-certificates.jsonl", output_bytes)
    write_exclusive(staging / "filter-provenance.json", provenance_bytes)
    write_exclusive(staging / "source-manifest.json", source_manifest_bytes)
    write_exclusive(staging / "manifest.json", manifest_bytes)

    reread = structural._strict_json_lines(
        staging / "learned-certificates.jsonl"
    )
    previous = None
    for index, record in enumerate(reread):
        structural._validate_record_hash(
            record, previous, where=f"published record {index}"
        )
        if record.get("index") != index or record.get("origin") != RETAIN_ORIGIN:
            raise FilterError("published record policy mismatch")
        previous = record["record_sha256"]
    if len(reread) != EXPECTED_RETAINED or previous != previous_output:
        raise FilterError("published bank replay mismatch")

    for path in sorted(staging.rglob("*"), reverse=True):
        path.chmod(0o555 if path.is_dir() else 0o444)
    staging.chmod(0o555)
    os.replace(staging, OUTPUT_DIR)
    return manifest


def main() -> int:
    try:
        manifest = materialize()
    except Exception as exc:
        print(f"cheap bootstrap materializer failed: {exc}", file=sys.stderr)
        return 1
    print(
        json.dumps(
            {
                "output_dir": str(OUTPUT_DIR),
                "source": manifest["source"],
                "output": manifest["output"],
                "excluded": manifest["excluded"],
                "manifest_payload_sha256": manifest[
                    "manifest_payload_sha256"
                ],
            },
            sort_keys=True,
        )
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
