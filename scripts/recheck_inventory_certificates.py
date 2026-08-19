#!/usr/bin/env python3
"""Tier-2a recheck of the two inventory certificates the Lean spine names.

``certificates/multi_center/reports/l2_class_inventory_certificate.json`` and
``l2_profile_class_incidence_certificate.json`` carry no polynomial payload, so
the algebraic recheck in ``scripts/recheck_algebraic_certificates.py`` does not
reach them.  They are metadata certificates over the L2 sweep census: counts,
per-class digests, a compressed incidence table, and a ``claims`` vector.  Both
are transcribed into Lean and admitted by ``native_decide``
(``lean/Erdos9796Proof/P97/MultiCenter/Certificate/ClassInventory.lean``,
``ProfileClassIncidence.lean``).

Their ``claims`` vector is all-``true`` and is computed, not literal
(``scripts/multi-center-sweep-certificate.py:301-304,510-513``).  It is NOT the
all-``False`` anti-overclaim seal used elsewhere in this repository; do not read
the two patterns the same way.

Two legs run.

Leg A -- independent, internal.  Written here, sharing no code with the writer:
a second implementation of ``key_digest``, ``single_key_sha256``,
``class_id_digest``, ``incidence_digest`` and ``id_ranges``, plus every count
and set relation the certificate states about its own contents.  Leg A
establishes that the certificate is internally coherent and that each digest is
in fact the digest of the data listed beside it.  It cannot establish that the
listed data is a correct reading of the sweep census.

Leg B -- producer replay against source.  ``build_class_report``,
``build_profile_report`` and ``build_incidence_report`` are imported from
``scripts/multi-center-sweep-certificate.py`` and re-run over
``census/multi_center/sweeps/``, then serialized the way the writer serializes
(``json.dumps(report, indent=2, sort_keys=True) + "\\n"``, writer line 520) and
compared byte for byte with the committed file.  Leg B reaches the raw inputs,
which leg A cannot; it is the producer's own code, so it corroborates rather
than independently derives.  ``main()`` is never called: it would overwrite six
committed Lean modules and four committed certificates.

Each relation records ``scope``: ``internal`` when it is settled by the
certificate's own contents, ``source`` when it needs the raw sweep files.

Exit status: 0 clean; 2 when a relation fails; 3 when the mutation control is
void; 1 on checker error.

Usage:
    uv run python scripts/recheck_inventory_certificates.py recheck \
        --repo-root . \
        --out <run-root>/artifacts/inventory-recheck.jsonl \
        --summary-out <run-root>/artifacts/inventory-recheck-summary.json
"""

from __future__ import annotations

import argparse
import copy
import hashlib
import importlib.util
import json
import os
import stat
import subprocess
import sys
import time
from collections import Counter
from pathlib import Path
from typing import Any

SCHEMA = "nonpiqd-inventory-recheck/v1"
SUMMARY_SCHEMA = "nonpiqd-inventory-recheck-summary/v1"

CLASS_SCHEMA = "multi_center_l2_class_inventory_certificate.v1"
INCIDENCE_SCHEMA = "multi_center_l2_profile_class_incidence_certificate.v1"

CLASS_CERT = "certificates/multi_center/reports/l2_class_inventory_certificate.json"
INCIDENCE_CERT = (
    "certificates/multi_center/reports/l2_profile_class_incidence_certificate.json"
)
DEFAULT_SWEEP_DIR = "census/multi_center/sweeps"
WRITER = "scripts/multi-center-sweep-certificate.py"

INTERNAL = "internal"
SOURCE = "source"

MAX_FILE_BYTES = 256 * 1024 * 1024

_WRITER_MODULE: Any = None


# --------------------------------------------------------------------------
# bounded IO
# --------------------------------------------------------------------------


def read_regular(path: Path) -> bytes:
    fd = os.open(path, os.O_RDONLY | getattr(os, "O_NOFOLLOW", 0))
    try:
        info = os.fstat(fd)
        if not stat.S_ISREG(info.st_mode):
            raise ValueError(f"{path}: not a regular file")
        if info.st_size > MAX_FILE_BYTES:
            raise ValueError(f"{path}: {info.st_size} bytes exceeds the read bound")
        with os.fdopen(fd, "rb") as handle:
            fd = -1
            return handle.read()
    finally:
        if fd >= 0:
            os.close(fd)


