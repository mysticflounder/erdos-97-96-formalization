"""Run one authenticated exact-12 named-arm static terminal canary.

The historical cell-1 static-convex and positive-membership formula is kept
byte-for-byte intact.  The selected named-deletion arm is appended as a
separately authenticated suffix, and the proof-backed source-order bank is
then rebuilt and installed against that strengthened parent.

SAT is accepted only after replay of the source candidate, base next-row
predicate, named-deletion arm, complete CNF, and canonical static extension.
Discovery UNSAT is accepted only after a fresh byte-identical proof-producing
run.  Even that result remains finite diagnostic evidence until the exact Lean
formula-order ingress and complete arm/placement coverage theorem are checked.
"""

from __future__ import annotations

import argparse
import hashlib
import json
from collections.abc import Callable, Collection, Mapping
from dataclasses import dataclass
from pathlib import Path
from typing import Any

from .candidate_surface import build_model
from .exact12_adjacent_apex_cross_block_membership_family_bank import (
    Exact12AdjacentApexCrossBlockMembershipFamilyBankError,
    attest_adjacent_apex_cross_block_membership_family_bank_live_sources,
    install_adjacent_apex_cross_block_membership_family_bank,
)
from .exact12_apex_first_opposite_shared_pair_common_five_membership_family_bank import (
    Exact12ApexFirstOppositeSharedPairCommonFiveMembershipFamilyBankError,
    attest_apex_first_opposite_shared_pair_common_five_membership_family_bank_live_sources,
    install_apex_first_opposite_shared_pair_common_five_membership_family_bank,
)
from .exact12_apex_first_opposite_shared_pair_common_five_membership_family_bank import (
    _source_paths as apex_first_opposite_shared_pair_common_five_source_paths,
)
from .exact12_apex_internal_shared_pair_common_five_membership_family_bank import (
    Exact12ApexInternalSharedPairCommonFiveMembershipFamilyBankError,
    attest_apex_internal_shared_pair_common_five_membership_family_bank_live_sources,
    install_apex_internal_shared_pair_common_five_membership_family_bank,
)
from .exact12_apex_pair_cross_block_membership_family_bank import (
    Exact12ApexPairCrossBlockMembershipFamilyBankError,
    attest_apex_pair_cross_block_membership_family_bank_live_sources,
    install_apex_pair_cross_block_membership_family_bank,
)
from .exact12_apex_shared_pair_cross_block_membership_family_bank import (
    Exact12ApexSharedPairCrossBlockMembershipFamilyBankError,
    attest_apex_shared_pair_cross_block_membership_family_bank_live_sources,
    install_apex_shared_pair_cross_block_membership_family_bank,
)
from .exact12_apex_zero_cross_block_membership_family_bank import (
    Exact12ApexZeroCrossBlockMembershipFamilyBankError,
    attest_apex_zero_cross_block_membership_family_bank_live_sources,
    install_apex_zero_cross_block_membership_family_bank,
)
from .exact12_next_row_cell_run import (
    _artifact,
    _claim_empty_workdir,
    _json_sha256,
    _sha256_file,
    _status_from_nonterminal,
    _write_bytes,
    _write_json,
)
from .exact12_next_row_static_cegar import (
    Exact12NextRowStaticCegarError,
    _terminal_proof_authenticated,
    detect_typed_source_order_cut,
    materialize_positive_membership_static_cell,
    replay_static_convex_sat_witness,
)
from .exact12_next_row_static_convex import StaticConvexLayout
from .exact12_next_row_valuation import (
    ARM_COMPILER_SCHEMA,
    CompiledExact12NextRowArmCell,
    CompiledExact12NextRowCell,
    Exact12NextRowValuationError,
    arm_cells,
    compile_arm_cell,
    decode_blockers,
    named_deletion_arm_holds,
)
from .exact12_positive_membership_source_order_bank import _source_record
from .exact12_second_cap_apex_surplus_membership_family_bank import (
    Exact12SecondCapApexSurplusMembershipFamilyBankError,
    attest_second_cap_apex_surplus_membership_family_bank_live_sources,
    install_second_cap_apex_surplus_membership_family_bank,
)
from .exact12_surplus_apex_pair_membership_family_bank import (
    Exact12SurplusApexPairMembershipFamilyBankError,
    attest_surplus_apex_pair_membership_family_bank_live_sources,
    install_surplus_apex_pair_membership_family_bank,
)
from .exact12_surplus_three_triad_membership_family_bank import (
    Exact12SurplusThreeTriadMembershipFamilyBankError,
    attest_surplus_three_triad_membership_family_bank_live_sources,
    install_surplus_three_triad_membership_family_bank,
)
from .exact12_v14_ordered_cut_adapter import (
    Exact12V14OrderedCutAdapterError,
    PreparedSourceOrderBank,
    attest_prepared_source_order_bank_installed,
    install_prepared_source_order_bank,
    prepare_proof_backed_source_order_bank,
)
from .exact12_v14_source_order_bank import (
    Exact12V14SourceOrderBankError,
    attest_source_order_bank_live_sources,
    build_source_order_bank,
)
from .exact12_zero_center_cross_block_membership_family_bank import (
    Exact12ZeroCenterCrossBlockMembershipFamilyBankError,
    attest_zero_center_cross_block_membership_family_bank_live_sources,
    install_zero_center_cross_block_membership_family_bank,
)
from .sat_encoding import CadicalResult, EncodingError, solve_cadical
from .source_faithful_candidate_surface import (
    SOURCE_FAITHFUL_CANDIDATE_SCHEMA,
    SOURCE_FAITHFUL_PYTHON_PROFILE,
    SourceFaithfulCoverInstance,
)

