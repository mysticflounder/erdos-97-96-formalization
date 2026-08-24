"""Derive the frozen v27 arm-static validator and its tests from the v26 pair.

The v26 validator attests the run that already happened and is never edited.
This script materializes its v27 successor by exact, counted string
replacements, so every byte that is not a deliberate identity change is
carried over unchanged.  The v27 identity adds the physically-bridged
class-cut layer after the source-order bank: the v26 final formula becomes
the post-source-order intermediate, and the new final formula appends the
229 distinct class-cut unit clauses.  `--verify` re-runs the replacements
and compares against the files on disk without writing.
"""

from __future__ import annotations

import argparse
import sys
from pathlib import Path

VALIDATOR_SOURCE = "census/card_head/exact12_next_row_arm_static_v26_validator.py"
VALIDATOR_TARGET = "census/card_head/exact12_next_row_arm_static_v27_validator.py"
TEST_SOURCE = "census/card_head/tests/test_exact12_next_row_arm_static_v26_validator.py"
TEST_TARGET = "census/card_head/tests/test_exact12_next_row_arm_static_v27_validator.py"

OLD_IDENTITY_BLOCK = """EXPECTED_SOURCE_ORDER_CLAUSES = 81
EXPECTED_SOURCE_ORDER_SHA256 = "cedf416274a28e0aaee1fe148986610fe7e0f81ca510cae5a69b43af3aa4348c"
EXPECTED_FINAL_VARS = 47211
EXPECTED_FINAL_CLAUSES = 704481
EXPECTED_FINAL_SHA256 = "82be51273d21d1377692a288b8d5714fb120792cb2e6565834b79f9b228ebd78"
"""
NEW_IDENTITY_BLOCK = """EXPECTED_SOURCE_ORDER_CLAUSES = 81
EXPECTED_SOURCE_ORDER_SHA256 = "cedf416274a28e0aaee1fe148986610fe7e0f81ca510cae5a69b43af3aa4348c"
EXPECTED_POST_SOURCE_ORDER_CLAUSES = 704481
EXPECTED_POST_SOURCE_ORDER_SHA256 = "82be51273d21d1377692a288b8d5714fb120792cb2e6565834b79f9b228ebd78"
EXPECTED_CLASS_CUT_CLAUSES = 229
EXPECTED_CLASS_CUT_SHA256 = "4ee8e46a036c04d3065f0b87160e23bdf21479f3021409ab2518cc25529ebb2c"
EXPECTED_CLASS_CUT_INSTALLED_CNF_JSON_SHA256 = "c25e722813d1741b618794558012b7f93ca32b053fc26b4285fe2337c0c75a6d"
EXPECTED_FINAL_VARS = 47211
EXPECTED_FINAL_CLAUSES = 704710
EXPECTED_FINAL_SHA256 = "8da06d5e45d1326fb256d3ca735a802c0bf942ce3e84f5df53125441526f2b5f"
"""

OLD_ARTIFACT_KEYS = """_ARTIFACT_KEYS = frozenset({"job", "arm_suffix", *_BANK_KEYS, "source_order_bank",
                            "source_order_installation", "discovery_cnf", "survivor",
                            "terminal_cnf", "proof"})
"""
NEW_ARTIFACT_KEYS = """_ARTIFACT_KEYS = frozenset({"job", "arm_suffix", *_BANK_KEYS, "source_order_bank",
                            "source_order_installation", "physical_class_cut_bank",
                            "physical_class_cut_installation", "discovery_cnf",
                            "survivor", "terminal_cnf", "proof"})
"""

OLD_SOURCE_JOB = """    source_job = _obj(job.get("source_order_bank"), "job.source_order_bank")
    if source_job.get("sha256") != EXPECTED_SOURCE_ORDER_SHA256 or source_job.get("n_clauses") != EXPECTED_SOURCE_ORDER_CLAUSES:
        _fail("job source-order identity mismatch")
"""
NEW_SOURCE_JOB = """    source_job = _obj(job.get("source_order_bank"), "job.source_order_bank")
    if source_job.get("sha256") != EXPECTED_SOURCE_ORDER_SHA256 or source_job.get("n_clauses") != EXPECTED_SOURCE_ORDER_CLAUSES:
        _fail("job source-order identity mismatch")
    class_job = _obj(job.get("physical_class_cut_bank"), "job.physical_class_cut_bank")
    if class_job.get("sha256") != EXPECTED_CLASS_CUT_SHA256 or class_job.get("n_clauses") != EXPECTED_CLASS_CUT_CLAUSES:
        _fail("job class-cut identity mismatch")
"""

