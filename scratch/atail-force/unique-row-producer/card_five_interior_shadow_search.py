#!/usr/bin/env python3
"""Narrow finite-shadow search for the exact-card-five interior branch.

This is a theorem-discovery search, not a proof checker.  It adds one exact
five-point first-apex class to the existing cap/incidence row model, retains
all three points in the strict interior of the first non-surplus cap, and
asks whether some distinct-blocker pair can evade
``CardFiveCapOrMutualFields``.  It enumerates all three possible interior
pairs; it does not infer unary second-apex survival from a shared K4 row.

The first apex is omitted from the global rows: its unique K4 radius is the
pinned five-point class.  Every other carrier center receives one four-point
subset of a K4 class from the already checked local candidate bank.  Only
the two rows chosen as critical-shell blockers are marked exact.

2026-07-15: adds the kernel-checked T1 localization cut
(``interior_pair_bisector_localization_ok``): every non-apex row center
whose support contains a strict-interior five-class pair must itself lie in
the O1 strict interior.

2026-07-15 (later): adds two OPT-IN candidate cuts, both {{NEEDS_PROOF}} —
discovery experiments only, never on by default and never part of a
recorded UNSAT claim unless explicitly labeled conditional:

- ``--cut-surplus-blocker``: no interior source's critical-shell blocker
  center lies in the surplus cap (kills the 555 witness class sig
  ``d48af6a7`` and half of 654's ``fa87f604``);
- ``--cut-pair-member-blocker``: no frontier pair member is the other
  member's blocker center (kills the other half of ``fa87f604``).
"""

from __future__ import annotations

import argparse
import hashlib
import importlib.util
import itertools
import json
import sys
import subprocess
from pathlib import Path
from collections import Counter, defaultdict
from dataclasses import dataclass
from typing import Mapping, Sequence

from census.global_confinement import shadow
from census.global_confinement import metric_realizability_probe as formal_metric
from census.multi_center import multi_center_census as mc


PROFILES = ((5, 5, 4), (6, 5, 4), (5, 5, 5))
FIRST_APEX = 1
MAX_NODES_PER_CARD_FIVE_ROW = 500_000
ROOT = Path(__file__).resolve().parents[3]
METRIC_ORACLE_PATH = (
    ROOT / "scratch/atail-force/second_center_metric_oracle/oracle.py"
)
REAL_INFEASIBLE_ROW_SIGNATURES = {
    "e7c77f73295e95076090e541b2296c9af3db7e3205f94c5aacdfeeec4f96d325": {
        "equality_sha256":
            "2476ead343e748e4edb2147ea81c03ed94280245cd82ea7dd7128eff4ed06750",
        "certificate_sha256":
            "6a37fbfdf3d55c11bba07837bf371441867bc357e5e4ee0806c43d593b383778",
        "impossible_polynomial": "4*x10y^2+1",
    },
    "dd5836b2e64e331bbc0ce45088ce7b787c19ebc1e8d6e59bbf53c89dc6095aae": {
        "equality_sha256":
            "e6f94a81ddab0caba870d6e3de16702b636894fbebcc4054164c84b80a431619",
        "exact_cas_status": "CROSSCHECKED_UNIT",
        "retained_unit_core_centers": [1, 3, 7, 8, 9, 11],
        "retained_unit_core_equality_count": 19,
    },
    "a5abb26a390d5388e074c9f2e1dc883fbe470dd596f0e3d304702ff1d508e745": {
        "equality_sha256":
            "ae4fcbc1eb69a658cd5f2e289480c6d03d52334b459c12abcbf203878aed3e36",
        "exact_cas_status": "CROSSCHECKED_UNIT",
        "retained_unit_core_centers": [1, 3, 7, 8, 9, 11],
        "retained_unit_core_equality_count": 19,
    },
    "5d50ba41a0eecf6eff28f2b0c9242d284579bee001b75b9ac85966a501c0bf1a": {
        "equality_sha256":
            "4ecd78336ade88fe8563583f6f89c65cefcb80eced0ea384975248b2663c4d31",
        "exact_cas_status": "CROSSCHECKED_UNIT",
        "retained_unit_core_centers": [1, 4, 7, 8, 10, 11],
        "retained_unit_core_equality_count": 19,
    },
    "4a3306baa4a7918c4fcbc731d90dc2ace51d2fa8de6d168fc5aed72675e96ec4": {
        "equality_sha256":
            "93da42a835707706d89dbaaae3c775a03f4525d354f7ad36e56d237877384d27",
        "exact_cas_status": "CROSSCHECKED_UNIT",
        "retained_unit_core_centers": [1, 5, 7, 8, 11],
        "retained_unit_core_equality_count": 16,
    },
    "0ff842a2ecb167cc275d14943377990b1103fb1b7a7080c8bc4143e36c45822f": {
        "equality_sha256":
            "6b9a71d7ca0c5b4d0498fafb76ed77173b770eef5016750ce8b6f483b51a787d",
        "exact_cas_status": "CROSSCHECKED_UNIT",
        "retained_unit_core_centers": [1, 5, 7, 8, 11],
        "retained_unit_core_equality_count": 16,
    },
    "0785ced6ae4772975908644ebe4f2f7864234f666b65a50d9ab955d4e9606691": {
        "equality_sha256":
            "b684bcbd4b4ffc529fd346dcb667e4e3fca03847c694b55e33b4fe74acc2ae94",
        "exact_cas_status": "CROSSCHECKED_REAL_INFEASIBLE_MEMBERSHIP",
        "impossible_polynomial": "4*x11y^2+1",
        "msolve_reduced_basis_membership": True,
        "singular_direct_reduction": "0",
        "cofactor_certificate": "TIMEOUT_NO_VERDICT",
    },
    "292e28f066e8c83668f0e23d712951e6a18fb937d0cde9ff36fd40910030429a": {
        "equality_sha256":
            "d6f7f1bfcda9ef706cd2e477e62de1e531475681fc7e07093decd93b6b82ee79",
        "exact_cas_status": "CROSSCHECKED_UNIT",
        "retained_unit_core_centers": [0, 2, 4, 10, 11],
        "retained_unit_core_equality_count": 15,
    },
    "e42297887c4e8b57c86e70d42dfc7fe6886aa4a6efc259cca24328538e1296de": {
        "equality_sha256":
            "875cf77cadd24ee331bcc8f6621fa45b0d05112047cfec81458be2ecd23062c4",
        "exact_cas_status": "MSOLVE_TWO_ORDER_REAL_INFEASIBLE",
        "forward_impossible_polynomial": "4*x8y^2+1",
        "reverse_impossible_polynomial": "4*x5x^2-6*x5x+3",
        "singular_direct_reduction": "TIMEOUT_NO_VERDICT",
        "cofactor_certificate": "NOT_EXTRACTED",
    },
    "02a093526e5f2bd4649839f90ca61cb00bdf44f91986456dea766fef2e923fa6": {
        "equality_sha256":
            "9584d576f96f5acb96b12eaf801f03dae58a1bcf28be9202de6757748bfb8f63",
        "exact_cas_status": "CROSSCHECKED_UNIT",
        "retained_unit_core_centers": [0, 2, 7, 8, 10, 11],
        "retained_unit_core_equality_count": 18,
    },
    "88df1f3c84bb4deb4679eedb87d7665dbbd0ec5120f90c763eaba7e71ff1833f": {
        "equality_sha256":
            "8c28f0efcb09ef9b9ab53c628e7d30d24fa6153ffb7c0e22b265e0556580f7b6",
        "exact_cas_status": "CROSSCHECKED_UNIT",
        "retained_unit_core_centers": [1, 2, 9, 10, 11],
        "retained_unit_core_equality_count": 16,
    },
    "cce940580a9259b35be7490be5503fe8b20c738914e54ca2eb0ba0a308ddcfb8": {
        "equality_sha256":
            "ba4a48cff181a73cbd5a8e78cb09dc9e630af83c75405e76f6108c853828089c",
        "exact_cas_status": "CROSSCHECKED_UNIT",
        "retained_unit_core_centers": [1, 2, 8, 9, 10, 11],
        "retained_unit_core_equality_count": 19,
    },
    "3eb60bb470d951b31faa3c739d8f79f7a6692d90f9d2ca3236b35b961efa749f": {
        "equality_sha256":
            "6d78b24936645ccfbaa706b6f94520bec4b5f1148c20ebabf4b1384a971f1030",
        "exact_cas_status": "CROSSCHECKED_UNIT",
        "retained_unit_core_centers": [1, 2, 8, 10, 11],
        "retained_unit_core_equality_count": 16,
    },
    "931934c22cd8d9981306090a0b4170345224368dbfcbb2d1dcf5e4626e4a9849": {
        "equality_sha256":
            "d0c3e1e3a0eae06200d695420266d5bdc4f9b18338c3a5adc3eaf13918cbdd74",
        "exact_cas_status": "CROSSCHECKED_UNIT",
        "retained_unit_core_centers": [1, 2, 8, 9, 10, 11],
        "retained_unit_core_equality_count": 19,
    },
    # 654 frontier witness admitted 2026-07-15: every complex realization
    # collapses the frontier pair (7,8).  Certified by
    # membership_crosscheck.py — Singular direct reduction 0 plus
    # Rabinowitsch UNIT in Singular and msolve (both variable orders).
    "fa87f604922173831bb083493f596949ef6e81a57b94a0635616e1efdd3c845b": {
        "equality_sha256":
            "574867866a5e7661b73b201e510ff83726e41fec5a7520795d003d78ad40cad7",
        "exact_cas_status": "CROSSCHECKED_REAL_INFEASIBLE_MEMBERSHIP",
        "forced_zero_squared_distance_pair": [7, 8],
        "singular_direct_reduction": "0",
        "msolve_rabinowitsch_radical_membership": True,
    },
}