RUN_SCHEMA = "p97_rigid221_exact12_next_row_arm_static_canary_run.v2"
JOB_SCHEMA = "p97_rigid221_exact12_next_row_arm_static_canary_job.v2"
ARM_SUFFIX_SCHEMA = "p97_rigid221_exact12_next_row_arm_static_named_deletion_suffix.v1"
SUPPORTED_ARM_CELL_INDEX = 6
SUPPORTED_PLACEMENT_INDEX = 1
EXPECTED_PREFIX_VARIABLES = 45_176
EXPECTED_PREFIX_CLAUSES = 640_828
EXPECTED_PREFIX_DIMACS_SHA256 = (
    "1c5e5128225ad7d3878a2e1580f3628ca8955172982b0803d599ed2ad94c2d59"
)
EXPECTED_ARM_SUFFIX_CLAUSES = 867
EXPECTED_POST_ARM_CLAUSES = 641_695
EXPECTED_POST_ARM_DIMACS_SHA256 = (
    "d93616f6553e9fc8e5ecdb56921b7279f24368cb47375f8811581a6bc5a66ad5"
)
EXPECTED_SOURCE_ORDER_CLAUSES = 81
EXPECTED_SOURCE_ORDER_BANK_SHA256 = (
    "84d27968cd8becaa9fe56e67839f3b54e6da53acd76f4f8ea700f0288f0377e5"
)
EXPECTED_FINAL_CLAUSES = 641_776
EXPECTED_FINAL_DIMACS_SHA256 = (
    "e2128c88bb9af157621674205f30596d4d9ca8f86911c070c03e3055767a3dcf"
)
TERMINAL_STATUS = "UNSAT_DRAT_VERIFIED_AWAITING_ARM_STATIC_LEAN_INGRESS"
SUCCESS_STATUSES = frozenset({"SAT_WITNESS_REPLAYED", TERMINAL_STATUS})

SOURCE_PATHS = (
    "census/card_head/exact12_next_row_arm_static_canary.py",
    "census/card_head/exact12_next_row_arm_cell_run.py",
    "census/card_head/exact12_next_row_static_cegar.py",
    "census/card_head/exact12_next_row_static_convex.py",
    "census/card_head/exact12_next_row_valuation.py",
    "census/card_head/exact12_apex_pair_cross_block_membership_family_bank.py",
    ("census/card_head/exact12_apex_shared_pair_cross_block_membership_family_bank.py"),
    (
        "census/card_head/"
        "exact12_apex_internal_shared_pair_common_five_membership_family_bank.py"
    ),
    (
        "census/card_head/"
        "exact12_apex_first_opposite_shared_pair_common_five_membership_family_bank.py"
    ),
    "census/card_head/exact12_apex_zero_cross_block_membership_family_bank.py",
    ("census/card_head/exact12_adjacent_apex_cross_block_membership_family_bank.py"),
    ("census/card_head/exact12_second_cap_apex_surplus_membership_family_bank.py"),
    "census/card_head/exact12_surplus_apex_pair_membership_family_bank.py",
    "census/card_head/exact12_surplus_three_triad_membership_family_bank.py",
    "census/card_head/exact12_zero_center_cross_block_membership_family_bank.py",
    "census/card_head/exact12_v14_ordered_cut_adapter.py",
    "census/card_head/exact12_v14_source_order_bank.py",
    "census/card_head/source_faithful_candidate_surface.py",
    "census/card_head/sat_encoding.py",
    (
        "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/"
        "ExactTwelveRigid221ApexPairCrossBlockCommonFiveCertificate.lean"
    ),
    (
        "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/"
        "ExactTwelveRigid221ApexPairCrossBlockMembershipFamilyCnf.lean"
    ),
    (
        "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/"
        "ExactTwelveRigid221ApexSharedPairCrossBlockCommonFiveCertificate.lean"
    ),
    (
        "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/"
        "ExactTwelveRigid221ApexSharedPairCrossBlockMembershipFamilyCnf.lean"
    ),
    (
        "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/"
        "ExactTwelveRigid221ApexInternalSharedPairCommonFiveCertificate.lean"
    ),
    (
        "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/"
        "ExactTwelveRigid221ApexInternalSharedPairCommonFiveMembershipFamilyCnf.lean"
    ),
    (
        "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/"
        "ExactTwelveRigid221ApexFirstOppositeSharedPairCommonFiveCertificate.lean"
    ),
    (
        "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/"
        "ExactTwelveRigid221ApexFirstOppositeSharedPairCommonFiveMembershipFamilyCnf.lean"
    ),
    (
        "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/"
        "ExactTwelveRigid221OrderedThreeRowCuts.lean"
    ),
    (
        "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/"
        "ExactTwelveRigid221PositiveMembershipCnfBridge.lean"
    ),
    (
        "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/"
        "ExactTwelveRigid221SourceOrderPositiveNogood.lean"
    ),
    (
        "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/"
        "ExactTwelveRigid221ApexZeroCrossBlockCommonFiveCertificate.lean"
    ),
    (
        "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/"
        "ExactTwelveRigid221ApexZeroCrossBlockMembershipFamilyCnf.lean"
    ),
    (
        "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/"
        "ExactTwelveRigid221NextRowJobSemantics.lean"
    ),
    (
        "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/"
        "ExactTwelveRigid221NextRowNamedDeletionJobCnf.lean"
    ),
    (
        "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/"
        "ExactTwelveRigid221StaticNamedDeletionParentIngress.lean"
    ),
    (
        "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/"
        "ExactTwelveRigid221SurplusThreeTriadCertificate.lean"
    ),
    (
        "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/"
        "ExactTwelveRigid221SurplusThreeTriadMembershipFamilyCnf.lean"
    ),
    (
        "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/"
        "ExactTwelveRigid221ZeroCenterCrossBlockCommonFiveCertificate.lean"
    ),
    (
        "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/"
        "ExactTwelveRigid221ZeroCenterCrossBlockMembershipFamilyCnf.lean"
    ),
)


class Exact12NextRowArmStaticCanaryError(ValueError):
    """The frozen prefix, arm suffix, bank, replay, or artifact drifted."""


