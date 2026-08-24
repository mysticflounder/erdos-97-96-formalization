"""Proof-backed exact-12 cell-6 physically-bridged class-cut bank.

Each entry is one full-row unit cut of the S1 mid-angle witness family at
the cell-6 placement ``(d, v) = (0, 3)``: a candidate four-row at an
on-class center ``z`` hosting a class pair ``{p, q}`` that ``z`` never
strictly separates in any of the 48 canonical boundary orders.  The Lean
certificate carrier is the generated module
``ExactTwelveRigid221PhysicalClassCell6PositiveCuts.lean``
(``cutEntries`` / ``physicalClassCell6Bank``), consumed by
``false_of_terminalFullMembershipNamedDeletionArmPhysicalClassBank``
with the class-radius hypothesis discharged at the source leaf by
``FrozenRoleLabeling.physicalClassRadius``.

The bank builder re-derives the cut list from the deck and the frozen
candidate surface, re-parses the byte-pinned generated Lean module, and
requires exact agreement in order and content before emitting a clause.
Installation appends the unit clauses exactly once, after the
proof-backed source-order bank, matching the Lean formula
``terminalFullMembershipNamedDeletionArmPhysicalClassDimacs``.

Finite discovery evidence only: nothing here asserts terminal UNSAT,
aggregate arm coverage, an arbitrary-cardinality lift, or live Rigid221
closure.
"""

from __future__ import annotations

import copy
import hashlib
import itertools
import json
import re
from collections.abc import Mapping
from pathlib import Path
from typing import Any, BinaryIO

from .exact12_center_exchange_all_order_common_five_membership_family_bank import (
    candidate_rows,
)
from .exact12_v14_ordered_coverage import source_boundary_orders
from .sat_encoding import CoverInstance

BANK_SCHEMA = "p97_rigid221_exact12_physical_class_cut_bank.v1"
INSTALLATION_SCHEMA = "p97_rigid221_exact12_physical_class_cut_installation.v1"
CERTIFICATE_KIND = "physical_class_witness_unit_cut"
LEAN_CONSUMER_THEOREM = (
    "Problem97.ATailFrontierLiveClosure.ExactTwelveRigid221Ingress."
    "FullMembershipPrefixTerminalConsumer."
    "false_of_terminalFullMembershipNamedDeletionArmPhysicalClassBank"
)
LEAN_BANK_MODULE = (
    "Problem97.ATailFrontierLiveClosure.ExactTwelveRigid221Ingress."
    "PhysicalClassCell6PositiveCuts"
)
LEAN_BANK_DECLARATION = "cutEntries"

APEX_LABEL = 1
DELETED_LABEL = 0
V_LABEL = 3
CLASS_LABELS = (0, 3, 6, 8, 9)
PLACEMENT_INDEX = 1
ARM_CELL_INDEX = 6

EXPECTED_DECK_ORDERS = 48
EXPECTED_ADMISSIBLE_ORDERED = 28
EXPECTED_CUT_INSTANCES = 290
EXPECTED_DISTINCT_CUTS = 229
EXPECTED_DISTINCT_PER_CENTER = {0: 21, 3: 152, 6: 28, 9: 28}
EXPECTED_COMBO_ROWS = {
    (0, 3, 6): 7, (0, 3, 8): 7, (0, 3, 9): 7,
    (0, 6, 8): 0, (0, 6, 9): 0, (0, 8, 9): 0,
    (3, 0, 6): 35, (3, 0, 8): 35, (3, 0, 9): 35,
    (3, 6, 8): 36, (3, 6, 9): 36, (3, 8, 9): 36,
    (6, 8, 9): 28, (9, 6, 8): 28,
}

