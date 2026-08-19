"""Extend the arm-static-canary test suite to the 22nd (core-pair) bank.

Mirrors the test half of commit 898fbd78, which extended the suite to the 21st
(center-exchange) bank.  Each block anchors on its center-exchange counterpart.

    uv run python .../chain_canary_tests_v14.py            # apply
    uv run python .../chain_canary_tests_v14.py --verify   # confirm blocks landed
"""

from __future__ import annotations

import argparse
import sys
from pathlib import Path

REPO = Path("/Users/adam/projects/math-projects/erdos-97-96-formalization")
TEST = REPO / "census/card_head/tests/test_exact12_next_row_arm_static_canary.py"

IMPORT_ANCHOR = '''\
from census.card_head.exact12_center_exchange_all_order_common_five_membership_family_bank import (
    install_center_exchange_all_order_common_five_membership_family_bank,
)
'''
IMPORT_ADDITION = '''\
from census.card_head.exact12_core_pair_all_order_common_five_membership_family_bank import (
    _source_paths as core_pair_all_order_common_five_source_paths,
)
from census.card_head.exact12_core_pair_all_order_common_five_membership_family_bank import (
    install_core_pair_all_order_common_five_membership_family_bank,
)
'''

INSTALL_ANCHOR = '''\
        self.assertEqual(
            center_exchange_all_order_common_five_family_bank["family_id"],
            "center-exchange-all-order-common-five-label-general-abcxy.v1",
        )
'''
INSTALL_ADDITION = '''\
        core_pair_all_order_common_five_family_bank = (
            install_core_pair_all_order_common_five_membership_family_bank(
                REPO_ROOT,
                instance,
                layout,
                center_exchange_all_order_common_five_family_bank,
                cell_index=6,
            )
        )
        self.assertEqual(
            core_pair_all_order_common_five_family_bank["family_id"],
            "core-pair-all-order-common-five-label-general-abcxy.v1",
        )
'''

BINDING_ANCHOR = '''\
        center_exchange_all_order_common_five_bank = (
            materialized.center_exchange_all_order_common_five_family_bank
        )
        center_exchange_all_order_common_five_binding = job[
            "center_exchange_all_order_common_five_membership_family_bank"
        ]
        self.assertEqual(
            center_exchange_all_order_common_five_binding["sha256"],
            center_exchange_all_order_common_five_bank["bank_sha256"],
        )
        self.assertEqual(
            center_exchange_all_order_common_five_binding["family_id"],
            center_exchange_all_order_common_five_bank["family_id"],
        )
'''
BINDING_ADDITION = '''\
        core_pair_all_order_common_five_bank = (
            materialized.core_pair_all_order_common_five_family_bank
        )
        core_pair_all_order_common_five_binding = job[
            "core_pair_all_order_common_five_membership_family_bank"
        ]
        self.assertEqual(
            core_pair_all_order_common_five_binding["sha256"],
            core_pair_all_order_common_five_bank["bank_sha256"],
        )
        self.assertEqual(
            core_pair_all_order_common_five_binding["family_id"],
            core_pair_all_order_common_five_bank["family_id"],
        )
'''

SOURCE_PATH_ANCHOR = '''\
        expected_source_paths.update(
            center_exchange_all_order_common_five_source_paths(REPO_ROOT)
        )
'''
SOURCE_PATH_ADDITION = '''\
        expected_source_paths.update(
            core_pair_all_order_common_five_source_paths(REPO_ROOT)
        )
'''

FAIL_CLOSED_ANCHOR = '''\
        artifacts["center_exchange_all_order_common_five_family_bank"] = {
            "sha256": "0" * 64
        }
        self.assertFalse(_required_artifacts_authenticated(artifacts, required))
        artifacts.pop("center_exchange_all_order_common_five_family_bank")
        self.assertFalse(_required_artifacts_authenticated(artifacts, required))
'''
FAIL_CLOSED_ADDITION = '''
        artifacts = {
            name: {"sha256": expected_sha256}
            for name, expected_sha256 in required.items()
        }
        artifacts["core_pair_all_order_common_five_family_bank"] = {
            "sha256": "0" * 64
        }
        self.assertFalse(_required_artifacts_authenticated(artifacts, required))
        artifacts.pop("core_pair_all_order_common_five_family_bank")
        self.assertFalse(_required_artifacts_authenticated(artifacts, required))
'''

INSERTIONS = (
    ("imports", IMPORT_ANCHOR, IMPORT_ADDITION),
    ("chain install", INSTALL_ANCHOR, INSTALL_ADDITION),
    ("job binding", BINDING_ANCHOR, BINDING_ADDITION),
    ("expected source paths", SOURCE_PATH_ANCHOR, SOURCE_PATH_ADDITION),
    ("artifact fail-closed", FAIL_CLOSED_ANCHOR, FAIL_CLOSED_ADDITION),
)

IDENTITY_ANCHOR = '''\
        self.assertEqual(EXPECTED_PREFIX_VARIABLES, 47_174)
        self.assertEqual(EXPECTED_PREFIX_CLAUSES, 679_351)
        self.assertEqual(EXPECTED_POST_ARM_CLAUSES, 680_218)
        self.assertEqual(EXPECTED_FINAL_CLAUSES, 680_299)
'''
IDENTITY_REPLACEMENT = '''\
        self.assertEqual(EXPECTED_PREFIX_VARIABLES, 47_211)
        self.assertEqual(EXPECTED_PREFIX_CLAUSES, 703_533)
        self.assertEqual(EXPECTED_POST_ARM_CLAUSES, 704_400)
        self.assertEqual(EXPECTED_FINAL_CLAUSES, 704_481)
'''

REPLACEMENTS = ((IDENTITY_ANCHOR, IDENTITY_REPLACEMENT),)


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--verify", action="store_true")
    arguments = parser.parse_args()
    text = TEST.read_text()
    if arguments.verify:
        missing = 0
        for label, anchor, addition in INSERTIONS:
            if anchor + addition not in text:
                print(f"MISSING {label}")
                missing += 1
        for _, new in REPLACEMENTS:
            if new not in text:
                print("MISSING frozen identity literals")
                missing += 1
        if missing:
            return 1
        print("all core-pair test blocks present")
        return 0
    for label, anchor, addition in INSERTIONS:
        if text.count(anchor) != 1:
            raise SystemExit(f"{label}: anchor is not unique")
        if addition in text:
            raise SystemExit(f"{label}: addition is already present")
        text = text.replace(anchor, anchor + addition)
    for old, new in REPLACEMENTS:
        if text.count(old) != 1:
            raise SystemExit("frozen identity literals are not unique")
        text = text.replace(old, new)
    TEST.write_text(text)
    print(f"applied {len(INSERTIONS)} insertions and {len(REPLACEMENTS)} replacements")
    return 0


if __name__ == "__main__":
    sys.exit(main())
