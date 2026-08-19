"""Chain the 22nd (core-pair) membership bank into the exact-12 arm static canary.

Mechanical transform mirroring commit 898fbd78, which chained the 21st
(center-exchange) bank.  Each insertion anchors on the center-exchange block it
follows and is asserted to apply exactly once.

    uv run python .../chain_canary_v14.py            # apply
    uv run python .../chain_canary_v14.py --verify   # confirm every block landed
"""

from __future__ import annotations

import argparse
import sys
from pathlib import Path

REPO = Path("/Users/adam/projects/math-projects/erdos-97-96-formalization")
CANARY = REPO / "census/card_head/exact12_next_row_arm_static_canary.py"

IMPORT_ANCHOR = '''\
from .exact12_center_exchange_all_order_common_five_membership_family_bank import (
    _source_paths as center_exchange_all_order_common_five_source_paths,
)
'''
IMPORT_ADDITION = '''\
from .exact12_core_pair_all_order_common_five_membership_family_bank import (
    Exact12CorePairAllOrderCommonFiveMembershipFamilyBankError,
    attest_core_pair_all_order_common_five_membership_family_bank_live_sources,
    install_core_pair_all_order_common_five_membership_family_bank,
)
from .exact12_core_pair_all_order_common_five_membership_family_bank import (
    _source_paths as core_pair_all_order_common_five_source_paths,
)
'''

BANK_PATH_ANCHOR = '''\
    (
        "census/card_head/"
        "exact12_center_exchange_all_order_common_five_membership_family_bank.py"
    ),
'''
BANK_PATH_ADDITION = '''\
    (
        "census/card_head/"
        "exact12_core_pair_all_order_common_five_membership_family_bank.py"
    ),
'''

LEAN_PATH_ANCHOR = '''\
    (
        "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/"
        "ExactTwelveRigid221CenterExchangeAllOrderCommonFiveMembershipFamilyCnf.lean"
    ),
'''
LEAN_PATH_ADDITION = '''\
    (
        "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/"
        "ExactTwelveRigid221CorePairAllOrderCommonFiveCertificate.lean"
    ),
    (
        "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/"
        "ExactTwelveRigid221CorePairAllOrderCommonFiveMembershipFamilyCnf.lean"
    ),
'''

FIELD_ANCHOR = (
    "    center_exchange_all_order_common_five_family_bank: dict[str, Any]\n"
)
FIELD_ADDITION = "    core_pair_all_order_common_five_family_bank: dict[str, Any]\n"

INSTALL_ANCHOR = '''\
        attest_center_exchange_all_order_common_five_membership_family_bank_live_sources(
            repo_root, center_exchange_all_order_common_five_family_bank
        )
'''
INSTALL_ADDITION = '''\
        core_pair_all_order_common_five_family_bank = (
            install_core_pair_all_order_common_five_membership_family_bank(
                repo_root,
                instance,
                layout,
                center_exchange_all_order_common_five_family_bank,
                cell_index=SUPPORTED_ARM_CELL_INDEX,
            )
        )
        attest_core_pair_all_order_common_five_membership_family_bank_live_sources(
            repo_root, core_pair_all_order_common_five_family_bank
        )
'''

EXCEPT_ANCHOR = '''\
    except (
        Exact12CenterExchangeAllOrderCommonFiveMembershipFamilyBankError
    ) as exc:
        raise Exact12NextRowArmStaticCanaryError(str(exc)) from exc
'''
EXCEPT_ADDITION = '''\
    except (
        Exact12CorePairAllOrderCommonFiveMembershipFamilyBankError
    ) as exc:
        raise Exact12NextRowArmStaticCanaryError(str(exc)) from exc
'''

KWARG_ANCHOR = '''\
        center_exchange_all_order_common_five_family_bank=(
            center_exchange_all_order_common_five_family_bank
        ),
'''
KWARG_ADDITION = '''\
        core_pair_all_order_common_five_family_bank=(
            core_pair_all_order_common_five_family_bank
        ),
'''

MANIFEST_ANCHOR = '''\
        source_paths.update(
            center_exchange_all_order_common_five_source_paths(repo_root)
        )
'''
MANIFEST_ADDITION = '''\
        source_paths.update(
            core_pair_all_order_common_five_source_paths(repo_root)
        )
'''

LOCAL_ANCHOR = '''\
    center_exchange_all_order_common_five_family_bank = (
        materialized.center_exchange_all_order_common_five_family_bank
    )
'''
LOCAL_ADDITION = '''\
    core_pair_all_order_common_five_family_bank = (
        materialized.core_pair_all_order_common_five_family_bank
    )
'''

JOB_ANCHOR = '''\
        "center_exchange_all_order_common_five_membership_family_bank": {
            "schema": center_exchange_all_order_common_five_family_bank.get("schema"),
            "sha256": center_exchange_all_order_common_five_family_bank.get(
                "bank_sha256"
            ),
            "family_id": center_exchange_all_order_common_five_family_bank.get(
                "family_id"
            ),
            "lean_terminal_ingress_ready": False,
        },
'''
JOB_ADDITION = '''\
        "core_pair_all_order_common_five_membership_family_bank": {
            "schema": core_pair_all_order_common_five_family_bank.get("schema"),
            "sha256": core_pair_all_order_common_five_family_bank.get(
                "bank_sha256"
            ),
            "family_id": core_pair_all_order_common_five_family_bank.get(
                "family_id"
            ),
            "lean_terminal_ingress_ready": False,
        },
'''