def _reject_duplicate_keys(pairs: list[tuple[str, Any]]) -> dict[str, Any]:
    out: dict[str, Any] = {}
    for key, value in pairs:
        if key in out:
            raise ValueError(f"duplicate JSON key {key!r}")
        out[key] = value
    return out


def load_document(path: Path) -> tuple[dict[str, Any], bytes]:
    raw = read_regular(path)
    document = json.loads(raw.decode("utf-8"), object_pairs_hook=_reject_duplicate_keys)
    if not isinstance(document, dict):
        raise TypeError(f"{path}: top level is not an object")
    return document, raw


# --------------------------------------------------------------------------
# leg A -- a second implementation of the writer's digests
# --------------------------------------------------------------------------


def key_set_digest(keys: list[str]) -> str:
    """sha256 over the distinct keys in sorted order, each followed by a newline."""
    digest = hashlib.sha256()
    for key in sorted(set(keys)):
        digest.update(key.encode("utf-8"))
        digest.update(b"\n")
    return digest.hexdigest()


def key_digest_one(key: str) -> str:
    return hashlib.sha256(key.encode("utf-8")).hexdigest()


def id_list_digest(class_ids: list[int]) -> str:
    digest = hashlib.sha256()
    for class_id in class_ids:
        digest.update(f"{class_id}\n".encode())
    return digest.hexdigest()


def incidence_table_digest(rows: list[dict[str, Any]]) -> str:
    digest = hashlib.sha256()
    for row in sorted(rows, key=lambda item: int(item["profile_id"])):
        profile_id = int(row["profile_id"])
        for class_id in row["class_ids"]:
            digest.update(f"{profile_id}\t{int(class_id)}\n".encode())
    return digest.hexdigest()


def compress_ranges(values: list[int]) -> list[dict[str, int]]:
    """Collapse an ascending id list into inclusive ``{first,last}`` runs."""
    out: list[dict[str, int]] = []
    for value in values:
        if out and value == out[-1]["last"] + 1:
            out[-1]["last"] = value
            continue
        out.append({"first": value, "last": value})
    return out


# --------------------------------------------------------------------------
# leg A -- relations
# --------------------------------------------------------------------------


def relation(name: str, scope: str, holds: bool, detail: Any = None) -> dict[str, Any]:
    return {"name": name, "scope": scope, "holds": bool(holds), "detail": detail}


def _mismatch_ids(rows: list[dict[str, Any]], key: str, predicate) -> list[Any]:
    """Ids of the first few rows failing ``predicate``; the count comes with them."""
    bad = [row.get(key) for row in rows if not predicate(row)]
    return bad[:8] if len(bad) <= 8 else bad[:8] + [f"... {len(bad)} total"]


