# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>

"""Strict Lean-source custody for the Rigid221 card-18 labeled projection.

This module authenticates only a frozen set of repository-local Lean source
bytes.  It does not run Lean, inspect ``.olean`` files, audit axioms, compare a
Python serialization with Lean data, invoke a solver, or make a proof claim.
"""

from __future__ import annotations

import hashlib
import json
import os
import re
import stat
from collections.abc import Mapping
from pathlib import Path, PurePosixPath
from types import MappingProxyType
from typing import Any, BinaryIO, Final

SCHEMA: Final = "p97-rigid221-card18-labeled-projection-lean-source-custody/v4"
LANE_ID_METADATA: Final = "rigid221-card18-labeled-projection-custody-v4-20260831"
LANE_BASE_HEAD_METADATA: Final = "ff935411514804caf003171164807f79d16a341e"
REPOSITORY_REVISION_METADATA: Final = LANE_BASE_HEAD_METADATA
SOURCE_SNAPSHOT_METADATA: Final = "CONTENT_ADDRESSED_LEAN_SOURCE_SET_ABOVE_LANE_BASE"

RECEIPT_SOURCE_BYTES_AUTHENTICATED: Final = True
RECEIPT_REVISION_METADATA_AUTHENTICATED: Final = False
RECEIPT_LEAN_BUILD_AUTHENTICATED: Final = False
RECEIPT_OLEAN_TREE_AUTHENTICATED: Final = False
RECEIPT_AXIOM_AUDIT_AUTHENTICATED: Final = False
RECEIPT_PYTHON_SERIALIZATION_EQUIVALENCE_AUTHENTICATED: Final = False
RECEIPT_SOLVER_AUTHENTICATED: Final = False
FROZEN_CONFIGURATION_SHA256: Final = (
    "9bb5f60c309ba2ee6a72bdf5e16ab0131e407185913f71eae338e7773c041f80"
)

LEAN_ROOT_MODULES = (
    ("Erdos9796Proof.P97.ATail.FrontierLiveClosure.Rigid221Card18LabeledProjection"),
)

# The repository-local modules supplying declarations transitively reached from
# every declaration in ``LEAN_ROOT_MODULES``.  This tuple was mined from the
# Lean kernel by ``scripts/mine_bank_lean_dependencies.py`` after a successful
# build.  It is intentionally narrower than the transitive import closure.
LEAN_DEPENDENCY_MODULES = (
    "Erdos9796Proof.P97.ATail.CardElevenUniqueFourCertificate.Support.Unique4LateChoiceTerminal.UniqueFourLateChoiceTerminal",
    "Erdos9796Proof.P97.ATail.CardElevenUniqueFourCertificate.Support.UniqueArmRouteAudit.OriginalUniqueResidualDispatch",
    "Erdos9796Proof.P97.ATail.CardElevenUniqueFourCertificate.Support.UniqueArmRouteAudit.UniqueArmDeletionNormalForm",
    "Erdos9796Proof.P97.ATail.CommonDeletionTwoCenter",
    "Erdos9796Proof.P97.ATail.CriticalPairFrontier",
    "Erdos9796Proof.P97.ATail.DeletionRobustness",
    "Erdos9796Proof.P97.ATail.ExactFourPhysicalConsumer",
    "Erdos9796Proof.P97.ATail.ExactFourRobustCapExpansion",
    "Erdos9796Proof.P97.ATail.FrontierLiveClosure.JointDeletion.Types",
    "Erdos9796Proof.P97.ATail.FrontierLiveClosure.Rigid221Card18FiniteDataExport",
    "Erdos9796Proof.P97.ATail.FrontierLiveClosure.Rigid221Card18LabeledProjection",
    "Erdos9796Proof.P97.ATail.FrontierLiveClosure.Rigid221Card18LeafExport",
    "Erdos9796Proof.P97.ATail.FrontierLiveClosure.Rigid221Placement",
    "Erdos9796Proof.P97.ATail.FrontierLiveClosure.Rigid221SourceHeavy",
    "Erdos9796Proof.P97.ATail.MinimalDeletionCore",
    "Erdos9796Proof.P97.ATail.SurvivalCover",
    "Erdos9796Proof.P97.Cap.PartitionFromMEC",
    "Erdos9796Proof.P97.Cap.Structure",
    "Erdos9796Proof.P97.MEC.Basic",
    "Erdos9796Proof.P97.Moser.Triangle",
    "Erdos9796Proof.P97.Moser.TriangleNonObtuse",
    "Erdos9796Proof.P97.U1CarrierInjection",
    "Erdos9796Proof.P97.U1TwoShortCapReduction",
    "Erdos9796Proof.P97.U5GlobalIncidenceBasic",
    "Erdos9796Proof.P97.U5ModeADeletion",
    "Erdos9796Proof.P97.WitnessPacketInterface",
)