LEAN_SOURCE_MANIFEST = (
    {
        "path": (
            "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/"
            "ExactTwelveRigid221FullMembershipPrefixTerminalConsumer.lean"
        ),
        "bytes": 102544,
        "sha256": (
            "dacf735432ae7d8b125160f39053bd1be03517d847693116799732c054d69f3e"
        ),
    },
    {
        "path": (
            "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/"
            "ExactTwelveRigid221PhysicalClassCell6PositiveCuts.lean"
        ),
        "bytes": 19070,
        "sha256": (
            "af0dcf4dbee492a19f235a1fe46be63c77866480b9e599279f21939b61c02b67"
        ),
    },
    {
        "path": (
            "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/"
            "ExactTwelveRigid221PhysicalClassWitnessBridge.lean"
        ),
        "bytes": 19937,
        "sha256": (
            "4c403f7500f8ce385e08a0c66efbac3a14340450686363e2f616723453bf64f7"
        ),
    },
    {
        "path": (
            "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/"
            "ExactTwelveRigid221SafeCandidate.lean"
        ),
        "bytes": 6405,
        "sha256": (
            "2d41f0fff2fe80bc5d7b5bee2e641a1db99aeab2014e67bbc3c89b79ddf8e0ca"
        ),
    },
)
_CUTS_MODULE_PATH = LEAN_SOURCE_MANIFEST[1]["path"]

_BANK_CLAIMS = {
    "semantic_status": (
        "finite exact-twelve physically-bridged class-cut ingress; no "
        "terminal UNSAT, coverage, or closure claim"
    ),
    "lean_consumer_theorem": LEAN_CONSUMER_THEOREM,
    "lean_bank_module": LEAN_BANK_MODULE,
    "lean_bank_declaration": LEAN_BANK_DECLARATION,
    "class_radius_producer": (
        "Problem97.ATailFrontierLiveClosure.ExactTwelveRigid221Ingress."
        "FrozenRoleLabeling.physicalClassRadius"
    ),
}

_BANK_FIELDS = frozenset(
    {
        "schema", "placement_index", "arm_cell_index", "apex_label",
        "deleted_label", "v_label", "class_labels", "deck_sha256",
        "lean_source_manifest", "entries", "claims", "bank_sha256",
    }
)

_INSTALLATION_ATTRIBUTE = "_exact12_physical_class_cut_installation"
_LEAN_ENTRY_PATTERN = re.compile(
    r"\(\{ center := (\d+),\s*\n?\s*support := \{([0-9, ]+)\} \},"
    r"\s*\n\s*\.witness (\d+) (\d+) (\d+)\)"
)


class Exact12PhysicalClassCutBankError(ValueError):
    """Raised when the physically-bridged class-cut bank fails authentication."""


def _canonical_json_bytes(value: Any) -> bytes:
    return json.dumps(
        value, ensure_ascii=True, sort_keys=True, separators=(",", ":")
    ).encode("ascii")


def _sha256_json(value: Any) -> str:
    return hashlib.sha256(_canonical_json_bytes(value)).hexdigest()


def _open_repo_source(repo_root: Path, relative: str) -> BinaryIO:
    path = (repo_root / relative).resolve()
    if not path.is_relative_to(repo_root):
        raise Exact12PhysicalClassCutBankError(
            f"pinned source escapes the repository: {relative}"
        )
    return path.open("rb")


def _current_lean_source_manifest(repo_root: Path) -> list[dict[str, Any]]:
    current = []
    for expected in LEAN_SOURCE_MANIFEST:
        digest = hashlib.sha256()
        byte_count = 0
        with _open_repo_source(repo_root, expected["path"]) as handle:
            for chunk in iter(lambda: handle.read(1 << 20), b""):
                byte_count += len(chunk)
                digest.update(chunk)
        record = {
            "path": expected["path"],
            "bytes": byte_count,
            "sha256": digest.hexdigest(),
        }
        if record != expected:
            raise Exact12PhysicalClassCutBankError(
                f"pinned Lean source bytes drifted: {expected['path']}"
            )
        current.append(record)
    return current


def _cyclic_triple(position: list[int], a: int, b: int, c: int) -> bool:
    pa, pb, pc = position[a], position[b], position[c]
    return (pa < pb < pc) or (pb < pc < pa) or (pc < pa < pb)