def check_class_inventory(document: dict[str, Any]) -> list[dict[str, Any]]:
    rows = document["rows"]
    loaded = document["loaded_n_values"]
    terminal_n = document["terminal_n"]
    keys = [row["class_key"] for row in rows]
    terminal_keys = [
        row["class_key"] for row in rows if terminal_n in row["seen_n_values"]
    ]
    loaded_set = set(loaded)

    bad_recomputed = [
        row["id"]
        for row in rows
        if row["last_n"] != terminal_n
        or row["seen_count"] <= 0
        or row["first_n"] not in loaded_set
        or row["status_counts"]["UNSAT"] != 0
        or row["status_counts"]["INDETERMINATE"] != 0
    ]
    first_seen = Counter(row["first_n"] for row in rows)
    first_seen_recomputed = [{"n": n, "count": first_seen[n]} for n in loaded]

    claims = document["claims"]
    full_digest = key_set_digest(keys)
    terminal_digest = key_set_digest(terminal_keys)

    out = [
        relation(
            "class_count_matches_rows",
            INTERNAL,
            document["class_count"] == len(rows),
            {"stated": document["class_count"], "rows": len(rows)},
        ),
        relation(
            "row_ids_are_contiguous_from_zero",
            INTERNAL,
            [row["id"] for row in rows] == list(range(len(rows))),
        ),
        relation(
            "rows_are_sorted_by_class_key",
            INTERNAL,
            keys == sorted(keys),
        ),
        relation(
            "class_keys_are_distinct",
            INTERNAL,
            len(set(keys)) == len(keys),
            {"distinct": len(set(keys)), "rows": len(keys)},
        ),
        relation(
            "class_key_sha256_recomputes",
            INTERNAL,
            all(key_digest_one(r["class_key"]) == r["class_key_sha256"] for r in rows),
            _mismatch_ids(
                rows,
                "id",
                lambda r: key_digest_one(r["class_key"]) == r["class_key_sha256"],
            ),
        ),
        relation(
            "class_key_length_matches",
            INTERNAL,
            all(len(r["class_key"]) == r["class_key_length"] for r in rows),
            _mismatch_ids(
                rows, "id", lambda r: len(r["class_key"]) == r["class_key_length"]
            ),
        ),
        relation(
            "seen_count_matches_seen_n_values",
            INTERNAL,
            all(r["seen_count"] == len(r["seen_n_values"]) for r in rows),
            _mismatch_ids(
                rows, "id", lambda r: r["seen_count"] == len(r["seen_n_values"])
            ),
        ),
        relation(
            "seen_n_values_strictly_ascending",
            INTERNAL,
            all(r["seen_n_values"] == sorted(set(r["seen_n_values"])) for r in rows),
        ),
        relation(
            "first_n_and_last_n_bound_seen_n_values",
            INTERNAL,
            all(
                r["seen_n_values"]
                and r["first_n"] == r["seen_n_values"][0]
                and r["last_n"] == r["seen_n_values"][-1]
                for r in rows
            ),
        ),
        relation(
            "seen_n_values_are_loaded_n_values",
            INTERNAL,
            all(set(r["seen_n_values"]) <= loaded_set for r in rows),
        ),
        relation(
            "terminal_n_is_the_largest_loaded_n",
            INTERNAL,
            bool(loaded) and terminal_n == max(loaded),
            {"terminal_n": terminal_n, "max_loaded": max(loaded) if loaded else None},
        ),
        relation(
            "terminal_class_count_matches_rows",
            INTERNAL,
            document["terminal_class_count"] == len(set(terminal_keys)),
            {
                "stated": document["terminal_class_count"],
                "recomputed": len(set(terminal_keys)),
            },
        ),
        relation(
            "full_inventory_sha256_recomputes",
            INTERNAL,
            full_digest == document["full_inventory_sha256"],
            {"stated": document["full_inventory_sha256"], "recomputed": full_digest},
        ),
        relation(
            "terminal_inventory_sha256_recomputes",
            INTERNAL,
            terminal_digest == document["terminal_inventory_sha256"],
            {
                "stated": document["terminal_inventory_sha256"],
                "recomputed": terminal_digest,
            },
        ),
        relation(
            "first_seen_counts_recompute",
            INTERNAL,
            document["first_seen_counts"] == first_seen_recomputed,
        ),
        relation(
            "first_seen_counts_sum_to_class_count",
            INTERNAL,
            sum(entry["count"] for entry in document["first_seen_counts"])
            == document["class_count"],
        ),
        relation(
            "bad_class_rows_recompute",
            INTERNAL,
            document["bad_class_rows"] == bad_recomputed,
            {
                "stated": document["bad_class_rows"][:8],
                "recomputed": bad_recomputed[:8],
            },
        ),
        relation(
            "claim_all_classes_seen_at_terminal_n_recomputes",
            INTERNAL,
            claims["all_classes_seen_at_terminal_n"] == (not bad_recomputed),
        ),
        relation(
            "claim_all_classes_have_no_bad_status_counts_recomputes",
            INTERNAL,
            claims["all_classes_have_no_bad_status_counts"] == (not bad_recomputed),
        ),
        relation(
            "claim_terminal_inventory_equals_full_inventory_recomputes",
            INTERNAL,
            claims["terminal_inventory_equals_full_inventory"]
            == (full_digest == terminal_digest),
        ),
    ]
    return out


