"""Derive the frozen v26 arm-static validator and its tests from the v25 pair.

The v25 validator attests the run that already happened and is never edited.
This script materializes its v26 successor by exact, counted string
replacements, so every byte that is not a deliberate identity change is
carried over unchanged.  `--verify` re-runs the replacements and compares
against the files on disk without writing.
"""

from __future__ import annotations

import argparse
import sys
from pathlib import Path

VALIDATOR_SOURCE = "census/card_head/exact12_next_row_arm_static_v25_validator.py"
VALIDATOR_TARGET = "census/card_head/exact12_next_row_arm_static_v26_validator.py"
TEST_SOURCE = "census/card_head/tests/test_exact12_next_row_arm_static_v25_validator.py"
TEST_TARGET = "census/card_head/tests/test_exact12_next_row_arm_static_v26_validator.py"

OLD_BANK_TAIL = """    "second_apex_surplus_second_first_common_five_family_bank",
)
"""
NEW_BANK_TAIL = """    "second_apex_surplus_second_first_common_five_family_bank",
    "core_pair_all_order_common_five_family_bank",
)
"""

# (old, new, expected occurrence count)
VALIDATOR_EDITS: tuple[tuple[str, str, int], ...] = (
    ("exact-12 v25 arm-static canary", "exact-12 v26 arm-static canary", 1),
    ("the frozen v24 validator", "the frozen v25 validator", 1),
    (
        "the v13 descriptor/receipt/custody envelope",
        "the v14 descriptor/receipt/custody envelope",
        1,
    ),
    ("_canary_run.v13\"", "_canary_run.v14\"", 1),
    ("_canary_job.v13\"", "_canary_job.v14\"", 1),
    ("cell6-v13-r1", "cell6-v14-r1", 1),
    ("EXPECTED_PREFIX_VARS = 47174", "EXPECTED_PREFIX_VARS = 47211", 1),
    ("EXPECTED_PREFIX_CLAUSES = 679351", "EXPECTED_PREFIX_CLAUSES = 703533", 1),
    (
        "ef94a6d4624b242a77195455d312a8e7f880e3fe547882b23c67d0359ce4d759",
        "415be05fdedfb008b0a1eb5a5ca5e299ef7564e9287b89333dc4705235916a93",
        1,
    ),
    ("EXPECTED_POST_ARM_CLAUSES = 680218", "EXPECTED_POST_ARM_CLAUSES = 704400", 1),
    (
        "4f15259e8d8494e4ebb741b52328cef4049049fe027159cd6ba0b19c4e50702d",
        "8f072d08ada262fcb3ba98012a5fc638297c681509e8355e04dadd4dd350d2d3",
        1,
    ),
    ("EXPECTED_FINAL_VARS = 47174", "EXPECTED_FINAL_VARS = 47211", 1),
    ("EXPECTED_FINAL_CLAUSES = 680299", "EXPECTED_FINAL_CLAUSES = 704481", 1),
    (
        "81b4e2e2fb6b39340253d0407a891d2d6b925cb444c56964e8dafdfb4597ae11",
        "82be51273d21d1377692a288b8d5714fb120792cb2e6565834b79f9b228ebd78",
        1,
    ),
    (OLD_BANK_TAIL, NEW_BANK_TAIL, 1),
    # The 22nd (core-pair) bank artifact is 121,948,722 bytes over 4,794,571
    # JSON nodes, so the two v25 parse bounds no longer admit a valid run.
    # Both stay finite and strictly below MAX_FILE_BYTES: they still bind.
    ("MAX_JSON_BYTES = 64 * 1024 * 1024", "MAX_JSON_BYTES = 192 * 1024 * 1024", 1),
    ("MAX_JSON_NODES = 4_000_000", "MAX_JSON_NODES = 8_000_000", 1),
    ("V25ValidationError", "V26ValidationError", 4),
    ("validate_v25_workdir", "validate_v26_workdir", 2),
    ("\"v13 job identity mismatch\"", "\"v14 job identity mismatch\"", 1),
    ("v13 Lean-ingress contract", "v14 Lean-ingress contract", 2),
    ("frozen v13 constant", "frozen v14 constant", 2),
    (
        "receipt job identity is not bound to the v25 contract",
        "receipt job identity is not bound to the v26 contract",
        1,
    ),
)

