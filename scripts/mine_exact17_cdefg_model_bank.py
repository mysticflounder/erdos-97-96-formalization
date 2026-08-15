"""Run the formalized obstruction bank on a decoded exact-17 PIQD model."""

from __future__ import annotations

import argparse
import hashlib
import json
import os
import sys
import uuid
from pathlib import Path
from typing import Any

REPO = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(REPO))

from census.atail_force import producer_bank

# The production child-31 lane is deliberately pinned to the PIQD response
# identity.  Older analysis files remain usable as diagnostic inputs only.
PINNED_CNF_SHA256 = "3c847c1ebcacf85256b65d54563584a8b89eb50f427fe268e2f916d4cdafa204"
PINNED_MODEL_SHA256 = "21b1ff04c42920daf9db259dda3ce966b82164ef64d3e2f1d3fa90538f280791"
PINNED_JOB_ID = "53044c24-da6c-4fdd-9f50-f4f539891383"

ORDERS = (
    (0, 6, 8, 11, 10, 9, 12, 7, 2, 15, 16, 3, 4, 5, 1, 13, 14),
    (0, 6, 8, 11, 10, 12, 9, 7, 2, 15, 16, 3, 4, 5, 1, 13, 14),
)


def reject_duplicate_keys(pairs: list[tuple[str, Any]]) -> dict[str, Any]:
    result: dict[str, Any] = {}
    for key, value in pairs:
        if key in result:
            raise ValueError(f"duplicate JSON key: {key}")
        result[key] = value
    return result


def load_json(path: Path) -> dict[str, Any]:
    """Load one immutable byte snapshot, rejecting ambiguous JSON."""

    data = path.read_bytes()
    value = json.loads(data.decode("utf-8"), object_pairs_hook=reject_duplicate_keys)
    if not isinstance(value, dict):
        raise TypeError("analysis must be a JSON object")
    return value


def sha256_file(path: Path) -> str:
    digest = hashlib.sha256()
    with path.open("rb") as handle:
        for block in iter(lambda: handle.read(1024 * 1024), b""):
            digest.update(block)
    return digest.hexdigest()


def sha256_json(path: Path) -> tuple[dict[str, Any], str]:
    """Return JSON and its digest from the same bytes (no TOCTOU split)."""

    data = path.read_bytes()
    value = json.loads(data.decode("utf-8"), object_pairs_hook=reject_duplicate_keys)
    if not isinstance(value, dict):
        raise TypeError("analysis must be a JSON object")
    return value, hashlib.sha256(data).hexdigest()


def atomic_write(path: Path, content: bytes) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    temporary = path.with_name(f".{path.name}.tmp.{os.getpid()}.{uuid.uuid4().hex}")
    fd = os.open(temporary, os.O_WRONLY | os.O_CREAT | os.O_EXCL, 0o600)
    try:
        with os.fdopen(fd, "wb") as stream:
            stream.write(content)
            stream.flush()
            os.fsync(stream.fileno())
        os.replace(temporary, path)
        directory = os.open(path.parent, os.O_RDONLY)
        try:
            os.fsync(directory)
        finally:
            os.close(directory)
    finally:
        temporary.unlink(missing_ok=True)


def validate_analysis(analysis: dict[str, Any]) -> tuple[list[producer_bank.MetricRow], bool]:
    """Validate the exact-17 decoded schema and classify its trust level."""

    if analysis.get("variables") != 308 or analysis.get("clauses") != 5_846_904:
        raise ValueError("analysis dimensions do not match exact-17 child 31")
    named_orders = analysis.get("named_orders")
    if (
        not isinstance(named_orders, list)
        or len(named_orders) != 1
        or type(named_orders[0]) is not int
        or named_orders[0] not in (0, 1)
    ):
        raise ValueError(f"expected one named order, got {named_orders!r}")
    rows = analysis.get("rows")
    row_sizes = analysis.get("row_sizes")
    expected_centers = {str(center) for center in range(17)}
    if not isinstance(rows, dict) or set(rows) != expected_centers:
        raise ValueError("analysis must contain exactly the 17 center rows")
    if not isinstance(row_sizes, dict) or row_sizes != {center: 4 for center in expected_centers}:
        raise ValueError("analysis row-size schema drifted")
    decoded: list[producer_bank.MetricRow] = []
    for center_text in sorted(rows, key=int):
        center = int(center_text)
        points = rows[center_text]
        if (
            not isinstance(points, list)
            or len(points) != 4
            or any(type(point) is not int or not 0 <= point < 17 for point in points)
            or len(set(points)) != 4
            or center in points
        ):
            raise ValueError(f"invalid selected row for center {center}")
        decoded.append(producer_bank.MetricRow(center, tuple(points), exact=False))
    auth = analysis.get("authentication")
    authenticated = (
        analysis.get("production_authenticated") is True
        and isinstance(auth, dict)
        and auth.get("scheme") == "piqd-sat-response/v1"
        and analysis.get("status") == "PASS"
        and analysis.get("cnf_sha256") == PINNED_CNF_SHA256
        and auth.get("cnf_sha256") == PINNED_CNF_SHA256
        and auth.get("model_sha256") == PINNED_MODEL_SHA256
        and auth.get("job_id") == PINNED_JOB_ID
    )
    return decoded, authenticated