def check_incidence(
    document: dict[str, Any], class_document: dict[str, Any]
) -> list[dict[str, Any]]:
    rows = document["rows"]
    class_count = document["class_count"]
    claims = document["claims"]

    bad_recomputed = [
        row["profile_id"]
        for row in rows
        if row["class_count"] != row["expected_local_classes"]
        or row["class_ids"] != sorted(set(row["class_ids"]))
    ]
    digest = incidence_table_digest(rows)

    return [
        relation(
            "profile_row_count_matches_rows",
            INTERNAL,
            document["profile_row_count"] == len(rows),
            {"stated": document["profile_row_count"], "rows": len(rows)},
        ),
        relation(
            "profile_ids_are_contiguous_from_zero",
            INTERNAL,
            [row["profile_id"] for row in rows] == list(range(len(rows))),
        ),
        relation(
            "total_incidence_pairs_matches_sum",
            INTERNAL,
            document["total_incidence_pairs"]
            == sum(row["class_count"] for row in rows),
            {
                "stated": document["total_incidence_pairs"],
                "recomputed": sum(row["class_count"] for row in rows),
            },
        ),
        relation(
            "compressed_range_count_matches_sum",
            INTERNAL,
            document["compressed_range_count"]
            == sum(row["range_count"] for row in rows),
            {
                "stated": document["compressed_range_count"],
                "recomputed": sum(row["range_count"] for row in rows),
            },
        ),
        relation(
            "class_count_matches_the_class_inventory",
            INTERNAL,
            class_count == class_document["class_count"],
            {"incidence": class_count, "inventory": class_document["class_count"]},
        ),
        relation(
            "class_count_matches_class_ids",
            INTERNAL,
            all(row["class_count"] == len(row["class_ids"]) for row in rows),
            _mismatch_ids(
                rows,
                "profile_id",
                lambda r: r["class_count"] == len(r["class_ids"]),
            ),
        ),
        relation(
            "class_ids_strictly_ascending",
            INTERNAL,
            all(row["class_ids"] == sorted(set(row["class_ids"])) for row in rows),
            _mismatch_ids(
                rows,
                "profile_id",
                lambda r: r["class_ids"] == sorted(set(r["class_ids"])),
            ),
        ),
        relation(
            "class_ids_are_inside_the_class_bank",
            INTERNAL,
            all(
                all(0 <= cid < class_count for cid in row["class_ids"]) for row in rows
            ),
        ),
        relation(
            "range_count_matches_ranges",
            INTERNAL,
            all(row["range_count"] == len(row["ranges"]) for row in rows),
        ),
        relation(
            "ranges_expand_to_class_ids",
            INTERNAL,
            all(compress_ranges(row["class_ids"]) == row["ranges"] for row in rows),
            _mismatch_ids(
                rows,
                "profile_id",
                lambda r: compress_ranges(r["class_ids"]) == r["ranges"],
            ),
        ),
        relation(
            "class_ids_sha256_recomputes",
            INTERNAL,
            all(
                id_list_digest(row["class_ids"]) == row["class_ids_sha256"]
                for row in rows
            ),
            _mismatch_ids(
                rows,
                "profile_id",
                lambda r: id_list_digest(r["class_ids"]) == r["class_ids_sha256"],
            ),
        ),
        relation(
            "incidence_sha256_recomputes",
            INTERNAL,
            digest == document["incidence_sha256"],
            {"stated": document["incidence_sha256"], "recomputed": digest},
        ),
        relation(
            "expected_local_classes_matches_class_count",
            INTERNAL,
            all(row["expected_local_classes"] == row["class_count"] for row in rows),
            _mismatch_ids(
                rows,
                "profile_id",
                lambda r: r["expected_local_classes"] == r["class_count"],
            ),
        ),
        relation(
            "bad_rows_recompute",
            INTERNAL,
            document["bad_rows"] == bad_recomputed,
            {"stated": document["bad_rows"][:8], "recomputed": bad_recomputed[:8]},
        ),
        relation(
            "claim_all_profile_class_counts_match_profile_inventory_recomputes",
            INTERNAL,
            claims["all_profile_class_counts_match_profile_inventory"]
            == (not bad_recomputed),
        ),
        relation(
            "claim_all_profile_class_ids_are_unique_recomputes",
            INTERNAL,
            claims["all_profile_class_ids_are_unique"]
            == (document["duplicate_class_ids"] == 0),
        ),
        # non_sat_cells and missing_class_keys count cells that the writer
        # dropped while reading the sweeps.  A dropped cell leaves no trace in
        # the certificate, so these two accumulators are settled only by leg B.
        relation(
            "claim_all_incidence_cells_are_sat_recomputes",
            SOURCE,
            claims["all_incidence_cells_are_sat"] == (document["non_sat_cells"] == 0),
            {"non_sat_cells": document["non_sat_cells"]},
        ),
        relation(
            "claim_all_incidence_class_keys_are_in_class_bank_recomputes",
            SOURCE,
            claims["all_incidence_class_keys_are_in_class_bank"]
            == (document["missing_class_keys"] == 0),
            {"missing_class_keys": document["missing_class_keys"]},
        ),
    ]


