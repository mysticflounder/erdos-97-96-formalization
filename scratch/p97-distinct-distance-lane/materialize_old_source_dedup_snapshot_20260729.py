#!/usr/bin/env python3
"""Freeze, authenticate, replay, deduplicate, and rechain old Phase-3 survivors.

This materializer is intentionally read-only with respect to the 24 source
journals.  It accepts only a manifest-authenticated stable boundary, copies the
exact raw inputs, replays every survivor through the current source tree, and
publishes a single legacy-schema chain for the standalone shared-pair checker.
It does not claim exhaustive Phase-3 coverage.
"""

from __future__ import annotations

import hashlib
import json
import os
import shutil
import sys
from collections.abc import Mapping
from pathlib import Path
from typing import Any

ROOT = Path(__file__).resolve().parents[2]
if str(ROOT) not in sys.path:
    sys.path.insert(0, str(ROOT))

from census.p97_search import phase3_shared_pair_separation as separation  # noqa: E402
from census.p97_search import phase3_structural_cegar as structural  # noqa: E402

LANE = ROOT / "scratch/p97-distinct-distance-lane"
V1E = LANE / "phase3_projected_static_v2_shell_exact_depth5_v1e_20260729"
LEGACY = LANE / "phase3_sixcut_depth4_shards_v1_20260729"
OUTPUT = LANE / "phase3_old_source_dedup_snapshot_20260729"

SOURCE_SPECS = tuple(
    (f"v1e-shard-{index:02d}", V1E / f"shard-{index:02d}", True)
    for index in range(20)
) + tuple(
    (f"legacy-depth4-shard-{index:02d}", LEGACY / f"shard-{index:02d}", False)
    for index in (0, 2, 4, 8)
)


class SnapshotError(RuntimeError):
    """An input authentication, current replay, or publication failure."""


def canonical_bytes(value: Any) -> bytes:
    return json.dumps(
        value, allow_nan=False, separators=(",", ":"), sort_keys=True
    ).encode("utf-8")


def sha256_bytes(value: bytes) -> str:
    return hashlib.sha256(value).hexdigest()


def sha256_value(value: Any) -> str:
    return sha256_bytes(canonical_bytes(value))


def strict_object(pairs: list[tuple[str, Any]]) -> dict[str, Any]:
    result: dict[str, Any] = {}
    for key, value in pairs:
        if key in result:
            raise SnapshotError(f"duplicate JSON key: {key}")
        result[key] = value
    return result


def strict_json_bytes(value: bytes, *, where: str) -> dict[str, Any]:
    try:
        parsed = json.loads(value, object_pairs_hook=strict_object)
    except (UnicodeDecodeError, json.JSONDecodeError) as exc:
        raise SnapshotError(f"{where}: malformed JSON") from exc
    if not isinstance(parsed, dict):
        raise SnapshotError(f"{where}: expected JSON object")
    return parsed


def strict_jsonl_bytes(value: bytes, *, where: str) -> list[dict[str, Any]]:
    if value and not value.endswith(b"\n"):
        raise SnapshotError(f"{where}: live boundary does not end at a full line")
    records: list[dict[str, Any]] = []
    for line_number, line in enumerate(value.splitlines(), start=1):
        records.append(
            strict_json_bytes(line, where=f"{where}:{line_number}")
        )
    return records


def manifest_payload_hash(manifest: Mapping[str, Any]) -> str:
    unsigned = dict(manifest)
    claimed = unsigned.pop("manifest_sha256", None)
    replayed = sha256_value(unsigned)
    if claimed != replayed:
        raise SnapshotError("source manifest canonical hash does not replay")
    return replayed


def cap_facts(record: Mapping[str, Any]) -> tuple[tuple[int, int], ...]:
    return separation._cap_facts(record.get("semantic_assignment"))


def replay_record(
    record: Mapping[str, Any],
    *,
    source_id: str,
    source_index: int,
    previous: str | None,
    projected: bool,
) -> tuple[dict[str, Any], tuple[tuple[int, int], ...]]:
    where = f"{source_id}:{source_index + 1}"
    structural._validate_record_hash(record, previous, where=where)
    expected_schema = (
        structural.PROJECTED_SURVIVOR_SCHEMA
        if projected
        else structural.SURVIVOR_SCHEMA
    )
    if (
        record.get("schema") != expected_schema
        or record.get("classification") != "STRUCTURALLY_UNRESOLVED"
        or record.get("index") != source_index
    ):
        raise SnapshotError(f"{where}: survivor identity mismatch")

    encoding = structural._phase3_encoding(projected_static_v2=projected)
    assignment = encoding.assignment_from_record(record)
    decoded = encoding.decode(assignment)
    encoding.validate(decoded, assignment)
    semantic = encoding.semantic_record(assignment)
    rows = structural._metric_rows(decoded)
    rows_json = [row.as_dict() for row in rows]
    blocking_clause = list(encoding.blocking_clause(assignment))
    structural._clause_false(blocking_clause, assignment)
    if (
        record.get("semantic_assignment") != semantic
        or record.get("assignment_sha256")
        != structural._assignment_hash(encoding, assignment)
        or record.get("metric_rows") != rows_json
        or record.get("metric_rows_sha256") != sha256_value(rows_json)
        or record.get("blocking_clause") != blocking_clause
    ):
        raise SnapshotError(f"{where}: current-source replay mismatch")
    return dict(record), cap_facts(record)


