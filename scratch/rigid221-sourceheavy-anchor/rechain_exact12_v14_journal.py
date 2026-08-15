"""Re-chain an authenticated exact-12 v14 journal under the current detector.

This is a checkpoint migration helper, not a proof artifact.  It first
authenticates the complete input chain, rewrites only detector/chain metadata,
and then invokes the production replay gate on the complete candidate output.
The candidate is published atomically only after current-source replay passes.
"""

from __future__ import annotations

import argparse
import json
import os
from collections.abc import Mapping
from pathlib import Path
from typing import Any

from census.card_head.exact12_v14_bound_jobs import (
    build_bound_job,
    instantiate_validated_bound_job,
)
from census.card_head.exact12_v14_schedule import build_manifest, json_sha256
from census.card_head.exact12_v14_structural_cegar import (
    DETECTOR_CONTRACT,
    RECORD_SCHEMA,
    _canonical_json_bytes,
    _detector_manifest,
    _json_object_without_duplicates,
    _sha256_json,
    replay_journal,
)


class RechainError(ValueError):
    """The input chain or migrated replay failed."""


def _strict_record(raw: bytes, line_number: int) -> dict[str, Any]:
    if not raw.endswith(b"\n"):
        raise RechainError(f"input line {line_number} is not newline terminated")
    try:
        record = json.loads(
            raw,
            object_pairs_hook=_json_object_without_duplicates,
            parse_constant=lambda value: (_ for _ in ()).throw(
                ValueError(f"invalid JSON constant {value}")
            ),
        )
    except (json.JSONDecodeError, ValueError) as exc:
        raise RechainError(f"input line {line_number} is not strict JSON") from exc
    if not isinstance(record, Mapping):
        raise RechainError(f"input line {line_number} is not an object")
    return dict(record)


def rechain(repo_root: Path, source: Path, output: Path, cell_index: int) -> None:
    if output.exists():
        raise RechainError("refusing to overwrite an existing output journal")
    schedule = build_manifest(repo_root)
    job = build_bound_job(schedule, repo_root, cell_index)
    job_sha256 = json_sha256(job)
    materialized = instantiate_validated_bound_job(job, schedule, repo_root)
    detector_manifest = _detector_manifest(repo_root)
    detector_sha256 = _sha256_json(detector_manifest)

    candidate = output.with_suffix(output.suffix + ".candidate")
    if candidate.exists():
        raise RechainError("refusing to overwrite an existing candidate journal")

    old_parent = job_sha256
    old_detector_sha256: str | None = None
    new_parent = job_sha256
    count = 0
    try:
        with source.open("rb") as input_handle, candidate.open("xb") as output_handle:
            for line_number, raw in enumerate(input_handle, 1):
                record = _strict_record(raw, line_number)
                body = dict(record)
                record_sha256 = body.pop("record_sha256", None)
                if old_detector_sha256 is None:
                    value = record.get("detector_contract_sha256")
                    if not isinstance(value, str):
                        raise RechainError("input detector hash is malformed")
                    old_detector_sha256 = value
                if (
                    record.get("schema") != RECORD_SCHEMA
                    or record.get("index") != count
                    or record.get("parent_sha256") != old_parent
                    or record.get("job_sha256") != job_sha256
                    or record.get("detector_contract_sha256")
                    != old_detector_sha256
                    or record.get("cell_index") != cell_index
                    or record.get("detector_contract") != DETECTOR_CONTRACT
                    or record_sha256 != _sha256_json(body)
                ):
                    raise RechainError(
                        f"input line {line_number} failed old-chain authentication"
                    )
                old_parent = record_sha256
                record["parent_sha256"] = new_parent
                record["detector_contract_sha256"] = detector_sha256
                new_body = dict(record)
                new_body.pop("record_sha256")
                new_record_sha256 = _sha256_json(new_body)
                record["record_sha256"] = new_record_sha256
                output_handle.write(_canonical_json_bytes(record) + b"\n")
                new_parent = new_record_sha256
                count += 1
            output_handle.flush()
            os.fsync(output_handle.fileno())

        replay_count, replay_parent, _ = replay_journal(
            repo_root,
            materialized.instance,
            candidate,
            job_sha256=job_sha256,
            detector_contract_sha256=detector_sha256,
            cell_index=cell_index,
        )
        if replay_count != count or replay_parent != new_parent:
            raise RechainError("current-source replay did not reproduce migrated chain")
        os.replace(candidate, output)
        print(
            json.dumps(
                {
                    "records": count,
                    "old_terminal_record_sha256": old_parent,
                    "new_terminal_record_sha256": new_parent,
                    "old_detector_contract_sha256": old_detector_sha256,
                    "new_detector_contract_sha256": detector_sha256,
                    "output": str(output),
                    "current_source_replayed": True,
                },
                sort_keys=True,
            )
        )
    except Exception:
        candidate.unlink(missing_ok=True)
        raise


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--repo-root", type=Path, required=True)
    parser.add_argument("--source", type=Path, required=True)
    parser.add_argument("--output", type=Path, required=True)
    parser.add_argument("--cell-index", type=int, required=True)
    args = parser.parse_args()
    rechain(
        args.repo_root.resolve(),
        args.source.resolve(),
        args.output.resolve(),
        args.cell_index,
    )


if __name__ == "__main__":
    main()
