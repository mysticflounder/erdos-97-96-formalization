"""Run the formalized obstruction bank on a decoded exact-17 PIQD model."""

from __future__ import annotations

import argparse
import hashlib
import json
import sys
from pathlib import Path
from typing import Any

REPO = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(REPO))

from census.atail_force import producer_bank

ORDER = (0, 6, 8, 11, 10, 9, 12, 7, 2, 15, 16, 3, 4, 5, 1, 13, 14)


def load_json(path: Path) -> dict[str, Any]:
    value = json.loads(path.read_text(encoding="utf-8"))
    if not isinstance(value, dict):
        raise TypeError("analysis must be a JSON object")
    return value


def sha256_file(path: Path) -> str:
    digest = hashlib.sha256()
    with path.open("rb") as handle:
        for block in iter(lambda: handle.read(1024 * 1024), b""):
            digest.update(block)
    return digest.hexdigest()


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

    analysis = load_json(args.analysis)
    named_orders = analysis["named_orders"]
    if named_orders not in ([0], [1]):
        raise ValueError(f"expected one named order, got {named_orders!r}")
    order = ORDER if named_orders == [0] else tuple(reversed(ORDER))
    rows = [
        producer_bank.MetricRow(int(center), tuple(points), exact=False)
        for center, points in sorted(
            analysis["rows"].items(), key=lambda item: int(item[0])
        )
    ]

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
        "schema": "p97-exact17-cdefg-model-theorem-bank/v2",
        "source_analysis": str(args.analysis),
        "source_analysis_sha256": sha256_file(args.analysis),
        "replay_mode": "exact-canonical-record",
        "legacy_cegar_helper": (
            str(args.cegar_helper) if args.cegar_helper is not None else None
        ),
        "order": list(order),
        "proposal_count": len(proposals),
        "hit_count": len(hits),
        "hits": hits,
        "unreplayed_proposals": unreplayed,
        "minimized_witnesses": minimized,
    }
    args.output.write_text(json.dumps(payload, indent=2, sort_keys=True) + "\n")
    print(json.dumps({"hit_count": len(hits), "output": str(args.output)}))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