# Literal subrow cuts extracted by exact characteristic-zero row deletion.
# Each subrow system is CROSSCHECKED_UNIT in Singular and in msolve under
# both forward and reverse variable orders after fixing the distinct labels
# 0=(0,0), 1=(1,0).  Thus any complete assignment containing one of these
# cores is complex-infeasible, independently of its remaining rows.
REAL_INFEASIBLE_ROW_CORES = (
    # 555 frontier witness d48af6a7… admitted 2026-07-15: bounded row
    # deletion of the CROSSCHECKED_UNIT 12-row system retained this 7-row
    # core (itself CROSSCHECKED_UNIT); both surplus-cap blocker rows were
    # deleted.  Not confirmed irredundant (two deletion attempts timed out).
    {
        "id": "unit-core-555-01",
        "rows": {
            0: frozenset({1, 2, 3, 4}),
            1: frozenset({0, 2, 6, 7, 8}),
            7: frozenset({4, 6, 8, 9}),
            8: frozenset({0, 7, 9, 10}),
            9: frozenset({0, 3, 5, 10}),
            10: frozenset({3, 7, 9, 11}),
            11: frozenset({1, 5, 8, 10}),
        },
        "equality_count": 22,
    },
    # 555 iteration-1 witness e93c0b50… admitted 2026-07-15: same shape —
    # CROSSCHECKED_UNIT 12-row system, 7-row retained core (itself
    # CROSSCHECKED_UNIT), blocker rows deleted, not confirmed irredundant.
    {
        "id": "unit-core-555-02",
        "rows": {
            0: frozenset({1, 2, 3, 4}),
            1: frozenset({0, 2, 6, 7, 8}),
            7: frozenset({0, 3, 6, 9}),
            8: frozenset({0, 7, 10, 11}),
            9: frozenset({0, 3, 5, 10}),
            10: frozenset({4, 6, 9, 11}),
            11: frozenset({1, 5, 6, 10}),
        },
        "equality_count": 22,
    },
    # 555 iteration-2 witness c6557e4d… admitted 2026-07-15: same audit
    # shape (CROSSCHECKED_UNIT system and retained core, not confirmed
    # irredundant).
    {
        "id": "unit-core-555-03",
        "rows": {
            0: frozenset({1, 2, 3, 4}),
            1: frozenset({0, 2, 6, 7, 8}),
            5: frozenset({1, 2, 9, 11}),
            8: frozenset({0, 4, 5, 7}),
            9: frozenset({0, 3, 5, 10}),
            10: frozenset({4, 8, 9, 11}),
            11: frozenset({1, 5, 8, 10}),
        },
        "equality_count": 22,
    },
    # 555 iteration-3 witness 1560c698… admitted 2026-07-15: 6-row
    # retained core, CROSSCHECKED_UNIT system and core.
    {
        "id": "unit-core-555-04",
        "rows": {
            0: frozenset({1, 2, 3, 4}),
            1: frozenset({0, 2, 6, 7, 8}),
            6: frozenset({2, 5, 7, 9}),
            8: frozenset({0, 4, 6, 9}),
            9: frozenset({0, 4, 10, 11}),
            10: frozenset({1, 5, 8, 9}),
        },
        "equality_count": 19,
    },
    # 555 iteration-4 witness 3d9a6b04… admitted 2026-07-15: first
    # witness off the {0,2,6,7,8} apex row; 6-row retained core,
    # CROSSCHECKED_UNIT system and core.
    {
        "id": "unit-core-555-05",
        "rows": {
            0: frozenset({1, 2, 3, 5}),
            1: frozenset({0, 5, 6, 7, 8}),
            3: frozenset({1, 4, 5, 9}),
            9: frozenset({1, 4, 7, 11}),
            10: frozenset({3, 8, 9, 11}),
            11: frozenset({0, 3, 4, 10}),
        },
        "equality_count": 19,
    },
    # 555 iteration-5 witness a94caeaf… admitted 2026-07-15: apex row
    # {2,6,7,8,10}; first retained core with NO apex row (7 non-apex
    # rows, 21 equalities), CROSSCHECKED_UNIT system and core.
    {
        "id": "unit-core-555-06",
        "rows": {
            0: frozenset({1, 3, 4, 8}),
            3: frozenset({0, 4, 6, 11}),
            6: frozenset({4, 5, 7, 9}),
            7: frozenset({0, 3, 6, 8}),
            9: frozenset({4, 7, 10, 11}),
            10: frozenset({5, 6, 9, 11}),
            11: frozenset({0, 1, 5, 7}),
        },
        "equality_count": 21,
    },
    # 555 iteration-6 witness aab3e0b5… admitted 2026-07-15: inline
    # Singular audit timed out (msolve UNIT x2); settled at 900 s via
    # system_unit_recheck.py, CROSSCHECKED_UNIT system and core; again
    # no apex row in the retained core.
    {
        "id": "unit-core-555-07",
        "rows": {
            0: frozenset({1, 4, 5, 7}),
            3: frozenset({0, 4, 6, 11}),
            4: frozenset({1, 5, 8, 11}),
            7: frozenset({0, 3, 5, 8}),
            9: frozenset({3, 4, 8, 10}),
            10: frozenset({0, 3, 7, 11}),
            11: frozenset({1, 3, 6, 9}),
        },
        "equality_count": 21,
    },
    {
        "id": "unit-core-654-02",
        "rows": {
            1: frozenset({0, 4, 7, 8, 9}),
            3: frozenset({1, 5, 6, 7}),
            7: frozenset({2, 6, 9, 11}),
            8: frozenset({1, 3, 7, 9}),
            9: frozenset({0, 2, 3, 4}),
            11: frozenset({1, 4, 6, 10}),
        },
        "equality_count": 19,
    },
    {
        "id": "unit-core-654-03",
        "rows": {
            1: frozenset({0, 4, 7, 8, 9}),
            3: frozenset({1, 5, 6, 7}),
            7: frozenset({2, 6, 9, 11}),
            8: frozenset({1, 3, 7, 9}),
            9: frozenset({0, 3, 4, 5}),
            11: frozenset({1, 4, 6, 10}),
        },
        "equality_count": 19,
    },
    {
        "id": "unit-core-654-04",
        "rows": {
            1: frozenset({0, 4, 7, 8, 9}),
            4: frozenset({2, 3, 8, 10}),
            7: frozenset({2, 6, 9, 11}),
            8: frozenset({1, 3, 7, 9}),
            10: frozenset({1, 2, 5, 9}),
            11: frozenset({1, 4, 6, 10}),
        },
        "equality_count": 19,
    },
    {
        "id": "unit-core-654-05",
        "rows": {
            1: frozenset({0, 5, 7, 8, 9}),
            5: frozenset({4, 6, 9, 11}),
            7: frozenset({2, 5, 8, 11}),
            8: frozenset({1, 3, 5, 9}),
            11: frozenset({1, 6, 7, 10}),
        },
        "equality_count": 16,
    },
    {
        "id": "unit-core-654-06",
        "rows": {
            1: frozenset({0, 5, 7, 8, 9}),
            5: frozenset({4, 6, 9, 11}),
            7: frozenset({2, 6, 8, 11}),
            8: frozenset({1, 3, 5, 9}),
            11: frozenset({1, 6, 7, 10}),
        },
        "equality_count": 16,
    },
    {
        "id": "unit-core-654-08",
        "rows": {
            0: frozenset({1, 2, 3, 4}),
            2: frozenset({0, 1, 10, 11}),
            4: frozenset({3, 6, 7, 11}),
            10: frozenset({0, 4, 6, 11}),
            11: frozenset({1, 5, 6, 10}),
        },
        "equality_count": 15,
    },
    {
        "id": "unit-core-654-10",
        "rows": {
            0: frozenset({1, 2, 3, 4}),
            2: frozenset({0, 1, 10, 11}),
            7: frozenset({3, 6, 8, 11}),
            8: frozenset({4, 6, 7, 10}),
            10: frozenset({0, 5, 7, 11}),
            11: frozenset({0, 1, 6, 8}),
        },
        "equality_count": 18,
    },
    {
        "id": "unit-core-654-11",
        "rows": {
            1: frozenset({0, 2, 7, 8, 9}),
            2: frozenset({0, 1, 10, 11}),
            9: frozenset({0, 2, 3, 4}),
            10: frozenset({5, 6, 9, 11}),
            11: frozenset({1, 4, 9, 10}),
        },
        "equality_count": 16,
    },
    {
        "id": "unit-core-654-12",
        "rows": {
            1: frozenset({0, 2, 7, 8, 9}),
            2: frozenset({0, 1, 10, 11}),
            8: frozenset({0, 2, 3, 4}),
            9: frozenset({0, 5, 6, 8}),
            10: frozenset({3, 6, 9, 11}),
            11: frozenset({1, 4, 8, 10}),
        },
        "equality_count": 19,
    },
    {
        "id": "unit-core-654-13",
        "rows": {
            1: frozenset({0, 2, 7, 8, 9}),
            2: frozenset({0, 1, 10, 11}),
            8: frozenset({2, 6, 9, 11}),
            10: frozenset({1, 3, 5, 8}),
            11: frozenset({1, 4, 9, 10}),
        },
        "equality_count": 16,
    },
    {
        "id": "unit-core-654-14",
        "rows": {
            1: frozenset({0, 2, 7, 8, 9}),
            2: frozenset({0, 1, 10, 11}),
            8: frozenset({3, 6, 7, 9}),
            9: frozenset({0, 2, 3, 5}),
            10: frozenset({0, 1, 3, 4}),
            11: frozenset({1, 5, 8, 10}),
        },
        "equality_count": 19,
    },
)