OLD_BANK_ASSERT = """    assert len(validator._BANK_KEYS) == 22
"""
NEW_BANK_ASSERT = """    assert (
        "core_pair_all_order_common_five_family_bank"
        in validator._BANK_KEYS
    )
    assert len(validator._BANK_KEYS) == 23
"""

OLD_DRAT_TEST = """def test_drat_verifier_requires_exact_verified_line("""
NEW_DRAT_TEST = """def test_parse_bounds_admit_the_live_banks_and_still_bind() -> None:
    # Largest live v26 artifact: 121,948,722 bytes over 4,794,571 JSON nodes.
    assert validator.MAX_JSON_BYTES == 192 * 1024 * 1024
    assert validator.MAX_JSON_NODES == 8_000_000
    assert validator.MAX_JSON_BYTES > 121_948_722
    assert validator.MAX_JSON_NODES > 4_794_571
    assert validator.MAX_JSON_BYTES < validator.MAX_FILE_BYTES
    assert validator.MAX_JSON_DEPTH == 96
    with pytest.raises(V26ValidationError, match="exceeds bounded size"):
        validator._json(b"0" * (validator.MAX_JSON_BYTES + 1), Path("oversize.json"))


def test_drat_verifier_requires_exact_verified_line("""


TEST_EDITS: tuple[tuple[str, str, int], ...] = (
    ("independent v25 validator boundary", "independent v26 validator boundary", 1),
    (
        "exact12_next_row_arm_static_v25_validator",
        "exact12_next_row_arm_static_v26_validator",
        2,
    ),
    ("V25ValidationError", "V26ValidationError", 13),
    (
        "4f15259e8d8494e4ebb741b52328cef4049049fe027159cd6ba0b19c4e50702d",
        "8f072d08ada262fcb3ba98012a5fc638297c681509e8355e04dadd4dd350d2d3",
        1,
    ),
    (
        "def test_v13_summary_promotion_fields_are_frozen_constants",
        "def test_v14_summary_promotion_fields_are_frozen_constants",
        1,
    ),
    ("_canary_run.v13\"", "_canary_run.v14\"", 1),
    (OLD_BANK_ASSERT, NEW_BANK_ASSERT, 1),
    (OLD_DRAT_TEST, NEW_DRAT_TEST, 1),
)


def _apply(text: str, edits: tuple[tuple[str, str, int], ...], label: str) -> str:
    for old, new, expected in edits:
        found = text.count(old)
        if found != expected:
            raise SystemExit(
                f"{label}: expected {expected} occurrence(s) of {old!r}, found {found}"
            )
        text = text.replace(old, new)
    return text


def _derive(repo_root: Path) -> dict[str, str]:
    validator = (repo_root / VALIDATOR_SOURCE).read_text(encoding="utf-8")
    tests = (repo_root / TEST_SOURCE).read_text(encoding="utf-8")
    return {
        VALIDATOR_TARGET: _apply(validator, VALIDATOR_EDITS, "validator"),
        TEST_TARGET: _apply(tests, TEST_EDITS, "tests"),
    }


def main(argv: list[str] | None = None) -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--repo-root", type=Path, default=Path.cwd())
    parser.add_argument("--verify", action="store_true")
    args = parser.parse_args(argv)
    derived = _derive(args.repo_root)
    for relative, text in derived.items():
        target = args.repo_root / relative
        if args.verify:
            if not target.exists():
                print(f"MISSING {relative}", file=sys.stderr)
                return 1
            if target.read_text(encoding="utf-8") != text:
                print(f"DRIFTED {relative}", file=sys.stderr)
                return 1
            print(f"verified {relative}")
        else:
            target.write_text(text, encoding="utf-8")
            print(f"wrote {relative} ({len(text)} bytes)")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
