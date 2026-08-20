"""Derive the v26 all-order mine from the frozen v25 mine.

Counted exact-string replacement, same discipline as the validator freeze:
everything that is not a deliberate v26 change is carried over unchanged.
`--verify` re-derives and diffs without writing.
"""

from __future__ import annotations

import argparse
import sys
from pathlib import Path

SOURCE = "scratch/rigid221-sourceheavy-anchor/mine_exact12_static_canary_all_orders_v25.py"
TARGET = "scratch/rigid221-sourceheavy-anchor/mine_exact12_static_canary_all_orders_v26.py"

CORE_PAIR_MODULE = (
    "from census.card_head."
    "exact12_core_pair_all_order_common_five_membership_family_bank import ("
)

OLD_IMPORT_ANCHOR = """from census.card_head.exact12_first_opposite_pair_surplus_second_opposite_common_five_membership_family_bank import (
    BANK_SCHEMA as FIRST_OPPOSITE_PAIR_SURPLUS_SECOND_OPPOSITE_COMMON_FIVE_BANK_SCHEMA,
"""
NEW_IMPORT_ANCHOR = (
    CORE_PAIR_MODULE
    + """
    BANK_SCHEMA as CORE_PAIR_ALL_ORDER_COMMON_FIVE_BANK_SCHEMA,
)
"""
    + CORE_PAIR_MODULE
    + """
    EXPECTED_BANK_SHA256 as EXPECTED_CORE_PAIR_ALL_ORDER_COMMON_FIVE_BANK_SHA256,
)
"""
    + CORE_PAIR_MODULE
    + """
    FAMILY_ID as CORE_PAIR_ALL_ORDER_COMMON_FIVE_FAMILY_ID,
)
"""
    + CORE_PAIR_MODULE
    + """
    _sha256_json as _core_pair_all_order_common_five_bank_sha256,
)
"""
    + CORE_PAIR_MODULE
    + """
    attest_core_pair_all_order_common_five_membership_family_bank_live_sources,
)
"""
    + OLD_IMPORT_ANCHOR
)

OLD_VALIDATOR_IMPORT = """from census.card_head.exact12_next_row_arm_static_v25_validator import (
    validate_v25_workdir,
)
"""
NEW_VALIDATOR_IMPORT = """from census.card_head.exact12_next_row_arm_static_v26_validator import (
    validate_v26_workdir,
)
"""

OLD_PATHS = """    center_exchange_all_order_common_five_bank_path = (
        workdir / "center_exchange_all_order_common_five_family_bank.json"
    )
"""
NEW_PATHS = OLD_PATHS + """    core_pair_all_order_common_five_bank_path = (
        workdir / "core_pair_all_order_common_five_family_bank.json"
    )
"""

OLD_READS = """    center_exchange_all_order_common_five_bank = _read_json(
        center_exchange_all_order_common_five_bank_path
    )
"""
NEW_READS = OLD_READS + """    core_pair_all_order_common_five_bank = _read_json(
        core_pair_all_order_common_five_bank_path
    )
"""

OLD_ARTIFACT = """    center_exchange_all_order_common_five_bank_artifact = _require_artifact(
        summary=summary,
        key="center_exchange_all_order_common_five_family_bank",
        path=center_exchange_all_order_common_five_bank_path,
    )
"""
NEW_ARTIFACT = OLD_ARTIFACT + """    core_pair_all_order_common_five_bank_artifact = _require_artifact(
        summary=summary,
        key="core_pair_all_order_common_five_family_bank",
        path=core_pair_all_order_common_five_bank_path,
    )
"""