_FROZEN_LEAN_SOURCE_MANIFEST_ROWS = (
    {
        "module": "Erdos9796Proof.P97.ATail.CardElevenUniqueFourCertificate.Support.Unique4LateChoiceTerminal.UniqueFourLateChoiceTerminal",
        "path": "lean/Erdos9796Proof/P97/ATail/CardElevenUniqueFourCertificate/Support/Unique4LateChoiceTerminal/UniqueFourLateChoiceTerminal.lean",
        "bytes": 15492,
        "sha256": "f275a2caa634d3950dfc81dd86d48f7949d54df24c6c4e88c1a16559bdac24ee",
    },
    {
        "module": "Erdos9796Proof.P97.ATail.CardElevenUniqueFourCertificate.Support.UniqueArmRouteAudit.OriginalUniqueResidualDispatch",
        "path": "lean/Erdos9796Proof/P97/ATail/CardElevenUniqueFourCertificate/Support/UniqueArmRouteAudit/OriginalUniqueResidualDispatch.lean",
        "bytes": 12283,
        "sha256": "b8f7c43a89bfbd52718f313407fbf7e41b53c71a56d9d435abc7732c2d2f5bb7",
    },
    {
        "module": "Erdos9796Proof.P97.ATail.CardElevenUniqueFourCertificate.Support.UniqueArmRouteAudit.UniqueArmDeletionNormalForm",
        "path": "lean/Erdos9796Proof/P97/ATail/CardElevenUniqueFourCertificate/Support/UniqueArmRouteAudit/UniqueArmDeletionNormalForm.lean",
        "bytes": 7582,
        "sha256": "73d7b3d9d934613273d874f82a46aee79bc9f4827fcc667e055699e754ab9468",
    },
    {
        "module": "Erdos9796Proof.P97.ATail.CommonDeletionTwoCenter",
        "path": "lean/Erdos9796Proof/P97/ATail/CommonDeletionTwoCenter.lean",
        "bytes": 5556,
        "sha256": "253737b1fb18570c031a80aae4357dbe432adda1220b20aefe3e79d8aef8c6aa",
    },
    {
        "module": "Erdos9796Proof.P97.ATail.CriticalPairFrontier",
        "path": "lean/Erdos9796Proof/P97/ATail/CriticalPairFrontier.lean",
        "bytes": 58758,
        "sha256": "2b2b381d0833292df28a1fd9d0316999a221623a23ed0cdb5f97c7f98547b959",
    },
    {
        "module": "Erdos9796Proof.P97.ATail.DeletionRobustness",
        "path": "lean/Erdos9796Proof/P97/ATail/DeletionRobustness.lean",
        "bytes": 7345,
        "sha256": "089425d468e90a515cf0dcd76e9fa633803b05ab158f345074f9df76e3394ed2",
    },
    {
        "module": "Erdos9796Proof.P97.ATail.ExactFourPhysicalConsumer",
        "path": "lean/Erdos9796Proof/P97/ATail/ExactFourPhysicalConsumer.lean",
        "bytes": 24478,
        "sha256": "207c246b1986cff1301d66d27cc51a7dbab2791ca38bf7445320ffbb0b4854ef",
    },
    {
        "module": "Erdos9796Proof.P97.ATail.ExactFourRobustCapExpansion",
        "path": "lean/Erdos9796Proof/P97/ATail/ExactFourRobustCapExpansion.lean",
        "bytes": 62683,
        "sha256": "5b353a5241f69121d1bad051137c346527be803ffc82ae7cd458b6e632896418",
    },
    {
        "module": "Erdos9796Proof.P97.ATail.FrontierLiveClosure.JointDeletion.Types",
        "path": "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/JointDeletion/Types.lean",
        "bytes": 4737,
        "sha256": "8cd091cf7b62c2236798390585e38184df8f366570b4c1d69892e01233b84587",
    },
    {
        "module": "Erdos9796Proof.P97.ATail.FrontierLiveClosure.Rigid221Card18FiniteDataExport",
        "path": "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/Rigid221Card18FiniteDataExport.lean",
        "bytes": 10540,
        "sha256": "a701180fa9f38cf5fec9029c49cea0bb03b6ae9f9741046addc8dc4cf0263a53",
    },
    {
        "module": "Erdos9796Proof.P97.ATail.FrontierLiveClosure.Rigid221Card18LabeledProjection",
        "path": "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/Rigid221Card18LabeledProjection.lean",
        "bytes": 28885,
        "sha256": "37927775bbe67598b60d49f32a45cddefea70c14f4aceccaf9dcac596baa1239",
    },
    {
        "module": "Erdos9796Proof.P97.ATail.FrontierLiveClosure.Rigid221Card18LeafExport",
        "path": "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/Rigid221Card18LeafExport.lean",
        "bytes": 18159,
        "sha256": "8de5492a0d41833932413092b7de7eb2ea224494873e7058286412d2e75a791e",
    },
    {
        "module": "Erdos9796Proof.P97.ATail.FrontierLiveClosure.Rigid221Placement",
        "path": "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/Rigid221Placement.lean",
        "bytes": 44313,
        "sha256": "49c8c3d6b8ed71c44b4f4287ce923fe63ac477432063db7875ca430753be1ea8",
    },
    {
        "module": "Erdos9796Proof.P97.ATail.FrontierLiveClosure.Rigid221SourceHeavy",
        "path": "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/Rigid221SourceHeavy.lean",
        "bytes": 907296,
        "sha256": "2f791217320ef4e3e522ab9f3cdcbb285035bd77a85d3d996a13ec2acb9c4698",
    },
    {
        "module": "Erdos9796Proof.P97.ATail.MinimalDeletionCore",
        "path": "lean/Erdos9796Proof/P97/ATail/MinimalDeletionCore.lean",
        "bytes": 13440,
        "sha256": "2c53389a26c37fa7d21ed928e5f32e51de27be56dabc4b4526f256aaa744ff75",
    },
    {
        "module": "Erdos9796Proof.P97.ATail.SurvivalCover",
        "path": "lean/Erdos9796Proof/P97/ATail/SurvivalCover.lean",
        "bytes": 17905,
        "sha256": "015941fc0b69014bd90a101d3f0b68e5fec4ec8e8b9c0e62b1e0b83c0f05851a",
    },
    {
        "module": "Erdos9796Proof.P97.Cap.PartitionFromMEC",
        "path": "lean/Erdos9796Proof/P97/Cap/PartitionFromMEC.lean",
        "bytes": 24753,
        "sha256": "69aac1234035af3fa8af657a4988a612aec3ba9c13049ddb51dde5c8d2b5144f",
    },
    {
        "module": "Erdos9796Proof.P97.Cap.Structure",
        "path": "lean/Erdos9796Proof/P97/Cap/Structure.lean",
        "bytes": 11300,
        "sha256": "c37032098ca734b3732823b68f086b864f33a605fab97f4d15fc1010f9faeb11",
    },
    {
        "module": "Erdos9796Proof.P97.MEC.Basic",
        "path": "lean/Erdos9796Proof/P97/MEC/Basic.lean",
        "bytes": 13313,
        "sha256": "f35255a6cfd027e89b35fa964269c5605d4561cdb60521d52519bc6fdf726fc4",
    },
    {
        "module": "Erdos9796Proof.P97.Moser.Triangle",
        "path": "lean/Erdos9796Proof/P97/Moser/Triangle.lean",
        "bytes": 6303,
        "sha256": "7c78d8a21f64e82cf408a3c1b2e026298d6173838f6b91484d8386f31cf2a392",
    },
    {
        "module": "Erdos9796Proof.P97.Moser.TriangleNonObtuse",
        "path": "lean/Erdos9796Proof/P97/Moser/TriangleNonObtuse.lean",
        "bytes": 36479,
        "sha256": "1c8cbee10abf2c5ab422910550a83d49c3628c88196f7f6fa5da4f9ed74ebeaa",
    },
    {
        "module": "Erdos9796Proof.P97.U1CarrierInjection",
        "path": "lean/Erdos9796Proof/P97/U1CarrierInjection.lean",
        "bytes": 77062,
        "sha256": "0763edd41bef51f9b5ca0c7d98d3178efdbe45f7ad130c723e672f6671379fc2",
    },
    {
        "module": "Erdos9796Proof.P97.U1TwoShortCapReduction",
        "path": "lean/Erdos9796Proof/P97/U1TwoShortCapReduction.lean",
        "bytes": 37220,
        "sha256": "30e455b737277a88b477e5d24fed5f2ad3e0d2af8f239ccb535bb4d892600298",
    },
    {
        "module": "Erdos9796Proof.P97.U5GlobalIncidenceBasic",
        "path": "lean/Erdos9796Proof/P97/U5GlobalIncidenceBasic.lean",
        "bytes": 44439,
        "sha256": "5e020505827935c99552c13ee10c89ab499804ed226c68700f4f65415995aca4",
    },
    {
        "module": "Erdos9796Proof.P97.U5ModeADeletion",
        "path": "lean/Erdos9796Proof/P97/U5ModeADeletion.lean",
        "bytes": 24050,
        "sha256": "22ae093b92fef64017f35718c041e606b00cc48aa433cc16faaa5bc86e30f144",
    },
    {
        "module": "Erdos9796Proof.P97.WitnessPacketInterface",
        "path": "lean/Erdos9796Proof/P97/WitnessPacketInterface.lean",
        "bytes": 19660,
        "sha256": "da61a9053f423bf45bce7d80e56f7a05c5cee334a242b9a389be3d3e20220f04",
    },
)