# --------------------------------------------------------------------------
# leg B -- producer replay from the raw sweeps
# --------------------------------------------------------------------------


def load_writer(repo_root: Path) -> Any:
    global _WRITER_MODULE
    if _WRITER_MODULE is None:
        path = repo_root / WRITER
        spec = importlib.util.spec_from_file_location(
            "multi_center_sweep_certificate", path
        )
        if spec is None or spec.loader is None:
            raise RuntimeError(f"could not load {path}")
        module = importlib.util.module_from_spec(spec)
        sys.modules[spec.name] = module
        spec.loader.exec_module(module)
        _WRITER_MODULE = module
    return _WRITER_MODULE


def writer_serialization(report: dict[str, Any]) -> bytes:
    """The writer's own on-disk form (scripts/multi-center-sweep-certificate.py:520)."""
    return (json.dumps(report, indent=2, sort_keys=True) + "\n").encode("utf-8")


def producer_replay(repo_root: Path, sweep_dir: Path) -> dict[str, Any]:
    """Rebuild both reports from the raw sweeps without writing anything."""
    started = time.monotonic()
    writer = load_writer(repo_root)
    class_report = writer.build_class_report(sweep_dir)
    profile_report = writer.build_profile_report(sweep_dir)
    incidence_report = writer.build_incidence_report(
        sweep_dir, class_report, profile_report
    )
    return {
        "sweep_dir": sweep_dir.relative_to(repo_root).as_posix(),
        "seconds": round(time.monotonic() - started, 3),
        "reports": {CLASS_CERT: class_report, INCIDENCE_CERT: incidence_report},
    }


def replay_diff(rebuilt: dict[str, Any], committed_bytes: bytes) -> dict[str, Any]:
    produced = writer_serialization(rebuilt)
    if produced == committed_bytes:
        return {"byte_identical": True, "first_difference": None}
    limit = min(len(produced), len(committed_bytes))
    offset = next((i for i in range(limit) if produced[i] != committed_bytes[i]), limit)
    return {
        "byte_identical": False,
        "committed_bytes": len(committed_bytes),
        "rebuilt_bytes": len(produced),
        "first_difference": {
            "offset": offset,
            "committed": committed_bytes[offset : offset + 120].decode(
                "utf-8", "replace"
            ),
            "rebuilt": produced[offset : offset + 120].decode("utf-8", "replace"),
        },
    }


# --------------------------------------------------------------------------
# mutation control
# --------------------------------------------------------------------------