@dataclass(frozen=True)
class Witness:
    profile: tuple[int, int, int]
    card_five_support: frozenset[int]
    rows: Mapping[int, frozenset[int]]
    pair_sources: tuple[int, int]
    blocker_map: Mapping[int, int]
    nodes: int


def load_metric_oracle():
    spec = importlib.util.spec_from_file_location(
        "card_five_interior_metric_oracle", METRIC_ORACLE_PATH
    )
    require(spec is not None and spec.loader is not None,
            "metric oracle import failed")
    module = importlib.util.module_from_spec(spec)
    sys.modules[spec.name] = module
    spec.loader.exec_module(module)
    return module


def require(condition: bool, message: str) -> None:
    if not condition:
        raise AssertionError(message)


def row_signature_sha256(
    pseudo: shadow.ClassRow, rows: Sequence[shadow.ClassRow]
) -> str:
    """Canonical no-good key for an apex row plus one row at every center."""

    payload = [
        [row.center, sorted(row.support)]
        for row in sorted((pseudo, *rows), key=lambda row: row.center)
    ]
    return hashlib.sha256(
        json.dumps(payload, separators=(",", ":")).encode("utf-8")
    ).hexdigest()


def real_infeasible_row_core(
    pseudo: shadow.ClassRow, rows: Sequence[shadow.ClassRow]
) -> Mapping[str, object] | None:
    """Return a trusted exact-CAS unit subcore contained in these rows."""

    row_map = {row.center: row.support for row in (pseudo, *rows)}
    for core in REAL_INFEASIBLE_ROW_CORES:
        core_rows = core["rows"]
        if all(row_map.get(center) == support
               for center, support in core_rows.items()):
            return core
    return None