FROZEN_LEAN_SOURCE_MANIFEST: Final = tuple(
    MappingProxyType(record) for record in _FROZEN_LEAN_SOURCE_MANIFEST_ROWS
)
del _FROZEN_LEAN_SOURCE_MANIFEST_ROWS

_MODULE_SEGMENT: Final = re.compile(r"[A-Za-z_][A-Za-z0-9_']*")
_SHA256: Final = re.compile(r"[0-9a-f]{64}")
_RECEIPT_FIELDS: Final = frozenset(
    {
        "schema",
        "metadata",
        "lean_root_modules",
        "lean_dependency_modules",
        "lean_source_manifest",
        "authentication",
        "receipt_sha256",
    }
)
_METADATA: Final = MappingProxyType(
    {
        "lane_id": LANE_ID_METADATA,
        "lane_base_head": LANE_BASE_HEAD_METADATA,
        "repository_revision": REPOSITORY_REVISION_METADATA,
        "source_snapshot": SOURCE_SNAPSHOT_METADATA,
    }
)
RECEIPT_AUTHENTICATION_SCOPE: Final = MappingProxyType(
    {
        "lean_source_bytes_authenticated": RECEIPT_SOURCE_BYTES_AUTHENTICATED,
        "revision_metadata_authenticated": (RECEIPT_REVISION_METADATA_AUTHENTICATED),
        "lean_build_authenticated": RECEIPT_LEAN_BUILD_AUTHENTICATED,
        "olean_tree_authenticated": RECEIPT_OLEAN_TREE_AUTHENTICATED,
        "axiom_audit_authenticated": RECEIPT_AXIOM_AUDIT_AUTHENTICATED,
        "python_serialization_equivalence_authenticated": (
            RECEIPT_PYTHON_SERIALIZATION_EQUIVALENCE_AUTHENTICATED
        ),
        "solver_authenticated": RECEIPT_SOLVER_AUTHENTICATED,
    }
)
_SOURCE_RECORD_FIELDS: Final = frozenset({"module", "path", "bytes", "sha256"})