HASH_ANCHOR = '''\
        "center_exchange_all_order_common_five_family_bank": _json_sha256(
            materialized.center_exchange_all_order_common_five_family_bank
        ),
'''
HASH_ADDITION = '''\
        "core_pair_all_order_common_five_family_bank": _json_sha256(
            materialized.core_pair_all_order_common_five_family_bank
        ),
'''

PATH_ANCHOR = '''\
        center_exchange_all_order_common_five_family_bank_path = (
            workdir / "center_exchange_all_order_common_five_family_bank.json"
        )
'''
PATH_ADDITION = '''\
        core_pair_all_order_common_five_family_bank_path = (
            workdir / "core_pair_all_order_common_five_family_bank.json"
        )
'''

WRITE_ANCHOR = '''\
        _write_json(
            center_exchange_all_order_common_five_family_bank_path,
            materialized.center_exchange_all_order_common_five_family_bank,
        )
'''
WRITE_ADDITION = '''\
        _write_json(
            core_pair_all_order_common_five_family_bank_path,
            materialized.core_pair_all_order_common_five_family_bank,
        )
'''

ARTIFACT_ANCHOR = '''\
            "center_exchange_all_order_common_five_family_bank": _artifact(
                center_exchange_all_order_common_five_family_bank_path
            ),
'''
ARTIFACT_ADDITION = '''\
            "core_pair_all_order_common_five_family_bank": _artifact(
                core_pair_all_order_common_five_family_bank_path
            ),
'''

INSERTIONS = (
    ("imports", IMPORT_ANCHOR, IMPORT_ADDITION),
    ("bank source path", BANK_PATH_ANCHOR, BANK_PATH_ADDITION),
    ("lean source paths", LEAN_PATH_ANCHOR, LEAN_PATH_ADDITION),
    ("materialized field", FIELD_ANCHOR, FIELD_ADDITION),
    ("install and attest", INSTALL_ANCHOR, INSTALL_ADDITION),
    ("bank error handler", EXCEPT_ANCHOR, EXCEPT_ADDITION),
    ("materialized argument", KWARG_ANCHOR, KWARG_ADDITION),
    ("source manifest", MANIFEST_ANCHOR, MANIFEST_ADDITION),
    ("job local binding", LOCAL_ANCHOR, LOCAL_ADDITION),
    ("job bank record", JOB_ANCHOR, JOB_ADDITION),
    ("required artifact hash", HASH_ANCHOR, HASH_ADDITION),
    ("workdir path", PATH_ANCHOR, PATH_ADDITION),
    ("workdir write", WRITE_ANCHOR, WRITE_ADDITION),
    ("run artifact record", ARTIFACT_ANCHOR, ARTIFACT_ADDITION),
)

REPLACEMENTS = (
    (
        'RUN_SCHEMA = "p97_rigid221_exact12_next_row_arm_static_canary_run.v13"',
        'RUN_SCHEMA = "p97_rigid221_exact12_next_row_arm_static_canary_run.v14"',
    ),
    (
        'JOB_SCHEMA = "p97_rigid221_exact12_next_row_arm_static_canary_job.v13"',
        'JOB_SCHEMA = "p97_rigid221_exact12_next_row_arm_static_canary_job.v14"',
    ),
    ("EXPECTED_PREFIX_VARIABLES = 47_174", "EXPECTED_PREFIX_VARIABLES = 47_211"),
    ("EXPECTED_PREFIX_CLAUSES = 679_351", "EXPECTED_PREFIX_CLAUSES = 703_533"),
)


def apply(text: str) -> str:
    for label, anchor, addition in INSERTIONS:
        if text.count(anchor) != 1:
            raise SystemExit(f"{label}: anchor is not unique")
        if addition in text:
            raise SystemExit(f"{label}: addition is already present")
        text = text.replace(anchor, anchor + addition)
    for old, new in REPLACEMENTS:
        if text.count(old) != 1:
            raise SystemExit(f"replacement anchor is not unique: {old[:60]}")
        text = text.replace(old, new)
    return text


def verify(text: str) -> int:
    missing = 0
    for label, anchor, addition in INSERTIONS:
        if anchor + addition not in text:
            print(f"MISSING {label}")
            missing += 1
    for _, new in REPLACEMENTS:
        if new not in text:
            print(f"MISSING replacement {new[:60]}")
            missing += 1
    if missing:
        print(f"{missing} block(s) missing")
        return 1
    print(f"all {len(INSERTIONS)} insertions and {len(REPLACEMENTS)} replacements present")
    return 0


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--verify", action="store_true")
    arguments = parser.parse_args()
    text = CANARY.read_text()
    if arguments.verify:
        return verify(text)
    CANARY.write_text(apply(text))
    print(f"applied {len(INSERTIONS)} insertions and {len(REPLACEMENTS)} replacements")
    return 0


if __name__ == "__main__":
    sys.exit(main())