@dataclass(frozen=True)
class MaterializedArmStaticCanary:
    """The exact strengthened cell and its authenticated formula boundaries."""

    instance: SourceFaithfulCoverInstance
    compiled: CompiledExact12NextRowCell
    arm_compiled: CompiledExact12NextRowArmCell
    layout: StaticConvexLayout
    positive_membership_bank: dict[str, Any]
    surplus_apex_pair_family_bank: dict[str, Any]
    adjacent_apex_cross_block_family_bank: dict[str, Any]
    second_cap_apex_surplus_family_bank: dict[str, Any]
    surplus_three_triad_family_bank: dict[str, Any]
    zero_center_cross_block_family_bank: dict[str, Any]
    apex_zero_cross_block_family_bank: dict[str, Any]
    apex_pair_cross_block_family_bank: dict[str, Any]
    apex_shared_pair_cross_block_family_bank: dict[str, Any]
    apex_internal_shared_pair_common_five_family_bank: dict[str, Any]
    apex_first_opposite_shared_pair_common_five_family_bank: dict[str, Any]
    arm_suffix: dict[str, Any]
    source_order_bank: dict[str, Any]
    prepared_source_order_bank: PreparedSourceOrderBank
    source_order_installation: dict[str, Any]


def _cnf_sha256(instance: SourceFaithfulCoverInstance) -> str:
    return hashlib.sha256(instance.dimacs().encode("ascii")).hexdigest()


def _validate_supported_arm_cell(arm_cell_index: int) -> None:
    if type(arm_cell_index) is not int:
        raise Exact12NextRowArmStaticCanaryError(
            "arm_cell_index must be a plain integer"
        )
    if arm_cell_index != SUPPORTED_ARM_CELL_INDEX:
        raise Exact12NextRowArmStaticCanaryError(
            "this frozen canary supports only arm cell 6"
        )


def append_authenticated_named_arm_suffix(
    instance: SourceFaithfulCoverInstance,
    compiled: CompiledExact12NextRowCell,
    arm_compiled: CompiledExact12NextRowArmCell,
) -> dict[str, Any]:
    """Append exactly the independently compiled named-arm clause suffix."""

    if not isinstance(instance, SourceFaithfulCoverInstance):
        raise Exact12NextRowArmStaticCanaryError(
            "source-faithful parent instance is required"
        )
    if arm_compiled.base.manifest() != compiled.manifest():
        raise Exact12NextRowArmStaticCanaryError(
            "named-arm compiler base differs from the frozen placement compiler"
        )
    if arm_compiled.cell.placement_index != SUPPORTED_PLACEMENT_INDEX:
        raise Exact12NextRowArmStaticCanaryError(
            "named-arm compiler is not bound to placement 1"
        )

    prefix_variables = instance.cnf.n_variables
    prefix_clauses = len(instance.cnf.clauses)
    prefix_sha256 = _cnf_sha256(instance)
    if (
        prefix_variables != EXPECTED_PREFIX_VARIABLES
        or prefix_clauses != EXPECTED_PREFIX_CLAUSES
        or prefix_sha256 != EXPECTED_PREFIX_DIMACS_SHA256
    ):
        raise Exact12NextRowArmStaticCanaryError(
            "instance is not the frozen static/membership prefix"
        )

    suffix = arm_compiled.named_deletion_clause_delta
    if (
        arm_compiled.final_n_variables != arm_compiled.base.final_n_variables
        or len(suffix) != EXPECTED_ARM_SUFFIX_CLAUSES
        or any(
            literal == 0 or abs(literal) > prefix_variables
            for clause in suffix
            for literal in clause
        )
    ):
        raise Exact12NextRowArmStaticCanaryError(
            "named-arm suffix changed variables, size, or literal bounds"
        )

    for clause in suffix:
        instance.cnf.add_clause(clause)

    post_arm_sha256 = _cnf_sha256(instance)
    if (
        instance.cnf.n_variables != EXPECTED_PREFIX_VARIABLES
        or len(instance.cnf.clauses) != EXPECTED_POST_ARM_CLAUSES
        or post_arm_sha256 != EXPECTED_POST_ARM_DIMACS_SHA256
    ):
        raise Exact12NextRowArmStaticCanaryError(
            "post-arm formula differs from the frozen canary identity"
        )

    payload = {
        "schema": ARM_SUFFIX_SCHEMA,
        "compiler_schema": ARM_COMPILER_SCHEMA,
        "cell": {
            "arm_cell_index": SUPPORTED_ARM_CELL_INDEX,
            "placement_index": arm_compiled.cell.placement_index,
            "joint_deletion": arm_compiled.cell.joint_deletion,
            "v": arm_compiled.cell.v,
            "arm": arm_compiled.cell.arm,
        },
        "prefix": {
            "variables": prefix_variables,
            "clauses": prefix_clauses,
            "dimacs_sha256": prefix_sha256,
        },
        "suffix": {
            "clauses": [list(clause) for clause in suffix],
            "n_clauses": len(suffix),
            "clause_delta_sha256": (arm_compiled.named_deletion_clause_delta_sha256),
        },
        "post_arm": {
            "variables": instance.cnf.n_variables,
            "clauses": len(instance.cnf.clauses),
            "dimacs_sha256": post_arm_sha256,
        },
        "claims": {
            "lean_terminal_ingress_ready": False,
            "aggregate_arm_coverage": False,
            "universal_lift": False,
            "live_theorem_closure": False,
        },
    }
    return {**payload, "suffix_record_sha256": _json_sha256(payload)}