class Rigid221Card18LabeledProjectionCustodyV4Error(ValueError):
    """The frozen source set, live source tree, or receipt is malformed."""


# Private implementation references retain the copied v1 body; the v4 error
# type is the public contract and is deliberately distinct from v1.
Rigid221Card18LabeledProjectionCustodyError = (
    Rigid221Card18LabeledProjectionCustodyV4Error
)


def _module_source_path(module: str) -> str:
    if type(module) is not str:
        raise Rigid221Card18LabeledProjectionCustodyV4Error(
            "Lean dependency module is not a string"
        )
    segments = module.split(".")
    if (
        not segments
        or segments[0] != "Erdos9796Proof"
        or any(_MODULE_SEGMENT.fullmatch(segment) is None for segment in segments)
    ):
        raise Rigid221Card18LabeledProjectionCustodyError(
            f"malformed repository-local Lean module: {module!r}"
        )
    return PurePosixPath("lean", *segments).with_suffix(".lean").as_posix()


def _expected_source_manifest() -> list[dict[str, Any]]:
    return [dict(record) for record in FROZEN_LEAN_SOURCE_MANIFEST]


def frozen_labeled_projection_lean_source_manifest() -> tuple[dict[str, Any], ...]:
    """Return a mutable copy of the frozen, canonically ordered source records."""

    _assert_frozen_configuration()
    return tuple(dict(record) for record in FROZEN_LEAN_SOURCE_MANIFEST)


def _configuration_snapshot() -> dict[str, Any]:
    return {
        "schema": SCHEMA,
        "lane_metadata_constants": {
            "lane_id": LANE_ID_METADATA,
            "lane_base_head": LANE_BASE_HEAD_METADATA,
            "repository_revision": REPOSITORY_REVISION_METADATA,
            "source_snapshot": SOURCE_SNAPSHOT_METADATA,
        },
        "receipt_metadata": dict(_METADATA),
        "lean_root_modules": list(LEAN_ROOT_MODULES),
        "lean_dependency_modules": list(LEAN_DEPENDENCY_MODULES),
        "lean_source_manifest": _expected_source_manifest(),
        "authentication_boolean_constants": {
            "lean_source_bytes_authenticated": (RECEIPT_SOURCE_BYTES_AUTHENTICATED),
            "revision_metadata_authenticated": (
                RECEIPT_REVISION_METADATA_AUTHENTICATED
            ),
            "lean_build_authenticated": RECEIPT_LEAN_BUILD_AUTHENTICATED,
            "olean_tree_authenticated": RECEIPT_OLEAN_TREE_AUTHENTICATED,
            "axiom_audit_authenticated": RECEIPT_AXIOM_AUDIT_AUTHENTICATED,
            "python_serialization_equivalence_authenticated": (
                RECEIPT_PYTHON_SERIALIZATION_EQUIVALENCE_AUTHENTICATED
            ),
            "solver_authenticated": RECEIPT_SOLVER_AUTHENTICATED,
        },
        "receipt_authentication_scope": dict(RECEIPT_AUTHENTICATION_SCOPE),
        "validation_policy": {
            "module_segment_pattern": _MODULE_SEGMENT.pattern,
            "module_segment_flags": _MODULE_SEGMENT.flags,
            "sha256_pattern": _SHA256.pattern,
            "sha256_flags": _SHA256.flags,
            "receipt_fields": sorted(_RECEIPT_FIELDS),
            "source_record_fields": sorted(_SOURCE_RECORD_FIELDS),
        },
    }