def record_key(record: dict[str, Any]) -> str:
    """Bind replay to the complete canonical record, not merely its family."""

    return json.dumps(record, sort_keys=True, separators=(",", ":"))


def exact_record_present(
    rows: list[producer_bank.MetricRow],
    order: tuple[int, ...],
    target_record: dict[str, Any],
) -> bool:
    target_key = record_key(target_record)
    return any(
        record_key(record) == target_key
        for record in producer_bank.scan_all_formalized_cores(rows, 17, order)
    )


def minimize_exact_witness(
    rows: list[producer_bank.MetricRow],
    order: tuple[int, ...],
    target_record: dict[str, Any],
) -> tuple[producer_bank.MetricRow, ...]:
    """Greedily shrink while preserving this exact canonical core record."""

    kept = list(rows)
    changed = True
    while changed:
        changed = False
        for row_index in range(len(kept)):
            trial = kept[:row_index] + kept[row_index + 1 :]
            if exact_record_present(trial, order, target_record):
                kept = trial
                changed = True
                break

    changed = True
    while changed:
        changed = False
        for row_index, row in enumerate(kept):
            if row.exact or len(row.support) <= 2:
                continue
            for point in row.support:
                support = tuple(hit for hit in row.support if hit != point)
                trial = list(kept)
                trial[row_index] = producer_bank.MetricRow(
                    row.center, support, exact=False
                )
                if exact_record_present(trial, order, target_record):
                    kept = trial
                    changed = True
                    break
            if changed:
                break
    return tuple(kept)


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--analysis", type=Path, required=True)
    # Retained as optional provenance metadata for old invocations.  The
    # historical helper's family-level replay is deliberately not imported.
    parser.add_argument("--cegar-helper", type=Path)
    parser.add_argument("--output", type=Path, required=True)
    parser.add_argument("--minimize-limit", type=int, default=0)
    parser.add_argument(
        "--minimize-index",
        type=int,
        action="append",
        default=[],
        help="zero-based theorem-bank record index to minimize (repeatable)",
    )
    args = parser.parse_args()

    analysis, source_analysis_sha256 = sha256_json(args.analysis)
    rows, production_authenticated = validate_analysis(analysis)
    named_orders = analysis["named_orders"]
    # `named_orders` selects one of the two Lean `NamedOrder` tables.  Cyclic
    # reversal is a separate `Orientation` handled by the obstruction scanners;
    # it is not the meaning of named order 1.  In Lean, order 1 differs from
    # order 0 only by swapping labels 9 and 12 at boundary positions 5 and 6.
    order = ORDERS[named_orders[0]]
    # This is the authoritative complete scan.  Do not rescan once per record:
    # that is redundant and makes the mandatory per-wave gate quadratic in the
    # number of recognized families.  Exact replay matters when a witness is
    # reduced or otherwise transformed below.
    proposals = producer_bank.scan_all_formalized_cores(rows, 17, order)
    hits = list(proposals)
    unreplayed: list[dict[str, Any]] = []
    minimize_indices = set(range(min(args.minimize_limit, len(hits))))
    for index in args.minimize_index:
        if not 0 <= index < len(hits):
            raise ValueError(
                f"minimize index {index} is outside the {len(hits)} theorem-bank hits"
            )
        minimize_indices.add(index)

    minimized = []
    for index in sorted(minimize_indices):
        hit = hits[index]
        witness = minimize_exact_witness(rows, order, hit)
        if not exact_record_present(list(witness), order, hit):
            raise ValueError("minimized exact theorem-bank record did not replay")
        minimized.append({
            "record_index": index,
            "record": hit,
            "rows": [
                {
                    "center": row.center,
                    "support": list(row.support),
                    "exact": row.exact,
                }
                for row in witness
                if row.support
            ],
        })

    payload = {
        "schema": "p97-exact17-cdefg-model-theorem-bank/v3",
        "source_analysis": str(args.analysis),
        "source_analysis_sha256": source_analysis_sha256,
        "replay_mode": "exact-canonical-record",
        "status": (
            "PRODUCTION_AUTHENTICATED"
            if production_authenticated
            else "DIAGNOSTIC"
        ),
        "diagnostic_status": analysis.get("status"),
        "production_authenticated": production_authenticated,
        "input_identity": {
            "cnf_sha256": analysis.get("cnf_sha256"),
            "model_sha256": (
                analysis.get("authentication", {}).get("model_sha256")
                if isinstance(analysis.get("authentication"), dict)
                else None
            ),
            "job_id": (
                analysis.get("authentication", {}).get("job_id")
                if isinstance(analysis.get("authentication"), dict)
                else None
            ),
        },
        "legacy_cegar_helper": (
            str(args.cegar_helper) if args.cegar_helper is not None else None
        ),
        "order": list(order),
        "proposal_count": len(proposals),
        "replayed_proposal_count": len(hits),
        "unreplayed_proposal_count": len(unreplayed),
        "replay_complete": not unreplayed,
        "hit_count": len(hits),
        "hits": hits,
        "unreplayed_proposals": unreplayed,
        "minimized_witnesses": minimized,
    }
    atomic_write(
        args.output,
        (json.dumps(payload, indent=2, sort_keys=True) + "\n").encode("utf-8"),
    )
    print(json.dumps({"hit_count": len(hits), "output": str(args.output)}))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