def materialize_arm_static_canary(
    repo_root: Path, arm_cell_index: int = SUPPORTED_ARM_CELL_INDEX
) -> MaterializedArmStaticCanary:
    """Materialize the exact prefix, arm suffix, and rebuilt ordered bank."""

    _validate_supported_arm_cell(arm_cell_index)
    repo_root = repo_root.resolve()
    instance, compiled, layout, membership_bank = (
        materialize_positive_membership_static_cell(
            repo_root, SUPPORTED_PLACEMENT_INDEX
        )
    )
    try:
        surplus_apex_pair_family_bank = (
            install_surplus_apex_pair_membership_family_bank(
                repo_root,
                instance,
                layout,
                membership_bank,
                cell_index=SUPPORTED_PLACEMENT_INDEX,
            )
        )
        attest_surplus_apex_pair_membership_family_bank_live_sources(
            repo_root, surplus_apex_pair_family_bank
        )
        adjacent_apex_cross_block_family_bank = (
            install_adjacent_apex_cross_block_membership_family_bank(
                repo_root,
                instance,
                layout,
                surplus_apex_pair_family_bank,
                cell_index=SUPPORTED_PLACEMENT_INDEX,
            )
        )
        attest_adjacent_apex_cross_block_membership_family_bank_live_sources(
            repo_root, adjacent_apex_cross_block_family_bank
        )
        second_cap_apex_surplus_family_bank = (
            install_second_cap_apex_surplus_membership_family_bank(
                repo_root,
                instance,
                layout,
                adjacent_apex_cross_block_family_bank,
                cell_index=SUPPORTED_PLACEMENT_INDEX,
            )
        )
        attest_second_cap_apex_surplus_membership_family_bank_live_sources(
            repo_root, second_cap_apex_surplus_family_bank
        )
        surplus_three_triad_family_bank = (
            install_surplus_three_triad_membership_family_bank(
                repo_root,
                instance,
                layout,
                second_cap_apex_surplus_family_bank,
                cell_index=SUPPORTED_PLACEMENT_INDEX,
            )
        )
        attest_surplus_three_triad_membership_family_bank_live_sources(
            repo_root, surplus_three_triad_family_bank
        )
        zero_center_cross_block_family_bank = (
            install_zero_center_cross_block_membership_family_bank(
                repo_root,
                instance,
                layout,
                surplus_three_triad_family_bank,
                cell_index=SUPPORTED_PLACEMENT_INDEX,
            )
        )
        attest_zero_center_cross_block_membership_family_bank_live_sources(
            repo_root, zero_center_cross_block_family_bank
        )
        apex_zero_cross_block_family_bank = (
            install_apex_zero_cross_block_membership_family_bank(
                repo_root,
                instance,
                layout,
                zero_center_cross_block_family_bank,
                cell_index=SUPPORTED_PLACEMENT_INDEX,
            )
        )
        attest_apex_zero_cross_block_membership_family_bank_live_sources(
            repo_root, apex_zero_cross_block_family_bank
        )
        apex_pair_cross_block_family_bank = (
            install_apex_pair_cross_block_membership_family_bank(
                repo_root,
                instance,
                layout,
                apex_zero_cross_block_family_bank,
                cell_index=SUPPORTED_PLACEMENT_INDEX,
            )
        )
        attest_apex_pair_cross_block_membership_family_bank_live_sources(
            repo_root, apex_pair_cross_block_family_bank
        )
        apex_shared_pair_cross_block_family_bank = (
            install_apex_shared_pair_cross_block_membership_family_bank(
                repo_root,
                instance,
                layout,
                apex_pair_cross_block_family_bank,
                cell_index=SUPPORTED_PLACEMENT_INDEX,
            )
        )
        attest_apex_shared_pair_cross_block_membership_family_bank_live_sources(
            repo_root, apex_shared_pair_cross_block_family_bank
        )
        apex_internal_shared_pair_common_five_family_bank = (
            install_apex_internal_shared_pair_common_five_membership_family_bank(
                repo_root,
                instance,
                layout,
                apex_shared_pair_cross_block_family_bank,
                cell_index=SUPPORTED_PLACEMENT_INDEX,
            )
        )
        attest_apex_internal_shared_pair_common_five_membership_family_bank_live_sources(
            repo_root, apex_internal_shared_pair_common_five_family_bank
        )
        apex_first_opposite_shared_pair_common_five_family_bank = (
            install_apex_first_opposite_shared_pair_common_five_membership_family_bank(
                repo_root,
                instance,
                layout,
                apex_internal_shared_pair_common_five_family_bank,
                cell_index=SUPPORTED_PLACEMENT_INDEX,
            )
        )
        attest_apex_first_opposite_shared_pair_common_five_membership_family_bank_live_sources(
            repo_root, apex_first_opposite_shared_pair_common_five_family_bank
        )
    except Exact12SurplusApexPairMembershipFamilyBankError as exc:
        raise Exact12NextRowArmStaticCanaryError(str(exc)) from exc
    except Exact12AdjacentApexCrossBlockMembershipFamilyBankError as exc:
        raise Exact12NextRowArmStaticCanaryError(str(exc)) from exc
    except Exact12SecondCapApexSurplusMembershipFamilyBankError as exc:
        raise Exact12NextRowArmStaticCanaryError(str(exc)) from exc
    except Exact12SurplusThreeTriadMembershipFamilyBankError as exc:
        raise Exact12NextRowArmStaticCanaryError(str(exc)) from exc
    except Exact12ZeroCenterCrossBlockMembershipFamilyBankError as exc:
        raise Exact12NextRowArmStaticCanaryError(str(exc)) from exc
    except Exact12ApexZeroCrossBlockMembershipFamilyBankError as exc:
        raise Exact12NextRowArmStaticCanaryError(str(exc)) from exc
    except Exact12ApexPairCrossBlockMembershipFamilyBankError as exc:
        raise Exact12NextRowArmStaticCanaryError(str(exc)) from exc
    except Exact12ApexSharedPairCrossBlockMembershipFamilyBankError as exc:
        raise Exact12NextRowArmStaticCanaryError(str(exc)) from exc
    except Exact12ApexInternalSharedPairCommonFiveMembershipFamilyBankError as exc:
        raise Exact12NextRowArmStaticCanaryError(str(exc)) from exc
    except Exact12ApexFirstOppositeSharedPairCommonFiveMembershipFamilyBankError as exc:
        raise Exact12NextRowArmStaticCanaryError(str(exc)) from exc

    arm_instance = SourceFaithfulCoverInstance(
        build_model(12, SOURCE_FAITHFUL_PYTHON_PROFILE)
    )
    arm_compiled = compile_arm_cell(arm_instance, arm_cells()[arm_cell_index])
    arm_suffix = append_authenticated_named_arm_suffix(instance, compiled, arm_compiled)

    try:
        prepared = prepare_proof_backed_source_order_bank(
            instance, build_source_order_bank(repo_root, instance)
        )
        source_order_bank = prepared.snapshot()
        attest_source_order_bank_live_sources(repo_root, source_order_bank)
        installation = install_prepared_source_order_bank(instance, prepared)
        attested_installation = attest_prepared_source_order_bank_installed(
            instance, prepared
        )
    except (
        Exact12V14OrderedCutAdapterError,
        Exact12V14SourceOrderBankError,
    ) as exc:
        raise Exact12NextRowArmStaticCanaryError(str(exc)) from exc

    entries = source_order_bank.get("entries")
    if (
        installation != attested_installation
        or type(entries) is not list
        or len(entries) != EXPECTED_SOURCE_ORDER_CLAUSES
        or source_order_bank.get("bank_sha256") != EXPECTED_SOURCE_ORDER_BANK_SHA256
        or instance.cnf.n_variables != EXPECTED_PREFIX_VARIABLES
        or len(instance.cnf.clauses) != EXPECTED_FINAL_CLAUSES
        or _cnf_sha256(instance) != EXPECTED_FINAL_DIMACS_SHA256
        or installation.get("final_cnf_sha256") != EXPECTED_FINAL_DIMACS_SHA256
    ):
        raise Exact12NextRowArmStaticCanaryError(
            "rebuilt source-order installation differs from the frozen canary"
        )

    return MaterializedArmStaticCanary(
        instance=instance,
        compiled=compiled,
        arm_compiled=arm_compiled,
        layout=layout,
        positive_membership_bank=membership_bank,
        surplus_apex_pair_family_bank=surplus_apex_pair_family_bank,
        adjacent_apex_cross_block_family_bank=(adjacent_apex_cross_block_family_bank),
        second_cap_apex_surplus_family_bank=(second_cap_apex_surplus_family_bank),
        surplus_three_triad_family_bank=surplus_three_triad_family_bank,
        zero_center_cross_block_family_bank=zero_center_cross_block_family_bank,
        apex_zero_cross_block_family_bank=apex_zero_cross_block_family_bank,
        apex_pair_cross_block_family_bank=apex_pair_cross_block_family_bank,
        apex_shared_pair_cross_block_family_bank=(
            apex_shared_pair_cross_block_family_bank
        ),
        apex_internal_shared_pair_common_five_family_bank=(
            apex_internal_shared_pair_common_five_family_bank
        ),
        apex_first_opposite_shared_pair_common_five_family_bank=(
            apex_first_opposite_shared_pair_common_five_family_bank
        ),
        arm_suffix=arm_suffix,
        source_order_bank=source_order_bank,
        prepared_source_order_bank=prepared,
        source_order_installation=installation,
    )