def card_five_candidates(frame: mc.Frame) -> tuple[frozenset[int], ...]:
    """All exact-card-five rows certified by the live adjacent one-hit bound."""

    own_interior = frozenset(frame.ints["O1"])
    require(len(own_interior) == 3, "the searched O1 cap must have card five")
    candidates = []
    for support_tuple in itertools.combinations(
        (point for point in range(frame.n) if point != FIRST_APEX), 5
    ):
        support = frozenset(support_tuple)
        if not own_interior <= support:
            continue
        if not mc.h1_moser_ok(frame, FIRST_APEX, support):
            continue
        candidates.append(support)
    return tuple(candidates)


def pseudo_compatible(
    frame: mc.Frame, pseudo: shadow.ClassRow, row: shadow.ClassRow
) -> bool:
    """Pairwise circle/cyclic constraints between the five-row and a K4 row."""

    if pseudo.center == row.center:
        return pseudo.support.isdisjoint(row.support)
    if len(pseudo.support & row.support) > 2:
        return False
    if row.center in mc.MOSER_SET:
        if not mc.q3.joint_ok(
            pseudo.center,
            pseudo.support,
            row.center,
            row.support,
            frame.caps_int,
        ):
            return False
    return shadow.cross_separation_ok(shadow.hull_order(frame), pseudo, row)


def pseudo_pair_bound_ok(
    pseudo: shadow.ClassRow, rows: Sequence[shadow.ClassRow]
) -> bool:
    """No point pair has three distinct bisector centers including the apex."""

    for pair in itertools.combinations(sorted(pseudo.support), 2):
        centers = {
            row.center for row in rows if set(pair) <= row.support
        }
        centers.add(pseudo.center)
        if len(centers) > 2:
            return False
    return True


def interior_pair_bisector_localization_ok(
    frame: mc.Frame, rows: Sequence[shadow.ClassRow]
) -> bool:
    """Kernel-checked T1 cut: bisector centers of interior pairs are interior.

    ``interior_pair_bisector_center_mem_capInterior``
    (``card_five_interior_bisector_localization.lean``, core axioms only):
    any carrier point other than the first apex equidistant from two
    distinct strict-interior members of the first-apex class lies in the
    strict interior of the first non-surplus cap.  A global row containing
    both pair members witnesses that equidistance at its center, so every
    such center must itself belong to ``ints["O1"]``.
    """

    interior = frozenset(frame.ints["O1"])
    for pair in itertools.combinations(sorted(interior), 2):
        for row in rows:
            if set(pair) <= row.support and row.center not in interior:
                return False
    return True


def blocker_choices(
    frame: mc.Frame,
    rows: Mapping[int, frozenset[int]],
    pseudo: shadow.ClassRow,
) -> dict[int, tuple[int, ...]]:
    """List eligible critical-shell rows for each interior source."""

    interior = tuple(frame.ints["O1"])
    require(set(interior) <= pseudo.support, "an interior source left the five-row")
    return {
        source: tuple(
            center
            for center, support in sorted(rows.items())
            if center != source and source in support
        )
        for source in interior
    }