def _assert_frozen_configuration() -> None:
    if (
        type(SCHEMA) is not str
        or type(LANE_ID_METADATA) is not str
        or type(LANE_BASE_HEAD_METADATA) is not str
        or type(REPOSITORY_REVISION_METADATA) is not str
        or type(SOURCE_SNAPSHOT_METADATA) is not str
        or not isinstance(_METADATA, Mapping)
        or not isinstance(RECEIPT_AUTHENTICATION_SCOPE, Mapping)
        or not isinstance(_MODULE_SEGMENT, re.Pattern)
        or not isinstance(_SHA256, re.Pattern)
        or not isinstance(_RECEIPT_FIELDS, frozenset)
        or any(type(field) is not str for field in _RECEIPT_FIELDS)
        or not isinstance(_SOURCE_RECORD_FIELDS, frozenset)
        or any(type(field) is not str for field in _SOURCE_RECORD_FIELDS)
        or any(
            type(value) is not bool
            for value in (
                RECEIPT_SOURCE_BYTES_AUTHENTICATED,
                RECEIPT_REVISION_METADATA_AUTHENTICATED,
                RECEIPT_LEAN_BUILD_AUTHENTICATED,
                RECEIPT_OLEAN_TREE_AUTHENTICATED,
                RECEIPT_AXIOM_AUDIT_AUTHENTICATED,
                RECEIPT_PYTHON_SERIALIZATION_EQUIVALENCE_AUTHENTICATED,
                RECEIPT_SOLVER_AUTHENTICATED,
            )
        )
        or any(
            type(value) is not bool for value in RECEIPT_AUTHENTICATION_SCOPE.values()
        )
    ):
        raise Rigid221Card18LabeledProjectionCustodyError(
            "frozen source-custody configuration has malformed types"
        )
    if (
        not isinstance(LEAN_ROOT_MODULES, tuple)
        or not LEAN_ROOT_MODULES
        or any(type(module) is not str for module in LEAN_ROOT_MODULES)
        or LEAN_ROOT_MODULES != tuple(sorted(LEAN_ROOT_MODULES))
        or len(LEAN_ROOT_MODULES) != len(set(LEAN_ROOT_MODULES))
    ):
        raise Rigid221Card18LabeledProjectionCustodyError(
            "Lean root modules are not duplicate-free canonical order"
        )
    if (
        not isinstance(LEAN_DEPENDENCY_MODULES, tuple)
        or not LEAN_DEPENDENCY_MODULES
        or any(type(module) is not str for module in LEAN_DEPENDENCY_MODULES)
        or LEAN_DEPENDENCY_MODULES != tuple(sorted(LEAN_DEPENDENCY_MODULES))
        or len(LEAN_DEPENDENCY_MODULES) != len(set(LEAN_DEPENDENCY_MODULES))
    ):
        raise Rigid221Card18LabeledProjectionCustodyError(
            "Lean dependency modules are not duplicate-free canonical order"
        )
    if any(module not in LEAN_DEPENDENCY_MODULES for module in LEAN_ROOT_MODULES):
        raise Rigid221Card18LabeledProjectionCustodyError(
            "Lean root module is absent from the frozen dependency set"
        )
    if len(FROZEN_LEAN_SOURCE_MANIFEST) != len(LEAN_DEPENDENCY_MODULES):
        raise Rigid221Card18LabeledProjectionCustodyError(
            "frozen Lean source manifest has the wrong length"
        )
    modules: list[str] = []
    paths: list[str] = []
    for expected_module, record in zip(
        LEAN_DEPENDENCY_MODULES,
        FROZEN_LEAN_SOURCE_MANIFEST,
        strict=True,
    ):
        if not isinstance(record, Mapping) or set(record) != _SOURCE_RECORD_FIELDS:
            raise Rigid221Card18LabeledProjectionCustodyError(
                "frozen Lean source record has malformed fields"
            )
        module = record["module"]
        path = record["path"]
        byte_count = record["bytes"]
        digest = record["sha256"]
        if (
            module != expected_module
            or path != _module_source_path(expected_module)
            or type(byte_count) is not int
            or byte_count < 0
            or type(digest) is not str
            or _SHA256.fullmatch(digest) is None
        ):
            raise Rigid221Card18LabeledProjectionCustodyError(
                "frozen Lean source record is not canonical"
            )
        modules.append(module)
        paths.append(path)
    if len(modules) != len(set(modules)) or len(paths) != len(set(paths)):
        raise Rigid221Card18LabeledProjectionCustodyError(
            "frozen Lean source manifest contains duplicate entries"
        )
    if list(zip(modules, paths, strict=True)) != sorted(
        zip(modules, paths, strict=True)
    ):
        raise Rigid221Card18LabeledProjectionCustodyError(
            "frozen Lean source manifest is not in canonical module/path order"
        )
    current_digest = _sha256_json(_configuration_snapshot())
    if (
        type(FROZEN_CONFIGURATION_SHA256) is not str
        or FROZEN_CONFIGURATION_SHA256
        != "9bb5f60c309ba2ee6a72bdf5e16ab0131e407185913f71eae338e7773c041f80"
        or current_digest
        != "9bb5f60c309ba2ee6a72bdf5e16ab0131e407185913f71eae338e7773c041f80"
    ):
        raise Rigid221Card18LabeledProjectionCustodyError(
            "frozen source-custody configuration digest drifted"
        )