def normalized_record(
    source: Mapping[str, Any],
    *,
    index: int,
    previous: str | None,
) -> dict[str, Any]:
    unsigned = {
        "schema": separation.SURVIVOR_SCHEMA,
        "index": index,
        "raw_sat_index": source["raw_sat_index"],
        "classification": "STRUCTURALLY_UNRESOLVED",
        "semantic_assignment": source["semantic_assignment"],
        "assignment_sha256": source["assignment_sha256"],
        "metric_rows": source["metric_rows"],
        "metric_rows_sha256": source["metric_rows_sha256"],
        "blocking_clause": source["blocking_clause"],
        "trust": (
            "authenticated old-source survivor replayed under the current "
            "encoding; deduplicated only for shared-pair separation replay"
        ),
        "previous_record_sha256": previous,
    }
    return {**unsigned, "record_sha256": sha256_value(unsigned)}


def write_exclusive(path: Path, value: bytes) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
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
    if OUTPUT.exists():
        raise SnapshotError(f"refusing to overwrite {OUTPUT}")
    staging = OUTPUT.with_name(f".{OUTPUT.name}.building-{os.getpid()}")
    staging.mkdir(mode=0o755)

    source_captures: list[dict[str, Any]] = []
    replayed: list[tuple[dict[str, Any], tuple[tuple[int, int], ...], str]] = []
    initial_bytes: dict[Path, bytes] = {}
    try:
        for order, (source_id, directory, projected) in enumerate(SOURCE_SPECS):
            manifest_path = directory / "manifest.json"
            survivors_path = directory / "survivors.jsonl"
            manifest_bytes = manifest_path.read_bytes()
            survivors_bytes = survivors_path.read_bytes()
            initial_bytes[manifest_path] = manifest_bytes
            initial_bytes[survivors_path] = survivors_bytes
            manifest = strict_json_bytes(
                manifest_bytes, where=str(manifest_path)
            )
            manifest_hash = manifest_payload_hash(manifest)
            expected_count = manifest.get("counts", {}).get(
                "structural_survivor_count"
            )
            expected_hash = manifest.get("artifact_hashes", {}).get(
                "survivors.jsonl"
            )
            records = strict_jsonl_bytes(
                survivors_bytes, where=str(survivors_path)
            )
            actual_hash = sha256_bytes(survivors_bytes)
            if expected_count != len(records) or expected_hash != actual_hash:
                raise SnapshotError(
                    f"{source_id}: manifest/file boundary mismatch"
                )

            previous: str | None = None
            for source_index, record in enumerate(records):
                replayed_record, facts = replay_record(
                    record,
                    source_id=source_id,
                    source_index=source_index,
                    previous=previous,
                    projected=projected,
                )
                previous = str(record["record_sha256"])
                replayed.append((replayed_record, facts, source_id))

            raw_dir = staging / "raw-sources" / source_id
            write_exclusive(raw_dir / "manifest.json", manifest_bytes)
            write_exclusive(raw_dir / "survivors.jsonl", survivors_bytes)
            source_captures.append(
                {
                    "order": order,
                    "source_id": source_id,
                    "source_directory": str(directory.relative_to(ROOT)),
                    "projected_static_v2": projected,
                    "status": manifest.get("status"),
                    "survivor_schema": (
                        structural.PROJECTED_SURVIVOR_SCHEMA
                        if projected
                        else structural.SURVIVOR_SCHEMA
                    ),
                    "survivor_count": len(records),
                    "survivors_sha256": actual_hash,
                    "record_chain_head_sha256": previous,
                    "source_manifest_file_sha256": sha256_bytes(manifest_bytes),
                    "source_manifest_payload_sha256": manifest_hash,
                }
            )

        # A source process may append only after updating both artifacts.  The
        # stopped boundary must nevertheless remain byte-for-byte fixed during
        # this complete replay and copy.
        for path, captured in initial_bytes.items():
            if path.read_bytes() != captured:
                raise SnapshotError(f"source changed during snapshot: {path}")

        groups: dict[str, dict[str, Any]] = {}
        group_order: list[str] = []
        for raw_index, (record, facts, source_id) in enumerate(replayed):
            identity = {
                "metric_rows_sha256": record["metric_rows_sha256"],
                "cap_facts": [list(fact) for fact in facts],
            }
            key = sha256_value(identity)
            if key not in groups:
                groups[key] = {
                    "identity": identity,
                    "representative": record,
                    "origins": [],
                }
                group_order.append(key)
            group = groups[key]
            if (
                group["representative"]["metric_rows"] != record["metric_rows"]
                or group["identity"] != identity
            ):
                raise SnapshotError("deduplication identity collision")
            group["origins"].append(
                {
                    "raw_snapshot_index": raw_index,
                    "source_id": source_id,
                    "source_index": record["index"],
                    "source_record_sha256": record["record_sha256"],
                    "source_assignment_sha256": record["assignment_sha256"],
                }
            )

        output_records: list[dict[str, Any]] = []
        dedup_groups: list[dict[str, Any]] = []
        previous_output: str | None = None
        for output_index, key in enumerate(group_order):
            group = groups[key]
            output = normalized_record(
                group["representative"],
                index=output_index,
                previous=previous_output,
            )
            separation._validate_source_record(output, previous_output)
            output_records.append(output)
            previous_output = output["record_sha256"]
            dedup_groups.append(
                {
                    "output_index": output_index,
                    "output_record_sha256": output["record_sha256"],
                    "dedup_identity_sha256": key,
                    "multiplicity": len(group["origins"]),
                    "origins": group["origins"],
                }
            )

        survivors_bytes = b"".join(
            canonical_bytes(record) + b"\n" for record in output_records
        )
        provenance_unsigned = {
            "schema": "p97-phase3-old-source-dedup-provenance-v1",
            "source_order": source_captures,
            "deduplication_identity": (
                "canonical pair of metric_rows_sha256 and the seven cap facts "
                "f[label,cap] for labels 3..9"
            ),
            "groups": dedup_groups,
        }
        provenance = {
            **provenance_unsigned,
            "provenance_sha256": sha256_value(provenance_unsigned),
        }
        provenance_bytes = canonical_bytes(provenance) + b"\n"
        write_exclusive(
            staging / "survivors-deduplicated-current-source.jsonl",
            survivors_bytes,
        )
        write_exclusive(
            staging / "dedup-provenance.json", provenance_bytes
        )

        dependency_paths = (
            Path("census/p97_search/phase3_structural_cegar.py"),
            Path("census/p97_search/sat_generate.py"),
            Path("census/p97_search/phase3_shared_pair_separation.py"),
        )
        dependencies = {
            str(path): sha256_bytes((ROOT / path).read_bytes())
            for path in dependency_paths
        }
        manifest_unsigned = {
            "schema": "p97-phase3-old-source-dedup-snapshot-v1",
            "status": "FIXED_PARTIAL_SNAPSHOT",
            "scope": (
                "the exact authenticated stopped boundary of 20 depth-5 v1e "
                "journals and four legacy depth-4 journals; not exhaustive "
                "Phase-3 coverage"
            ),
            "counts": {
                "source_journal_count": len(SOURCE_SPECS),
                "raw_source_record_count": len(replayed),
                "current_source_replayed_record_count": len(replayed),
                "deduplicated_current_source_record_count": len(output_records),
                "duplicate_occurrence_count": len(replayed) - len(output_records),
            },
            "sources": source_captures,
            "artifacts": {
                "survivors-deduplicated-current-source.jsonl": {
                    "count": len(output_records),
                    "sha256": sha256_bytes(survivors_bytes),
                    "record_chain_head_sha256": previous_output,
                },
                "dedup-provenance.json": {
                    "sha256": sha256_bytes(provenance_bytes),
                    "provenance_payload_sha256": provenance[
                        "provenance_sha256"
                    ],
                },
            },
            "current_dependency_sha256": dependencies,
            "trust_boundary": {
                "source": (
                    "each copied journal is pinned by its canonical source "
                    "manifest, full-file SHA-256, record count, and record chain"
                ),
                "current_source": (
                    "every raw record is decoded and reconstructed with the "
                    "current source encoding matching its original mode"
                ),
                "deduplication": (
                    "only rows and cap facts consumed by shared-pair separation "
                    "define equality; every occurrence remains in provenance"
                ),
                "separation": (
                    "not run by this materializer; invoke the standalone "
                    "replayer on the published normalized chain"
                ),
                "lean": "NOT_LANDED",
            },
        }
        manifest = {
            **manifest_unsigned,
            "manifest_payload_sha256": sha256_value(manifest_unsigned),
        }
        manifest_bytes = canonical_bytes(manifest) + b"\n"
        write_exclusive(staging / "manifest.json", manifest_bytes)

        # Replay publication bytes before making the snapshot visible.
        reread = strict_jsonl_bytes(
            (staging / "survivors-deduplicated-current-source.jsonl").read_bytes(),
            where="published deduplicated survivors",
        )
        previous = None
        for record in reread:
            separation._validate_source_record(record, previous)
            previous = record["record_sha256"]
        if len(reread) != len(output_records) or previous != previous_output:
            raise SnapshotError("published deduplicated chain replay mismatch")

        for path in sorted(staging.rglob("*"), reverse=True):
            path.chmod(0o555 if path.is_dir() else 0o444)
        staging.chmod(0o555)
        os.replace(staging, OUTPUT)
        return manifest
    except BaseException:
        # Preserve failed staging for forensic inspection.
        raise


def main() -> int:
    try:
        manifest = materialize()
    except Exception as exc:
        print(f"old-source snapshot materializer failed: {exc}", file=sys.stderr)
        return 1
    print(
        json.dumps(
            {
                "output": str(OUTPUT),
                "counts": manifest["counts"],
                "artifacts": manifest["artifacts"],
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