def mutation_control(
    class_document: dict[str, Any],
    incidence_document: dict[str, Any],
    replay: dict[str, Any] | None,
    committed: dict[str, bytes],
) -> dict[str, Any]:
    """Every mutant must be rejected; the run is void otherwise.

    Each mutation is applied to a deep copy in memory.  Nothing on disk is
    touched.
    """
    mutants: list[dict[str, Any]] = []

    tampered = copy.deepcopy(class_document)
    tampered["rows"][0]["class_key"] += "x"
    failed = {r["name"] for r in check_class_inventory(tampered) if not r["holds"]}
    mutants.append(
        {
            "name": "class_key_tampered",
            "target": CLASS_CERT,
            "expected_failures": [
                "class_key_sha256_recomputes",
                "class_key_length_matches",
                "full_inventory_sha256_recomputes",
            ],
            "observed_failures": sorted(failed),
            "rejected": {
                "class_key_sha256_recomputes",
                "class_key_length_matches",
                "full_inventory_sha256_recomputes",
            }
            <= failed,
        }
    )

    tampered = copy.deepcopy(incidence_document)
    tampered["total_incidence_pairs"] += 1
    failed = {
        r["name"] for r in check_incidence(tampered, class_document) if not r["holds"]
    }
    mutants.append(
        {
            "name": "total_incidence_pairs_tampered",
            "target": INCIDENCE_CERT,
            "expected_failures": ["total_incidence_pairs_matches_sum"],
            "observed_failures": sorted(failed),
            "rejected": "total_incidence_pairs_matches_sum" in failed,
        }
    )

    tampered = copy.deepcopy(incidence_document)
    tampered["rows"][0]["class_ids"] = tampered["rows"][0]["class_ids"][:-1]
    failed = {
        r["name"] for r in check_incidence(tampered, class_document) if not r["holds"]
    }
    mutants.append(
        {
            "name": "incidence_class_ids_truncated",
            "target": INCIDENCE_CERT,
            "expected_failures": [
                "incidence_sha256_recomputes",
                "class_ids_sha256_recomputes",
                "class_count_matches_class_ids",
            ],
            "observed_failures": sorted(failed),
            "rejected": {
                "incidence_sha256_recomputes",
                "class_ids_sha256_recomputes",
                "class_count_matches_class_ids",
            }
            <= failed,
        }
    )

    if replay is not None:
        rebuilt = copy.deepcopy(replay["reports"][CLASS_CERT])
        rebuilt["class_count"] += 1
        diff = replay_diff(rebuilt, committed[CLASS_CERT])
        mutants.append(
            {
                "name": "replay_class_count_tampered",
                "target": CLASS_CERT,
                "expected_failures": ["byte_identical"],
                "observed_failures": []
                if diff["byte_identical"]
                else ["byte_identical"],
                "rejected": not diff["byte_identical"],
            }
        )

    return {
        "n_mutants": len(mutants),
        "n_rejected": sum(1 for m in mutants if m["rejected"]),
        "mutants": mutants,
    }


# --------------------------------------------------------------------------
# driver
# --------------------------------------------------------------------------


def git_head(repo_root: Path) -> str | None:
    try:
        proc = subprocess.run(
            ["git", "rev-parse", "HEAD"],
            cwd=repo_root,
            capture_output=True,
            text=True,
            check=False,
        )
    except OSError:
        return None
    return proc.stdout.strip() or None


def canonical_json(value: Any) -> str:
    return json.dumps(value, sort_keys=True, indent=2, ensure_ascii=False) + "\n"