OLD_GATE_TAIL = """    positive_variables = survivor.get("positive_variables")
"""
NEW_GATE_TAIL = """    core_pair_all_order_common_five_job = job.get(
        "core_pair_all_order_common_five_membership_family_bank"
    )
    core_pair_all_order_common_five_snapshot = dict(
        core_pair_all_order_common_five_bank
    )
    core_pair_all_order_common_five_digest = (
        core_pair_all_order_common_five_snapshot.pop("bank_sha256", None)
    )
    if (
        core_pair_all_order_common_five_job
        != {
            "schema": CORE_PAIR_ALL_ORDER_COMMON_FIVE_BANK_SCHEMA,
            "family_id": CORE_PAIR_ALL_ORDER_COMMON_FIVE_FAMILY_ID,
            "sha256": EXPECTED_CORE_PAIR_ALL_ORDER_COMMON_FIVE_BANK_SHA256,
            "lean_terminal_ingress_ready": False,
        }
        or core_pair_all_order_common_five_bank.get("schema")
        != CORE_PAIR_ALL_ORDER_COMMON_FIVE_BANK_SCHEMA
        or core_pair_all_order_common_five_bank.get("family_id")
        != CORE_PAIR_ALL_ORDER_COMMON_FIVE_FAMILY_ID
        or core_pair_all_order_common_five_digest
        != EXPECTED_CORE_PAIR_ALL_ORDER_COMMON_FIVE_BANK_SHA256
        or core_pair_all_order_common_five_digest
        != _core_pair_all_order_common_five_bank_sha256(
            core_pair_all_order_common_five_snapshot
        )
    ):
        raise MiningError("core-pair all-order common-five bank provenance failed")
    try:
        attest_core_pair_all_order_common_five_membership_family_bank_live_sources(
            Path(__file__).resolve().parents[2],
            core_pair_all_order_common_five_bank,
        )
    except ValueError as exc:
        raise MiningError(
            "core-pair all-order common-five bank source "
            f"attestation failed: {exc}"
        ) from exc

""" + OLD_GATE_TAIL

OLD_SOURCE_DICT = """            "center_exchange_all_order_common_five_family_bank": (
                center_exchange_all_order_common_five_bank_artifact
            ),
"""
NEW_SOURCE_DICT = OLD_SOURCE_DICT + """            "core_pair_all_order_common_five_family_bank": (
                core_pair_all_order_common_five_bank_artifact
            ),
"""

OLD_DEFAULT = """        default=Path("scratch/arm-static-cell6-v25-live-898fbd78-20260816"),
"""
NEW_DEFAULT = """        default=Path(
            "scratch/runs/exact12-rigid221-all-order-common-five/"
            "canary-v14-20260818/artifacts/workdir"
        ),
"""

EDITS: tuple[tuple[str, str, int], ...] = (
    ("one v25 static-canary SAT survivor", "one v26 static-canary SAT survivor", 1),
    (OLD_IMPORT_ANCHOR, NEW_IMPORT_ANCHOR, 1),
    (OLD_VALIDATOR_IMPORT, NEW_VALIDATOR_IMPORT, 1),
    ("all_order_mining.v5", "all_order_mining.v6", 1),
    ("validate_v25_workdir(", "validate_v26_workdir(", 1),
    (
        "all-order mining requires a v25-validated SAT survivor",
        "all-order mining requires a v26-validated SAT survivor",
        1,
    ),
    (OLD_PATHS, NEW_PATHS, 1),
    (OLD_READS, NEW_READS, 1),
    (OLD_ARTIFACT, NEW_ARTIFACT, 1),
    (OLD_GATE_TAIL, NEW_GATE_TAIL, 1),
    ("\"v25_validator\": validator_result,", "\"v26_validator\": validator_result,", 1),
    (OLD_SOURCE_DICT, NEW_SOURCE_DICT, 1),
    (OLD_DEFAULT, NEW_DEFAULT, 1),
)


def _derive(repo_root: Path) -> str:
    text = (repo_root / SOURCE).read_text(encoding="utf-8")
    for old, new, expected in EDITS:
        found = text.count(old)
        if found != expected:
            raise SystemExit(
                f"expected {expected} occurrence(s) of {old[:60]!r}, found {found}"
            )
        text = text.replace(old, new)
    return text


def main(argv: list[str] | None = None) -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--repo-root", type=Path, default=Path.cwd())
    parser.add_argument("--verify", action="store_true")
    args = parser.parse_args(argv)
    text = _derive(args.repo_root)
    target = args.repo_root / TARGET
    if args.verify:
        if not target.exists():
            print(f"MISSING {TARGET}", file=sys.stderr)
            return 1
        if target.read_text(encoding="utf-8") != text:
            print(f"DRIFTED {TARGET}", file=sys.stderr)
            return 1
        print(f"verified {TARGET}")
        return 0
    target.write_text(text, encoding="utf-8")
    print(f"wrote {TARGET} ({len(text)} bytes)")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