OLD_INSTALLATION_BLOCK = """    installation = _obj(_json(artifacts["source_order_installation"], workdir / "source_order_installation.json"), "source-order installation")
    if installation.get("bank_sha256") != EXPECTED_SOURCE_ORDER_SHA256 or installation.get("final_n_variables") != EXPECTED_FINAL_VARS or installation.get("final_n_clauses") != EXPECTED_FINAL_CLAUSES or installation.get("final_cnf_sha256") != EXPECTED_FINAL_SHA256:
        _fail("source-order installation is not bound to final CNF")
    order = descriptor.get("source_order_bank", {})
    if order.get("sha256") != EXPECTED_SOURCE_ORDER_SHA256 or order.get("n_clauses") != EXPECTED_SOURCE_ORDER_CLAUSES:
        _fail("source-order bank identity mismatch")
"""
NEW_INSTALLATION_BLOCK = """    installation = _obj(_json(artifacts["source_order_installation"], workdir / "source_order_installation.json"), "source-order installation")
    if installation.get("bank_sha256") != EXPECTED_SOURCE_ORDER_SHA256 or installation.get("final_n_variables") != EXPECTED_FINAL_VARS or installation.get("final_n_clauses") != EXPECTED_POST_SOURCE_ORDER_CLAUSES or installation.get("final_cnf_sha256") != EXPECTED_POST_SOURCE_ORDER_SHA256:
        _fail("source-order installation is not bound to post-source-order CNF")
    class_artifact = _obj(_json(artifacts["physical_class_cut_bank"], workdir / "physical_class_cut_bank.json"), "class-cut bank artifact")
    if class_artifact.get("bank_sha256") != EXPECTED_CLASS_CUT_SHA256:
        _fail("class-cut bank artifact hash mismatch")
    class_installation = _obj(_json(artifacts["physical_class_cut_installation"], workdir / "physical_class_cut_installation.json"), "class-cut installation")
    if class_installation.get("bank_sha256") != EXPECTED_CLASS_CUT_SHA256 or class_installation.get("suffix_n_clauses") != EXPECTED_CLASS_CUT_CLAUSES or class_installation.get("base_n_clauses") != EXPECTED_POST_SOURCE_ORDER_CLAUSES or class_installation.get("final_n_variables") != EXPECTED_FINAL_VARS or class_installation.get("final_n_clauses") != EXPECTED_FINAL_CLAUSES or class_installation.get("final_cnf_sha256") != EXPECTED_CLASS_CUT_INSTALLED_CNF_JSON_SHA256:
        _fail("class-cut installation is not bound to final CNF")
    order = descriptor.get("source_order_bank", {})
    if order.get("sha256") != EXPECTED_SOURCE_ORDER_SHA256 or order.get("n_clauses") != EXPECTED_SOURCE_ORDER_CLAUSES:
        _fail("source-order bank identity mismatch")
    class_order = descriptor.get("physical_class_cut_bank", {})
    if class_order.get("sha256") != EXPECTED_CLASS_CUT_SHA256 or class_order.get("n_clauses") != EXPECTED_CLASS_CUT_CLAUSES:
        _fail("class-cut bank identity mismatch")
"""

# (old, new, expected occurrence count)
VALIDATOR_EDITS: tuple[tuple[str, str, int], ...] = (
    ("exact-12 v26 arm-static canary", "exact-12 v27 arm-static canary", 1),
    ("the frozen v25 validator", "the frozen v26 validator", 1),
    (
        "the v14 descriptor/receipt/custody envelope",
        "the v15 descriptor/receipt/custody envelope",
        1,
    ),
    ('_canary_run.v14"', '_canary_run.v15"', 1),
    ('_canary_job.v14"', '_canary_job.v15"', 1),
    ("cell6-v14-r1", "cell6-v15-r1", 1),
    ("v14 job identity mismatch", "v15 job identity mismatch", 1),
    ("v14 Lean-ingress contract", "v15 Lean-ingress contract", 2),
    ("frozen v14 constant", "frozen v15 constant", 2),
    (
        "false_of_terminalFullMembershipNamedDeletionArmBank",
        "false_of_terminalFullMembershipNamedDeletionArmPhysicalClassBank",
        1,
    ),
    (OLD_IDENTITY_BLOCK, NEW_IDENTITY_BLOCK, 1),
    (OLD_ARTIFACT_KEYS, NEW_ARTIFACT_KEYS, 1),
    (OLD_SOURCE_JOB, NEW_SOURCE_JOB, 1),
    (OLD_INSTALLATION_BLOCK, NEW_INSTALLATION_BLOCK, 1),
    ("V26ValidationError", "V27ValidationError", 4),
    ("validate_v26_workdir", "validate_v27_workdir", 2),
    (
        "receipt job identity is not bound to the v26 contract",
        "receipt job identity is not bound to the v27 contract",
        1,
    ),
)

OLD_BANK_ASSERT = """    assert len(validator._BANK_KEYS) == 23
"""
NEW_BANK_ASSERT = """    assert len(validator._BANK_KEYS) == 23
    assert "physical_class_cut_bank" in validator._ARTIFACT_KEYS
    assert "physical_class_cut_installation" in validator._ARTIFACT_KEYS
    assert validator.EXPECTED_CLASS_CUT_CLAUSES == 229
    assert validator.EXPECTED_CLASS_CUT_SHA256 == (
        "4ee8e46a036c04d3065f0b87160e23bdf21479f3021409ab2518cc25529ebb2c"
    )
    assert validator.EXPECTED_POST_SOURCE_ORDER_CLAUSES == 704481
    assert validator.EXPECTED_POST_SOURCE_ORDER_SHA256 == (
        "82be51273d21d1377692a288b8d5714fb120792cb2e6565834b79f9b228ebd78"
    )
    assert validator.EXPECTED_FINAL_CLAUSES == 704710
    assert validator.EXPECTED_FINAL_SHA256 == (
        "8da06d5e45d1326fb256d3ca735a802c0bf942ce3e84f5df53125441526f2b5f"
    )
"""

TEST_EDITS: tuple[tuple[str, str, int], ...] = (
    ("independent v26 validator boundary", "independent v27 validator boundary", 1),
    ('_canary_run.v14"', '_canary_run.v15"', 1),
    (
        "def test_v14_summary_promotion_fields_are_frozen_constants",
        "def test_v15_summary_promotion_fields_are_frozen_constants",
        1,
    ),
    (
        "exact12_next_row_arm_static_v26_validator",
        "exact12_next_row_arm_static_v27_validator",
        2,
    ),
    ("V26ValidationError", "V27ValidationError", 14),
    (
        "false_of_terminalFullMembershipNamedDeletionArmBank",
        "false_of_terminalFullMembershipNamedDeletionArmPhysicalClassBank",
        1,
    ),
    (OLD_BANK_ASSERT, NEW_BANK_ASSERT, 1),
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