def _descriptor_flags() -> tuple[int, int]:
    nofollow = getattr(os, "O_NOFOLLOW", 0)
    directory = getattr(os, "O_DIRECTORY", 0)
    nonblock = getattr(os, "O_NONBLOCK", 0)
    if (
        nofollow == 0
        or directory == 0
        or nonblock == 0
        or os.open not in os.supports_dir_fd
    ):
        raise Rigid221Card18LabeledProjectionCustodyError(
            "platform lacks descriptor-relative no-follow source custody"
        )
    close_on_exec = getattr(os, "O_CLOEXEC", 0)
    directory_flags = os.O_RDONLY | nofollow | directory | close_on_exec
    source_flags = os.O_RDONLY | nofollow | nonblock | close_on_exec
    return directory_flags, source_flags


def _open_repo_root(repo_root: Path) -> int:
    """Open a canonical repository directory without following any symlink."""

    try:
        lexical = Path(os.path.abspath(os.fspath(repo_root)))
        resolved = lexical.resolve(strict=True)
    except (OSError, RuntimeError, TypeError, ValueError) as exc:
        raise Rigid221Card18LabeledProjectionCustodyError(
            "repository root is missing or malformed"
        ) from exc
    if lexical != resolved:
        raise Rigid221Card18LabeledProjectionCustodyError(
            "repository root contains a symlink or path escape"
        )
    directory_flags, _source_flags = _descriptor_flags()
    descriptor: int | None = None
    try:
        descriptor = os.open(lexical.anchor, directory_flags)
        for component in lexical.parts[1:]:
            next_descriptor = os.open(
                component,
                directory_flags,
                dir_fd=descriptor,
            )
            previous_descriptor = descriptor
            descriptor = next_descriptor
            os.close(previous_descriptor)
        info = os.fstat(descriptor)
        if not stat.S_ISDIR(info.st_mode):
            raise Rigid221Card18LabeledProjectionCustodyError(
                "repository root is not a directory"
            )
        result = descriptor
        descriptor = None
        return result
    except Rigid221Card18LabeledProjectionCustodyError:
        raise
    except OSError as exc:
        raise Rigid221Card18LabeledProjectionCustodyError(
            "repository root is missing, non-directory, or symlinked"
        ) from exc
    finally:
        if descriptor is not None:
            try:
                os.close(descriptor)
            except OSError:
                pass


def _validate_relative_source_path(relative: str) -> tuple[str, ...]:
    if type(relative) is not str or not relative:
        raise Rigid221Card18LabeledProjectionCustodyError(
            "Lean source path is not a nonempty string"
        )
    parts = relative.split("/")
    if (
        relative.startswith("/")
        or "\\" in relative
        or "\x00" in relative
        or any(part in {"", ".", ".."} for part in parts)
        or PurePosixPath(relative).as_posix() != relative
    ):
        raise Rigid221Card18LabeledProjectionCustodyError(
            f"Lean source path escapes repository custody: {relative!r}"
        )
    return tuple(parts)


def _open_repo_source(root_descriptor: int, relative: str) -> BinaryIO:
    """Open a repository-relative regular file without following symlinks."""

    parts = _validate_relative_source_path(relative)
    directory_flags, source_flags = _descriptor_flags()
    descriptor: int | None = os.dup(root_descriptor)
    source_descriptor: int | None = None
    try:
        for component in parts[:-1]:
            next_descriptor = os.open(
                component,
                directory_flags,
                dir_fd=descriptor,
            )
            previous_descriptor = descriptor
            descriptor = next_descriptor
            os.close(previous_descriptor)
        source_descriptor = os.open(
            parts[-1],
            source_flags,
            dir_fd=descriptor,
        )
    except OSError as exc:
        raise Rigid221Card18LabeledProjectionCustodyError(
            f"Lean source is missing, nonregular, or symlinked: {relative}"
        ) from exc
    finally:
        if descriptor is not None:
            try:
                os.close(descriptor)
            except OSError:
                pass
    try:
        assert source_descriptor is not None
        info = os.fstat(source_descriptor)
        if not stat.S_ISREG(info.st_mode) or info.st_nlink != 1:
            raise Rigid221Card18LabeledProjectionCustodyError(
                f"Lean source is not a singly linked regular file: {relative}"
            )
        handle = os.fdopen(source_descriptor, "rb")
        source_descriptor = None
        return handle
    finally:
        if source_descriptor is not None:
            try:
                os.close(source_descriptor)
            except OSError:
                pass


def _source_record(
    root_descriptor: int,
    *,
    module: str,
    relative: str,
) -> dict[str, Any]:
    digest = hashlib.sha256()
    byte_count = 0
    with _open_repo_source(root_descriptor, relative) as handle:
        for chunk in iter(lambda: handle.read(1 << 20), b""):
            byte_count += len(chunk)
            digest.update(chunk)
    return {
        "module": module,
        "path": relative,
        "bytes": byte_count,
        "sha256": digest.hexdigest(),
    }