def replay_arm_static_sat_witness(
    materialized: MaterializedArmStaticCanary,
    reported_cube: Mapping[int | str, Collection[int]],
    positive_variables: Collection[int],
) -> tuple[dict[int, list[int]], frozenset[int], dict[str, bool]]:
    """Replay every source, arm, CNF, and canonical-static SAT gate."""

    cube, positive, replay = replay_static_convex_sat_witness(
        materialized.instance,
        materialized.compiled,
        materialized.layout,
        reported_cube,
        positive_variables,
    )
    blockers = decode_blockers(
        positive, materialized.arm_compiled.base.blocker_variables
    )
    arm_replayed = named_deletion_arm_holds(
        materialized.arm_compiled.cell.arm, cube, blockers
    )
    if not arm_replayed:
        raise Exact12NextRowArmStaticCanaryError(
            "SAT assignment failed the named-deletion-arm gate"
        )
    return cube, positive, {**replay, "named_deletion_arm": True}


def _source_manifest(repo_root: Path) -> list[dict[str, Any]]:
    try:
        source_paths = set(SOURCE_PATHS)
        source_paths.update(
            apex_first_opposite_shared_pair_common_five_source_paths(repo_root)
        )
        return [
            _source_record(repo_root.resolve(), path) for path in sorted(source_paths)
        ]
    except (OSError, ValueError) as exc:
        raise Exact12NextRowArmStaticCanaryError(
            "required canary source failed authentication"
        ) from exc


