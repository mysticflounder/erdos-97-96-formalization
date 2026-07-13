#!/usr/bin/env python3
"""Generation-check and rank remotely shrunk Census-554 candidates.

The audit is read-only with respect to the bank and shared queue.  It verifies
the shrink artifact's hashes, requires its frozen bank generation to equal the
current bank, reconstructs the authoritative iteration's queued certificate
patterns from jobs/done/results, and reports canonical overlap plus candidates
that are stronger (smaller) than a queued pattern.  It never certifies or
publishes a pattern.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import os
import sys
from pathlib import Path


HERE = Path(__file__).resolve().parent
REPO_ROOT = HERE.parent.parent
sys.path.insert(0, str(HERE))
sys.path.insert(0, str(REPO_ROOT))

import miner  # noqa: E402
from census.census_554.io_protocol import atomic_write_json  # noqa: E402


SCHEMA = "census554_prefetch_candidate_audit.v1"
SHRINK_SCHEMA = "census554_prefetch_greedy_shrink.v1"


def _file_sha256(path: Path) -> str:
    digest = hashlib.sha256()
    with path.open("rb") as handle:
        for chunk in iter(lambda: handle.read(1024 * 1024), b""):
            digest.update(chunk)
    return digest.hexdigest()


def _native(value):
    return {
        int(center): frozenset(int(member) for member in members)
        for center, members in value.items()
    }


def _pattern_json(pattern):
    return {
        str(center): sorted(int(member) for member in members)
        for center, members in sorted(pattern.items())
    }


def _pattern_list_sha(patterns) -> str:
    raw = json.dumps(
        [_pattern_json(pattern) for pattern in patterns],
        sort_keys=True,
        separators=(",", ":"),
    ).encode("ascii")
    return hashlib.sha256(raw).hexdigest()


def _canonical_sha(pattern) -> str:
    raw = json.dumps(
        miner.canon_key(pattern), separators=(",", ":")
    ).encode("ascii")
    return hashlib.sha256(raw).hexdigest()


def _load_bank(path: Path):
    rows = []
    with path.open(encoding="utf-8") as handle:
        for line_number, line in enumerate(handle, 1):
            if not line.strip():
                continue
            try:
                row = json.loads(line)
                rows.append(_native(row["pattern"]))
            except (json.JSONDecodeError, KeyError, TypeError, ValueError) as exc:
                raise ValueError(f"invalid bank row {line_number}: {exc}") from exc
    return rows


def _queue_payloads(queue_root: Path, prefix: str):
    payloads = {}
    locations = {}
    for area in ("jobs", "done", "results"):
        directory = queue_root / area
        try:
            names = os.listdir(directory)
        except OSError:
            continue
        for name in sorted(names):
            if name.startswith(".") or not name.startswith(prefix):
                continue
            stem = name
            if stem.endswith(".claimed"):
                stem = stem[:-len(".claimed")]
            if not stem.endswith(".json"):
                continue
            stem = stem[:-len(".json")]
            path = directory / name
            try:
                value = json.loads(path.read_text(encoding="utf-8"))
            except (OSError, UnicodeDecodeError, json.JSONDecodeError):
                continue
            if area == "results":
                value = value.get("pattern") if isinstance(value, dict) else None
            elif isinstance(value, dict) and value.get("type") == "certify":
                value = value.get("pattern")
            if not isinstance(value, dict):
                continue
            pattern = _native(value)
            key = miner.canon_key(pattern)
            payloads.setdefault(key, pattern)
            locations.setdefault(key, []).append(f"{area}/{name}")
    return payloads, locations


def _strengthens(candidate, queued_patterns):
    hits = set()
    for image in miner.orbit(candidate):
        for index, queued in enumerate(queued_patterns):
            if miner.instance_subsumes(image, queued):
                hits.add(index)
    return sorted(hits)


def main(argv=None) -> int:
    parser = argparse.ArgumentParser(description=__doc__.splitlines()[0])
    parser.add_argument("--shrunk", type=Path, required=True)
    parser.add_argument("--bank", type=Path, required=True)
    parser.add_argument("--queue-root", type=Path, required=True)
    parser.add_argument("--iteration", type=int, required=True)
    parser.add_argument("--output", type=Path, required=True)
    args = parser.parse_args(argv)
    if args.output.exists():
        parser.error(f"refusing to overwrite {args.output}")

    shrink = json.loads(args.shrunk.read_text(encoding="utf-8"))
    if shrink.get("schema") != SHRINK_SCHEMA or shrink.get("status") != "complete":
        parser.error("shrink artifact is not complete")
    patterns = [_native(value) for value in shrink["shrunk_patterns"]]
    computed_pattern_sha = _pattern_list_sha(patterns)
    if computed_pattern_sha != shrink.get("shrunk_patterns_sha256"):
        parser.error("shrunk pattern inventory hash mismatch")

    bank_sha256 = _file_sha256(args.bank)
    bank_patterns = _load_bank(args.bank)
    if (
        bank_sha256 != shrink.get("bank_sha256")
        or len(bank_patterns) != int(shrink.get("bank_rows", -1))
    ):
        parser.error("live bank generation differs from shrink artifact")
    bank_keys = {miner.canon_key(pattern) for pattern in bank_patterns}

    prefix = f"cert-i{args.iteration:04d}-"
    queued_by_key, locations = _queue_payloads(args.queue_root, prefix)
    queued_patterns = [queued_by_key[key] for key in sorted(queued_by_key)]
    queued_index = {
        key: index for index, key in enumerate(sorted(queued_by_key))
    }

    records = []
    exact_bank = exact_queue = stronger = 0
    for pattern in patterns:
        key = miner.canon_key(pattern)
        strengthens = _strengthens(pattern, queued_patterns)
        record = {
            "canonical_sha256": _canonical_sha(pattern),
            "pattern": _pattern_json(pattern),
            "centers": len(pattern),
            "generators": miner.n_gens(pattern),
            "support_points": len(miner.pattern_points(pattern)),
            "orbit_size": len(miner.orbit(pattern)),
            "exact_bank_duplicate": key in bank_keys,
            "exact_queue_duplicate": key in queued_by_key,
            "strengthens_queue_indices": strengthens,
        }
        exact_bank += int(record["exact_bank_duplicate"])
        exact_queue += int(record["exact_queue_duplicate"])
        stronger += int(bool(strengthens))
        records.append(record)
    records.sort(key=lambda record: (
        not bool(record["strengthens_queue_indices"]),
        record["generators"],
        record["centers"],
        record["support_points"],
        record["canonical_sha256"],
    ))
    for rank, record in enumerate(records, 1):
        record["rank"] = rank

    queue_records = []
    for key in sorted(queued_by_key):
        queue_records.append({
            "index": queued_index[key],
            "canonical_sha256": _canonical_sha(queued_by_key[key]),
            "pattern": _pattern_json(queued_by_key[key]),
            "locations": sorted(locations[key]),
        })

    output = {
        "schema": SCHEMA,
        "status": "complete",
        "iteration": args.iteration,
        "generation": {
            "bank_rows": len(bank_patterns),
            "bank_sha256": bank_sha256,
            "shrunk_artifact": str(args.shrunk),
            "shrunk_artifact_sha256": _file_sha256(args.shrunk),
            "shrunk_patterns_sha256": computed_pattern_sha,
        },
        "counts": {
            "shrunk_candidates": len(patterns),
            "queued_canonical_patterns_found": len(queued_patterns),
            "exact_bank_duplicates": exact_bank,
            "exact_queue_duplicates": exact_queue,
            "candidates_strengthening_a_queue_pattern": stronger,
        },
        "queued_patterns": queue_records,
        "ranked_candidates": records,
        "trust": (
            "generation and canonical-overlap audit only; remote deadness is "
            "heuristic and every selected candidate still requires exact "
            "certification before authoritative publication"
        ),
    }
    atomic_write_json(args.output, output)
    print(json.dumps(output["counts"], sort_keys=True), flush=True)
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