def _current_source_manifest(repo_root: Path) -> list[dict[str, Any]]:
    _assert_frozen_configuration()
    root_descriptor = _open_repo_root(repo_root)
    try:
        return [
            _source_record(
                root_descriptor,
                module=record["module"],
                relative=record["path"],
            )
            for record in FROZEN_LEAN_SOURCE_MANIFEST
        ]
    finally:
        os.close(root_descriptor)


def _canonical_json_bytes(value: Any) -> bytes:
    try:
        return json.dumps(
            value,
            sort_keys=True,
            separators=(",", ":"),
            allow_nan=False,
        ).encode("utf-8")
    except (TypeError, ValueError) as exc:
        raise Rigid221Card18LabeledProjectionCustodyError(
            "source-custody receipt is not strict JSON"
        ) from exc


def _sha256_json(value: Any) -> str:
    return hashlib.sha256(_canonical_json_bytes(value)).hexdigest()


def _receipt_body(source_manifest: list[dict[str, Any]]) -> dict[str, Any]:
    return {
        "schema": SCHEMA,
        "metadata": dict(_METADATA),
        "lean_root_modules": list(LEAN_ROOT_MODULES),
        "lean_dependency_modules": list(LEAN_DEPENDENCY_MODULES),
        "lean_source_manifest": source_manifest,
        "authentication": dict(RECEIPT_AUTHENTICATION_SCOPE),
    }


def _validate_source_manifest(manifest: Any) -> None:
    if not isinstance(manifest, list):
        raise Rigid221Card18LabeledProjectionCustodyError(
            "Lean source manifest is not a list"
        )
    modules: list[str] = []
    paths: list[str] = []
    for record in manifest:
        if not isinstance(record, dict) or set(record) != _SOURCE_RECORD_FIELDS:
            raise Rigid221Card18LabeledProjectionCustodyError(
                "Lean source manifest record has malformed fields"
            )
        module = record["module"]
        path = record["path"]
        byte_count = record["bytes"]
        digest = record["sha256"]
        if (
            type(module) is not str
            or type(path) is not str
            or type(byte_count) is not int
            or byte_count < 0
            or type(digest) is not str
            or _SHA256.fullmatch(digest) is None
        ):
            raise Rigid221Card18LabeledProjectionCustodyError(
                "Lean source manifest record has malformed values"
            )
        _validate_relative_source_path(path)
        modules.append(module)
        paths.append(path)
    if len(modules) != len(set(modules)) or len(paths) != len(set(paths)):
        raise Rigid221Card18LabeledProjectionCustodyError(
            "Lean source manifest contains duplicate module or path entries"
        )
    if list(zip(modules, paths, strict=True)) != sorted(
        zip(modules, paths, strict=True)
    ):
        raise Rigid221Card18LabeledProjectionCustodyError(
            "Lean source manifest is not in canonical module/path order"
        )
    if manifest != _expected_source_manifest():
        raise Rigid221Card18LabeledProjectionCustodyError(
            "Lean source manifest differs from the frozen source set"
        )


def validate_labeled_projection_source_custody_receipt(
    receipt: Mapping[str, Any],
) -> dict[str, Any]:
    """Validate exact fields, frozen sources, booleans, and the self-hash."""

    _assert_frozen_configuration()
    if not isinstance(receipt, Mapping):
        raise Rigid221Card18LabeledProjectionCustodyError(
            "source-custody receipt is not a mapping"
        )
    try:
        snapshot = json.loads(_canonical_json_bytes(receipt))
    except json.JSONDecodeError as exc:
        raise Rigid221Card18LabeledProjectionCustodyError(
            "source-custody receipt is not strict JSON"
        ) from exc
    if not isinstance(snapshot, dict) or set(snapshot) != _RECEIPT_FIELDS:
        raise Rigid221Card18LabeledProjectionCustodyError(
            "source-custody receipt fields are malformed"
        )
    if snapshot["schema"] != SCHEMA:
        raise Rigid221Card18LabeledProjectionCustodyError(
            "source-custody receipt schema is wrong"
        )
    if snapshot["metadata"] != dict(_METADATA):
        raise Rigid221Card18LabeledProjectionCustodyError(
            "source-custody revision metadata is wrong"
        )
    authentication = snapshot["authentication"]
    if (
        not isinstance(authentication, dict)
        or set(authentication) != set(RECEIPT_AUTHENTICATION_SCOPE)
        or any(type(value) is not bool for value in authentication.values())
        or authentication != dict(RECEIPT_AUTHENTICATION_SCOPE)
    ):
        raise Rigid221Card18LabeledProjectionCustodyError(
            "source-custody authentication scope is wrong"
        )
    root_modules = snapshot["lean_root_modules"]
    dependency_modules = snapshot["lean_dependency_modules"]
    if (
        not isinstance(root_modules, list)
        or any(type(module) is not str for module in root_modules)
        or len(root_modules) != len(set(root_modules))
        or root_modules != list(LEAN_ROOT_MODULES)
    ):
        raise Rigid221Card18LabeledProjectionCustodyError(
            "source-custody root modules are wrong, duplicated, or reordered"
        )
    if (
        not isinstance(dependency_modules, list)
        or any(type(module) is not str for module in dependency_modules)
        or len(dependency_modules) != len(set(dependency_modules))
        or dependency_modules != list(LEAN_DEPENDENCY_MODULES)
    ):
        raise Rigid221Card18LabeledProjectionCustodyError(
            "source-custody dependencies are wrong, duplicated, or reordered"
        )
    _validate_source_manifest(snapshot["lean_source_manifest"])
    claimed_digest = snapshot["receipt_sha256"]
    if type(claimed_digest) is not str or _SHA256.fullmatch(claimed_digest) is None:
        raise Rigid221Card18LabeledProjectionCustodyError(
            "source-custody receipt self-hash is malformed"
        )
    body = dict(snapshot)
    del body["receipt_sha256"]
    if claimed_digest != _sha256_json(body):
        raise Rigid221Card18LabeledProjectionCustodyError(
            "source-custody receipt self-hash is wrong"
        )
    return snapshot