def _build_job(
    repo_root: Path, materialized: MaterializedArmStaticCanary
) -> dict[str, Any]:
    instance = materialized.instance
    membership_bank = materialized.positive_membership_bank
    surplus_apex_pair_family_bank = materialized.surplus_apex_pair_family_bank
    adjacent_apex_cross_block_family_bank = (
        materialized.adjacent_apex_cross_block_family_bank
    )
    second_cap_apex_surplus_family_bank = (
        materialized.second_cap_apex_surplus_family_bank
    )
    surplus_three_triad_family_bank = materialized.surplus_three_triad_family_bank
    zero_center_cross_block_family_bank = (
        materialized.zero_center_cross_block_family_bank
    )
    apex_zero_cross_block_family_bank = materialized.apex_zero_cross_block_family_bank
    apex_pair_cross_block_family_bank = materialized.apex_pair_cross_block_family_bank
    apex_shared_pair_cross_block_family_bank = (
        materialized.apex_shared_pair_cross_block_family_bank
    )
    apex_internal_shared_pair_common_five_family_bank = (
        materialized.apex_internal_shared_pair_common_five_family_bank
    )
    apex_first_opposite_shared_pair_common_five_family_bank = (
        materialized.apex_first_opposite_shared_pair_common_five_family_bank
    )
    source_order_bank = materialized.source_order_bank
    payload = {
        "schema": JOB_SCHEMA,
        "scope": (
            "one finite exact-12 placement-1 named-arm static canary; no "
            "aggregate arm coverage, universal lift, or Lean closure"
        ),
        "arm_cell_index": SUPPORTED_ARM_CELL_INDEX,
        "candidate_schema": SOURCE_FAITHFUL_CANDIDATE_SCHEMA,
        "candidate_profile": list(SOURCE_FAITHFUL_PYTHON_PROFILE),
        "compiler_manifest": materialized.arm_compiled.manifest(),
        "positive_membership_bank": {
            "schema": membership_bank.get("schema"),
            "sha256": membership_bank.get("bank_sha256"),
            "cut_id": membership_bank.get("cut_id"),
        },
        "surplus_apex_pair_membership_family_bank": {
            "schema": surplus_apex_pair_family_bank.get("schema"),
            "sha256": surplus_apex_pair_family_bank.get("bank_sha256"),
            "family_id": surplus_apex_pair_family_bank.get("family_id"),
            "lean_terminal_ingress_ready": False,
        },
        "adjacent_apex_cross_block_membership_family_bank": {
            "schema": adjacent_apex_cross_block_family_bank.get("schema"),
            "sha256": adjacent_apex_cross_block_family_bank.get("bank_sha256"),
            "family_id": adjacent_apex_cross_block_family_bank.get("family_id"),
            "lean_terminal_ingress_ready": False,
        },
        "second_cap_apex_surplus_membership_family_bank": {
            "schema": second_cap_apex_surplus_family_bank.get("schema"),
            "sha256": second_cap_apex_surplus_family_bank.get("bank_sha256"),
            "family_id": second_cap_apex_surplus_family_bank.get("family_id"),
            "lean_terminal_ingress_ready": False,
        },
        "surplus_three_triad_membership_family_bank": {
            "schema": surplus_three_triad_family_bank.get("schema"),
            "sha256": surplus_three_triad_family_bank.get("bank_sha256"),
            "family_id": surplus_three_triad_family_bank.get("family_id"),
            "lean_terminal_ingress_ready": False,
        },
        "zero_center_cross_block_membership_family_bank": {
            "schema": zero_center_cross_block_family_bank.get("schema"),
            "sha256": zero_center_cross_block_family_bank.get("bank_sha256"),
            "family_id": zero_center_cross_block_family_bank.get("family_id"),
            "lean_terminal_ingress_ready": False,
        },
        "apex_zero_cross_block_membership_family_bank": {
            "schema": apex_zero_cross_block_family_bank.get("schema"),
            "sha256": apex_zero_cross_block_family_bank.get("bank_sha256"),
            "family_id": apex_zero_cross_block_family_bank.get("family_id"),
            "lean_terminal_ingress_ready": False,
        },
        "apex_pair_cross_block_membership_family_bank": {
            "schema": apex_pair_cross_block_family_bank.get("schema"),
            "sha256": apex_pair_cross_block_family_bank.get("bank_sha256"),
            "family_id": apex_pair_cross_block_family_bank.get("family_id"),
            "lean_terminal_ingress_ready": False,
        },
        "apex_shared_pair_cross_block_membership_family_bank": {
            "schema": apex_shared_pair_cross_block_family_bank.get("schema"),
            "sha256": apex_shared_pair_cross_block_family_bank.get("bank_sha256"),
            "family_id": apex_shared_pair_cross_block_family_bank.get("family_id"),
            "lean_terminal_ingress_ready": False,
        },
        "apex_internal_shared_pair_common_five_membership_family_bank": {
            "schema": apex_internal_shared_pair_common_five_family_bank.get("schema"),
            "sha256": apex_internal_shared_pair_common_five_family_bank.get(
                "bank_sha256"
            ),
            "family_id": apex_internal_shared_pair_common_five_family_bank.get(
                "family_id"
            ),
            "lean_terminal_ingress_ready": False,
        },
        "apex_first_opposite_shared_pair_common_five_membership_family_bank": {
            "schema": apex_first_opposite_shared_pair_common_five_family_bank.get(
                "schema"
            ),
            "sha256": apex_first_opposite_shared_pair_common_five_family_bank.get(
                "bank_sha256"
            ),
            "family_id": apex_first_opposite_shared_pair_common_five_family_bank.get(
                "family_id"
            ),
            "lean_terminal_ingress_ready": False,
        },
        "arm_suffix": {
            "schema": ARM_SUFFIX_SCHEMA,
            "sha256": materialized.arm_suffix["suffix_record_sha256"],
            "n_clauses": EXPECTED_ARM_SUFFIX_CLAUSES,
            "post_arm_dimacs_sha256": EXPECTED_POST_ARM_DIMACS_SHA256,
        },
        "source_order_bank": {
            "schema": source_order_bank.get("schema"),
            "sha256": source_order_bank.get("bank_sha256"),
            "n_clauses": EXPECTED_SOURCE_ORDER_CLAUSES,
            "installation": materialized.source_order_installation,
        },
        "cnf": {
            "bytes": len(instance.dimacs().encode("ascii")),
            "sha256": EXPECTED_FINAL_DIMACS_SHA256,
            "variables": instance.cnf.n_variables,
            "clauses": len(instance.cnf.clauses),
        },
        "promotion": {
            "lean_terminal_ingress_ready": False,
            "status_on_verified_unsat": TERMINAL_STATUS,
        },
        "sources": _source_manifest(repo_root),
    }
    return {**payload, "job_id": _json_sha256(payload)}


def _required_artifact_hashes(
    job: Mapping[str, Any], materialized: MaterializedArmStaticCanary
) -> dict[str, str]:
    return {
        "job": _json_sha256(job),
        "arm_suffix": _json_sha256(materialized.arm_suffix),
        "positive_membership_bank": _json_sha256(
            materialized.positive_membership_bank
        ),
        "surplus_apex_pair_family_bank": _json_sha256(
            materialized.surplus_apex_pair_family_bank
        ),
        "adjacent_apex_cross_block_family_bank": _json_sha256(
            materialized.adjacent_apex_cross_block_family_bank
        ),
        "second_cap_apex_surplus_family_bank": _json_sha256(
            materialized.second_cap_apex_surplus_family_bank
        ),
        "surplus_three_triad_family_bank": _json_sha256(
            materialized.surplus_three_triad_family_bank
        ),
        "zero_center_cross_block_family_bank": _json_sha256(
            materialized.zero_center_cross_block_family_bank
        ),
        "apex_zero_cross_block_family_bank": _json_sha256(
            materialized.apex_zero_cross_block_family_bank
        ),
        "apex_pair_cross_block_family_bank": _json_sha256(
            materialized.apex_pair_cross_block_family_bank
        ),
        "apex_shared_pair_cross_block_family_bank": _json_sha256(
            materialized.apex_shared_pair_cross_block_family_bank
        ),
        "apex_internal_shared_pair_common_five_family_bank": _json_sha256(
            materialized.apex_internal_shared_pair_common_five_family_bank
        ),
        "apex_first_opposite_shared_pair_common_five_family_bank": _json_sha256(
            materialized.apex_first_opposite_shared_pair_common_five_family_bank
        ),
        "source_order_bank": _json_sha256(materialized.source_order_bank),
        "source_order_installation": _json_sha256(
            materialized.source_order_installation
        ),
        "discovery_cnf": EXPECTED_FINAL_DIMACS_SHA256,
    }