def target_negating_blockers(
    frame: mc.Frame,
    rows: Mapping[int, frozenset[int]],
    eligible: Mapping[int, tuple[int, ...]],
    pair_sources: tuple[int, ...],
    *,
    cut_surplus_blocker: bool = False,
    cut_pair_member_blocker: bool = False,
) -> tuple[tuple[tuple[int, int], dict[int, int]], ...]:
    """Enumerate every distinct-blocker interior pair evading the target.

    The two keyword cuts are {{NEEDS_PROOF}} candidate theorems, off by
    default; enabling one makes any resulting UNSAT conditional on it.
    """

    surplus = frame.S
    results = []
    for q, w in itertools.combinations(pair_sources, 2):
        for bq, bw in itertools.product(eligible[q], eligible[w]):
            if bq == bw:
                continue
            if cut_surplus_blocker and (bq in surplus or bw in surplus):
                continue
            if cut_pair_member_blocker and (bq == w or bw == q):
                continue
            cross_q = w in rows[bq]
            cross_w = q in rows[bw]
            if (
                (cross_q and bq in surplus)
                or (cross_w and bw in surplus)
                or (cross_q and cross_w)
            ):
                continue
            results.append(((q, w), {q: bq, w: bw}))
    return tuple(results)


def formal_metric_rows_for_blockers(
    pseudo: shadow.ClassRow,
    rows: Sequence[shadow.ClassRow],
    blocker_map: Mapping[int, int],
) -> tuple[formal_metric.MetricRow, ...]:
    """Translate rows with exactness only where the live hypotheses justify it."""

    exact_blockers = frozenset(blocker_map.values())
    return (
        formal_metric.MetricRow(
            pseudo.center, tuple(sorted(pseudo.support)), exact=True
        ),
        *(formal_metric.MetricRow(
            row.center,
            tuple(sorted(row.support)),
            exact=row.center in exact_blockers,
        ) for row in rows),
    )


def solve_card_five_row(
    frame: mc.Frame,
    candidates: Mapping[int, Sequence[frozenset[int]]],
    support: frozenset[int],
    *,
    bank_negative: bool,
    real_cas_negative: bool,
    cut_surplus_blocker: bool,
    cut_pair_member_blocker: bool,
    max_nodes: int,
) -> tuple[dict[str, object], int, Counter[str]]:
    pseudo = shadow.ClassRow(
        "first-apex-card-five", FIRST_APEX, support, exact=True
    )
    choice_rows = tuple(
        shadow.ChoiceRow(
            f"global:{center}",
            tuple(
                shadow.RowChoice(center, candidate)
                for candidate in candidates[center]
            ),
            exact=False,
        )
        for center in range(frame.n)
        if center != FIRST_APEX
    )

    result_payload: dict[str, object] = {}
    rejected_bank_cores: Counter[str] = Counter()

    def prefix_ok(rows: Sequence[shadow.ClassRow]) -> bool:
        return (
            all(pseudo_compatible(frame, pseudo, row) for row in rows)
            and pseudo_pair_bound_ok(pseudo, rows)
            and interior_pair_bisector_localization_ok(frame, rows)
        )

    def complete_ok(rows_seq: Sequence[shadow.ClassRow]) -> bool:
        rows = {row.center: row.support for row in rows_seq}
        require(len(rows) == frame.n - 1, "global row center repeated")
        eligible = blocker_choices(frame, rows, pseudo)
        target_negations = target_negating_blockers(
            frame, rows, eligible, tuple(frame.ints["O1"]),
            cut_surplus_blocker=cut_surplus_blocker,
            cut_pair_member_blocker=cut_pair_member_blocker,
        )
        if not target_negations:
            return False
        if real_cas_negative:
            unit_core = real_infeasible_row_core(pseudo, rows_seq)
            if unit_core is not None:
                rejected_bank_cores[
                    json.dumps(
                        {
                            "stage": "exact-algebraic-unit-core",
                            "id": unit_core["id"],
                            "equality_count": unit_core["equality_count"],
                        },
                        sort_keys=True,
                        separators=(",", ":"),
                    )
                ] += 1
                return False
            signature = row_signature_sha256(pseudo, rows_seq)
            if signature in REAL_INFEASIBLE_ROW_SIGNATURES:
                rejected_bank_cores[
                    json.dumps(
                        {
                            "stage": "exact-algebraic-no-good",
                            "row_signature_sha256": signature,
                            **REAL_INFEASIBLE_ROW_SIGNATURES[signature],
                        },
                        sort_keys=True,
                        separators=(",", ":"),
                    )
                ] += 1
                return False
        if bank_negative:
            base_metric_rows = formal_metric_rows_for_blockers(
                pseudo, rows_seq, {}
            )
            base_detection = formal_metric._formalized_metric_core(
                base_metric_rows,
                frame.n,
                shadow.hull_order(frame),
                include_extended=True,
                include_ordered=True,
            )
            if base_detection is not None:
                rejected_bank_cores[
                    json.dumps(
                        base_detection,
                        sort_keys=True,
                        separators=(",", ":"),
                    )
                ] += 1
                return False
        selected = None
        blocker_scan_cache: dict[frozenset[int], dict[str, object] | None] = {}
        for pair_sources, blocker_map in target_negations:
            if bank_negative:
                exact_blockers = frozenset(blocker_map.values())
                if exact_blockers not in blocker_scan_cache:
                    metric_rows = formal_metric_rows_for_blockers(
                        pseudo, rows_seq, blocker_map
                    )
                    blocker_scan_cache[exact_blockers] = (
                        formal_metric._formalized_metric_core(
                            metric_rows,
                            frame.n,
                            shadow.hull_order(frame),
                            include_extended=True,
                            include_ordered=True,
                        )
                    )
                detection = blocker_scan_cache[exact_blockers]
                if detection is not None:
                    rejected_bank_cores[
                        json.dumps(
                            detection,
                            sort_keys=True,
                            separators=(",", ":"),
                        )
                    ] += 1
                    continue
            selected = pair_sources, blocker_map
            break
        if selected is None:
            return False
        pair_sources, blocker_map = selected
        result_payload.update(
            rows=rows,
            pair_sources=pair_sources,
            blocker_map=blocker_map,
        )
        return True

    result = shadow.solve_choice_rows(
        frame,
        set(mc.PROVEN_ROWS),
        fixed_rows=(),
        choice_rows=choice_rows,
        max_nodes=max_nodes,
        want_assignment=True,
        prefix_compatible=prefix_ok,
        complete_compatible=complete_ok,
    )
    if result["status"] != "SAT":
        return {}, int(result["nodes"]), rejected_bank_cores
    require(result_payload, "SAT assignment did not retain its target audit")
    return result_payload, int(result["nodes"]), rejected_bank_cores