def _witness_same_side_all(
    positions: list[list[int]], z: int, p: int, q: int
) -> bool:
    return all(
        (
            _cyclic_triple(pos, APEX_LABEL, p, z)
            and _cyclic_triple(pos, APEX_LABEL, q, z)
        )
        or (
            _cyclic_triple(pos, APEX_LABEL, z, p)
            and _cyclic_triple(pos, APEX_LABEL, z, q)
        )
        for pos in positions
    )


def _deck_positions() -> tuple[list[list[int]], str]:
    orders = [tuple(order) for _orientation, order in source_boundary_orders()]
    if len(orders) != EXPECTED_DECK_ORDERS or any(
        sorted(order) != list(range(12)) for order in orders
    ):
        raise Exact12PhysicalClassCutBankError(
            "canonical deck does not carry 48 permutations of the 12 labels"
        )
    positions = []
    for order in orders:
        position = [0] * 12
        for index, label in enumerate(order):
            position[label] = index
        positions.append(position)
    deck_sha = hashlib.sha256(
        json.dumps([list(order) for order in orders]).encode()
    ).hexdigest()
    return positions, deck_sha


def _derived_cuts() -> tuple[list[tuple[int, tuple[int, ...], int, int, int]], str]:
    """The frozen derivation: (center, support, z, p, q) in emission order."""

    positions, deck_sha = _deck_positions()
    admissible = [
        (z, p, q)
        for z, p, q in itertools.permutations(CLASS_LABELS, 3)
        if _witness_same_side_all(positions, z, p, q)
    ]
    if len(admissible) != EXPECTED_ADMISSIBLE_ORDERED:
        raise Exact12PhysicalClassCutBankError(
            "admissible ordered witness triples drifted from the frozen count"
        )
    combos = sorted({(z, min(p, q), max(p, q)) for z, p, q in admissible})
    combo_rows: dict[tuple[int, int, int], int] = {}
    instances = 0
    chosen: dict[tuple[int, int], tuple[int, tuple[int, ...], int, int, int]] = {}
    for z, p, q in combos:
        rows = list(candidate_rows(z))
        hosting = [
            (index, row)
            for index, row in enumerate(rows)
            if p in row and q in row
        ]
        combo_rows[(z, p, q)] = len(hosting)
        instances += len(hosting)
        for index, row in hosting:
            chosen.setdefault((z, index), (z, tuple(row), z, p, q))
    cuts = [chosen[key] for key in sorted(chosen)]
    per_center: dict[int, int] = {}
    for center, _support, _z, _p, _q in cuts:
        per_center[center] = per_center.get(center, 0) + 1
    if (
        combo_rows != EXPECTED_COMBO_ROWS
        or instances != EXPECTED_CUT_INSTANCES
        or len(cuts) != EXPECTED_DISTINCT_CUTS
        or per_center != EXPECTED_DISTINCT_PER_CENTER
    ):
        raise Exact12PhysicalClassCutBankError(
            "class-cut expansion drifted from the frozen distribution"
        )
    return cuts, deck_sha


def _lean_cut_entries(repo_root: Path) -> list[tuple[int, tuple[int, ...], int, int, int]]:
    """Parse the byte-pinned generated module's ``cutEntries`` list."""

    with _open_repo_source(repo_root, _CUTS_MODULE_PATH) as handle:
        payload = handle.read()
    if (
        len(payload) != LEAN_SOURCE_MANIFEST[1]["bytes"]
        or hashlib.sha256(payload).hexdigest() != LEAN_SOURCE_MANIFEST[1]["sha256"]
    ):
        raise Exact12PhysicalClassCutBankError(
            "generated class-cut Lean module bytes drifted from the pin"
        )
    entries = [
        (
            int(center),
            tuple(int(label) for label in support.split(",")),
            int(z),
            int(p),
            int(q),
        )
        for center, support, z, p, q in _LEAN_ENTRY_PATTERN.findall(
            payload.decode("utf-8")
        )
    ]
    if len(entries) != EXPECTED_DISTINCT_CUTS:
        raise Exact12PhysicalClassCutBankError(
            "generated class-cut Lean module does not carry the frozen cut count"
        )
    return entries