def _required_artifacts_authenticated(
    artifacts: Mapping[str, Mapping[str, Any] | None],
    required: Mapping[str, str],
) -> bool:
    for name, expected_sha256 in required.items():
        artifact = artifacts.get(name)
        if not isinstance(artifact, Mapping) or artifact.get("sha256") != expected_sha256:
            return False
    return True


def run_arm_static_canary(
    repo_root: Path,
    workdir: Path,
    arm_cell_index: int = SUPPORTED_ARM_CELL_INDEX,
    *,
    timeout_seconds: int = 3_600,
    nice: int = 10,
    solver: Callable[..., CadicalResult] = solve_cadical,
    certifier: Callable[..., bool] | None = None,
) -> dict[str, Any]:
    """Materialize, solve, replay, and authenticate the frozen canary."""

    _validate_supported_arm_cell(arm_cell_index)
    if type(timeout_seconds) is not int or timeout_seconds <= 0:
        raise Exact12NextRowArmStaticCanaryError("timeout_seconds must be positive")
    if type(nice) is not int or not 1 <= nice <= 19:
        raise Exact12NextRowArmStaticCanaryError("nice must lie in [1, 19]")

    repo_root = repo_root.resolve()
    lock_path = _claim_empty_workdir(workdir)
    try:
        materialized = materialize_arm_static_canary(repo_root, arm_cell_index)
        instance = materialized.instance
        cnf_bytes = instance.dimacs().encode("ascii")
        job = _build_job(repo_root, materialized)

        job_path = workdir / "job.json"
        arm_suffix_path = workdir / "arm_suffix.json"
        membership_bank_path = workdir / "positive_membership_bank.json"
        surplus_apex_pair_family_bank_path = (
            workdir / "surplus_apex_pair_family_bank.json"
        )
        adjacent_family_bank_path = (
            workdir / "adjacent_apex_cross_block_family_bank.json"
        )
        second_cap_family_bank_path = (
            workdir / "second_cap_apex_surplus_family_bank.json"
        )
        surplus_three_triad_family_bank_path = (
            workdir / "surplus_three_triad_family_bank.json"
        )
        zero_center_cross_block_family_bank_path = (
            workdir / "zero_center_cross_block_family_bank.json"
        )
        apex_zero_cross_block_family_bank_path = (
            workdir / "apex_zero_cross_block_family_bank.json"
        )
        apex_pair_cross_block_family_bank_path = (
            workdir / "apex_pair_cross_block_family_bank.json"
        )
        apex_shared_pair_cross_block_family_bank_path = (
            workdir / "apex_shared_pair_cross_block_family_bank.json"
        )
        apex_internal_shared_pair_common_five_family_bank_path = (
            workdir / "apex_internal_shared_pair_common_five_family_bank.json"
        )
        apex_first_opposite_shared_pair_common_five_family_bank_path = (
            workdir
            / "apex_first_opposite_shared_pair_common_five_family_bank.json"
        )
        source_order_bank_path = workdir / "source_order_bank.json"
        source_order_installation_path = workdir / "source_order_installation.json"
        discovery_cnf_path = workdir / "discovery.cnf"
        terminal_cnf_path = workdir / "terminal.cnf"
        proof_path = workdir / "terminal.drat"
        survivor_path = workdir / "survivor.json"

        _write_json(job_path, job)
        _write_json(arm_suffix_path, materialized.arm_suffix)
        _write_json(membership_bank_path, materialized.positive_membership_bank)
        _write_json(
            surplus_apex_pair_family_bank_path,
            materialized.surplus_apex_pair_family_bank,
        )
        _write_json(
            adjacent_family_bank_path,
            materialized.adjacent_apex_cross_block_family_bank,
        )
        _write_json(
            second_cap_family_bank_path,
            materialized.second_cap_apex_surplus_family_bank,
        )
        _write_json(
            surplus_three_triad_family_bank_path,
            materialized.surplus_three_triad_family_bank,
        )
        _write_json(
            zero_center_cross_block_family_bank_path,
            materialized.zero_center_cross_block_family_bank,
        )
        _write_json(
            apex_zero_cross_block_family_bank_path,
            materialized.apex_zero_cross_block_family_bank,
        )
        _write_json(
            apex_pair_cross_block_family_bank_path,
            materialized.apex_pair_cross_block_family_bank,
        )
        _write_json(
            apex_shared_pair_cross_block_family_bank_path,
            materialized.apex_shared_pair_cross_block_family_bank,
        )
        _write_json(
            apex_internal_shared_pair_common_five_family_bank_path,
            materialized.apex_internal_shared_pair_common_five_family_bank,
        )
        _write_json(
            apex_first_opposite_shared_pair_common_five_family_bank_path,
            materialized.apex_first_opposite_shared_pair_common_five_family_bank,
        )
        _write_json(source_order_bank_path, materialized.source_order_bank)
        _write_json(
            source_order_installation_path,
            materialized.source_order_installation,
        )
        _write_bytes(discovery_cnf_path, cnf_bytes)

        discovery = solver(
            instance,
            discovery_cnf_path,
            timeout_seconds=timeout_seconds,
            nice=nice,
            proof_path=None,
        )
        terminal: CadicalResult | None = None
        replay = {
            "candidate": False,
            "added_constraints": False,
            "named_deletion_arm": False,
            "exact_cnf": False,
            "canonical_static_extension": False,
        }
        classification: str | None = None
        terminal_proof_authenticated = False
        status: str
        error: str | None = None

        if discovery.verdict == "SAT":
            if discovery.cube is None or discovery.positive_variables is None:
                status = "PIPELINE_ERROR"
                error = "SAT result omitted its cube or complete assignment"
            else:
                try:
                    cube, positive, replay = replay_arm_static_sat_witness(
                        materialized,
                        discovery.cube,
                        discovery.positive_variables,
                    )
                    admitted, classification, structural = (
                        detect_typed_source_order_cut(
                            instance,
                            cube,
                            source_order_bank=(materialized.prepared_source_order_bank),
                        )
                    )
                    if admitted is not None:
                        raise Exact12NextRowArmStaticCanaryError(
                            "SAT assignment violates an eagerly installed "
                            "source-order bank clause"
                        )
                    survivor = {
                        "job_id": job["job_id"],
                        "arm_cell_index": arm_cell_index,
                        "classification": classification,
                        "cube": {
                            str(center): row for center, row in sorted(cube.items())
                        },
                        "positive_variables": sorted(positive),
                        "assignment_sha256": _json_sha256(sorted(positive)),
                        "replay": replay,
                        "structural_certificate": structural,
                    }
                    _write_json(survivor_path, survivor)
                    status = "SAT_WITNESS_REPLAYED"
                except (
                    EncodingError,
                    Exact12NextRowArmStaticCanaryError,
                    Exact12NextRowStaticCegarError,
                    Exact12NextRowValuationError,
                    ValueError,
                ) as exc:
                    status = "SAT_REPLAY_FAILED"
                    error = str(exc)
        elif discovery.verdict == "UNSAT":
            _write_bytes(terminal_cnf_path, cnf_bytes)
            terminal = solver(
                instance,
                terminal_cnf_path,
                timeout_seconds=timeout_seconds,
                nice=nice,
                proof_path=proof_path,
            )
            identical_terminal = (
                terminal_cnf_path.is_file()
                and _sha256_file(terminal_cnf_path) == EXPECTED_FINAL_DIMACS_SHA256
            )
            terminal_proof_authenticated = _terminal_proof_authenticated(
                solver,
                certifier,
                instance,
                terminal_cnf_path,
                proof_path,
                terminal,
            )
            if (
                terminal.verdict == "UNSAT"
                and terminal_proof_authenticated
                and proof_path.is_file()
                and identical_terminal
            ):
                status = TERMINAL_STATUS
            else:
                status = "DISCOVERY_UNSAT_UNVERIFIED"
                error = (
                    "fresh terminal run did not reproduce a verified "
                    "byte-identical UNSAT result"
                )
        else:
            status, error = _status_from_nonterminal(discovery)

        artifacts = {
            "job": _artifact(job_path),
            "arm_suffix": _artifact(arm_suffix_path),
            "positive_membership_bank": _artifact(membership_bank_path),
            "surplus_apex_pair_family_bank": _artifact(
                surplus_apex_pair_family_bank_path
            ),
            "adjacent_apex_cross_block_family_bank": _artifact(
                adjacent_family_bank_path
            ),
            "second_cap_apex_surplus_family_bank": _artifact(
                second_cap_family_bank_path
            ),
            "surplus_three_triad_family_bank": _artifact(
                surplus_three_triad_family_bank_path
            ),
            "zero_center_cross_block_family_bank": _artifact(
                zero_center_cross_block_family_bank_path
            ),
            "apex_zero_cross_block_family_bank": _artifact(
                apex_zero_cross_block_family_bank_path
            ),
            "apex_pair_cross_block_family_bank": _artifact(
                apex_pair_cross_block_family_bank_path
            ),
            "apex_shared_pair_cross_block_family_bank": _artifact(
                apex_shared_pair_cross_block_family_bank_path
            ),
            "apex_internal_shared_pair_common_five_family_bank": _artifact(
                apex_internal_shared_pair_common_five_family_bank_path
            ),
            "apex_first_opposite_shared_pair_common_five_family_bank": _artifact(
                apex_first_opposite_shared_pair_common_five_family_bank_path
            ),
            "source_order_bank": _artifact(source_order_bank_path),
            "source_order_installation": _artifact(source_order_installation_path),
            "discovery_cnf": _artifact(discovery_cnf_path),
            "survivor": _artifact(survivor_path),
            "terminal_cnf": _artifact(terminal_cnf_path),
            "proof": _artifact(proof_path),
        }
        required = _required_artifact_hashes(job, materialized)
        if not _required_artifacts_authenticated(artifacts, required):
            status = "ARTIFACT_ERROR"
            error = "required canary artifact failed authentication"

        summary = {
            "schema": RUN_SCHEMA,
            "scope": job["scope"],
            "job_id": job["job_id"],
            "job_sha256": _json_sha256(job),
            "arm_cell_index": arm_cell_index,
            "status": status,
            "classification": classification,
            "discovery_verdict": discovery.verdict,
            "terminal_verdict": terminal.verdict if terminal else None,
            "terminal_proof_verified": (terminal.proof_verified if terminal else False),
            "terminal_proof_authenticated": terminal_proof_authenticated,
            "lean_terminal_ingress_ready": False,
            "replay": replay,
            "timeout_seconds": timeout_seconds,
            "nice": nice,
            "artifacts": artifacts,
            "error": error,
            "discovery_stdout_tail": discovery.stdout_tail,
            "terminal_stdout_tail": terminal.stdout_tail if terminal else None,
        }
        _write_json(workdir / "summary.json", summary)
        return summary
    finally:
        lock_path.unlink(missing_ok=True)


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--repo-root", type=Path, default=Path.cwd())
    parser.add_argument("--workdir", type=Path, required=True)
    parser.add_argument("--arm-cell-index", type=int, default=SUPPORTED_ARM_CELL_INDEX)
    parser.add_argument("--timeout-seconds", type=int, default=3_600)
    parser.add_argument("--nice", type=int, default=10)
    args = parser.parse_args()
    try:
        summary = run_arm_static_canary(
            args.repo_root,
            args.workdir,
            args.arm_cell_index,
            timeout_seconds=args.timeout_seconds,
            nice=args.nice,
        )
    except (
        EncodingError,
        Exact12NextRowArmStaticCanaryError,
        Exact12NextRowStaticCegarError,
        Exact12NextRowValuationError,
        OSError,
    ) as exc:
        parser.error(str(exc))
    print(json.dumps(summary, sort_keys=True, indent=2))
    return 0 if summary["status"] in SUCCESS_STATUSES else 2


if __name__ == "__main__":
    raise SystemExit(main())