def validate_witness(
    witness: Witness,
    *,
    require_bank_negative: bool,
    require_real_cas_negative: bool,
    require_cut_surplus_blocker: bool = False,
    require_cut_pair_member_blocker: bool = False,
) -> None:
    frame = mc.build_frame(witness.profile)
    pseudo = shadow.ClassRow(
        "first-apex-card-five",
        FIRST_APEX,
        witness.card_five_support,
        exact=True,
    )
    require(len(pseudo.support) == 5, "first-apex row is not card five")
    require(
        frozenset(frame.ints["O1"]) <= pseudo.support,
        "strict O1 interior is not contained in the first-apex class",
    )
    require(
        mc.h1_moser_ok(frame, FIRST_APEX, pseudo.support),
        "first-apex row violates adjacent one-hit",
    )
    require(set(witness.rows) == set(range(frame.n)) - {FIRST_APEX},
            "wrong global-row center set")
    exact_blockers = frozenset(witness.blocker_map.values())
    rows_seq = tuple(
        shadow.ClassRow(
            f"global:{center}",
            center,
            support,
            exact=center in exact_blockers,
        )
        for center, support in sorted(witness.rows.items())
    )
    if require_real_cas_negative:
        require(
            real_infeasible_row_core(pseudo, rows_seq) is None,
            "reported witness still contains an exact unit row core",
        )
        require(
            row_signature_sha256(pseudo, rows_seq)
            not in REAL_INFEASIBLE_ROW_SIGNATURES,
            "reported witness still hits an exact real-infeasible no-good",
        )
    ok, reason = shadow.verify_assignment(
        frame, set(mc.PROVEN_ROWS), rows_seq
    )
    require(ok, f"global rows failed independent replay: {reason}")
    require(all(pseudo_compatible(frame, pseudo, row) for row in rows_seq),
            "pseudo-row pairwise replay failed")
    require(pseudo_pair_bound_ok(pseudo, rows_seq),
            "pseudo-row bisector-center bound failed")
    require(interior_pair_bisector_localization_ok(frame, rows_seq),
            "interior-pair bisector center escaped the O1 strict interior")
    require(len(witness.pair_sources) == 2, "wrong pair size")
    require(set(witness.pair_sources) <= set(frame.ints["O1"]),
            "pair source is not in the strict O1 interior")
    require(len({witness.blocker_map[q] for q in witness.pair_sources}) == 2,
            "pair blockers are not distinct")
    require(set(witness.blocker_map) == set(witness.pair_sources),
            "blocker map contains a non-pair source")
    for source, center in witness.blocker_map.items():
        require(center != source, "a source blocks itself")
        require(source in witness.rows[center], "source absent from blocker row")
    q, w = witness.pair_sources
    bq = witness.blocker_map[q]
    bw = witness.blocker_map[w]
    cross_q = w in witness.rows[bq]
    cross_w = q in witness.rows[bw]
    require(
        not (
            (cross_q and bq in frame.S)
            or (cross_w and bw in frame.S)
            or (cross_q and cross_w)
        ),
        "an accepted CardFiveCapOrMutualFields arm survived",
    )
    if require_cut_surplus_blocker:
        require(
            bq not in frame.S and bw not in frame.S,
            "candidate surplus-blocker cut violated by reported witness",
        )
    if require_cut_pair_member_blocker:
        require(
            bq != w and bw != q,
            "candidate pair-member-blocker cut violated by reported witness",
        )
    eligible = blocker_choices(frame, witness.rows, pseudo)
    target_negations = target_negating_blockers(
        frame, witness.rows, eligible, tuple(frame.ints["O1"]),
        cut_surplus_blocker=require_cut_surplus_blocker,
        cut_pair_member_blocker=require_cut_pair_member_blocker,
    )
    require(
        any(
            pair == witness.pair_sources and blockers == witness.blocker_map
            for pair, blockers in target_negations
        ),
        "reported blocker pair was not reproduced by exhaustive target replay",
    )
    metric_rows = formal_metric_rows_for_blockers(
        pseudo, rows_seq, witness.blocker_map
    )
    require(
        {row.center for row in metric_rows if row.exact}
        == {FIRST_APEX, *witness.blocker_map.values()},
        "exactness escaped the apex and selected blocker centers",
    )
    if require_bank_negative:
        require(
            formal_metric._formalized_metric_core(
                metric_rows,
                frame.n,
                shadow.hull_order(frame),
                include_extended=True,
                include_ordered=True,
            ) is None,
            "reported bank-negative witness still hits a formalized core",
        )


def summarize_rejected_bank_cores(
    rejected: Counter[str],
) -> dict[str, object]:
    """Keep deterministic solver output small without discarding cut provenance."""

    by_stage: Counter[str] = Counter()
    for encoded, count in rejected.items():
        by_stage[json.loads(encoded)["stage"]] += count
    summary: dict[str, object] = {
        "total_formalized_core_cut_hits": sum(rejected.values()),
        "distinct_core_instances": len(rejected),
        "by_stage": dict(sorted(by_stage.items())),
    }
    if len(rejected) <= 8:
        summary["instances"] = {
            key: count for key, count in sorted(rejected.items())
        }
    return summary


