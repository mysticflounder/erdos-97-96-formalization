"""Read-only P10A proof-core/schema miner for authenticated learned journals."""

from __future__ import annotations

import argparse
import hashlib
import json
import os
import sys
import tempfile
from pathlib import Path
from typing import Any

ROOT = Path(__file__).resolve().parents[2]
sys.path.insert(0, str(ROOT))

from census.p97_search import phase3_productivity as productivity


def _object_without_duplicate_keys(
    pairs: list[tuple[str, Any]],
) -> dict[str, Any]:
    result: dict[str, Any] = {}
    for key, value in pairs:
        if key in result:
            raise productivity.ProductivityError(f"duplicate JSON key {key!r}")
        result[key] = value
    return result


def _load_jsonl(path: Path) -> tuple[list[dict[str, Any]], str]:
    if not path.is_file():
        raise productivity.ProductivityError(f"missing source journal {path}")
    digest = hashlib.sha256()
    records: list[dict[str, Any]] = []
    with path.open("rb") as handle:
        for line_number, raw in enumerate(handle, start=1):
            digest.update(raw)
            if not raw.endswith(b"\n"):
                raise productivity.ProductivityError(
                    f"{path}:{line_number}: truncated JSONL line"
                )
            payload = raw[:-1]
            if not payload.strip():
                raise productivity.ProductivityError(
                    f"{path}:{line_number}: blank JSONL line"
                )
            try:
                value = json.loads(
                    payload,
                    parse_constant=lambda token: (_ for _ in ()).throw(
                        ValueError(f"invalid JSON constant {token}")
                    ),
                    object_pairs_hook=_object_without_duplicate_keys,
                )
            except (UnicodeDecodeError, json.JSONDecodeError, ValueError) as exc:
                raise productivity.ProductivityError(
                    f"{path}:{line_number}: invalid JSON: {exc}"
                ) from exc
            if not isinstance(value, dict):
                raise productivity.ProductivityError(
                    f"{path}:{line_number}: expected JSON object"
                )
            records.append(value)
    productivity.validate_authenticated_chain(records)
    return records, digest.hexdigest()


def _atomic_write(path: Path, data: bytes) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    fd, temporary = tempfile.mkstemp(
        prefix=f".{path.name}.", suffix=".tmp", dir=path.parent
    )
    try:
        with os.fdopen(fd, "wb") as handle:
            handle.write(data)
            handle.flush()
            os.fsync(handle.fileno())
        os.replace(temporary, path)
        directory_fd = os.open(path.parent, os.O_RDONLY)
        try:
            os.fsync(directory_fd)
        finally:
            os.close(directory_fd)
    except BaseException:
        try:
            os.unlink(temporary)
        except FileNotFoundError:
            pass
        raise


def mine_file(
    source: Path,
    output: Path,
    *,
    max_parents: int = 256,
) -> dict[str, Any]:
    records, source_sha256 = _load_jsonl(source)
    report = productivity.mine_records(
        records,
        source_file_sha256=source_sha256,
        max_parents=max_parents,
    )
    _atomic_write(output, productivity.canonical_bytes(report) + b"\n")
    return report


def _parse_args(argv: list[str] | None = None) -> argparse.Namespace:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--journal", type=Path, required=True)
    parser.add_argument("--out", type=Path, required=True)
    parser.add_argument("--max-parents", type=int, default=256)
    args = parser.parse_args(argv)
    if args.max_parents <= 0:
        parser.error("--max-parents must be positive")
    return args


def main(argv: list[str] | None = None) -> int:
    args = _parse_args(argv)
    report = mine_file(
        args.journal,
        args.out,
        max_parents=args.max_parents,
    )
    print(
        json.dumps(
            {
                "schema": report["schema"],
                "status": report["status"],
                "ingress": report["ingress"],
                "source": report["source"],
                "repeated_core_group_count": len(report["repeated_core_groups"]),
                "report_sha256": report["report_sha256"],
                "out": str(args.out),
            },
            sort_keys=True,
        )
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