def command_recheck(args: argparse.Namespace) -> int:
    repo_root = args.repo_root.resolve()
    sweep_dir = (repo_root / args.sweep_dir).resolve()

    class_document, class_bytes = load_document(repo_root / CLASS_CERT)
    incidence_document, incidence_bytes = load_document(repo_root / INCIDENCE_CERT)
    committed = {CLASS_CERT: class_bytes, INCIDENCE_CERT: incidence_bytes}

    if class_document.get("schema") != CLASS_SCHEMA:
        raise SystemExit(
            f"{CLASS_CERT}: unexpected schema {class_document.get('schema')!r}"
        )
    if incidence_document.get("schema") != INCIDENCE_SCHEMA:
        raise SystemExit(
            f"{INCIDENCE_CERT}: unexpected schema {incidence_document.get('schema')!r}"
        )

    records = [
        {
            "schema": SCHEMA,
            "path": CLASS_CERT,
            "sha256": hashlib.sha256(class_bytes).hexdigest(),
            "record_schema": CLASS_SCHEMA,
            "declared_claims": class_document["claims"],
            "relations": check_class_inventory(class_document),
        },
        {
            "schema": SCHEMA,
            "path": INCIDENCE_CERT,
            "sha256": hashlib.sha256(incidence_bytes).hexdigest(),
            "record_schema": INCIDENCE_SCHEMA,
            "declared_claims": incidence_document["claims"],
            "relations": check_incidence(incidence_document, class_document),
        },
    ]

    replay: dict[str, Any] | None = None
    replay_note: str | None = None
    if args.producer_replay:
        if not sweep_dir.is_dir():
            replay_note = f"sweep directory absent: {args.sweep_dir}"
        else:
            replay = producer_replay(repo_root, sweep_dir)
            for record in records:
                record["producer_replay"] = replay_diff(
                    replay["reports"][record["path"]], committed[record["path"]]
                )
    else:
        replay_note = "producer replay disabled by --no-producer-replay"

    control = mutation_control(class_document, incidence_document, replay, committed)

    failures = [
        {"path": r["path"], "relation": rel["name"], "scope": rel["scope"]}
        for r in records
        for rel in r["relations"]
        if not rel["holds"]
    ]
    replay_failures = [
        r["path"]
        for r in records
        if "producer_replay" in r and not r["producer_replay"]["byte_identical"]
    ]

    summary = {
        "schema": SUMMARY_SCHEMA,
        "repo_head": git_head(repo_root),
        "certificates": [r["path"] for r in records],
        "relations": {
            "total": sum(len(r["relations"]) for r in records),
            "holding": sum(
                1 for r in records for rel in r["relations"] if rel["holds"]
            ),
            "by_scope": dict(
                sorted(
                    Counter(
                        rel["scope"] for r in records for rel in r["relations"]
                    ).items()
                )
            ),
        },
        "relation_failures": failures,
        "producer_replay": {
            "ran": replay is not None,
            "note": replay_note,
            "sweep_dir": replay["sweep_dir"] if replay else None,
            "seconds": replay["seconds"] if replay else None,
            "byte_identical": (
                []
                if replay is None
                else [
                    r["path"] for r in records if r["producer_replay"]["byte_identical"]
                ]
            ),
            "differing": replay_failures,
        },
        "mutation_control_rejects": {
            "n_mutants": control["n_mutants"],
            "n_rejected": control["n_rejected"],
        },
        "mutation_control_valid": bool(
            control["n_mutants"] > 0 and control["n_mutants"] == control["n_rejected"]
        ),
        "mutation_control_detail": control["mutants"],
    }

    if args.out is not None:
        args.out.parent.mkdir(parents=True, exist_ok=True)
        with args.out.open("w", encoding="utf-8") as handle:
            for record in records:
                handle.write(
                    json.dumps(record, sort_keys=True, ensure_ascii=False) + "\n"
                )
    if args.summary_out is not None:
        args.summary_out.parent.mkdir(parents=True, exist_ok=True)
        args.summary_out.write_text(canonical_json(summary), encoding="utf-8")

    sys.stdout.write(canonical_json(summary))

    if not summary["mutation_control_valid"]:
        sys.stderr.write("mutation control void: the run establishes nothing\n")
        return 3
    if failures or replay_failures:
        return 2
    return 0


def parse_args(argv: list[str]) -> argparse.Namespace:
    parser = argparse.ArgumentParser(description=__doc__)
    sub = parser.add_subparsers(dest="command", required=True)

    recheck = sub.add_parser("recheck", help="Recheck both inventory certificates.")
    recheck.add_argument("--repo-root", type=Path, default=Path("."))
    recheck.add_argument("--sweep-dir", default=DEFAULT_SWEEP_DIR)
    recheck.add_argument(
        "--no-producer-replay",
        dest="producer_replay",
        action="store_false",
        help="Skip leg B; leg A relations still run.",
    )
    recheck.add_argument("--out", type=Path)
    recheck.add_argument("--summary-out", type=Path)
    recheck.set_defaults(func=command_recheck, producer_replay=True)

    return parser.parse_args(argv)


def main(argv: list[str]) -> int:
    args = parse_args(argv)
    return int(args.func(args))


if __name__ == "__main__":
    raise SystemExit(main(sys.argv[1:]))