def search_profile(
    profile: tuple[int, int, int], *, bank_negative: bool,
    real_cas_negative: bool,
    cut_surplus_blocker: bool,
    cut_pair_member_blocker: bool,
    max_nodes: int,
) -> tuple[Witness | None, dict[str, object]]:
    frame, candidates = mc.cached_candidate_lists(profile, set(mc.PROVEN_ROWS))
    require(candidates is not None, "candidate bank unexpectedly empty")
    tried = 0
    total_nodes = 0
    node_caps = 0
    rejected_bank_cores: Counter[str] = Counter()
    for support in card_five_candidates(frame):
        tried += 1
        payload, nodes, rejected = solve_card_five_row(
            frame,
            candidates,
            support,
            bank_negative=bank_negative,
            real_cas_negative=real_cas_negative,
            cut_surplus_blocker=cut_surplus_blocker,
            cut_pair_member_blocker=cut_pair_member_blocker,
            max_nodes=max_nodes,
        )
        rejected_bank_cores.update(rejected)
        total_nodes += nodes
        if not payload:
            if nodes > max_nodes:
                node_caps += 1
            continue
        witness = Witness(
            profile=profile,
            card_five_support=support,
            rows=payload["rows"],
            pair_sources=payload["pair_sources"],
            blocker_map=payload["blocker_map"],
            nodes=nodes,
        )
        validate_witness(
            witness,
            require_bank_negative=bank_negative,
            require_real_cas_negative=real_cas_negative,
            require_cut_surplus_blocker=cut_surplus_blocker,
            require_cut_pair_member_blocker=cut_pair_member_blocker,
        )
        return witness, {
            "card_five_rows_tried": tried,
            "total_nodes": total_nodes,
            "node_caps": node_caps,
            "max_nodes_per_card_five_row": max_nodes,
            "rejected_formalized_bank_cores":
                summarize_rejected_bank_cores(rejected_bank_cores),
        }
    return None, {
        "card_five_rows_tried": tried,
        "total_nodes": total_nodes,
        "node_caps": node_caps,
        "max_nodes_per_card_five_row": max_nodes,
        "rejected_formalized_bank_cores":
            summarize_rejected_bank_cores(rejected_bank_cores),
    }


def encode_witness(
    witness: Witness | None, stats: Mapping[str, object]
) -> dict[str, object]:
    if witness is None:
        exhaustive = int(stats["node_caps"]) == 0
        return {
            "status": (
                "EXHAUSTIVE_UNSAT_IN_FINITE_SHADOW"
                if exhaustive
                else "NO_WITNESS_WITHIN_BOUNDED_FINITE_SHADOW"
            ),
            "stats": dict(stats),
        }
    frame = mc.build_frame(witness.profile)
    q, w = witness.pair_sources
    bq = witness.blocker_map[q]
    bw = witness.blocker_map[w]
    pair_audit = {
        "pair": [q, w],
        "blockers": [bq, bw],
        "cross_memberships": [w in witness.rows[bq], q in witness.rows[bw]],
        "blockers_in_surplus": [bq in frame.S, bw in frame.S],
        "accepted_target": False,
    }
    return {
        "status": "SAT_TARGET_NEGATING_FINITE_SHADOW_ONLY",
        "profile": list(witness.profile),
        "card_five_support": sorted(witness.card_five_support),
        "strict_opp1_interior": list(frame.ints["O1"]),
        "selected_pair_sources": list(witness.pair_sources),
        "blocker_map": {
            str(source): center
            for source, center in sorted(witness.blocker_map.items())
        },
        "rows": {
            str(center): sorted(support)
            for center, support in sorted(witness.rows.items())
        },
        "row_signature_sha256": row_signature_sha256(
            shadow.ClassRow(
                "first-apex-card-five",
                FIRST_APEX,
                witness.card_five_support,
                exact=True,
            ),
            tuple(
                shadow.ClassRow(
                    f"global:{center}", center, support, exact=False
                )
                for center, support in sorted(witness.rows.items())
            ),
        ),
        "selected_pair_audit": pair_audit,
        "nodes_for_witness_row": witness.nodes,
        "stats": dict(stats),
        "trust_boundary": (
            "finite cap/incidence/equality shadow only; omits Euclidean coordinate "
            "realizability, unary second-apex survival, MEC predicates, and the "
            "coincident-blocker residual K4 packet"
        ),
    }


def metric_audit(witness: Witness, metric_oracle) -> dict[str, object]:
    """Cross-check the pinned equality ideal in Singular and two msolve orders."""

    rows = [
        metric_oracle.MetricRow(
            FIRST_APEX,
            tuple(sorted(witness.card_five_support)),
            exact=True,
        )
    ]
    exact_blockers = frozenset(witness.blocker_map.values())
    rows.extend(
        metric_oracle.MetricRow(
            center,
            tuple(sorted(support)),
            exact=center in exact_blockers,
        )
        for center, support in sorted(witness.rows.items())
    )
    n = mc.build_frame(witness.profile).n
    result = metric_oracle.crosscheck_system(
        n,
        tuple(rows),
        budget=metric_oracle.CaseBudget(seconds=45.0),
    )
    audit = {
        "status": result["status"],
        "row_count": len(rows),
        "equality_count": sum(len(row.support) - 1 for row in rows),
        "expanded_polynomial_sha256": metric_oracle.canonical_sha256(
            list(metric_oracle.serialized_system(
                n, tuple(rows)
            ))
        ),
        "oracles": result,
        "interpretation": (
            "UNIT excludes this fixed normalized complex equality shadow; "
            "NONUNIT is not a real Euclidean witness"
        ),
    }
    audit["formalized_metric_core_scan"] = formal_metric._formalized_metric_core(
        tuple(rows),
        n,
        shadow.hull_order(mc.build_frame(witness.profile)),
        include_extended=True,
        include_ordered=True,
    )
    if result["status"] == "CROSSCHECKED_UNIT":
        deletion = metric_oracle.bounded_row_deletion(
            n,
            tuple(rows),
            budget=metric_oracle.CaseBudget(seconds=45.0),
        )
        retained = tuple(
            metric_oracle.row_from_dict(row)
            for row in deletion["retained_rows"]
        )
        deletion["retained_core_crosscheck"] = metric_oracle.crosscheck_system(
            n,
            retained,
            budget=metric_oracle.CaseBudget(seconds=45.0),
        )
        audit["bounded_row_deletion"] = deletion
    elif result["status"] == "CROSSCHECKED_NONUNIT":
        audit["singular_direct_membership"] = singular_direct_membership_audit(
            n, tuple(rows), metric_oracle
        )
    return audit