def build_physical_class_cut_bank(
    repo_root: Path, instance: CoverInstance
) -> dict[str, Any]:
    """Derive, authenticate, and emit the proof-backed class-cut bank."""

    repo_root = repo_root.resolve()
    if instance.model.cardinality != 12:
        raise Exact12PhysicalClassCutBankError(
            "physical class-cut bank is exact-cardinality 12"
        )
    lean_sources = _current_lean_source_manifest(repo_root)
    derived, deck_sha = _derived_cuts()
    if _lean_cut_entries(repo_root) != derived:
        raise Exact12PhysicalClassCutBankError(
            "generated Lean cutEntries disagree with the frozen derivation"
        )
    entries = []
    for index, (center, support, z, p, q) in enumerate(derived):
        if tuple(instance.candidates[center]).count(support) != 1:
            raise Exact12PhysicalClassCutBankError(
                "hosted row is not a unique frozen candidate"
            )
        candidate_index = instance.candidates[center].index(support)
        variable = instance.choice_variables[(center, candidate_index)]
        entries.append(
            {
                "index": index,
                "certificate_kind": CERTIFICATE_KIND,
                "witness": {"z": z, "p": p, "q": q},
                "center": center,
                "support": list(support),
                "candidate_index": candidate_index,
                "learned_clause": [-variable],
                "generated_lean_nogood": {
                    "module": LEAN_BANK_MODULE,
                    "declaration": LEAN_BANK_DECLARATION,
                    "entry_index": index,
                    "source_path": _CUTS_MODULE_PATH,
                    "source_bytes": LEAN_SOURCE_MANIFEST[1]["bytes"],
                    "source_sha256": LEAN_SOURCE_MANIFEST[1]["sha256"],
                },
            }
        )
    body = {
        "schema": BANK_SCHEMA,
        "placement_index": PLACEMENT_INDEX,
        "arm_cell_index": ARM_CELL_INDEX,
        "apex_label": APEX_LABEL,
        "deleted_label": DELETED_LABEL,
        "v_label": V_LABEL,
        "class_labels": list(CLASS_LABELS),
        "deck_sha256": deck_sha,
        "lean_source_manifest": lean_sources,
        "entries": entries,
        "claims": dict(_BANK_CLAIMS),
    }
    return {**body, "bank_sha256": _sha256_json(body)}


def attest_physical_class_cut_bank_live_sources(
    repo_root: Path, bank: Mapping[str, Any]
) -> None:
    """Bind a bank snapshot to the current no-follow source bytes."""

    if bank.get("lean_source_manifest") != _current_lean_source_manifest(
        repo_root.resolve()
    ):
        raise Exact12PhysicalClassCutBankError(
            "physical class-cut bank Lean sources are not live-current"
        )


def snapshot_physical_class_cut_bank(
    repo_root: Path, instance: CoverInstance, bank: Mapping[str, Any]
) -> dict[str, Any]:
    """Freeze and fully recompile one caller-supplied class-cut bank."""

    if not isinstance(bank, Mapping):
        raise Exact12PhysicalClassCutBankError("class-cut bank is not a mapping")
    try:
        snapshot = json.loads(_canonical_json_bytes(bank))
    except (TypeError, ValueError) as exc:
        raise Exact12PhysicalClassCutBankError(
            "class-cut bank is not strict canonical JSON"
        ) from exc
    if not isinstance(snapshot, dict) or set(snapshot) != _BANK_FIELDS:
        raise Exact12PhysicalClassCutBankError(
            "class-cut bank fields are malformed"
        )
    claimed_sha256 = snapshot.pop("bank_sha256")
    if (
        not isinstance(claimed_sha256, str)
        or claimed_sha256 != _sha256_json(snapshot)
    ):
        raise Exact12PhysicalClassCutBankError(
            "class-cut bank digest authentication failed"
        )
    frozen = {**snapshot, "bank_sha256": claimed_sha256}
    expected = build_physical_class_cut_bank(repo_root, instance)
    if _canonical_json_bytes(frozen) != _canonical_json_bytes(expected):
        raise Exact12PhysicalClassCutBankError(
            "class-cut bank failed exact recompilation"
        )
    return frozen