def build_labeled_projection_source_custody_receipt(repo_root: Path) -> dict[str, Any]:
    """Authenticate the frozen live Lean bytes and return their strict receipt."""

    _assert_frozen_configuration()
    current_manifest = _current_source_manifest(repo_root)
    if current_manifest != _expected_source_manifest():
        raise Rigid221Card18LabeledProjectionCustodyError(
            "live Lean source bytes drifted from the frozen manifest"
        )
    body = _receipt_body(current_manifest)
    return validate_labeled_projection_source_custody_receipt(
        {**body, "receipt_sha256": _sha256_json(body)}
    )


def encode_labeled_projection_source_custody_receipt(
    receipt: Mapping[str, Any],
) -> bytes:
    """Return the only accepted canonical byte representation of a receipt."""

    return _canonical_json_bytes(
        validate_labeled_projection_source_custody_receipt(receipt)
    )


def _reject_duplicate_object_pairs(pairs: list[tuple[str, Any]]) -> dict[str, Any]:
    result: dict[str, Any] = {}
    for key, value in pairs:
        if key in result:
            raise Rigid221Card18LabeledProjectionCustodyError(
                f"duplicate JSON object key in source-custody receipt: {key!r}"
            )
        result[key] = value
    return result


def _reject_json_constant(value: str) -> None:
    raise Rigid221Card18LabeledProjectionCustodyError(
        f"invalid JSON constant in source-custody receipt: {value}"
    )


def parse_labeled_projection_source_custody_receipt(payload: bytes) -> dict[str, Any]:
    """Parse one duplicate-free receipt and require exact canonical JSON bytes."""

    _assert_frozen_configuration()
    if type(payload) is not bytes:
        raise Rigid221Card18LabeledProjectionCustodyError(
            "source-custody receipt payload is not immutable bytes"
        )
    try:
        parsed = json.loads(
            payload.decode("utf-8"),
            object_pairs_hook=_reject_duplicate_object_pairs,
            parse_constant=_reject_json_constant,
        )
    except Rigid221Card18LabeledProjectionCustodyError:
        raise
    except (UnicodeDecodeError, json.JSONDecodeError, ValueError) as exc:
        raise Rigid221Card18LabeledProjectionCustodyError(
            "source-custody receipt is not strict JSON"
        ) from exc
    if _canonical_json_bytes(parsed) != payload:
        raise Rigid221Card18LabeledProjectionCustodyError(
            "source-custody receipt is not canonical JSON"
        )
    return validate_labeled_projection_source_custody_receipt(parsed)


def attest_labeled_projection_source_custody_receipt(
    repo_root: Path,
    payload: bytes,
) -> dict[str, Any]:
    """Bind a canonical receipt to a fresh no-follow read of the live sources."""

    _assert_frozen_configuration()
    parsed = parse_labeled_projection_source_custody_receipt(payload)
    fresh = build_labeled_projection_source_custody_receipt(repo_root)
    if payload != encode_labeled_projection_source_custody_receipt(fresh):
        raise Rigid221Card18LabeledProjectionCustodyError(
            "source-custody receipt is not live-current"
        )
    return parsed


# Version-distinct public spellings.  Keep the implementation names above
# private-by-convention so callers cannot accidentally cross-attest versions.
frozen_labeled_projection_lean_source_manifest_v4 = (
    frozen_labeled_projection_lean_source_manifest
)
validate_labeled_projection_source_custody_receipt_v4 = (
    validate_labeled_projection_source_custody_receipt
)
build_labeled_projection_source_custody_receipt_v4 = (
    build_labeled_projection_source_custody_receipt
)
encode_labeled_projection_source_custody_receipt_v4 = (
    encode_labeled_projection_source_custody_receipt
)
parse_labeled_projection_source_custody_receipt_v4 = (
    parse_labeled_projection_source_custody_receipt
)
attest_labeled_projection_source_custody_receipt_v4 = (
    attest_labeled_projection_source_custody_receipt
)