def singular_direct_membership_audit(n: int, rows, metric_oracle) -> dict[str, object]:
    """Check dimension and direct ideal membership of every squared distance."""

    variables = tuple(str(variable) for variable in metric_oracle.variable_symbols(n))
    polynomials = metric_oracle.serialized_system(n, rows)
    points = metric_oracle.coordinate_symbols(n)
    sympy_variables = metric_oracle.variable_symbols(n)
    pair_polynomials = {}
    for left, right in itertools.combinations(range(n), 2):
        poly = metric_oracle.sp.Poly(
            metric_oracle.squared_distance(points, left, right),
            *sympy_variables,
            domain=metric_oracle.sp.QQ,
        )
        pair_polynomials[(left, right)] = metric_oracle.serialize_poly(poly)
    lines = [
        f"ring R=0,({','.join(variables)}),dp;",
        f"ideal I={','.join(polynomials)};",
        "ideal G=std(I);",
        'print("DIM_BEGIN");',
        "print(dim(G));",
        'print("DIM_END");',
        f"ideal P={','.join(pair_polynomials.values())};",
        "ideal Z=reduce(P,G);",
    ]
    for index, (left, right) in enumerate(pair_polynomials, start=1):
        lines.append(
            f'if (Z[{index}]==0) '
            f'{{ print("FORCED_ZERO_{left}_{right}"); }}'
        )
    lines.append("quit;")
    try:
        process = subprocess.run(
            ["Singular", "-q"],
            input="\n".join(lines) + "\n",
            capture_output=True,
            text=True,
            timeout=30.0,
            check=False,
        )
    except subprocess.TimeoutExpired:
        return {
            "status": "TIMEOUT_NO_VERDICT",
            "timeout_seconds": 30,
            "verdict_scope": "no membership or dimension claim",
        }
    require(process.returncode == 0,
            f"Singular membership audit failed: {process.stderr.strip()}")
    output = process.stdout.splitlines()
    begin = output.index("DIM_BEGIN")
    end = output.index("DIM_END")
    require(end == begin + 2, "malformed Singular dimension output")
    forced = []
    for line in output:
        if not line.startswith("FORCED_ZERO_"):
            continue
        _, _, left, right = line.split("_")
        forced.append([int(left), int(right)])
    return {
        "status": "COMPLETED",
        "ideal_dimension": int(output[begin + 1]),
        "forced_zero_squared_distance_pairs": forced,
        "verdict_scope": (
            "direct membership in the generated equality ideal; a listed pair "
            "collapses in every complex realization of this fixed shadow"
        ),
    }


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--profile", choices=["554", "654", "555"])
    parser.add_argument("--check", action="store_true")
    parser.add_argument("--metric", action="store_true")
    parser.add_argument(
        "--bank-negative",
        action="store_true",
        help="reject every complete assignment hit by the current formalized metric-core scanner",
    )
    parser.add_argument(
        "--real-cas-negative",
        action="store_true",
        help="reject row signatures with an exact characteristic-zero no-real certificate",
    )
    parser.add_argument(
        "--cut-surplus-blocker",
        action="store_true",
        help="{{NEEDS_PROOF}} candidate cut: exclude blocker centers in the "
        "surplus cap for strict-O1-interior sources; any UNSAT is "
        "conditional on this unproven theorem",
    )
    parser.add_argument(
        "--cut-pair-member-blocker",
        action="store_true",
        help="{{NEEDS_PROOF}} candidate cut: exclude a frontier pair member "
        "as the other member's blocker center; any UNSAT is conditional "
        "on this unproven theorem",
    )
    parser.add_argument(
        "--max-nodes",
        type=int,
        default=MAX_NODES_PER_CARD_FIVE_ROW,
        help="DFS node cap for each candidate card-five row",
    )
    args = parser.parse_args()
    require(args.max_nodes > 0, "--max-nodes must be positive")
    profile_map = {"554": (5, 5, 4), "654": (6, 5, 4), "555": (5, 5, 5)}
    profiles = (profile_map[args.profile],) if args.profile else PROFILES
    metric_oracle = None
    smoke = None
    if args.metric:
        metric_oracle = load_metric_oracle()
        smoke = metric_oracle.smoke_gates()
    reports = []
    for profile in profiles:
        witness, stats = search_profile(
            profile,
            bank_negative=args.bank_negative,
            real_cas_negative=args.real_cas_negative,
            cut_surplus_blocker=args.cut_surplus_blocker,
            cut_pair_member_blocker=args.cut_pair_member_blocker,
            max_nodes=args.max_nodes,
        )
        report = encode_witness(witness, stats)
        report["requested_profile"] = list(profile)
        report["formalized_bank_negative_required"] = args.bank_negative
        report["exact_real_cas_negative_required"] = args.real_cas_negative
        report["needs_proof_candidate_cuts"] = {
            "cut_surplus_blocker": args.cut_surplus_blocker,
            "cut_pair_member_blocker": args.cut_pair_member_blocker,
        }
        if args.metric and witness is not None:
            report["metric_equality_audit"] = metric_audit(
                witness, metric_oracle
            )
        reports.append(report)
    if args.check:
        for report in reports:
            require(report["status"] in {
                "SAT_TARGET_NEGATING_FINITE_SHADOW_ONLY",
                "EXHAUSTIVE_UNSAT_IN_FINITE_SHADOW",
                "NO_WITNESS_WITHIN_BOUNDED_FINITE_SHADOW",
            }, "fail-closed status drift")
    print(json.dumps({
        "schema": "p97-atail-card-five-interior-shadow-search-v1",
        "metric_smoke_gates": smoke,
        "reports": reports,
    }, indent=2, sort_keys=True))


if __name__ == "__main__":
    main()