def install_physical_class_cut_bank(
    repo_root: Path,
    instance: CoverInstance,
    bank: Mapping[str, Any],
    *,
    require_source_order_installed: bool = True,
) -> dict[str, Any]:
    """Append the authenticated unit-cut suffix exactly once, after the
    source-order bank, matching the Lean terminal formula order."""

    frozen = snapshot_physical_class_cut_bank(repo_root, instance, bank)
    if hasattr(instance, _INSTALLATION_ATTRIBUTE):
        raise Exact12PhysicalClassCutBankError(
            "physical class-cut bank is already installed"
        )
    if require_source_order_installed and not hasattr(
        instance, "_proof_backed_source_order_bank_installation"
    ):
        raise Exact12PhysicalClassCutBankError(
            "physical class-cut bank must install after the source-order bank"
        )
    clauses = tuple(
        tuple(entry["learned_clause"]) for entry in frozen["entries"]
    )
    if len(clauses) != len(set(clauses)):
        raise Exact12PhysicalClassCutBankError(
            "class-cut clauses are duplicated"
        )
    existing = set(instance.cnf.clauses)
    if any(clause in existing for clause in clauses):
        raise Exact12PhysicalClassCutBankError(
            "class-cut clause already occurs in the base formula"
        )
    base_n_variables = instance.cnf.n_variables
    base_n_clauses = len(instance.cnf.clauses)
    base_cnf_sha256 = _sha256_json(
        [list(clause) for clause in instance.cnf.clauses]
    )
    original_clauses = instance.cnf.clauses
    marker_installed = False
    try:
        instance.cnf.clauses = list(original_clauses)
        for clause in clauses:
            instance.cnf.add_clause(clause)
        body = {
            "schema": INSTALLATION_SCHEMA,
            "bank_sha256": frozen["bank_sha256"],
            "base_n_variables": base_n_variables,
            "base_n_clauses": base_n_clauses,
            "base_cnf_sha256": base_cnf_sha256,
            "suffix_n_clauses": len(clauses),
            "suffix_sha256": _sha256_json([list(clause) for clause in clauses]),
            "final_n_variables": instance.cnf.n_variables,
            "final_n_clauses": len(instance.cnf.clauses),
            "final_cnf_sha256": _sha256_json(
                [list(clause) for clause in instance.cnf.clauses]
            ),
        }
        installation = {**body, "installation_sha256": _sha256_json(body)}
        setattr(
            instance, _INSTALLATION_ATTRIBUTE, copy.deepcopy(installation)
        )
        marker_installed = True
        return installation
    except BaseException as exc:
        try:
            instance.cnf.clauses = original_clauses
            if marker_installed:
                delattr(instance, _INSTALLATION_ATTRIBUTE)
        except (AttributeError, TypeError) as rollback_exc:  # pragma: no cover
            exc.add_note(
                f"class-cut installation rollback also failed: {rollback_exc!r}"
            )
        raise


def attest_physical_class_cut_bank_installed(
    instance: CoverInstance, bank: Mapping[str, Any]
) -> dict[str, Any]:
    """Recheck the recorded installation against the live instance."""

    installation = getattr(instance, _INSTALLATION_ATTRIBUTE, None)
    if not isinstance(installation, dict):
        raise Exact12PhysicalClassCutBankError(
            "physical class-cut bank is not installed"
        )
    body = {
        key: value
        for key, value in installation.items()
        if key != "installation_sha256"
    }
    if (
        installation.get("installation_sha256") != _sha256_json(body)
        or installation.get("bank_sha256") != bank.get("bank_sha256")
        or installation.get("final_n_variables") != instance.cnf.n_variables
        or installation.get("final_n_clauses") != len(instance.cnf.clauses)
        or installation.get("final_cnf_sha256")
        != _sha256_json([list(clause) for clause in instance.cnf.clauses])
    ):
        raise Exact12PhysicalClassCutBankError(
            "physical class-cut installation attestation failed"
        )
    return copy.deepcopy(installation)
