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
    # 654 iteration-1 witness admitted 2026-07-15: std(I) defeats 1800 s,
    # so certified at radical grade by membership_crosscheck.py
    # --radical-only — Rabinowitsch I + (1 - t*dist2(7,8)) is UNIT in
    # Singular and msolve (both variable orders); dist2(7,8) vanishes on
    # every complex realization, so no distinct-point realization exists.
    "a4914ed295b4d1f0f507a8c8cf9233f1238604aaa63c5da52dd9fa58c3d742f9": {
        "equality_sha256":
            "4a75ebc112edfe2e533d9f0f51110c047be22622aa5d20fc6ec9943119a8d972",
        "exact_cas_status": "CROSSCHECKED_REAL_INFEASIBLE_RADICAL_MEMBERSHIP",
        "forced_zero_squared_distance_pair": [7, 8],
        "singular_direct_reduction": "SKIPPED_RADICAL_ONLY",
        "msolve_rabinowitsch_radical_membership": True,
    },
    # 555 iteration-7 witness admitted 2026-07-15 (first NONUNIT on 555;
    # std(I) defeats 900 s): the forced-zero pair is the SOURCE pair
    # (6,7) itself — every complex realization collapses the two
    # strict-O1-interior sources.  Certified by membership_crosscheck.py
    # --radical-only, Rabinowitsch UNIT in Singular and msolve (both
    # variable orders).
    "84ac8d4a7d4b0de0ca165f4d28ca5fc766e6ac8ea51d57a448aae5236a34cb8a": {
        "equality_sha256":
            "9b395b6478f81bcc7311beab58c4161ce0393a49b2f1eab5d2105b1e7c97d9f1",
        "exact_cas_status": "CROSSCHECKED_REAL_INFEASIBLE_RADICAL_MEMBERSHIP",
        "forced_zero_squared_distance_pair": [6, 7],
        "singular_direct_reduction": "SKIPPED_RADICAL_ONLY",
        "msolve_rabinowitsch_radical_membership": True,
    },
    # 654 iteration-2 witness admitted 2026-07-15: the forced-zero pair
    # is again the SOURCE pair (7,8) — every complex realization
    # collapses the two strict-O1-interior sources.  Certified by
    # membership_crosscheck.py --radical-only, Rabinowitsch UNIT in
    # Singular and msolve (both variable orders).
    "9095f63558a23f492da967104eeec45d08ca8d3f560978e1812af850d330b2ad": {
        "equality_sha256":
            "fa3a3801e20a0309ad941f740d5d4850407e2e4130ff762cda38c89e5b260c03",
        "exact_cas_status": "CROSSCHECKED_REAL_INFEASIBLE_RADICAL_MEMBERSHIP",
        "forced_zero_squared_distance_pair": [7, 8],
        "singular_direct_reduction": "SKIPPED_RADICAL_ONLY",
        "msolve_rabinowitsch_radical_membership": True,
    },
    # 555 iteration-8 witness admitted 2026-07-15: source pair (6,7)
    # forced zero, certified by membership_crosscheck.py --radical-only,
    # Rabinowitsch UNIT in Singular and msolve (both variable orders).
    "79a04c0fcc6b3b8cf905628a8595015519afc68dd062c1623183002e0680a25f": {
        "equality_sha256":
            "c4745615d3ecf02dc2a63fe192427b9be76788ce5772ae99c266dc6b33f2af67",
        "exact_cas_status": "CROSSCHECKED_REAL_INFEASIBLE_RADICAL_MEMBERSHIP",
        "forced_zero_squared_distance_pair": [6, 7],
        "singular_direct_reduction": "SKIPPED_RADICAL_ONLY",
        "msolve_rabinowitsch_radical_membership": True,
    },
    # 555 iteration-9 witness admitted 2026-07-15: source pair (6,7)
    # forced zero, certified by membership_crosscheck.py --radical-only,
    # Rabinowitsch UNIT in Singular and msolve (both variable orders).
    "fd874bf26dfed39fbb53a17433b99e4852eca0c899abd696bededd820f879319": {
        "equality_sha256":
            "b3a25241eb7909133e001cabfaff8ed39cd2f9358776a4febbe6e2d71b59540f",
        "exact_cas_status": "CROSSCHECKED_REAL_INFEASIBLE_RADICAL_MEMBERSHIP",
        "forced_zero_squared_distance_pair": [6, 7],
        "singular_direct_reduction": "SKIPPED_RADICAL_ONLY",
        "msolve_rabinowitsch_radical_membership": True,
    },
    # 654 iteration-3 witness admitted 2026-07-15: source pair (7,8)
    # forced zero, certified by membership_crosscheck.py --radical-only,
    # Rabinowitsch UNIT in Singular and msolve (both variable orders).
    "cb30873e7b2e23b4ce5480b1359173af2e36a993ef66b0704ef4775fa54996b0": {
        "equality_sha256":
            "7dc3caead23b283c343837351808e5e1412b0e0e50c5ae43df045678f12ff579",
        "exact_cas_status": "CROSSCHECKED_REAL_INFEASIBLE_RADICAL_MEMBERSHIP",
        "forced_zero_squared_distance_pair": [7, 8],
        "singular_direct_reduction": "SKIPPED_RADICAL_ONLY",
        "msolve_rabinowitsch_radical_membership": True,
    },
    # 555 iteration-10 witness admitted 2026-07-15: source pair (6,7)
    # forced zero, certified by membership_crosscheck.py --radical-only;
    # its retained 7-row deletion core is forced-pair-core-555-01.
    "50cfcbecc82307735ade1bd14558a9f04cfa35c8d9a1bc97184d44882c52eb8c": {
        "equality_sha256":
            "e9b8d85db00e51be8ca9c629c6f39038fac84934ba46ef3407c6b270db2439eb",
        "exact_cas_status": "CROSSCHECKED_REAL_INFEASIBLE_RADICAL_MEMBERSHIP",
        "forced_zero_squared_distance_pair": [6, 7],
        "singular_direct_reduction": "SKIPPED_RADICAL_ONLY",
        "msolve_rabinowitsch_radical_membership": True,
    },
    # 654 iteration-4 witness admitted 2026-07-15: source pair (7,8)
    # forced zero, certified by membership_crosscheck.py --radical-only;
    # its retained 8-row deletion core is forced-pair-core-654-02.
    "6b5de144ff0470a66778e33f22cb7169714de053336c9e4f0a629733bca70e6a": {
        "equality_sha256":
            "bbdbf705ee12bfa52cf0616993160bac05a198fdd3a9b16d698d7fb9379d3e13",
        "exact_cas_status": "CROSSCHECKED_REAL_INFEASIBLE_RADICAL_MEMBERSHIP",
        "forced_zero_squared_distance_pair": [7, 8],
        "singular_direct_reduction": "SKIPPED_RADICAL_ONLY",
        "msolve_rabinowitsch_radical_membership": True,
    },
    # 555 iteration-11 witness admitted 2026-07-15: source pair (6,7)
    # forced zero, certified by membership_crosscheck.py --radical-only;
    # its retained 7-row deletion core is forced-pair-core-555-05.
    "38a642e3e883fbb124726f9fb514e95601297fe38bc43d4a8e4ea4ca16c3f114": {
        "equality_sha256":
            "7483cc4ddd0937f9c71979f838202f07bbd2a6c1964d66e9ad63bd381ef68f2e",
        "exact_cas_status": "CROSSCHECKED_REAL_INFEASIBLE_RADICAL_MEMBERSHIP",
        "forced_zero_squared_distance_pair": [6, 7],
        "singular_direct_reduction": "SKIPPED_RADICAL_ONLY",
        "msolve_rabinowitsch_radical_membership": True,
    },
    # 654 iteration-5 witness admitted 2026-07-15: source pair (7,8)
    # forced zero, certified by membership_crosscheck.py --radical-only;
    # its retained 8-row deletion core is forced-pair-core-654-05.
    "080287b2a76b49e6b24949f51daae0a8e581882b8a3b7ab67561df610f24c101": {
        "equality_sha256":
            "b2276dd8b93c4a09045b9135af005651de54990793dc7a0fd91ba5c8a3cced80",
        "exact_cas_status": "CROSSCHECKED_REAL_INFEASIBLE_RADICAL_MEMBERSHIP",
        "forced_zero_squared_distance_pair": [7, 8],
        "singular_direct_reduction": "SKIPPED_RADICAL_ONLY",
        "msolve_rabinowitsch_radical_membership": True,
    },
    # 555 iteration-12 witness admitted 2026-07-15: source pair (6,7)
    # forced zero, certified by membership_crosscheck.py --radical-only;
    # its retained 7-row deletion core is forced-pair-core-555-06.
    "5d2b6e6518b2360290649f0673c34229da737fbaa1c6e562571582f5d167d535": {
        "equality_sha256":
            "3932b5083e677ea5db12b8ca7d655972d6093d86d2bfb028baf81af593e5b02f",
        "exact_cas_status": "CROSSCHECKED_REAL_INFEASIBLE_RADICAL_MEMBERSHIP",
        "forced_zero_squared_distance_pair": [6, 7],
        "singular_direct_reduction": "SKIPPED_RADICAL_ONLY",
        "msolve_rabinowitsch_radical_membership": True,
    },
    # 654 iteration-6 witness admitted 2026-07-15: source pair (7,8)
    # forced zero, certified by membership_crosscheck.py --radical-only;
    # its retained 7-row deletion core is forced-pair-core-654-06.
    "f8dd433b257e6a9e9ca6cbc1b7012f954a970afaf84af1558740c9de64e16855": {
        "equality_sha256":
            "8307a470eefabb98b8dab750ddf7d12397414885494d51fc3af9f4510e216d0e",
        "exact_cas_status": "CROSSCHECKED_REAL_INFEASIBLE_RADICAL_MEMBERSHIP",
        "forced_zero_squared_distance_pair": [7, 8],
        "singular_direct_reduction": "SKIPPED_RADICAL_ONLY",
        "msolve_rabinowitsch_radical_membership": True,
    },
    # 555 iteration-13 witness admitted 2026-07-15: source pair (6,7)
    # forced zero, certified by membership_crosscheck.py --radical-only;
    # its retained 8-row deletion core is forced-pair-core-555-07.
    "78b4d1afad727d62d9c9609702d6004f0f20bc047c1871be94a2557a703c4f42": {
        "equality_sha256":
            "e46278440fa1f04748817348bda8c48f33061c6852e3db8fe77ad5aa2fc7cbbd",
        "exact_cas_status": "CROSSCHECKED_REAL_INFEASIBLE_RADICAL_MEMBERSHIP",
        "forced_zero_squared_distance_pair": [6, 7],
        "singular_direct_reduction": "SKIPPED_RADICAL_ONLY",
        "msolve_rabinowitsch_radical_membership": True,
    },
    # 654 iteration-7 witness admitted 2026-07-15: source pair (7,8)
    # forced zero, certified by membership_crosscheck.py --radical-only;
    # its retained 7-row deletion core is forced-pair-core-654-07.
    "e99adf80569a78483433d95edc211d75f821d2c6de8388a2a5ade4b218163ea4": {
        "equality_sha256":
            "c527c00449f13e35b4a9a7302f7770dba735e2b25134f47d2216741e55abccf9",
        "exact_cas_status": "CROSSCHECKED_REAL_INFEASIBLE_RADICAL_MEMBERSHIP",
        "forced_zero_squared_distance_pair": [7, 8],
        "singular_direct_reduction": "SKIPPED_RADICAL_ONLY",
        "msolve_rabinowitsch_radical_membership": True,
    },
    # 555 iteration-14 witness admitted 2026-07-15: source pair (6,7)
    # forced zero, certified by membership_crosscheck.py --radical-only;
    # its retained 7-row deletion core is forced-pair-core-555-08.
    "67cd332a619524420ad3663dd0e700148ed12f9d5acbf25201af2ccbb420364e": {
        "equality_sha256":
            "455ed4a99c8f3e93993057e4319402531aad223a393c9e13a404a953a6dfe958",
        "exact_cas_status": "CROSSCHECKED_REAL_INFEASIBLE_RADICAL_MEMBERSHIP",
        "forced_zero_squared_distance_pair": [6, 7],
        "singular_direct_reduction": "SKIPPED_RADICAL_ONLY",
        "msolve_rabinowitsch_radical_membership": True,
    },
    # 654 iteration-8 witness admitted 2026-07-15: source pair (7,8)
    # forced zero, certified by membership_crosscheck.py --radical-only;
    # its retained 9-row deletion core is forced-pair-core-654-08.
    "0fe506e46a4f396e7c298974d2d7d0bf6efe7158e0cdbd1c136d8ccce56cbcb8": {
        "equality_sha256":
            "163bdca71cbfd3d941ef83780f7930dfea4482489d13295589b5743a47c911ac",
        "exact_cas_status": "CROSSCHECKED_REAL_INFEASIBLE_RADICAL_MEMBERSHIP",
        "forced_zero_squared_distance_pair": [7, 8],
        "singular_direct_reduction": "SKIPPED_RADICAL_ONLY",
        "msolve_rabinowitsch_radical_membership": True,
    },
    # 555 iteration-15 witness admitted 2026-07-15: the SOURCE pair
    # (6,7) is NOT forced (radical membership NONUNIT x3); the all-pairs
    # scan found 49/66 pair distances directly in the ideal, and the
    # kill pair (7,8) was certified by membership_crosscheck.py
    # --radical-only; its retained 8-row deletion core is
    # forced-pair-core-555-09.
    "1e81296b99f2c3a8dfccf169a8b046828431503ab7ec086010fece1f41ca550f": {
        "equality_sha256":
            "9d90aa098f746f8b71ccadf99aa726e782312634cdb7cb1088f25a23fa75b428",
        "exact_cas_status": "CROSSCHECKED_REAL_INFEASIBLE_RADICAL_MEMBERSHIP",
        "forced_zero_squared_distance_pair": [7, 8],
        "singular_direct_reduction": "SKIPPED_RADICAL_ONLY",
        "msolve_rabinowitsch_radical_membership": True,
    },
    # 654 iteration-9 witness admitted 2026-07-15: source pair (7,8)
    # forced zero, certified by membership_crosscheck.py --radical-only;
    # its retained 7-row deletion core is forced-pair-core-654-09.
    "9bd971a6d31f3cd8db7c39e8d930990d0efae2c49de8143a195c2c1995068200": {
        "equality_sha256":
            "dbaf633cced7e288fc601d357e90c7beaa2dfd57eafbb632f5a6630ba8477bfa",
        "exact_cas_status": "CROSSCHECKED_REAL_INFEASIBLE_RADICAL_MEMBERSHIP",
        "forced_zero_squared_distance_pair": [7, 8],
        "singular_direct_reduction": "SKIPPED_RADICAL_ONLY",
        "msolve_rabinowitsch_radical_membership": True,
    },
    # 555 iteration-16 witness admitted 2026-07-15: source pair (6,7)
    # forced zero, certified by membership_crosscheck.py --radical-only;
    # its retained 7-row deletion core is forced-pair-core-555-10.
    "25e8cc56a2a3326c7b53aed5619aa8c6044f6cd6ce29eeb8aec0ce2e516454df": {
        "equality_sha256":
            "1285327c27bcac48cdb9772f1eb6fe95c22e52de0cdd195d9d748e979b325648",
        "exact_cas_status": "CROSSCHECKED_REAL_INFEASIBLE_RADICAL_MEMBERSHIP",
        "forced_zero_squared_distance_pair": [6, 7],
        "singular_direct_reduction": "SKIPPED_RADICAL_ONLY",
        "msolve_rabinowitsch_radical_membership": True,
    },
    # 654 iteration-10 witness admitted 2026-07-15: source pair (7,8)
    # forced zero, certified by membership_crosscheck.py --radical-only;
    # its retained 7-row deletion core is forced-pair-core-654-10.
    "d515e6847680afd33c76514db39aa204cd84d4ab65da6d5ce8a052823eb41a60": {
        "equality_sha256":
            "10f3634a0f4378a0187eca1c65923249f4a7bf502a87ca3b06d5906cca02b8c8",
        "exact_cas_status": "CROSSCHECKED_REAL_INFEASIBLE_RADICAL_MEMBERSHIP",
        "forced_zero_squared_distance_pair": [7, 8],
        "singular_direct_reduction": "SKIPPED_RADICAL_ONLY",
        "msolve_rabinowitsch_radical_membership": True,
    },
    # 555 iteration-17 witness admitted 2026-07-15: source pair (6,7)
    # forced zero, certified by membership_crosscheck.py --radical-only;
    # its retained 8-row deletion core is forced-pair-core-555-11.
    "09fd77b8a694d2837231b7c3a3ca6039379d48b3969e4d3fb31b142b67ba6721": {
        "equality_sha256":
            "afd2e545a1a284ac5c691e2029383f443c99f8dd2c9c38b844b657437d906bea",
        "exact_cas_status": "CROSSCHECKED_REAL_INFEASIBLE_RADICAL_MEMBERSHIP",
        "forced_zero_squared_distance_pair": [6, 7],
        "singular_direct_reduction": "SKIPPED_RADICAL_ONLY",
        "msolve_rabinowitsch_radical_membership": True,
    },
    # 555 iteration-18 witness admitted 2026-07-15: source pair (6,7)
    # forced zero, certified by membership_crosscheck.py --radical-only;
    # its retained 6-row deletion core (zero deletion timeouts — the
    # smallest 555 core to date) is forced-pair-core-555-12.
    "0d357ae88031c6a44082d881d82687cbc903df4b99f1b0538fe7dd0caa4cc530": {
        "equality_sha256":
            "a0c399a1faec4798c2bba570804f19f0e68871cb49e3d270666ed23c6b3fa24b",
        "exact_cas_status": "CROSSCHECKED_REAL_INFEASIBLE_RADICAL_MEMBERSHIP",
        "forced_zero_squared_distance_pair": [6, 7],
        "singular_direct_reduction": "SKIPPED_RADICAL_ONLY",
        "msolve_rabinowitsch_radical_membership": True,
    },
    # 555 iteration-19 witness admitted 2026-07-15: source pair (6,7)
    # forced zero, certified by membership_crosscheck.py --radical-only;
    # its retained 7-row deletion core (zero deletion timeouts) is
    # forced-pair-core-555-13.
    "717de68a6c84c9bc7c4be9e57cff44a408699642966acf02e2b97b62958cbac1": {
        "equality_sha256":
            "f28cb93af38c376871cafaffbfb9158d2c62c46f51d0b6be09e1c21a9a22ebc2",
        "exact_cas_status": "CROSSCHECKED_REAL_INFEASIBLE_RADICAL_MEMBERSHIP",
        "forced_zero_squared_distance_pair": [6, 7],
        "singular_direct_reduction": "SKIPPED_RADICAL_ONLY",
        "msolve_rabinowitsch_radical_membership": True,
    },
    # 654 iteration-28 witness admitted 2026-07-15: source pair (7,8)
    # forced zero — first 654 NONUNIT since iteration-10 (inline audit
    # UNDECIDED, 900 s recheck CROSSCHECKED_NONUNIT); certified by
    # membership_crosscheck.py --radical-only; its retained 7-row
    # deletion core (zero deletion timeouts) is forced-pair-core-654-11.
    "8f8cdfed03433593c85048346ee276fdbc02fce35ae791d0bbef9a7ea652b4d9": {
        "equality_sha256":
            "c06cf2fbb039d8450ad790316ca19be80a65c6187235bf0ba91ff4bbb4cb372d",
        "exact_cas_status": "CROSSCHECKED_REAL_INFEASIBLE_RADICAL_MEMBERSHIP",
        "forced_zero_squared_distance_pair": [7, 8],
        "singular_direct_reduction": "SKIPPED_RADICAL_ONLY",
        "msolve_rabinowitsch_radical_membership": True,
    },
    # 654 iteration-29 witness admitted 2026-07-15: source pair (7,8)
    # forced zero — second consecutive 654 NONUNIT (recheck decided
    # NONUNIT with no timeout); certified by membership_crosscheck.py
    # --radical-only; its retained 8-row deletion core (zero deletion
    # timeouts) is forced-pair-core-654-12.
    "5a6fd93d7fda01cd5016417ee6197cd05694a0e527e2463d9dcb7813e353a775": {
        "equality_sha256":
            "42d100e348c86b55e8392dcb3a58c7009a3dae9be1db82744eba1b68626eb74b",
        "exact_cas_status": "CROSSCHECKED_REAL_INFEASIBLE_RADICAL_MEMBERSHIP",
        "forced_zero_squared_distance_pair": [7, 8],
        "singular_direct_reduction": "SKIPPED_RADICAL_ONLY",
        "msolve_rabinowitsch_radical_membership": True,
    },
    # 654 iteration-30 witness admitted 2026-07-15: source pair (7,8)
    # forced zero — third consecutive 654 NONUNIT (inline audit decided
    # NONUNIT directly); certified by membership_crosscheck.py
    # --radical-only; its retained 6-row deletion core (zero deletion
    # timeouts) is forced-pair-core-654-13.
    "998d759a3658ae990e57df3a3fcfde46e1d0322da4e71d89478d6098397e9bc7": {
        "equality_sha256":
            "b1cebb4957e59aa56ded77f055c4a40b23b1ec40d002d6c67968e85a1ebc9b50",
        "exact_cas_status": "CROSSCHECKED_REAL_INFEASIBLE_RADICAL_MEMBERSHIP",
        "forced_zero_squared_distance_pair": [7, 8],
        "singular_direct_reduction": "SKIPPED_RADICAL_ONLY",
        "msolve_rabinowitsch_radical_membership": True,
    },
    # 654 iteration-31 witness admitted 2026-07-15: source pair (7,8)
    # forced zero — fourth consecutive 654 NONUNIT (inline audit
    # decided NONUNIT directly); certified by membership_crosscheck.py
    # --radical-only; its retained 7-row deletion core (zero deletion
    # timeouts) is forced-pair-core-654-14.
    "1902f507e3c57d40c704d9c3343150674e25118fdc5d1a46a7544cdfc6c36fb1": {
        "equality_sha256":
            "1e022b8399f0d76b52f0edcd878011788115d6c728ee3761d37fccac0fc8d080",
        "exact_cas_status": "CROSSCHECKED_REAL_INFEASIBLE_RADICAL_MEMBERSHIP",
        "forced_zero_squared_distance_pair": [7, 8],
        "singular_direct_reduction": "SKIPPED_RADICAL_ONLY",
        "msolve_rabinowitsch_radical_membership": True,
    },
    # 654 iteration-32 witness admitted 2026-07-16: source pair (7,8)
    # forced zero — fifth consecutive 654 NONUNIT (inline audit decided
    # NONUNIT directly); certified by membership_crosscheck.py
    # --radical-only; its retained 6-row deletion core (zero deletion
    # timeouts) is forced-pair-core-654-15.
    "5b9f46c002a49dca4d04c5007b6c4c3a9f4b1da4c970c0f9a2221773c9c5c6ed": {
        "equality_sha256":
            "cca5fc4aefe34527afc43860cd8ae1c90bae1a55dbfca44b7a0c41b78826d373",
        "exact_cas_status": "CROSSCHECKED_REAL_INFEASIBLE_RADICAL_MEMBERSHIP",
        "forced_zero_squared_distance_pair": [7, 8],
        "singular_direct_reduction": "SKIPPED_RADICAL_ONLY",
        "msolve_rabinowitsch_radical_membership": True,
    },
    # 654 iteration-33 witness admitted 2026-07-16: source pair (7,8)
    # forced zero — sixth consecutive 654 NONUNIT; both the inline
    # audit and the 900 s system recheck returned UNDECIDED (first of
    # loop), so the membership_crosscheck.py --radical-only cert is the
    # sole, self-contained kill; its retained 7-row deletion core (zero
    # deletion timeouts) is forced-pair-core-654-16.
    "ea77d6029ed03d773465b60a207433a9ff966e4d8428daa38ce5c254eee5f825": {
        "equality_sha256":
            "24ae0238ab7e8915db3530d9ffb2edd35eaf698094a4d7a58b74b0c27e2871e7",
        "exact_cas_status": "CROSSCHECKED_REAL_INFEASIBLE_RADICAL_MEMBERSHIP",
        "forced_zero_squared_distance_pair": [7, 8],
        "singular_direct_reduction": "SKIPPED_RADICAL_ONLY",
        "msolve_rabinowitsch_radical_membership": True,
    },
    # 654 iteration-34 witness admitted 2026-07-16: source pair (7,8)
    # forced zero — seventh consecutive 654 NONUNIT-track witness
    # (inline audit decided NONUNIT directly); certified by
    # membership_crosscheck.py --radical-only; its retained 6-row
    # deletion core (3 deletion timeouts fail-closed) is
    # forced-pair-core-654-17.
    "b7de22833b90a4f79663762937603683a2887a0d763563ecf90acc7d3158f8e1": {
        "equality_sha256":
            "7d6157918d4a441fa8c6ee734207b5b465763b7f62ee4dc35acde5dcb0e97ed1",
        "exact_cas_status": "CROSSCHECKED_REAL_INFEASIBLE_RADICAL_MEMBERSHIP",
        "forced_zero_squared_distance_pair": [7, 8],
        "singular_direct_reduction": "SKIPPED_RADICAL_ONLY",
        "msolve_rabinowitsch_radical_membership": True,
    },
    # 654 iteration-35 witness admitted 2026-07-16: source pair (7,8)
    # forced zero — eighth consecutive 654 NONUNIT-track witness
    # (inline audit decided NONUNIT directly); certified by
    # membership_crosscheck.py --radical-only; its retained 7-row
    # deletion core (5 deletion timeouts fail-closed) is
    # forced-pair-core-654-18.
    "429495325247ef89abfe573983a85a5b90000c6499cbcd3f13f2ba9257fe9d5d": {
        "equality_sha256":
            "04dbf93f163422a5163592b918d4f3af23258b68455517766eac301faa337df2",
        "exact_cas_status": "CROSSCHECKED_REAL_INFEASIBLE_RADICAL_MEMBERSHIP",
        "forced_zero_squared_distance_pair": [7, 8],
        "singular_direct_reduction": "SKIPPED_RADICAL_ONLY",
        "msolve_rabinowitsch_radical_membership": True,
    },
    # 654 iteration-36 witness admitted 2026-07-16: source pair (7,8)
    # forced zero — ninth consecutive 654 NONUNIT-track witness
    # (inline audit decided NONUNIT directly); certified by
    # membership_crosscheck.py --radical-only; its retained 7-row
    # deletion core (7 deletion timeouts fail-closed) is
    # forced-pair-core-654-19.
    "61222481b526b5db1d3e54132f0ece7049a751fc578e743f22f797e7fb0efd05": {
        "equality_sha256":
            "27d76d694ac82a9932ad950fff5bdb37dde7653a11d985c05515bd67e8b6ef7d",
        "exact_cas_status": "CROSSCHECKED_REAL_INFEASIBLE_RADICAL_MEMBERSHIP",
        "forced_zero_squared_distance_pair": [7, 8],
        "singular_direct_reduction": "SKIPPED_RADICAL_ONLY",
        "msolve_rabinowitsch_radical_membership": True,
    },
    # 654 iteration-37 witness admitted 2026-07-16: source pair (7,8)
    # forced zero — tenth consecutive 654 NONUNIT-track witness
    # (inline audit decided NONUNIT directly, 9.680 M nodes); certified
    # by membership_crosscheck.py --radical-only; its retained 7-row
    # deletion core (6 deletion timeouts fail-closed) is
    # forced-pair-core-654-20.
    "91c0316c0db1c5dfc755b492dc1bb6d170444ba4cccee0b87b1965c996bb344e": {
        "equality_sha256":
            "83f200b51383f6cc2a303d203ddd3c993ad67a7811f30513d42a1292d5e7c190",
        "exact_cas_status": "CROSSCHECKED_REAL_INFEASIBLE_RADICAL_MEMBERSHIP",
        "forced_zero_squared_distance_pair": [7, 8],
        "singular_direct_reduction": "SKIPPED_RADICAL_ONLY",
        "msolve_rabinowitsch_radical_membership": True,
    },
    # 654 iteration-38 witness admitted 2026-07-16: source pair (7,8)
    # forced zero — eleventh consecutive 654 NONUNIT-track witness
    # (10.155 M nodes, first past the old 10 M cap; inline audit
    # UNDECIDED, routed directly to the self-contained cert per the
    # double-UNDECIDED decision); certified by membership_crosscheck.py
    # --radical-only; its retained 8-row deletion core (5 deletion
    # timeouts fail-closed) is forced-pair-core-654-21.
    "8bb1f4212f932623f3b8d997961f2eb7a5eee9f93ca959147f25d5118f1ab4fc": {
        "equality_sha256":
            "1223c85b5883c90d82bdf778a5b966bf3e0498f29dfc384aabbf7ed69f9544bc",
        "exact_cas_status": "CROSSCHECKED_REAL_INFEASIBLE_RADICAL_MEMBERSHIP",
        "forced_zero_squared_distance_pair": [7, 8],
        "singular_direct_reduction": "SKIPPED_RADICAL_ONLY",
        "msolve_rabinowitsch_radical_membership": True,
    },
    # 654 iteration-40 witness admitted 2026-07-16: source pair (7,8)
    # forced zero — twelfth NONUNIT-track 654 witness, first after the
    # unit-grade interruption at iteration 39 (inline audit decided
    # NONUNIT directly, 11.485 M nodes); certified by
    # membership_crosscheck.py --radical-only; its retained 8-row
    # deletion core (7 deletion timeouts fail-closed) is
    # forced-pair-core-654-22.
    "9c5941584e4c8d5c1680d2c8544d88f959d37d1db27f426c749db1283c68063a": {
        "equality_sha256":
            "ee393c39517f9f3cf150fdd441d91f3eb07272e425ed5275e26206ece5695f23",
        "exact_cas_status": "CROSSCHECKED_REAL_INFEASIBLE_RADICAL_MEMBERSHIP",
        "forced_zero_squared_distance_pair": [7, 8],
        "singular_direct_reduction": "SKIPPED_RADICAL_ONLY",
        "msolve_rabinowitsch_radical_membership": True,
    },
    # 654 iteration-41 witness: thirteenth NONUNIT-track 654 witness,
    # surfacing 3 nodes past iteration 40's in the same 11.485 M
    # pocket (20 M run, caps=0; inline audit decided NONUNIT
    # directly); certified by membership_crosscheck.py --radical-only;
    # its retained 7-row deletion core (6 deletion timeouts
    # fail-closed) is forced-pair-core-654-23.
    "b2a6ec6967d85e84146ffc07c0606fa1e02e5277b992195e0750869b84d0b1c4": {
        "equality_sha256":
            "8cc04ef9ddf1b579a14889682d5f53dee718c184615b6694210fc536f367603a",
        "exact_cas_status": "CROSSCHECKED_REAL_INFEASIBLE_RADICAL_MEMBERSHIP",
        "forced_zero_squared_distance_pair": [7, 8],
        "singular_direct_reduction": "SKIPPED_RADICAL_ONLY",
        "msolve_rabinowitsch_radical_membership": True,
    },
    # 654 iteration-42 witness: fourteenth NONUNIT-track 654 witness
    # (11,499,531 nodes, 20 M run, caps=0; inline audit decided
    # NONUNIT directly); certified by membership_crosscheck.py
    # --radical-only; its retained 6-row deletion core (6 deletion
    # timeouts fail-closed) is forced-pair-core-654-24.
    "e50b99fc1dbbb90924fcd5c10981ff37468ffa387f9aa596d7578d0f348b945a": {
        "equality_sha256":
            "a1bd74b56224aa95378f6f170bdf84d802ff3177c3a0a1e8f56adda861a484f6",
        "exact_cas_status": "CROSSCHECKED_REAL_INFEASIBLE_RADICAL_MEMBERSHIP",
        "forced_zero_squared_distance_pair": [7, 8],
        "singular_direct_reduction": "SKIPPED_RADICAL_ONLY",
        "msolve_rabinowitsch_radical_membership": True,
    },
    # 654 iteration-43 witness: fifteenth NONUNIT-track 654 witness
    # (11,540,705 nodes, 20 M run, caps=0; inline audit UNDECIDED —
    # third direct-cert use per decision 01KXMXK5NR11WYEYYZAS0X7RGY);
    # certified by membership_crosscheck.py --pair 7 8 --radical-only
    # --core; its retained 8-row deletion core (4 deletion timeouts
    # fail-closed) is forced-pair-core-654-25.
    "0ddb2d5f748f36a3bff668decb56e32551fcf7fdc6fd31c31f0c0506cb8e0124": {
        "equality_sha256":
            "8c864f8c33a7b0515c65c07c0152117f692ae5bb26e5c30ac5897125b161f597",
        "exact_cas_status": "CROSSCHECKED_REAL_INFEASIBLE_RADICAL_MEMBERSHIP",
        "forced_zero_squared_distance_pair": [7, 8],
        "singular_direct_reduction": "SKIPPED_RADICAL_ONLY",
        "msolve_rabinowitsch_radical_membership": True,
    },
    # 654 iteration-44 witness: sixteenth NONUNIT-track 654 witness
    # (11,836,418 nodes, 20 M run, caps=0; inline audit decided
    # NONUNIT directly); certified by membership_crosscheck.py
    # --pair 7 8 --radical-only --core; its retained 8-row deletion
    # core (6 deletion timeouts fail-closed) is
    # forced-pair-core-654-26.
    "9bc4457383d2842793c4fb6cf7a19384bc73486a0529c84fcbf6a8d831d78b41": {
        "equality_sha256":
            "7e4ea12e691453bd05a8325d2d0907ad3373889a80d8498687f8355c222162c1",
        "exact_cas_status": "CROSSCHECKED_REAL_INFEASIBLE_RADICAL_MEMBERSHIP",
        "forced_zero_squared_distance_pair": [7, 8],
        "singular_direct_reduction": "SKIPPED_RADICAL_ONLY",
        "msolve_rabinowitsch_radical_membership": True,
    },
    # 654 iteration-45 witness: seventeenth NONUNIT-track 654 witness
    # (11,836,421 nodes — 3 past iteration 44's — 20 M run, caps=0;
    # inline audit decided NONUNIT directly); certified by
    # membership_crosscheck.py --pair 7 8 --radical-only --core; its
    # retained 7-row deletion core (7 deletion timeouts fail-closed)
    # is forced-pair-core-654-27.
    "916dab7fd94bf49c7f4e9a414c0cf7011253b08a461e8b0a6791027e5fee40c6": {
        "equality_sha256":
            "26bd30990776cd78c7f2537f863a57c96e5915c2aa074475d5e96a793f5943d3",
        "exact_cas_status": "CROSSCHECKED_REAL_INFEASIBLE_RADICAL_MEMBERSHIP",
        "forced_zero_squared_distance_pair": [7, 8],
        "singular_direct_reduction": "SKIPPED_RADICAL_ONLY",
        "msolve_rabinowitsch_radical_membership": True,
    },
    # 654 iteration-46 witness: eighteenth NONUNIT-track 654 witness
    # (11,836,444 nodes — 23 past iteration 45's — 20 M run, caps=0;
    # inline audit decided NONUNIT directly); certified by
    # membership_crosscheck.py --pair 7 8 --radical-only --core; its
    # retained 7-row deletion core (6 deletion timeouts fail-closed)
    # is forced-pair-core-654-28.
    "4b546937044da9eb3c4fc99d3c6ae701ee22f97e8f76ecc7a66c91f464540f93": {
        "equality_sha256":
            "52d2e04c606b0e495c66777457d8b78ff78f1444f3b462ffa626bf0be709d6aa",
        "exact_cas_status": "CROSSCHECKED_REAL_INFEASIBLE_RADICAL_MEMBERSHIP",
        "forced_zero_squared_distance_pair": [7, 8],
        "singular_direct_reduction": "SKIPPED_RADICAL_ONLY",
        "msolve_rabinowitsch_radical_membership": True,
    },
    # 654 iteration-47 witness: nineteenth NONUNIT-track 654 witness
    # (11,836,463 nodes — 19 past iteration 46's — 20 M run, caps=0;
    # inline audit decided NONUNIT directly); certified by
    # membership_crosscheck.py --pair 7 8 --radical-only --core; its
    # retained 6-row deletion core (6 deletion timeouts fail-closed)
    # is forced-pair-core-654-29.
    "a170733b29f2567deef1e8b699e5098b262e561138731ff4d91d0369a8e3fbf0": {
        "equality_sha256":
            "337df5699a8030b63cfbfe795ca36ea00b4fd9eb9cdd74a59fb0b0ebe7067029",
        "exact_cas_status": "CROSSCHECKED_REAL_INFEASIBLE_RADICAL_MEMBERSHIP",
        "forced_zero_squared_distance_pair": [7, 8],
        "singular_direct_reduction": "SKIPPED_RADICAL_ONLY",
        "msolve_rabinowitsch_radical_membership": True,
    },
    # 654 iteration-48 witness: twentieth NONUNIT-track 654 witness
    # (11,837,146 nodes — 683 past iteration 47's — 20 M run, caps=0;
    # inline audit UNDECIDED, fourth direct-cert use); certified by
    # membership_crosscheck.py --pair 7 8 --radical-only --core; its
    # retained 7-row deletion core (4 deletion timeouts fail-closed)
    # is forced-pair-core-654-30.
    "da21b15f168795efbba90df9cd65733ef0d830413e4548446de6094217981917": {
        "equality_sha256":
            "ab8008b5b9fb7fdd0629186e8648f02f2929fd05f806265bd166c53b96c059b4",
        "exact_cas_status": "CROSSCHECKED_REAL_INFEASIBLE_RADICAL_MEMBERSHIP",
        "forced_zero_squared_distance_pair": [7, 8],
        "singular_direct_reduction": "SKIPPED_RADICAL_ONLY",
        "msolve_rabinowitsch_radical_membership": True,
    },
    # 654 iteration-49 witness: twenty-first NONUNIT-track 654 witness
    # (11,837,149 nodes — 3 past iteration 48's — 20 M run, caps=0;
    # inline audit decided NONUNIT directly); certified by
    # membership_crosscheck.py --pair 7 8 --radical-only --core; its
    # retained 7-row deletion core (5 deletion timeouts fail-closed)
    # is forced-pair-core-654-31.
    "b27d13a485280cc033db070e96c2a4bb896931fc1f59927506a291da6b0353b3": {
        "equality_sha256":
            "66f7c3a6da509fd33739f76d922e94fd6109486865552bfcc980ee860e03f268",
        "exact_cas_status": "CROSSCHECKED_REAL_INFEASIBLE_RADICAL_MEMBERSHIP",
        "forced_zero_squared_distance_pair": [7, 8],
        "singular_direct_reduction": "SKIPPED_RADICAL_ONLY",
        "msolve_rabinowitsch_radical_membership": True,
    },
}

# Literal subrow cuts extracted by exact characteristic-zero row deletion.
# Two admissible grades, both fixing the distinct labels 0=(0,0), 1=(1,0):
# unit-core-* entries are CROSSCHECKED_UNIT in Singular and in msolve under
# both forward and reverse variable orders, so any complete assignment
# containing one is complex-infeasible independently of its remaining rows.
# forced-pair-core-* entries are CROSSCHECKED_FORCED_ZERO_PAIR_CORE: the
# Rabinowitsch ideal of the subrow system plus (1 - t*dist2(pair)) is UNIT
# in all three oracle calls, i.e. dist2(pair) lies in the radical of the
# subrow ideal.  By monotonicity of radical membership this transfers to
# every superset assignment: any complete assignment containing the core
# rows forces the pair to coincide, contradicting distinct labels, hence
# admits no real Euclidean witness.
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
    # 555 iteration-20 witness d4521f84… admitted 2026-07-15: first
    # unit-grade 555 witness since iteration 6, ending a 13-iteration
    # NONUNIT run; system_unit_recheck.py 900 s deletion retained
    # 7 rows / 21 equalities incl. the Moser row 0:{1,2,3,4}
    # (4 deletion TIMEOUTs fail-closed), retained core
    # CROSSCHECKED_UNIT (Singular + msolve fwd/rev).
    {
        "id": "unit-core-555-08",
        "rows": {
            0: frozenset({1, 2, 3, 4}),
            2: frozenset({0, 1, 9, 10}),
            6: frozenset({0, 3, 7, 11}),
            7: frozenset({3, 5, 8, 10}),
            8: frozenset({0, 4, 5, 7}),
            10: frozenset({0, 4, 6, 11}),
            11: frozenset({0, 1, 5, 8}),
        },
        "equality_count": 21,
    },
    # 555 iteration-21 witness 0c979445… admitted 2026-07-15: second
    # consecutive unit-grade 555 witness (same 3.52 M pocket as iter
    # 20); system_unit_recheck.py 900 s deletion retained 8 rows / 24
    # equalities incl. the Moser row 0:{1,2,3,4} (5 deletion TIMEOUTs
    # fail-closed), retained core CROSSCHECKED_UNIT (Singular + msolve
    # fwd/rev); shares six rows with unit-core-555-08.
    {
        "id": "unit-core-555-09",
        "rows": {
            0: frozenset({1, 2, 3, 4}),
            2: frozenset({0, 1, 9, 10}),
            6: frozenset({0, 3, 7, 11}),
            7: frozenset({3, 5, 8, 10}),
            8: frozenset({4, 5, 7, 9}),
            9: frozenset({2, 7, 10, 11}),
            10: frozenset({0, 4, 6, 11}),
            11: frozenset({0, 1, 5, 8}),
        },
        "equality_count": 24,
    },
    # 555 iteration-22 witness 408ff3e5… admitted 2026-07-15: third
    # consecutive unit-grade 555 witness (3.67 M nodes, creeping past
    # the 3.52 M pocket); system_unit_recheck.py 900 s deletion
    # retained 7 rows / 21 equalities incl. the Moser row 0:{1,2,3,4}
    # (5 deletion TIMEOUTs fail-closed), retained core
    # CROSSCHECKED_UNIT (Singular + msolve fwd/rev).
    {
        "id": "unit-core-555-10",
        "rows": {
            0: frozenset({1, 2, 3, 4}),
            2: frozenset({0, 1, 9, 10}),
            7: frozenset({0, 4, 6, 8}),
            8: frozenset({2, 6, 9, 11}),
            9: frozenset({0, 4, 10, 11}),
            10: frozenset({0, 1, 5, 6}),
            11: frozenset({4, 5, 7, 10}),
        },
        "equality_count": 21,
    },
    # 555 iteration-23 witness 4bd55dcb… admitted 2026-07-15: fourth
    # consecutive unit-grade 555 witness (3.67 M nodes, same pocket as
    # iteration 22); system_unit_recheck.py 900 s deletion retained
    # 7 rows / 21 equalities incl. the Moser row 0:{1,2,3,4}
    # (4 deletion TIMEOUTs fail-closed), retained core
    # CROSSCHECKED_UNIT (Singular + msolve fwd/rev); near-twin of
    # unit-core-555-10 differing only in row 8.
    {
        "id": "unit-core-555-11",
        "rows": {
            0: frozenset({1, 2, 3, 4}),
            2: frozenset({0, 1, 9, 10}),
            7: frozenset({0, 4, 6, 8}),
            8: frozenset({2, 7, 9, 11}),
            9: frozenset({0, 4, 10, 11}),
            10: frozenset({0, 1, 5, 6}),
            11: frozenset({4, 5, 7, 10}),
        },
        "equality_count": 21,
    },
    # 555 iteration-24 witness fc6e93e9… admitted 2026-07-15: fifth
    # consecutive unit-grade 555 witness (3.68 M nodes, same pocket);
    # system_unit_recheck.py 900 s deletion retained 6 rows / 18
    # equalities incl. the Moser row 0:{1,2,3,4} (4 deletion TIMEOUTs
    # fail-closed), retained core CROSSCHECKED_UNIT (Singular + msolve
    # fwd/rev); SMALLEST unit-grade 555 core to date.
    {
        "id": "unit-core-555-12",
        "rows": {
            0: frozenset({1, 2, 3, 4}),
            2: frozenset({0, 1, 9, 10}),
            5: frozenset({2, 4, 7, 10}),
            9: frozenset({0, 4, 7, 11}),
            10: frozenset({0, 1, 5, 6}),
            11: frozenset({4, 5, 8, 10}),
        },
        "equality_count": 18,
    },
    # 555 iteration-25 witness 0f041710… admitted 2026-07-15: sixth
    # consecutive unit-grade 555 witness (3.68 M nodes, same pocket);
    # system_unit_recheck.py 900 s deletion retained 7 rows / 21
    # equalities incl. the Moser row 0:{1,2,3,4} (6 deletion TIMEOUTs
    # fail-closed), retained core CROSSCHECKED_UNIT (Singular + msolve
    # fwd/rev); differs from unit-core-555-10 only in rows 9 and 11.
    {
        "id": "unit-core-555-13",
        "rows": {
            0: frozenset({1, 2, 3, 4}),
            2: frozenset({0, 1, 9, 10}),
            7: frozenset({0, 4, 6, 8}),
            8: frozenset({2, 6, 9, 11}),
            9: frozenset({0, 3, 10, 11}),
            10: frozenset({0, 1, 5, 6}),
            11: frozenset({4, 5, 8, 10}),
        },
        "equality_count": 21,
    },
    # 555 iteration-26 witness ad1a8ed9… admitted 2026-07-15: seventh
    # consecutive unit-grade 555 witness (3.77 M nodes);
    # system_unit_recheck.py 900 s deletion retained 7 rows / 21
    # equalities incl. the Moser row 0:{1,2,3,4} (3 deletion TIMEOUTs
    # fail-closed), retained core CROSSCHECKED_UNIT (Singular + msolve
    # fwd/rev); FIRST 555 unit core with row 2:{0,1,9,11} — every
    # earlier loop 555 unit core carried 2:{0,1,9,10}.
    {
        "id": "unit-core-555-14",
        "rows": {
            0: frozenset({1, 2, 3, 4}),
            2: frozenset({0, 1, 9, 11}),
            7: frozenset({2, 5, 6, 9}),
            8: frozenset({4, 7, 9, 10}),
            9: frozenset({2, 8, 10, 11}),
            10: frozenset({0, 4, 6, 11}),
            11: frozenset({0, 1, 5, 7}),
        },
        "equality_count": 21,
    },
    # 555 iteration-27 witness c52e8cfd… admitted 2026-07-15: eighth
    # consecutive unit-grade 555 witness (3.78 M nodes);
    # system_unit_recheck.py 900 s deletion retained 7 rows / 21
    # equalities incl. the Moser row 0:{1,2,3,4} (4 deletion TIMEOUTs
    # fail-closed), retained core CROSSCHECKED_UNIT (Singular + msolve
    # fwd/rev); second consecutive core with row 2:{0,1,9,11}.
    {
        "id": "unit-core-555-15",
        "rows": {
            0: frozenset({1, 2, 3, 4}),
            2: frozenset({0, 1, 9, 11}),
            5: frozenset({1, 2, 7, 10}),
            8: frozenset({4, 5, 7, 9}),
            9: frozenset({0, 5, 8, 10}),
            10: frozenset({0, 4, 6, 11}),
            11: frozenset({1, 5, 6, 10}),
        },
        "equality_count": 21,
    },
    # 555 iteration-28 witness d770d8d7… admitted 2026-07-15: ninth
    # consecutive unit-grade 555 witness (3.79 M nodes);
    # system_unit_recheck.py 900 s deletion retained 6 rows / 18
    # equalities incl. the Moser row 0:{1,2,3,4} (4 deletion TIMEOUTs
    # fail-closed), retained core CROSSCHECKED_UNIT (Singular + msolve
    # fwd/rev); third consecutive core with row 2:{0,1,9,11}, ties
    # unit-core-555-12 for smallest unit-grade 555 core.
    {
        "id": "unit-core-555-16",
        "rows": {
            0: frozenset({1, 2, 3, 4}),
            2: frozenset({0, 1, 9, 11}),
            4: frozenset({2, 3, 5, 9}),
            9: frozenset({0, 5, 8, 10}),
            10: frozenset({0, 4, 7, 11}),
            11: frozenset({1, 5, 7, 10}),
        },
        "equality_count": 18,
    },
    # 555 iteration-29 witness d1bc6439… admitted 2026-07-15: tenth
    # consecutive unit-grade 555 witness (3.82 M nodes);
    # system_unit_recheck.py 900 s deletion retained 6 rows / 18
    # equalities incl. the Moser row 0:{1,2,3,4} (4 deletion TIMEOUTs
    # fail-closed), retained core CROSSCHECKED_UNIT (Singular + msolve
    # fwd/rev); fourth consecutive core with row 2:{0,1,9,11}, ties
    # unit-core-555-12/-16 for smallest unit-grade 555 core.
    {
        "id": "unit-core-555-17",
        "rows": {
            0: frozenset({1, 2, 3, 4}),
            2: frozenset({0, 1, 9, 11}),
            3: frozenset({1, 2, 7, 10}),
            8: frozenset({0, 4, 5, 6}),
            10: frozenset({0, 4, 8, 11}),
            11: frozenset({1, 5, 8, 10}),
        },
        "equality_count": 18,
    },
    # 555 iteration-30 witness cb967da2… admitted 2026-07-15: eleventh
    # consecutive unit-grade 555 witness (3.82 M nodes, 11 nodes past
    # iteration-29 — same pocket); system_unit_recheck.py 900 s deletion
    # retained 8 rows / 24 equalities incl. the Moser row 0:{1,2,3,4}
    # (7 deletion TIMEOUTs fail-closed), retained core CROSSCHECKED_UNIT
    # (Singular + msolve fwd/rev); fifth consecutive core with row
    # 2:{0,1,9,11}; shares rows 10 and 11 with unit-core-555-17.
    {
        "id": "unit-core-555-18",
        "rows": {
            0: frozenset({1, 2, 3, 4}),
            2: frozenset({0, 1, 9, 11}),
            5: frozenset({0, 3, 6, 10}),
            7: frozenset({2, 6, 8, 11}),
            8: frozenset({4, 5, 6, 9}),
            9: frozenset({0, 5, 7, 10}),
            10: frozenset({0, 4, 8, 11}),
            11: frozenset({1, 5, 8, 10}),
        },
        "equality_count": 24,
    },
    # 555 iteration-31 witness 3c75cbfd… admitted 2026-07-15: twelfth
    # consecutive unit-grade 555 witness (3.88 M nodes, stepped past
    # the 3.816 M pocket); system_unit_recheck.py 900 s deletion
    # retained 7 rows / 21 equalities incl. the Moser row 0:{1,2,3,4}
    # (4 deletion TIMEOUTs fail-closed), retained core CROSSCHECKED_UNIT
    # (Singular + msolve fwd/rev); sixth consecutive core with row
    # 2:{0,1,9,11}.
    {
        "id": "unit-core-555-19",
        "rows": {
            0: frozenset({1, 2, 3, 4}),
            2: frozenset({0, 1, 9, 11}),
            7: frozenset({2, 6, 8, 10}),
            8: frozenset({0, 4, 5, 7}),
            9: frozenset({0, 4, 8, 10}),
            10: frozenset({2, 5, 9, 11}),
            11: frozenset({0, 1, 5, 6}),
        },
        "equality_count": 21,
    },
    # 555 iteration-32 witness 4eb64017… admitted 2026-07-15:
    # thirteenth consecutive unit-grade 555 witness (4.00 M nodes,
    # first 555 witness past 4 M); system_unit_recheck.py 900 s
    # deletion retained 7 rows / 21 equalities incl. the Moser row
    # 0:{1,2,3,4} (5 deletion TIMEOUTs fail-closed), retained core
    # CROSSCHECKED_UNIT (Singular + msolve fwd/rev); row 2 returns to
    # the original {0,1,9,10} after six consecutive {0,1,9,11} cores.
    {
        "id": "unit-core-555-20",
        "rows": {
            0: frozenset({1, 2, 3, 4}),
            2: frozenset({0, 1, 9, 10}),
            6: frozenset({2, 5, 7, 9}),
            7: frozenset({2, 6, 10, 11}),
            9: frozenset({4, 5, 8, 10}),
            10: frozenset({0, 4, 7, 11}),
            11: frozenset({0, 1, 5, 6}),
        },
        "equality_count": 21,
    },
    # 555 iteration-33 witness 4e0a3c53… admitted 2026-07-16:
    # fourteenth consecutive unit-grade 555 witness (4.00 M nodes,
    # 67 nodes past iteration-32 — same pocket); system_unit_recheck.py
    # 900 s deletion retained 7 rows / 21 equalities incl. the Moser
    # row 0:{1,2,3,4} (5 deletion TIMEOUTs fail-closed), retained core
    # CROSSCHECKED_UNIT (Singular + msolve fwd/rev); near-twin of
    # unit-core-555-20 differing only in row 6 ({2,5,7,9} -> {2,5,8,9});
    # second consecutive core with the original row 2:{0,1,9,10}.
    {
        "id": "unit-core-555-21",
        "rows": {
            0: frozenset({1, 2, 3, 4}),
            2: frozenset({0, 1, 9, 10}),
            6: frozenset({2, 5, 8, 9}),
            7: frozenset({2, 6, 10, 11}),
            9: frozenset({4, 5, 8, 10}),
            10: frozenset({0, 4, 7, 11}),
            11: frozenset({0, 1, 5, 6}),
        },
        "equality_count": 21,
    },
    # 555 iteration-34 witness 620dad4a… admitted 2026-07-16: fifteenth
    # consecutive unit-grade 555 witness (4.00 M nodes, same pocket);
    # system_unit_recheck.py 900 s deletion retained 7 rows / 21
    # equalities incl. the Moser row 0:{1,2,3,4} (3 deletion TIMEOUTs
    # fail-closed), retained core CROSSCHECKED_UNIT (Singular + msolve
    # fwd/rev); near-twin of unit-core-555-21 — identical except the
    # {2,6,10,11} support moves from center 7 to center 8.
    {
        "id": "unit-core-555-22",
        "rows": {
            0: frozenset({1, 2, 3, 4}),
            2: frozenset({0, 1, 9, 10}),
            6: frozenset({2, 5, 8, 9}),
            8: frozenset({2, 6, 10, 11}),
            9: frozenset({4, 5, 8, 10}),
            10: frozenset({0, 4, 7, 11}),
            11: frozenset({0, 1, 5, 6}),
        },
        "equality_count": 21,
    },
    # 555 iteration-35 witness b8152428… admitted 2026-07-16: sixteenth
    # consecutive unit-grade 555 witness (4.00 M nodes, same pocket);
    # system_unit_recheck.py 900 s deletion retained 7 rows / 21
    # equalities incl. the Moser row 0:{1,2,3,4} (4 deletion TIMEOUTs
    # fail-closed), retained core CROSSCHECKED_UNIT (Singular + msolve
    # fwd/rev); differs from unit-core-555-22 by exchanging points
    # 7 and 8 within the supports of rows 6, 9, 10.
    {
        "id": "unit-core-555-23",
        "rows": {
            0: frozenset({1, 2, 3, 4}),
            2: frozenset({0, 1, 9, 10}),
            6: frozenset({2, 5, 7, 9}),
            8: frozenset({2, 6, 10, 11}),
            9: frozenset({4, 5, 7, 10}),
            10: frozenset({0, 4, 8, 11}),
            11: frozenset({0, 1, 5, 6}),
        },
        "equality_count": 21,
    },
    # 555 iteration-36 witness 964ae2d9… admitted 2026-07-16:
    # seventeenth consecutive unit-grade 555 witness (4.00 M nodes,
    # same pocket); system_unit_recheck.py 900 s deletion retained
    # 7 rows / 21 equalities incl. the Moser row 0:{1,2,3,4}
    # (5 deletion TIMEOUTs fail-closed), retained core
    # CROSSCHECKED_UNIT (Singular + msolve fwd/rev); near-twin of
    # unit-core-555-23 differing only in row 6 (7 -> 8), i.e.
    # unit-core-555-22 with 7 and 8 exchanged in rows 9/10 only.
    {
        "id": "unit-core-555-24",
        "rows": {
            0: frozenset({1, 2, 3, 4}),
            2: frozenset({0, 1, 9, 10}),
            6: frozenset({2, 5, 8, 9}),
            8: frozenset({2, 6, 10, 11}),
            9: frozenset({4, 5, 7, 10}),
            10: frozenset({0, 4, 8, 11}),
            11: frozenset({0, 1, 5, 6}),
        },
        "equality_count": 21,
    },
    # 555 iteration-37 witness 8702b9d4… admitted 2026-07-16:
    # eighteenth consecutive unit-grade 555 witness, found at only
    # 56,760 nodes after the unit-core-555-24 admission pruned the
    # 4.00 M pocket; system_unit_recheck.py 900 s deletion retained
    # 7 rows / 21 equalities incl. the Moser row 0:{1,2,3,4}
    # (4 deletion TIMEOUTs fail-closed), retained core
    # CROSSCHECKED_UNIT (Singular + msolve fwd/rev); same drift
    # family — closest to unit-core-555-20: support {0,4,7,11}
    # moves center 10 -> 8, row 9 swaps point 5 -> 0.
    {
        "id": "unit-core-555-25",
        "rows": {
            0: frozenset({1, 2, 3, 4}),
            2: frozenset({0, 1, 9, 10}),
            6: frozenset({2, 5, 7, 9}),
            7: frozenset({2, 6, 10, 11}),
            8: frozenset({0, 4, 7, 11}),
            9: frozenset({0, 4, 8, 10}),
            11: frozenset({0, 1, 5, 6}),
        },
        "equality_count": 21,
    },
    # 555 iteration-38 witness 53959a53… admitted 2026-07-16:
    # nineteenth consecutive unit-grade 555 witness (56,859 nodes,
    # same shallow pocket as iteration 37); system_unit_recheck.py
    # 900 s deletion retained 8 rows / 24 equalities incl. the Moser
    # row 0:{1,2,3,4} (7 deletion TIMEOUTs fail-closed — first 8-row
    # 555 core after a run of 7-row cores), retained core
    # CROSSCHECKED_UNIT (Singular + msolve fwd/rev); same drift
    # family anchors (rows 0/2/11), new support 10:{3,5,9,11}.
    {
        "id": "unit-core-555-26",
        "rows": {
            0: frozenset({1, 2, 3, 4}),
            2: frozenset({0, 1, 9, 10}),
            6: frozenset({2, 5, 7, 9}),
            7: frozenset({0, 4, 5, 8}),
            8: frozenset({2, 6, 10, 11}),
            9: frozenset({0, 4, 7, 10}),
            10: frozenset({3, 5, 9, 11}),
            11: frozenset({0, 1, 5, 6}),
        },
        "equality_count": 24,
    },
    # 555 iteration-39 witness 4459e702… admitted 2026-07-16:
    # twentieth consecutive unit-grade 555 witness (57,003 nodes,
    # same shallow pocket); system_unit_recheck.py 900 s deletion
    # retained 7 rows / 21 equalities incl. the Moser row 0:{1,2,3,4}
    # (4 deletion TIMEOUTs fail-closed), retained core
    # CROSSCHECKED_UNIT (Singular + msolve fwd/rev); a 7-row
    # refinement of unit-core-555-26's shape — drops row
    # 8:{2,6,10,11}, row 7 changes {0,4,5,8} -> {0,4,8,11}, keeps
    # the new support 10:{3,5,9,11}.
    {
        "id": "unit-core-555-27",
        "rows": {
            0: frozenset({1, 2, 3, 4}),
            2: frozenset({0, 1, 9, 10}),
            6: frozenset({2, 5, 7, 9}),
            7: frozenset({0, 4, 8, 11}),
            9: frozenset({0, 4, 7, 10}),
            10: frozenset({3, 5, 9, 11}),
            11: frozenset({0, 1, 5, 6}),
        },
        "equality_count": 21,
    },
    # 555 iteration-40 witness 7dc62b25… admitted 2026-07-16:
    # twenty-first consecutive unit-grade 555 witness (58,209 nodes,
    # same shallow pocket); system_unit_recheck.py 900 s deletion
    # retained 7 rows / 21 equalities incl. the Moser row 0:{1,2,3,4}
    # (3 deletion TIMEOUTs fail-closed), retained core
    # CROSSCHECKED_UNIT (Singular + msolve fwd/rev); closest to
    # unit-core-555-24 — support {0,4,8,11} moves center 10 -> 7,
    # row 9 swaps point 5 -> 0 (same move-type as 555-20 -> 555-25).
    {
        "id": "unit-core-555-28",
        "rows": {
            0: frozenset({1, 2, 3, 4}),
            2: frozenset({0, 1, 9, 10}),
            6: frozenset({2, 5, 8, 9}),
            7: frozenset({0, 4, 8, 11}),
            8: frozenset({2, 6, 10, 11}),
            9: frozenset({0, 4, 7, 10}),
            11: frozenset({0, 1, 5, 6}),
        },
        "equality_count": 21,
    },
    # 555 iteration-41 witness 2a4fdbbc… admitted 2026-07-16:
    # twenty-second consecutive unit-grade 555 witness (58,435 nodes,
    # same shallow pocket); system_unit_recheck.py 900 s deletion
    # retained 7 rows / 21 equalities incl. the Moser row 0:{1,2,3,4}
    # (4 deletion TIMEOUTs fail-closed), retained core
    # CROSSCHECKED_UNIT (Singular + msolve fwd/rev); exactly the
    # image of unit-core-555-27 under the transposition 7<->8 — all
    # seven rows map (rows 6/9 swap the point, center 7 -> 8 with
    # support {0,4,8,11} -> {0,4,7,11}).  Fourth full-core (7 8)
    # pair in the family: exhaustive transposition check also
    # relates 555-20<->555-24, 555-21<->555-23, 555-25<->555-28 —
    # the search does not quotient by the 7<->8 symmetry, so the
    # shallow pocket enumerates both halves of each symmetric orbit.
    {
        "id": "unit-core-555-29",
        "rows": {
            0: frozenset({1, 2, 3, 4}),
            2: frozenset({0, 1, 9, 10}),
            6: frozenset({2, 5, 8, 9}),
            8: frozenset({0, 4, 7, 11}),
            9: frozenset({0, 4, 8, 10}),
            10: frozenset({3, 5, 9, 11}),
            11: frozenset({0, 1, 5, 6}),
        },
        "equality_count": 21,
    },
    # 555 iteration-42 witness 9f4776ab… admitted 2026-07-16:
    # twenty-third consecutive unit-grade 555 witness (59,426 nodes,
    # same shallow pocket); system_unit_recheck.py 900 s deletion
    # retained 8 rows / 24 equalities incl. the Moser row 0:{1,2,3,4}
    # (6 deletion TIMEOUTs fail-closed), retained core
    # CROSSCHECKED_UNIT (Singular + msolve fwd/rev); NOT a
    # transposition image of any banked 555 unit core (exhaustive
    # check); shares six rows with unit-core-555-29 — row 6 changes
    # {2,5,8,9} -> {4,5,7,9} (a support last seen in 555-06) and row
    # 7:{2,6,10,11} (as in 555-20/-21/-25) re-enters.
    {
        "id": "unit-core-555-30",
        "rows": {
            0: frozenset({1, 2, 3, 4}),
            2: frozenset({0, 1, 9, 10}),
            6: frozenset({4, 5, 7, 9}),
            7: frozenset({2, 6, 10, 11}),
            8: frozenset({0, 4, 7, 11}),
            9: frozenset({0, 4, 8, 10}),
            10: frozenset({3, 5, 9, 11}),
            11: frozenset({0, 1, 5, 6}),
        },
        "equality_count": 24,
    },
    # 555 iteration-43 witness 6460bfa8… admitted 2026-07-16:
    # twenty-fourth consecutive unit-grade 555 witness (60,215 nodes,
    # same shallow pocket); system_unit_recheck.py 900 s deletion
    # retained 7 rows / 21 equalities incl. the Moser row 0:{1,2,3,4}
    # (5 deletion TIMEOUTs fail-closed), retained core
    # CROSSCHECKED_UNIT (Singular + msolve fwd/rev); not a
    # transposition image of any banked 555 unit core; shares five
    # rows with unit-core-555-29 — row 6 {2,5,8,9} -> {4,5,8,9} and
    # row 9 {0,4,8,10} -> {0,8,10,11}, both supports new to the bank.
    {
        "id": "unit-core-555-31",
        "rows": {
            0: frozenset({1, 2, 3, 4}),
            2: frozenset({0, 1, 9, 10}),
            6: frozenset({4, 5, 8, 9}),
            8: frozenset({0, 4, 7, 11}),
            9: frozenset({0, 8, 10, 11}),
            10: frozenset({3, 5, 9, 11}),
            11: frozenset({0, 1, 5, 6}),
        },
        "equality_count": 21,
    },
    # 555 iteration-44 witness c586bc22… admitted 2026-07-16:
    # twenty-fifth consecutive unit-grade 555 witness, but the pocket
    # depth JUMPED 60,215 -> 85,509 nodes and the core shape shifted:
    # both anchor rows 2:{0,1,9,10} and 11:{0,1,5,6} of the 555-24..31
    # family are gone.  system_unit_recheck.py 900 s deletion retained
    # 6 rows / 18 equalities incl. the Moser row 0:{1,2,3,4} (only 2
    # deletion TIMEOUTs), retained core CROSSCHECKED_UNIT (Singular +
    # msolve fwd/rev); not a transposition image of any banked 555
    # unit core; rows reach back to the older family — 7:{0,4,5,8} as
    # in 555-26, 8:{2,7,9,11} as in 555-11, 9:{0,3,10,11} as in
    # 555-13, 10:{4,8,9,11} as in 555-03 and forced-pair-555-10..13;
    # row 3:{0,4,7,11} is new (that support sat at center 8 in
    # 555-29/-30/-31).
    {
        "id": "unit-core-555-32",
        "rows": {
            0: frozenset({1, 2, 3, 4}),
            3: frozenset({0, 4, 7, 11}),
            7: frozenset({0, 4, 5, 8}),
            8: frozenset({2, 7, 9, 11}),
            9: frozenset({0, 3, 10, 11}),
            10: frozenset({4, 8, 9, 11}),
        },
        "equality_count": 18,
    },
    # 555 iter-45 witness c0b4b809 (SAT at 93,292 nodes, sources (6,7),
    # inline CROSSCHECKED_UNIT): the search returned to the anchored
    # family one iteration after the iter-44 pocket shift — anchor rows
    # 2:{0,1,9,10} and 11:{0,1,5,6} are back.  system_unit_recheck.py
    # 900 s deletion retained 7 rows / 21 equalities (4 deletion
    # TIMEOUTs), retained core CROSSCHECKED_UNIT (Singular + msolve
    # fwd/rev); not a transposition image of any banked 555 unit core;
    # closest kin unit-core-555-26/-28 (5 shared rows: 0, 2, 8, 9, 11);
    # supports 7:{0,3,8,11} and 10:{5,7,9,11} are new to the bank.
    {
        "id": "unit-core-555-33",
        "rows": {
            0: frozenset({1, 2, 3, 4}),
            2: frozenset({0, 1, 9, 10}),
            7: frozenset({0, 3, 8, 11}),
            8: frozenset({2, 6, 10, 11}),
            9: frozenset({0, 4, 7, 10}),
            10: frozenset({5, 7, 9, 11}),
            11: frozenset({0, 1, 5, 6}),
        },
        "equality_count": 21,
    },
    # 555 iter-46 witness 612548dc (SAT at 95,975 nodes, sources (6,7),
    # inline CROSSCHECKED_UNIT): anchored family continues — anchor
    # rows 0/2/11 all present.  system_unit_recheck.py 900 s deletion
    # retained 7 rows / 21 equalities (4 deletion TIMEOUTs), retained
    # core CROSSCHECKED_UNIT (Singular + msolve fwd/rev); not a
    # transposition image of any banked core; closest kin
    # unit-core-555-26/-27/-28/-33 (4 shared rows: 0, 2, 9, 11);
    # support 5:{2,4,6,9} new to the bank (center 5 last seen in the
    # older 555-03/-12/-15/-18 family); 8:{0,4,6,11} previously only
    # in forced-pair-core-555-07, 10:{5,8,9,11} previously only in
    # forced-pair-core-555-08/-09.
    {
        "id": "unit-core-555-34",
        "rows": {
            0: frozenset({1, 2, 3, 4}),
            2: frozenset({0, 1, 9, 10}),
            5: frozenset({2, 4, 6, 9}),
            8: frozenset({0, 4, 6, 11}),
            9: frozenset({0, 4, 7, 10}),
            10: frozenset({5, 8, 9, 11}),
            11: frozenset({0, 1, 5, 6}),
        },
        "equality_count": 21,
    },
    # 555 iter-47 witness 9896f0cd (SAT at 105,177 nodes, sources
    # (6,7), inline CROSSCHECKED_UNIT): system_unit_recheck.py 900 s
    # deletion retained 7 rows / 21 equalities (4 deletion TIMEOUTs),
    # retained core CROSSCHECKED_UNIT (Singular + msolve fwd/rev);
    # exactly the image of unit-core-555-22 under transposition 6<->7
    # (all seven rows map) — the FIFTH full-core transposition pair in
    # the 555 unit family and the first under (6 7): the earlier four
    # (555-20<->24, 21<->23, 25<->28, 27<->29) are all (7 8) pairs.
    # Row 11 deviates from the {0,1,5,6} anchor to {0,1,5,7} (seen in
    # 555-06/-14); supports 7:{2,5,8,9} and 8:{2,7,10,11} are new to
    # the bank.
    {
        "id": "unit-core-555-35",
        "rows": {
            0: frozenset({1, 2, 3, 4}),
            2: frozenset({0, 1, 9, 10}),
            7: frozenset({2, 5, 8, 9}),
            8: frozenset({2, 7, 10, 11}),
            9: frozenset({4, 5, 8, 10}),
            10: frozenset({0, 4, 6, 11}),
            11: frozenset({0, 1, 5, 7}),
        },
        "equality_count": 21,
    },
    # 555 iter-48 witness e2d7b37f (SAT at 107,074 nodes, sources
    # (6,7), inline CROSSCHECKED_UNIT): system_unit_recheck.py 900 s
    # deletion retained 7 rows / 21 equalities (4 deletion TIMEOUTs),
    # retained core CROSSCHECKED_UNIT (Singular + msolve fwd/rev);
    # exactly the image of unit-core-555-24 under transposition 6<->7
    # — the SIXTH full-core transposition pair in the 555 unit family
    # and the second under (6 7), landing one iteration after the
    # first ((6,7)-image of 555-22 = 555-35): the pocket is now
    # enumerating (6,7)-images of the earlier 555-20..28 family.
    # Shares 5 rows with 555-35;
    # support 9:{4,5,6,10} new to the bank.
    {
        "id": "unit-core-555-36",
        "rows": {
            0: frozenset({1, 2, 3, 4}),
            2: frozenset({0, 1, 9, 10}),
            7: frozenset({2, 5, 8, 9}),
            8: frozenset({2, 7, 10, 11}),
            9: frozenset({4, 5, 6, 10}),
            10: frozenset({0, 4, 8, 11}),
            11: frozenset({0, 1, 5, 7}),
        },
        "equality_count": 21,
    },
    # 555 iter-49 witness e6eae86f (SAT at 136,868 nodes — a depth
    # jump from iter-48's 107,074 — sources (6,7), inline
    # CROSSCHECKED_UNIT): system_unit_recheck.py 900 s deletion
    # retained 6 rows / 18 equalities (deletion verdicts 6 UNIT /
    # 4 NONUNIT / 2 TIMEOUT fail-closed), retained core
    # CROSSCHECKED_UNIT (Singular + msolve fwd/rev); first 6-row 555
    # core since unit-core-555-32, matching the smallest banked
    # 555-unit grade (6 rows / 18 eq: 555-12/-16/-17/-32); not a
    # transposition image of any banked core; keeps anchors
    # 0:{1,2,3,4}, 2:{0,1,9,10} and the deviated row 11:{0,1,5,7} of
    # iters 47-48 (closest kin 555-35/-36, 3 shared rows); supports
    # 5:{2,4,7,9}, 9:{0,4,6,10}, 10:{2,5,8,11} all new to the bank.
    {
        "id": "unit-core-555-37",
        "rows": {
            0: frozenset({1, 2, 3, 4}),
            2: frozenset({0, 1, 9, 10}),
            5: frozenset({2, 4, 7, 9}),
            9: frozenset({0, 4, 6, 10}),
            10: frozenset({2, 5, 8, 11}),
            11: frozenset({0, 1, 5, 7}),
        },
        "equality_count": 18,
    },
    # 555 iter-50 witness 6035ec53 (SAT at 150,291 nodes, sources
    # (6,7), inline CROSSCHECKED_UNIT): system_unit_recheck.py 900 s
    # deletion retained 8 rows / 24 equalities (deletion verdicts
    # 4 UNIT / 7 TIMEOUT fail-closed / 1 NONUNIT), retained core
    # CROSSCHECKED_UNIT (Singular + msolve fwd/rev); exactly the
    # image of unit-core-555-26 under transposition 6<->7 — the
    # SEVENTH full-core transposition pair in the 555 unit family and
    # the third under (6 7),
    # extending the (6,7)-image enumeration of the 555-20..28 family
    # (555-22 -> 555-35, 555-24 -> 555-36, 555-26 -> 555-38); support
    # 6:{0,4,5,8} new to the bank; closest kin 555-35/-36/-37
    # (4 shared rows each).
    {
        "id": "unit-core-555-38",
        "rows": {
            0: frozenset({1, 2, 3, 4}),
            2: frozenset({0, 1, 9, 10}),
            6: frozenset({0, 4, 5, 8}),
            7: frozenset({2, 5, 6, 9}),
            8: frozenset({2, 7, 10, 11}),
            9: frozenset({0, 4, 6, 10}),
            10: frozenset({3, 5, 9, 11}),
            11: frozenset({0, 1, 5, 7}),
        },
        "equality_count": 24,
    },
    # 555 iter-51 witness b984833b (SAT at 150,618 nodes — just 327
    # past iter-50's witness, the pocket tightening; sources (6,7),
    # inline CROSSCHECKED_UNIT): system_unit_recheck.py 900 s
    # deletion retained 7 rows / 21 equalities (deletion verdicts
    # 5 UNIT / 5 TIMEOUT fail-closed / 2 NONUNIT), retained core
    # CROSSCHECKED_UNIT (Singular + msolve fwd/rev); not a
    # transposition image of any banked core; closest kin
    # 555-37/-38 (4 shared rows: 0, 2, 9, 11) — the iter-49 new row
    # 9:{0,4,6,10} reused immediately; row 8:{2,7,9,11} last seen in
    # 555-11/-32 and fp-654-01/-08; supports 6:{0,4,8,11} and
    # 7:{5,6,8,9} new to the bank.
    {
        "id": "unit-core-555-39",
        "rows": {
            0: frozenset({1, 2, 3, 4}),
            2: frozenset({0, 1, 9, 10}),
            6: frozenset({0, 4, 8, 11}),
            7: frozenset({5, 6, 8, 9}),
            8: frozenset({2, 7, 9, 11}),
            9: frozenset({0, 4, 6, 10}),
            11: frozenset({0, 1, 5, 7}),
        },
        "equality_count": 21,
    },
    # 555 iter-52 witness f4f99970 (SAT at 150,678 nodes — just 60
    # past iter-51's witness, the pocket still tightening; sources
    # (6,7), inline CROSSCHECKED_UNIT): system_unit_recheck.py 900 s
    # deletion retained 7 rows / 21 equalities (deletion verdicts
    # 5 UNIT / 3 TIMEOUT fail-closed / 4 NONUNIT), retained core
    # CROSSCHECKED_UNIT (Singular + msolve fwd/rev); exact image of
    # unit-core-555-28 under transposition 6<->7 — the EIGHTH
    # full-core transposition pair in the 555 unit family (the bank
    # also holds 654-19<->20 under (7 8) and 654-29<->30 under (3 4))
    # and the fourth under (6 7): every even member 22/24/26/28 of the
    # 555-20..28 family now has its (6,7)-image banked (22 -> 35,
    # 24 -> 36, 26 -> 38, 28 -> 40).  555-28 joins 555-24 as the only
    # cores in two image pairs (25<->28 under (7 8)).  No new
    # supports — all seven rows already banked; closest kin
    # 555-35/-36/-38/-39 (5 shared rows each).
    {
        "id": "unit-core-555-40",
        "rows": {
            0: frozenset({1, 2, 3, 4}),
            2: frozenset({0, 1, 9, 10}),
            6: frozenset({0, 4, 8, 11}),
            7: frozenset({2, 5, 8, 9}),
            8: frozenset({2, 7, 10, 11}),
            9: frozenset({0, 4, 6, 10}),
            11: frozenset({0, 1, 5, 7}),
        },
        "equality_count": 21,
    },
    # 555 iter-53 witness 42b8c21f (SAT at 154,383 nodes — a wider
    # +3,705 step past iter-52 after the +327 and +60 steps; sources
    # (6,7), inline CROSSCHECKED_UNIT): system_unit_recheck.py 900 s
    # deletion retained 7 rows / 21 equalities (deletion verdicts
    # 5 UNIT / 5 TIMEOUT fail-closed / 2 NONUNIT), retained core
    # CROSSCHECKED_UNIT (Singular + msolve fwd/rev); not a
    # transposition image of any banked core; reaches back to the
    # 555-25..31 sector — closest kin 555-29/-30 (5 shared rows:
    # 0, 2, 8, 9, 10), row 8:{0,4,7,11} last in 555-25/-29/-30/-31
    # and fp-555-09, row 9:{0,4,8,10} in 555-19/-25/-29/-30 — while
    # keeping the 11:{0,1,5,7} anchor deviation; support 7:{2,5,6,10}
    # new to the bank.
    {
        "id": "unit-core-555-41",
        "rows": {
            0: frozenset({1, 2, 3, 4}),
            2: frozenset({0, 1, 9, 10}),
            7: frozenset({2, 5, 6, 10}),
            8: frozenset({0, 4, 7, 11}),
            9: frozenset({0, 4, 8, 10}),
            10: frozenset({3, 5, 9, 11}),
            11: frozenset({0, 1, 5, 7}),
        },
        "equality_count": 21,
    },
    # 555 iter-54 witness adc950eb (SAT at 167,139 nodes — a
    # +12,756 step past iter-53, the pocket's largest jump yet;
    # sources (6,7), inline CROSSCHECKED_UNIT):
    # system_unit_recheck.py 900 s deletion retained 8 rows /
    # 24 equalities (deletion verdicts 4 UNIT / 4 TIMEOUT
    # fail-closed / 4 NONUNIT), retained core CROSSCHECKED_UNIT
    # (Singular + msolve fwd/rev); not a transposition image of any
    # banked core; back in the current pocket family after iter-53's
    # reach-back — closest kin 555-38/-40 (5 shared rows: 0, 2, 8,
    # 9, 11); THREE new supports 5:{3,6,9,11}, 7:{2,6,8,9},
    # 10:{4,5,9,11}.
    {
        "id": "unit-core-555-42",
        "rows": {
            0: frozenset({1, 2, 3, 4}),
            2: frozenset({0, 1, 9, 10}),
            5: frozenset({3, 6, 9, 11}),
            7: frozenset({2, 6, 8, 9}),
            8: frozenset({2, 7, 10, 11}),
            9: frozenset({0, 4, 6, 10}),
            10: frozenset({4, 5, 9, 11}),
            11: frozenset({0, 1, 5, 7}),
        },
        "equality_count": 24,
    },
    # 555 iter-55 witness 65d4cb45 (SAT at 182,797 nodes — a
    # +15,658 step past iter-54, extending the widening trend;
    # sources (6,7), inline CROSSCHECKED_UNIT):
    # system_unit_recheck.py 900 s deletion retained 7 rows /
    # 21 equalities (deletion verdicts 5 UNIT / 4 TIMEOUT
    # fail-closed / 3 NONUNIT), retained core CROSSCHECKED_UNIT
    # (Singular + msolve fwd/rev); exact (6,7)-transposition image
    # of unit-core-555-33 — the NINTH full-core transposition pair
    # in the 555 unit family and the fifth under (6 7), and the
    # first whose preimage lies outside the even 555-20..28
    # members (whose (6,7)-images 35/36/38/40 are all banked);
    # closest same-family kin 555-38/-40/-42 (5 shared rows: 0, 2,
    # 8, 9, 11). One new support 6:{0,3,8,11}; row 10:{5,6,9,11}
    # previously only in 555-06 and 654-11.
    {
        "id": "unit-core-555-43",
        "rows": {
            0: frozenset({1, 2, 3, 4}),
            2: frozenset({0, 1, 9, 10}),
            6: frozenset({0, 3, 8, 11}),
            8: frozenset({2, 7, 10, 11}),
            9: frozenset({0, 4, 6, 10}),
            10: frozenset({5, 6, 9, 11}),
            11: frozenset({0, 1, 5, 7}),
        },
        "equality_count": 21,
    },
    # 555 iter-56 witness 70836825 (SAT at 399,458 nodes — a
    # +216,661 step past iter-55, more than doubling the pocket
    # node count, the largest jump yet; sources (6,7), inline
    # CROSSCHECKED_UNIT): system_unit_recheck.py 900 s deletion
    # retained 7 rows / 21 equalities (deletion verdicts 5 UNIT /
    # 5 TIMEOUT fail-closed / 2 NONUNIT), retained core
    # CROSSCHECKED_UNIT (Singular + msolve fwd/rev); not a
    # transposition image of any banked core; the 11:{0,1,5,7}
    # anchor deviation persistent through 555-35..43 is replaced
    # by NEW support 11:{1,5,6,9}; closest kin 555-37 (5 shared
    # rows: 0, 2, 5, 9, 10) — rows 5:{2,4,7,9} and 10:{2,5,8,11}
    # previously only in 555-37; row 8:{0,4,7,11} from the
    # 555-25..31 sector (also 555-41, fp-555-09).
    {
        "id": "unit-core-555-44",
        "rows": {
            0: frozenset({1, 2, 3, 4}),
            2: frozenset({0, 1, 9, 10}),
            5: frozenset({2, 4, 7, 9}),
            8: frozenset({0, 4, 7, 11}),
            9: frozenset({0, 4, 6, 10}),
            10: frozenset({2, 5, 8, 11}),
            11: frozenset({1, 5, 6, 9}),
        },
        "equality_count": 21,
    },
    # 555 iter-57 witness 55885365 (SAT at 465,871 nodes — a
    # +66,413 step past iter-56; sources (6,7), inline
    # CROSSCHECKED_UNIT): system_unit_recheck.py 900 s deletion
    # retained 7 rows / 21 equalities (deletion verdicts 5 UNIT /
    # 7 TIMEOUT fail-closed), retained core CROSSCHECKED_UNIT
    # (Singular + msolve fwd/rev); not a transposition image of any
    # banked core; second consecutive core with row 11 off the old
    # {0,1,5,7} anchor; no kin above 3 shared rows — THREE new
    # supports 7:{4,5,8,9}, 10:{0,5,6,11}, 11:{1,5,7,9}; row
    # 8:{2,7,10,11} from the 555-35..43 pocket, row 9:{0,4,8,10}
    # from the 555-19/-25..30/-41 sector.
    {
        "id": "unit-core-555-45",
        "rows": {
            0: frozenset({1, 2, 3, 4}),
            2: frozenset({0, 1, 9, 10}),
            7: frozenset({4, 5, 8, 9}),
            8: frozenset({2, 7, 10, 11}),
            9: frozenset({0, 4, 8, 10}),
            10: frozenset({0, 5, 6, 11}),
            11: frozenset({1, 5, 7, 9}),
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
    # 654 iteration-12 witness 4846a007… admitted 2026-07-15: first
    # unit-grade 654 loop witness (found at --max-nodes 5000000 after
    # iteration 11 capped out at 500 k per row with no witness); inline
    # audit CROSSCHECKED_UNIT, system_unit_recheck.py 900 s deletion
    # retained 6 rows / 19 equalities (2 deletion TIMEOUTs fail-closed),
    # retained core CROSSCHECKED_UNIT (Singular + msolve fwd/rev).
    {
        "id": "unit-core-654-15",
        "rows": {
            1: frozenset({0, 2, 7, 8, 9}),
            2: frozenset({0, 1, 10, 11}),
            8: frozenset({2, 5, 9, 11}),
            9: frozenset({0, 5, 6, 7}),
            10: frozenset({3, 6, 9, 11}),
            11: frozenset({1, 4, 7, 10}),
        },
        "equality_count": 19,
    },
    # 654 iteration-13 witness 1f76e0e5… admitted 2026-07-15: second
    # consecutive unit-grade 654 witness; system_unit_recheck.py 900 s
    # deletion retained 5 rows / 16 equalities (1 deletion TIMEOUT
    # fail-closed), retained core CROSSCHECKED_UNIT (Singular + msolve
    # fwd/rev); same apex+row-2 family shape as unit-core-654-11..14.
    {
        "id": "unit-core-654-16",
        "rows": {
            1: frozenset({0, 2, 7, 8, 9}),
            2: frozenset({0, 1, 10, 11}),
            8: frozenset({0, 2, 3, 4}),
            10: frozenset({0, 1, 3, 6}),
            11: frozenset({1, 4, 8, 10}),
        },
        "equality_count": 16,
    },
    # 654 iteration-14 witness 5e8d1b6f… admitted 2026-07-15: third
    # consecutive unit-grade 654 witness; system_unit_recheck.py 900 s
    # deletion retained 6 rows / 19 equalities (1 deletion TIMEOUT
    # fail-closed), retained core CROSSCHECKED_UNIT (Singular + msolve
    # fwd/rev); near-twin of unit-core-654-15 (rows 8 and 10 differ).
    {
        "id": "unit-core-654-17",
        "rows": {
            1: frozenset({0, 2, 7, 8, 9}),
            2: frozenset({0, 1, 10, 11}),
            8: frozenset({2, 6, 9, 11}),
            9: frozenset({0, 5, 6, 7}),
            10: frozenset({0, 1, 3, 6}),
            11: frozenset({1, 4, 7, 10}),
        },
        "equality_count": 19,
    },
    # 654 iteration-15 witness 9dd49bf2… admitted 2026-07-15: fourth
    # consecutive unit-grade 654 witness; system_unit_recheck.py 900 s
    # deletion retained 5 rows / 16 equalities with ZERO deletion
    # timeouts, retained core CROSSCHECKED_UNIT (Singular + msolve
    # fwd/rev); same apex+row-2 family as unit-core-654-11..17.
    {
        "id": "unit-core-654-18",
        "rows": {
            1: frozenset({0, 2, 7, 8, 9}),
            2: frozenset({0, 1, 10, 11}),
            9: frozenset({0, 2, 3, 6}),
            10: frozenset({0, 1, 3, 4}),
            11: frozenset({1, 5, 9, 10}),
        },
        "equality_count": 16,
    },
    # 654 iteration-16 witness 3dfbe849… admitted 2026-07-15: fifth
    # consecutive unit-grade 654 witness; system_unit_recheck.py 900 s
    # deletion retained 6 rows / 19 equalities (2 deletion TIMEOUTs
    # fail-closed), retained core CROSSCHECKED_UNIT (Singular + msolve
    # fwd/rev); same apex+row-2 family as unit-core-654-11..18.
    {
        "id": "unit-core-654-19",
        "rows": {
            1: frozenset({0, 2, 7, 8, 9}),
            2: frozenset({0, 1, 10, 11}),
            7: frozenset({2, 5, 9, 11}),
            9: frozenset({0, 5, 6, 8}),
            10: frozenset({3, 6, 7, 11}),
            11: frozenset({1, 4, 8, 10}),
        },
        "equality_count": 19,
    },
    # 654 iteration-17 witness 62a1cfb7… admitted 2026-07-15: sixth
    # consecutive unit-grade 654 witness; system_unit_recheck.py 900 s
    # deletion retained 6 rows / 19 equalities (2 deletion TIMEOUTs
    # fail-closed), retained core CROSSCHECKED_UNIT (Singular + msolve
    # fwd/rev); differs from unit-core-654-15 only in row 10
    # ({3,6,8,11} vs {3,6,9,11}).
    {
        "id": "unit-core-654-20",
        "rows": {
            1: frozenset({0, 2, 7, 8, 9}),
            2: frozenset({0, 1, 10, 11}),
            8: frozenset({2, 5, 9, 11}),
            9: frozenset({0, 5, 6, 7}),
            10: frozenset({3, 6, 8, 11}),
            11: frozenset({1, 4, 7, 10}),
        },
        "equality_count": 19,
    },
    # 654 iteration-18 witness 2e78700a… admitted 2026-07-15: seventh
    # consecutive unit-grade 654 witness (2.98 M nodes — first jump off
    # the 1.5 M pocket); system_unit_recheck.py 900 s deletion retained
    # 6 rows / 19 equalities (1 deletion TIMEOUT fail-closed), retained
    # core CROSSCHECKED_UNIT (Singular + msolve fwd/rev); same
    # apex+row-2 family, rows 9/10/11 differ from unit-core-654-14.
    {
        "id": "unit-core-654-21",
        "rows": {
            1: frozenset({0, 2, 7, 8, 9}),
            2: frozenset({0, 1, 10, 11}),
            8: frozenset({3, 6, 7, 9}),
            9: frozenset({0, 2, 3, 4}),
            10: frozenset({0, 1, 5, 6}),
            11: frozenset({1, 3, 8, 10}),
        },
        "equality_count": 19,
    },
    # 654 iteration-19 witness 978ae764… admitted 2026-07-15: eighth
    # consecutive unit-grade 654 witness (2.98 M pocket);
    # system_unit_recheck.py 900 s deletion retained 6 rows / 19
    # equalities (1 deletion TIMEOUT fail-closed), retained core
    # CROSSCHECKED_UNIT (Singular + msolve fwd/rev); near-twin of
    # unit-core-654-21 (rows 8 and 11 differ).
    {
        "id": "unit-core-654-22",
        "rows": {
            1: frozenset({0, 2, 7, 8, 9}),
            2: frozenset({0, 1, 10, 11}),
            8: frozenset({6, 7, 9, 11}),
            9: frozenset({0, 2, 3, 4}),
            10: frozenset({0, 1, 5, 6}),
            11: frozenset({1, 3, 7, 10}),
        },
        "equality_count": 19,
    },
    # 654 iteration-20 witness a77c802b… admitted 2026-07-15: ninth
    # consecutive unit-grade 654 witness (3.22 M nodes, past the
    # 2.98 M pocket); system_unit_recheck.py 900 s deletion retained
    # 5 rows / 16 equalities (1 deletion TIMEOUT fail-closed),
    # retained core CROSSCHECKED_UNIT (Singular + msolve fwd/rev);
    # same apex+row-2 family.
    {
        "id": "unit-core-654-23",
        "rows": {
            1: frozenset({0, 2, 7, 8, 9}),
            2: frozenset({0, 1, 10, 11}),
            8: frozenset({2, 6, 9, 11}),
            10: frozenset({0, 1, 5, 6}),
            11: frozenset({1, 3, 9, 10}),
        },
        "equality_count": 16,
    },
    # 654 iteration-21 witness 572e2d89… admitted 2026-07-15: tenth
    # consecutive unit-grade 654 witness (3.80 M nodes, past the
    # 3.22 M pocket); system_unit_recheck.py 900 s deletion retained
    # 6 rows / 19 equalities (1 deletion TIMEOUT fail-closed),
    # retained core CROSSCHECKED_UNIT (Singular + msolve fwd/rev);
    # same apex+row-2 family.
    {
        "id": "unit-core-654-24",
        "rows": {
            1: frozenset({0, 2, 7, 8, 9}),
            2: frozenset({0, 1, 10, 11}),
            8: frozenset({2, 4, 9, 11}),
            9: frozenset({0, 2, 3, 6}),
            10: frozenset({0, 1, 5, 6}),
            11: frozenset({4, 5, 9, 10}),
        },
        "equality_count": 19,
    },
    # 654 iteration-22 witness 2b74db8e… admitted 2026-07-15: eleventh
    # consecutive unit-grade 654 witness (4.16 M nodes, depth still
    # climbing); system_unit_recheck.py 900 s deletion retained
    # 6 rows / 19 equalities (1 deletion TIMEOUT fail-closed),
    # retained core CROSSCHECKED_UNIT (Singular + msolve fwd/rev);
    # shares five rows with unit-core-654-24 (row 7 replaces row 8).
    {
        "id": "unit-core-654-25",
        "rows": {
            1: frozenset({0, 2, 7, 8, 9}),
            2: frozenset({0, 1, 10, 11}),
            7: frozenset({2, 5, 8, 10}),
            9: frozenset({0, 2, 3, 6}),
            10: frozenset({0, 1, 5, 6}),
            11: frozenset({4, 5, 9, 10}),
        },
        "equality_count": 19,
    },
    # 654 iteration-23 witness 999ff6d4… admitted 2026-07-15: twelfth
    # consecutive unit-grade 654 witness (4.19 M nodes, same pocket as
    # iteration 22); system_unit_recheck.py 900 s deletion retained
    # 5 rows / 16 equalities (1 deletion TIMEOUT fail-closed),
    # retained core CROSSCHECKED_UNIT (Singular + msolve fwd/rev);
    # same apex+row-2 family.
    {
        "id": "unit-core-654-26",
        "rows": {
            1: frozenset({0, 2, 7, 8, 9}),
            2: frozenset({0, 1, 10, 11}),
            7: frozenset({2, 5, 8, 10}),
            10: frozenset({0, 1, 5, 6}),
            11: frozenset({4, 5, 7, 10}),
        },
        "equality_count": 16,
    },
    # 654 iteration-24 witness 01edc0f1… admitted 2026-07-15:
    # thirteenth consecutive unit-grade 654 witness (4.59 M nodes,
    # nearing the 5 M cap); system_unit_recheck.py 900 s deletion
    # retained 6 rows / 19 equalities (2 deletion TIMEOUTs
    # fail-closed), retained core CROSSCHECKED_UNIT (Singular +
    # msolve fwd/rev); same apex+row-2 family.
    {
        "id": "unit-core-654-27",
        "rows": {
            1: frozenset({0, 2, 7, 8, 9}),
            2: frozenset({0, 1, 10, 11}),
            8: frozenset({5, 7, 9, 10}),
            9: frozenset({0, 2, 3, 4}),
            10: frozenset({0, 1, 5, 6}),
            11: frozenset({4, 5, 8, 10}),
        },
        "equality_count": 19,
    },
    # 654 iteration-25 witness 08395232… admitted 2026-07-15:
    # fourteenth consecutive unit-grade 654 witness (4.594 M nodes,
    # same depth as iteration 24 — plateau pocket; searched at
    # --max-nodes 10000000); system_unit_recheck.py 900 s deletion
    # retained 6 rows / 19 equalities (1 deletion TIMEOUT
    # fail-closed), retained core CROSSCHECKED_UNIT (Singular +
    # msolve fwd/rev); same apex+row-2 family.
    {
        "id": "unit-core-654-28",
        "rows": {
            1: frozenset({0, 2, 7, 8, 9}),
            2: frozenset({0, 1, 10, 11}),
            7: frozenset({2, 6, 8, 11}),
            8: frozenset({2, 4, 9, 10}),
            10: frozenset({0, 1, 5, 6}),
            11: frozenset({4, 5, 8, 10}),
        },
        "equality_count": 19,
    },
    # 654 iteration-26 witness cbf173d2… admitted 2026-07-15:
    # fifteenth consecutive unit-grade 654 witness (6.58 M nodes, big
    # depth jump past the 4.59 M plateau; --max-nodes 10000000);
    # system_unit_recheck.py 900 s deletion retained 5 rows / 16
    # equalities (4 deletion TIMEOUTs fail-closed), retained core
    # CROSSCHECKED_UNIT (Singular + msolve fwd/rev); FIRST loop 654
    # unit core WITHOUT row 2:{0,1,10,11} — keeps the apex row
    # 1:{0,2,7,8,9} but departs from the apex+row-2 family.
    {
        "id": "unit-core-654-29",
        "rows": {
            1: frozenset({0, 2, 7, 8, 9}),
            5: frozenset({1, 4, 6, 7}),
            7: frozenset({2, 3, 5, 8}),
            8: frozenset({2, 6, 9, 11}),
            9: frozenset({1, 5, 7, 10}),
        },
        "equality_count": 16,
    },
    # 654 iteration-27 witness 780ac81b… admitted 2026-07-15:
    # sixteenth consecutive unit-grade 654 witness (6.72 M nodes,
    # same pocket as iteration 26); system_unit_recheck.py 900 s
    # deletion retained 5 rows / 16 equalities (4 deletion TIMEOUTs
    # fail-closed), retained core CROSSCHECKED_UNIT (Singular +
    # msolve fwd/rev); second consecutive no-row-2 core, near-twin
    # of unit-core-654-29 differing in rows 5 and 7.
    {
        "id": "unit-core-654-30",
        "rows": {
            1: frozenset({0, 2, 7, 8, 9}),
            5: frozenset({1, 3, 6, 7}),
            7: frozenset({2, 4, 5, 8}),
            8: frozenset({2, 6, 9, 11}),
            9: frozenset({1, 5, 7, 10}),
        },
        "equality_count": 16,
    },
    # 654 iteration-39 witness 8b8d49f1… admitted 2026-07-16: FIRST
    # unit-grade 654 witness after the eleven-witness NONUNIT run
    # (iterations 28-38), and the deepest 654 witness yet (10.775 M
    # nodes, run at --max-nodes 20000000); system_unit_recheck.py
    # 900 s deletion retained 6 rows / 19 equalities (5 deletion
    # TIMEOUTs fail-closed), retained core CROSSCHECKED_UNIT
    # (Singular + msolve fwd/rev); not a transposition image of any
    # banked 654 unit core; keeps the recurring surplus row
    # 1:{0,2,7,8,9}; shares 2:{0,5,10,11} with forced-pair-core-654-21
    # (the immediately preceding admission) and carries its {1,3,7,10}
    # support at center 11 (exact row of unit-core-654-22); supports
    # 6:{1,4,5,7} and 9:{1,2,6,10} are new to the bank.
    {
        "id": "unit-core-654-31",
        "rows": {
            1: frozenset({0, 2, 7, 8, 9}),
            2: frozenset({0, 5, 10, 11}),
            6: frozenset({1, 4, 5, 7}),
            9: frozenset({1, 2, 6, 10}),
            10: frozenset({0, 4, 6, 11}),
            11: frozenset({1, 3, 7, 10}),
        },
        "equality_count": 19,
    },
    # 555 iteration-10 witness 50cfcbec… admitted 2026-07-15: first
    # forced-pair core (membership_crosscheck.py --radical-only --core).
    # SUPERSEDED 2026-07-15 by the 600 s re-deletion sweep: the 60 s
    # pass had kept 7 rows / 21 equalities; at 600 s per attempt the
    # greedy deletion (zero TIMEOUTs) retained 6 rows / 18 equalities
    # with the pair-(6,7) Rabinowitsch ideal UNIT; retained core
    # CROSSCHECKED_FORCED_ZERO_PAIR_CORE (Singular + msolve fwd/rev).
    # The only shrinkage in the 13-witness redel600 sweep.
    {
        "id": "forced-pair-core-555-01",
        "rows": {
            3: frozenset({0, 4, 6, 11}),
            6: frozenset({2, 7, 9, 11}),
            7: frozenset({0, 3, 6, 8}),
            8: frozenset({2, 3, 4, 10}),
            9: frozenset({5, 7, 10, 11}),
            10: frozenset({3, 8, 9, 11}),
        },
        "equality_count": 18,
        "forced_zero_squared_distance_pair": (6, 7),
        "exact_cas_status": "CROSSCHECKED_FORCED_ZERO_PAIR_CORE",
    },
    # 654 iteration-3 witness cb30873e… retro-admitted 2026-07-15
    # (--radical-only --core rerun of the signature-only kill): 5-row /
    # 15-equality core forcing pair (7,8) with no row centered at 7;
    # retained core Rabinowitsch UNIT x3.
    {
        "id": "forced-pair-core-654-01",
        "rows": {
            2: frozenset({0, 1, 10, 11}),
            8: frozenset({2, 7, 9, 11}),
            9: frozenset({2, 4, 8, 10}),
            10: frozenset({0, 6, 8, 11}),
            11: frozenset({0, 2, 3, 5}),
        },
        "equality_count": 15,
        "forced_zero_squared_distance_pair": (7, 8),
        "exact_cas_status": "CROSSCHECKED_FORCED_ZERO_PAIR_CORE",
    },
    # 654 iteration-4 witness 6b5de144… admitted 2026-07-15: 8-row /
    # 24-equality core forcing pair (7,8); no row centered at 7 or at
    # the apex; retained core Rabinowitsch UNIT x3.
    {
        "id": "forced-pair-core-654-02",
        "rows": {
            3: frozenset({1, 4, 6, 7}),
            4: frozenset({2, 3, 6, 10}),
            5: frozenset({0, 3, 4, 7}),
            6: frozenset({4, 5, 8, 11}),
            8: frozenset({3, 7, 9, 11}),
            9: frozenset({2, 4, 8, 10}),
            10: frozenset({0, 6, 8, 11}),
            11: frozenset({0, 2, 3, 5}),
        },
        "equality_count": 24,
        "forced_zero_squared_distance_pair": (7, 8),
        "exact_cas_status": "CROSSCHECKED_FORCED_ZERO_PAIR_CORE",
    },
    # 555 iteration-7 witness 84ac8d4a… retro-admitted 2026-07-15
    # (--radical-only --core rerun of the signature-only kill): 7-row /
    # 21-equality core forcing pair (6,7); differs from the iteration-9
    # retro core only in row 4; retained core Rabinowitsch UNIT x3.
    {
        "id": "forced-pair-core-555-02",
        "rows": {
            0: frozenset({4, 5, 7, 9}),
            4: frozenset({2, 3, 5, 9}),
            5: frozenset({1, 4, 7, 11}),
            7: frozenset({0, 3, 6, 8}),
            8: frozenset({2, 3, 4, 10}),
            9: frozenset({5, 8, 10, 11}),
            11: frozenset({0, 1, 3, 5}),
        },
        "equality_count": 21,
        "forced_zero_squared_distance_pair": (6, 7),
        "exact_cas_status": "CROSSCHECKED_FORCED_ZERO_PAIR_CORE",
    },
    # 555 iteration-9 witness fd874bf2… retro-admitted 2026-07-15: same
    # shape as forced-pair-core-555-02 except row 4 = {3,5,6,9};
    # retained core Rabinowitsch UNIT x3.
    {
        "id": "forced-pair-core-555-03",
        "rows": {
            0: frozenset({4, 5, 7, 9}),
            4: frozenset({3, 5, 6, 9}),
            5: frozenset({1, 4, 7, 11}),
            7: frozenset({0, 3, 6, 8}),
            8: frozenset({2, 3, 4, 10}),
            9: frozenset({5, 8, 10, 11}),
            11: frozenset({0, 1, 3, 5}),
        },
        "equality_count": 21,
        "forced_zero_squared_distance_pair": (6, 7),
        "exact_cas_status": "CROSSCHECKED_FORCED_ZERO_PAIR_CORE",
    },
    # 555 iteration-8 witness 79a04c0f… retro-admitted 2026-07-15: 8-row
    # / 24-equality core forcing pair (6,7); retained core Rabinowitsch
    # UNIT x3.
    {
        "id": "forced-pair-core-555-04",
        "rows": {
            0: frozenset({4, 5, 8, 9}),
            4: frozenset({2, 3, 5, 9}),
            5: frozenset({1, 4, 8, 11}),
            6: frozenset({2, 7, 9, 11}),
            7: frozenset({0, 3, 6, 8}),
            8: frozenset({2, 3, 4, 10}),
            9: frozenset({5, 7, 10, 11}),
            10: frozenset({3, 8, 9, 11}),
        },
        "equality_count": 24,
        "forced_zero_squared_distance_pair": (6, 7),
        "exact_cas_status": "CROSSCHECKED_FORCED_ZERO_PAIR_CORE",
    },
    # 654 iteration-1 witness a4914ed2… retro-admitted 2026-07-15 (the
    # ideal whose std(I) defeated 1800 s): 10-row / 30-equality core
    # forcing pair (7,8) — only two rows deleted; retained core
    # Rabinowitsch UNIT x3.
    {
        "id": "forced-pair-core-654-03",
        "rows": {
            2: frozenset({0, 1, 10, 11}),
            3: frozenset({1, 5, 6, 7}),
            4: frozenset({2, 3, 9, 11}),
            5: frozenset({2, 4, 6, 10}),
            6: frozenset({0, 3, 4, 7}),
            7: frozenset({4, 5, 8, 11}),
            8: frozenset({1, 4, 6, 9}),
            9: frozenset({2, 3, 7, 10}),
            10: frozenset({0, 6, 9, 11}),
            11: frozenset({0, 2, 5, 8}),
        },
        "equality_count": 30,
        "forced_zero_squared_distance_pair": (7, 8),
        "exact_cas_status": "CROSSCHECKED_FORCED_ZERO_PAIR_CORE",
    },
    # 654 iteration-2 witness 9095f635… retro-admitted 2026-07-15:
    # 7-row / 21-equality core forcing pair (7,8); retained core
    # Rabinowitsch UNIT x3.
    {
        "id": "forced-pair-core-654-04",
        "rows": {
            2: frozenset({0, 1, 10, 11}),
            5: frozenset({2, 4, 6, 11}),
            7: frozenset({2, 4, 8, 10}),
            8: frozenset({5, 7, 9, 10}),
            9: frozenset({3, 5, 8, 11}),
            10: frozenset({1, 2, 5, 9}),
            11: frozenset({0, 2, 3, 7}),
        },
        "equality_count": 21,
        "forced_zero_squared_distance_pair": (7, 8),
        "exact_cas_status": "CROSSCHECKED_FORCED_ZERO_PAIR_CORE",
    },
    # 555 iteration-11 witness 38a642e3… admitted 2026-07-15: 7-row /
    # 21-equality core forcing pair (6,7); retained core Rabinowitsch
    # UNIT x3.
    {
        "id": "forced-pair-core-555-05",
        "rows": {
            2: frozenset({0, 1, 9, 10}),
            6: frozenset({2, 5, 7, 9}),
            7: frozenset({2, 4, 8, 10}),
            8: frozenset({4, 7, 9, 11}),
            9: frozenset({0, 6, 10, 11}),
            10: frozenset({1, 3, 8, 9}),
            11: frozenset({1, 4, 6, 10}),
        },
        "equality_count": 21,
        "forced_zero_squared_distance_pair": (6, 7),
        "exact_cas_status": "CROSSCHECKED_FORCED_ZERO_PAIR_CORE",
    },
    # 654 iteration-5 witness 080287b2… admitted 2026-07-15: 8-row /
    # 24-equality core forcing pair (7,8); retained core Rabinowitsch
    # UNIT x3.
    {
        "id": "forced-pair-core-654-05",
        "rows": {
            2: frozenset({0, 1, 10, 11}),
            4: frozenset({2, 3, 7, 11}),
            6: frozenset({0, 4, 5, 7}),
            7: frozenset({2, 5, 8, 11}),
            8: frozenset({0, 3, 7, 9}),
            9: frozenset({3, 6, 8, 10}),
            10: frozenset({0, 2, 4, 8}),
            11: frozenset({0, 1, 5, 6}),
        },
        "equality_count": 24,
        "forced_zero_squared_distance_pair": (7, 8),
        "exact_cas_status": "CROSSCHECKED_FORCED_ZERO_PAIR_CORE",
    },
    # 555 iteration-12 witness 5d2b6e65… admitted 2026-07-15 (inline
    # audit UNDECIDED: msolve NONUNIT x2, Singular TIMEOUT; pair route
    # certified directly): 7-row / 21-equality core forcing pair (6,7)
    # with no row centered at 7; retained core Rabinowitsch UNIT x3.
    {
        "id": "forced-pair-core-555-06",
        "rows": {
            0: frozenset({3, 5, 7, 9}),
            2: frozenset({0, 1, 9, 10}),
            3: frozenset({1, 4, 5, 8}),
            4: frozenset({0, 3, 5, 6}),
            5: frozenset({2, 3, 4, 10}),
            6: frozenset({2, 4, 7, 9}),
            10: frozenset({1, 3, 6, 9}),
        },
        "equality_count": 21,
        "forced_zero_squared_distance_pair": (6, 7),
        "exact_cas_status": "CROSSCHECKED_FORCED_ZERO_PAIR_CORE",
    },
    # 654 iteration-6 witness f8dd433b… admitted 2026-07-15: 7-row /
    # 21-equality core forcing pair (7,8); shares five rows with
    # forced-pair-core-654-05; retained core Rabinowitsch UNIT x3.
    {
        "id": "forced-pair-core-654-06",
        "rows": {
            3: frozenset({1, 4, 6, 7}),
            4: frozenset({2, 3, 7, 11}),
            6: frozenset({0, 4, 5, 7}),
            7: frozenset({2, 5, 8, 11}),
            8: frozenset({0, 3, 7, 9}),
            9: frozenset({3, 6, 8, 10}),
            11: frozenset({0, 1, 5, 6}),
        },
        "equality_count": 21,
        "forced_zero_squared_distance_pair": (7, 8),
        "exact_cas_status": "CROSSCHECKED_FORCED_ZERO_PAIR_CORE",
    },
    # 555 iteration-13 witness 78b4d1af… admitted 2026-07-15: 8-row /
    # 24-equality core forcing pair (6,7); retained core Rabinowitsch
    # UNIT x3.
    {
        "id": "forced-pair-core-555-07",
        "rows": {
            3: frozenset({1, 4, 5, 8}),
            4: frozenset({0, 3, 5, 6}),
            6: frozenset({2, 4, 7, 9}),
            7: frozenset({2, 5, 8, 10}),
            8: frozenset({0, 4, 6, 11}),
            9: frozenset({0, 7, 10, 11}),
            10: frozenset({0, 1, 3, 8}),
            11: frozenset({1, 4, 7, 10}),
        },
        "equality_count": 24,
        "forced_zero_squared_distance_pair": (6, 7),
        "exact_cas_status": "CROSSCHECKED_FORCED_ZERO_PAIR_CORE",
    },
    # 654 iteration-7 witness e99adf80… admitted 2026-07-15: 7-row /
    # 21-equality core forcing pair (7,8); no row centered at 7; retained
    # core Rabinowitsch UNIT x3.
    {
        "id": "forced-pair-core-654-07",
        "rows": {
            0: frozenset({3, 6, 9, 11}),
            2: frozenset({0, 1, 10, 11}),
            3: frozenset({1, 4, 6, 8}),
            8: frozenset({4, 7, 9, 11}),
            9: frozenset({2, 3, 5, 10}),
            10: frozenset({0, 1, 3, 7}),
            11: frozenset({1, 2, 4, 9}),
        },
        "equality_count": 21,
        "forced_zero_squared_distance_pair": (7, 8),
        "exact_cas_status": "CROSSCHECKED_FORCED_ZERO_PAIR_CORE",
    },
    # 555 iteration-14 witness 67cd332a… admitted 2026-07-15: 7-row /
    # 21-equality core forcing pair (6,7); retained core Rabinowitsch
    # UNIT x3 (6 deletion TIMEOUTs retained fail-closed).
    {
        "id": "forced-pair-core-555-08",
        "rows": {
            2: frozenset({0, 1, 9, 10}),
            4: frozenset({0, 3, 5, 6}),
            5: frozenset({2, 3, 4, 10}),
            6: frozenset({2, 4, 7, 9}),
            9: frozenset({0, 1, 3, 8}),
            10: frozenset({5, 8, 9, 11}),
            11: frozenset({1, 4, 6, 9}),
        },
        "equality_count": 21,
        "forced_zero_squared_distance_pair": (6, 7),
        "exact_cas_status": "CROSSCHECKED_FORCED_ZERO_PAIR_CORE",
    },
    # 654 iteration-8 witness 0fe506e4… admitted 2026-07-15: 9-row /
    # 27-equality core forcing pair (7,8); retained core Rabinowitsch
    # UNIT x3 (8 deletion TIMEOUTs retained fail-closed under box load).
    {
        "id": "forced-pair-core-654-08",
        "rows": {
            0: frozenset({1, 3, 6, 9}),
            3: frozenset({1, 4, 6, 8}),
            5: frozenset({4, 6, 7, 11}),
            6: frozenset({2, 5, 8, 11}),
            7: frozenset({0, 3, 5, 9}),
            8: frozenset({2, 7, 9, 11}),
            9: frozenset({2, 4, 5, 10}),
            10: frozenset({0, 3, 8, 11}),
            11: frozenset({0, 1, 4, 7}),
        },
        "equality_count": 27,
        "forced_zero_squared_distance_pair": (7, 8),
        "exact_cas_status": "CROSSCHECKED_FORCED_ZERO_PAIR_CORE",
    },
    # 555 iteration-15 witness 1e81296b… admitted 2026-07-15: 8-row /
    # 24-equality core forcing pair (7,8) — NOT the source pair (6,7),
    # which is unforced on this witness (NONUNIT x3); retained core
    # Rabinowitsch UNIT x3 (8 deletion TIMEOUTs retained fail-closed).
    {
        "id": "forced-pair-core-555-09",
        "rows": {
            2: frozenset({0, 1, 9, 10}),
            4: frozenset({0, 3, 5, 7}),
            5: frozenset({2, 3, 4, 10}),
            7: frozenset({2, 5, 8, 10}),
            8: frozenset({0, 4, 7, 11}),
            9: frozenset({0, 1, 3, 8}),
            10: frozenset({5, 8, 9, 11}),
            11: frozenset({1, 4, 6, 9}),
        },
        "equality_count": 24,
        "forced_zero_squared_distance_pair": (7, 8),
        "exact_cas_status": "CROSSCHECKED_FORCED_ZERO_PAIR_CORE",
    },
    # 654 iteration-9 witness 9bd971a6… admitted 2026-07-15: 7-row /
    # 21-equality core forcing pair (7,8); no row centered at 3, 4, or
    # 5; retained core Rabinowitsch UNIT x3 (5 deletion TIMEOUTs
    # retained fail-closed).
    {
        "id": "forced-pair-core-654-09",
        "rows": {
            2: frozenset({0, 1, 10, 11}),
            6: frozenset({4, 5, 8, 10}),
            7: frozenset({0, 5, 6, 9}),
            8: frozenset({2, 7, 9, 10}),
            9: frozenset({1, 2, 3, 5}),
            10: frozenset({2, 4, 9, 11}),
            11: frozenset({0, 1, 4, 8}),
        },
        "equality_count": 21,
        "forced_zero_squared_distance_pair": (7, 8),
        "exact_cas_status": "CROSSCHECKED_FORCED_ZERO_PAIR_CORE",
    },
    # 555 iteration-16 witness 25e8cc56… admitted 2026-07-15: 7-row /
    # 21-equality core forcing pair (6,7); retained core Rabinowitsch
    # UNIT x3 (6 deletion TIMEOUTs retained fail-closed).
    {
        "id": "forced-pair-core-555-10",
        "rows": {
            0: frozenset({1, 3, 5, 8}),
            6: frozenset({2, 4, 7, 10}),
            7: frozenset({0, 5, 6, 8}),
            8: frozenset({5, 7, 9, 11}),
            9: frozenset({0, 3, 6, 11}),
            10: frozenset({4, 8, 9, 11}),
            11: frozenset({0, 1, 4, 7}),
        },
        "equality_count": 21,
        "forced_zero_squared_distance_pair": (6, 7),
        "exact_cas_status": "CROSSCHECKED_FORCED_ZERO_PAIR_CORE",
    },
    # 654 iteration-10 witness d515e684… admitted 2026-07-15: 7-row /
    # 22-equality core forcing pair (7,8) — first forced-pair core
    # retaining an apex row (center 1, five-point support); retained
    # core Rabinowitsch UNIT x3 (3 deletion TIMEOUTs retained
    # fail-closed).
    {
        "id": "forced-pair-core-654-10",
        "rows": {
            1: frozenset({5, 7, 8, 9, 11}),
            5: frozenset({0, 4, 6, 8}),
            6: frozenset({2, 5, 8, 10}),
            7: frozenset({0, 5, 6, 9}),
            9: frozenset({2, 3, 5, 11}),
            10: frozenset({0, 1, 3, 7}),
            11: frozenset({1, 4, 5, 10}),
        },
        "equality_count": 22,
        "forced_zero_squared_distance_pair": (7, 8),
        "exact_cas_status": "CROSSCHECKED_FORCED_ZERO_PAIR_CORE",
    },
    # 555 iteration-17 witness 09fd77b8… admitted 2026-07-15: 8-row /
    # 24-equality core forcing pair (6,7); retained core Rabinowitsch
    # UNIT x3 (7 deletion TIMEOUTs retained fail-closed).
    {
        "id": "forced-pair-core-555-11",
        "rows": {
            2: frozenset({0, 1, 9, 10}),
            4: frozenset({2, 3, 5, 10}),
            6: frozenset({2, 4, 7, 10}),
            7: frozenset({0, 3, 6, 8}),
            8: frozenset({5, 7, 9, 11}),
            9: frozenset({0, 5, 6, 10}),
            10: frozenset({4, 8, 9, 11}),
            11: frozenset({0, 1, 4, 7}),
        },
        "equality_count": 24,
        "forced_zero_squared_distance_pair": (6, 7),
        "exact_cas_status": "CROSSCHECKED_FORCED_ZERO_PAIR_CORE",
    },
    # 555 iteration-18 witness 0d357ae8… admitted 2026-07-15: 6-row /
    # 18-equality core forcing pair (6,7) — smallest 555 core to date;
    # retained core Rabinowitsch UNIT x3, ZERO deletion timeouts.
    {
        "id": "forced-pair-core-555-12",
        "rows": {
            5: frozenset({3, 4, 6, 9}),
            6: frozenset({2, 4, 8, 10}),
            7: frozenset({0, 3, 6, 8}),
            8: frozenset({5, 7, 9, 11}),
            9: frozenset({0, 5, 6, 10}),
            10: frozenset({4, 8, 9, 11}),
        },
        "equality_count": 18,
        "forced_zero_squared_distance_pair": (6, 7),
        "exact_cas_status": "CROSSCHECKED_FORCED_ZERO_PAIR_CORE",
    },
    # 555 iteration-19 witness 717de68a… admitted 2026-07-15: 7-row /
    # 21-equality core forcing pair (6,7); retained core Rabinowitsch
    # UNIT x3, ZERO deletion timeouts; differs from 555-10 only in row
    # 6's support ({2,4,8,10} vs {2,4,7,10}).
    {
        "id": "forced-pair-core-555-13",
        "rows": {
            0: frozenset({1, 3, 5, 8}),
            6: frozenset({2, 4, 8, 10}),
            7: frozenset({0, 5, 6, 8}),
            8: frozenset({5, 7, 9, 11}),
            9: frozenset({0, 3, 6, 11}),
            10: frozenset({4, 8, 9, 11}),
            11: frozenset({0, 1, 4, 7}),
        },
        "equality_count": 21,
        "forced_zero_squared_distance_pair": (6, 7),
        "exact_cas_status": "CROSSCHECKED_FORCED_ZERO_PAIR_CORE",
    },
    # 654 iteration-28 witness 8f8cdfed… admitted 2026-07-15: 7-row /
    # 21-equality core forcing pair (7,8) — first 654 NONUNIT since
    # iteration-10, arriving with the no-row-2 family edge; retained
    # core Rabinowitsch UNIT x3, ZERO deletion timeouts; no apex row.
    {
        "id": "forced-pair-core-654-11",
        "rows": {
            0: frozenset({3, 6, 9, 10}),
            3: frozenset({1, 4, 7, 10}),
            6: frozenset({1, 5, 9, 11}),
            7: frozenset({2, 6, 8, 11}),
            9: frozenset({0, 3, 5, 7}),
            10: frozenset({0, 4, 5, 6}),
            11: frozenset({1, 3, 8, 10}),
        },
        "equality_count": 21,
        "forced_zero_squared_distance_pair": (7, 8),
        "exact_cas_status": "CROSSCHECKED_FORCED_ZERO_PAIR_CORE",
    },
    # 654 iteration-29 witness 5a6fd93d… admitted 2026-07-15: 8-row /
    # 24-equality core forcing pair (7,8) — second consecutive 654
    # NONUNIT; retained core Rabinowitsch UNIT x3, ZERO deletion
    # timeouts; no apex row; shares rows 0/6/7/10/11 with
    # forced-pair-core-654-11 (drops 3 and 9, adds 4, 5, 8).
    {
        "id": "forced-pair-core-654-12",
        "rows": {
            0: frozenset({3, 6, 9, 10}),
            4: frozenset({3, 6, 7, 11}),
            5: frozenset({1, 4, 6, 8}),
            6: frozenset({1, 5, 9, 11}),
            7: frozenset({2, 6, 8, 11}),
            8: frozenset({3, 4, 7, 9}),
            10: frozenset({0, 4, 5, 6}),
            11: frozenset({1, 3, 8, 10}),
        },
        "equality_count": 24,
        "forced_zero_squared_distance_pair": (7, 8),
        "exact_cas_status": "CROSSCHECKED_FORCED_ZERO_PAIR_CORE",
    },
    # 654 iteration-30 witness 998d759a… admitted 2026-07-15: 6-row /
    # 19-equality core forcing pair (7,8) — third consecutive 654
    # NONUNIT; retained core Rabinowitsch UNIT x3, ZERO deletion
    # timeouts; second-smallest 654 forced-pair core (after 654-01's
    # 15 equalities); apex row 1:{0,2,7,8,9} returns (654-11/-12 had
    # none); shares rows 6 and 7 with both 654-11 and 654-12.
    {
        "id": "forced-pair-core-654-13",
        "rows": {
            1: frozenset({0, 2, 7, 8, 9}),
            6: frozenset({1, 5, 9, 11}),
            7: frozenset({2, 6, 8, 11}),
            9: frozenset({0, 3, 6, 7}),
            10: frozenset({0, 1, 4, 6}),
            11: frozenset({1, 3, 9, 10}),
        },
        "equality_count": 19,
        "forced_zero_squared_distance_pair": (7, 8),
        "exact_cas_status": "CROSSCHECKED_FORCED_ZERO_PAIR_CORE",
    },
    # 654 iteration-31 witness 1902f507… admitted 2026-07-15: 7-row /
    # 22-equality core forcing pair (7,8) — fourth consecutive 654
    # NONUNIT; retained core Rabinowitsch UNIT x3, ZERO deletion
    # timeouts; shares rows 1/6/7/10/11 with forced-pair-core-654-13
    # (row 9 support {0,3,6,7} -> {0,3,5,8}, row 8 added).
    {
        "id": "forced-pair-core-654-14",
        "rows": {
            1: frozenset({0, 2, 7, 8, 9}),
            6: frozenset({1, 5, 9, 11}),
            7: frozenset({2, 6, 8, 11}),
            8: frozenset({2, 3, 4, 9}),
            9: frozenset({0, 3, 5, 8}),
            10: frozenset({0, 1, 4, 6}),
            11: frozenset({1, 3, 9, 10}),
        },
        "equality_count": 22,
        "forced_zero_squared_distance_pair": (7, 8),
        "exact_cas_status": "CROSSCHECKED_FORCED_ZERO_PAIR_CORE",
    },
    # 654 iteration-32 witness 5b9f46c0… admitted 2026-07-16: 6-row /
    # 18-equality core forcing pair (7,8) — fifth consecutive 654
    # NONUNIT; retained core Rabinowitsch UNIT x3, ZERO deletion
    # timeouts; second-smallest 654 forced-pair core (between 654-01's
    # 15 and 654-13's 19 equalities); shares NO rows with the
    # 654-11..14 cluster — a fresh NONUNIT pattern, no apex row.
    {
        "id": "forced-pair-core-654-15",
        "rows": {
            4: frozenset({3, 5, 8, 11}),
            5: frozenset({1, 6, 8, 10}),
            7: frozenset({2, 4, 5, 8}),
            8: frozenset({6, 7, 9, 10}),
            10: frozenset({0, 1, 3, 4}),
            11: frozenset({1, 5, 7, 10}),
        },
        "equality_count": 18,
        "forced_zero_squared_distance_pair": (7, 8),
        "exact_cas_status": "CROSSCHECKED_FORCED_ZERO_PAIR_CORE",
    },
    # 654 iteration-33 witness ea77d602… admitted 2026-07-16: 7-row /
    # 22-equality core forcing pair (7,8) — sixth consecutive 654
    # NONUNIT; BOTH inline audit and 900 s system recheck were
    # UNDECIDED (first of loop), so this self-contained forced-pair
    # cert is the sole kill; retained core Rabinowitsch UNIT x3
    # (msolve forward/reverse + Singular), ZERO deletion timeouts;
    # shares rows 7/8/11 with 654-15 — the "fresh" pattern clusters.
    {
        "id": "forced-pair-core-654-16",
        "rows": {
            1: frozenset({0, 2, 7, 8, 9}),
            0: frozenset({5, 6, 9, 11}),
            7: frozenset({2, 4, 5, 8}),
            8: frozenset({6, 7, 9, 10}),
            9: frozenset({0, 2, 3, 6}),
            10: frozenset({1, 3, 4, 9}),
            11: frozenset({1, 5, 7, 10}),
        },
        "equality_count": 22,
        "forced_zero_squared_distance_pair": (7, 8),
        "exact_cas_status": "CROSSCHECKED_FORCED_ZERO_PAIR_CORE",
    },
    # 654 iteration-34 witness b7de2283… admitted 2026-07-16: 6-row /
    # 18-equality core forcing pair (7,8) — seventh consecutive 654
    # NONUNIT-track witness (inline audit decided NONUNIT directly);
    # retained core Rabinowitsch UNIT x3, 3 deletion TIMEOUTs
    # fail-closed; ties forced-pair-core-654-15's 18 equalities for
    # second-smallest; no apex row; bridges the two NONUNIT clusters —
    # shares rows 5/8/10 with 654-15 and rows 0/8/9 with 654-16.
    {
        "id": "forced-pair-core-654-17",
        "rows": {
            0: frozenset({5, 6, 9, 11}),
            5: frozenset({1, 6, 8, 10}),
            6: frozenset({2, 3, 5, 10}),
            8: frozenset({6, 7, 9, 10}),
            9: frozenset({0, 2, 3, 6}),
            10: frozenset({0, 1, 3, 4}),
        },
        "equality_count": 18,
        "forced_zero_squared_distance_pair": (7, 8),
        "exact_cas_status": "CROSSCHECKED_FORCED_ZERO_PAIR_CORE",
    },
    # 654 iteration-35 witness 42949532… admitted 2026-07-16: 7-row /
    # 21-equality core forcing pair (7,8) — eighth consecutive 654
    # NONUNIT-track witness (inline audit decided NONUNIT directly,
    # 7.809 M nodes — past the 7.559 M pocket); retained core
    # Rabinowitsch UNIT x3, 5 deletion TIMEOUTs fail-closed; no apex
    # row; shares three rows with EACH of 654-15/-16/-17, and swaps
    # points 8 and 9 in rows 0/5 relative to 654-17 — the NONUNIT
    # family presents as one connected orbit.
    {
        "id": "forced-pair-core-654-18",
        "rows": {
            0: frozenset({5, 6, 8, 11}),
            5: frozenset({1, 6, 9, 10}),
            6: frozenset({2, 3, 5, 10}),
            7: frozenset({2, 4, 5, 8}),
            9: frozenset({0, 2, 3, 6}),
            10: frozenset({0, 1, 3, 4}),
            11: frozenset({1, 5, 7, 10}),
        },
        "equality_count": 21,
        "forced_zero_squared_distance_pair": (7, 8),
        "exact_cas_status": "CROSSCHECKED_FORCED_ZERO_PAIR_CORE",
    },
    # 654 iteration-36 witness 61222481… admitted 2026-07-16: 7-row /
    # 21-equality core forcing pair (7,8) — ninth consecutive 654
    # NONUNIT-track witness (inline audit decided NONUNIT directly,
    # 8.264 M nodes); retained core Rabinowitsch UNIT x3, 7 deletion
    # TIMEOUTs fail-closed; no apex row; bridges both NONUNIT
    # clusters — shares 10:{0,1,4,6} with 654-13/-14 and
    # 11:{1,5,7,10} with 654-15/-16/-18, and carries the {1,5,9,11}
    # support (at center 4) that 654-11..14 held at center 6.
    {
        "id": "forced-pair-core-654-19",
        "rows": {
            3: frozenset({1, 4, 8, 10}),
            4: frozenset({1, 5, 9, 11}),
            5: frozenset({2, 3, 6, 10}),
            7: frozenset({2, 3, 8, 11}),
            8: frozenset({2, 5, 9, 10}),
            10: frozenset({0, 1, 4, 6}),
            11: frozenset({1, 5, 7, 10}),
        },
        "equality_count": 21,
        "forced_zero_squared_distance_pair": (7, 8),
        "exact_cas_status": "CROSSCHECKED_FORCED_ZERO_PAIR_CORE",
    },
    # 654 iteration-37 witness 91c0316c… admitted 2026-07-16: 7-row /
    # 22-equality core forcing pair (7,8) — tenth consecutive 654
    # NONUNIT-track witness (inline audit decided NONUNIT directly,
    # 9.680 M nodes, deepest yet); retained core Rabinowitsch UNIT x3,
    # 6 deletion TIMEOUTs fail-closed; keeps the 5-support surplus
    # row 1:{0,2,7,8,9} shared with 654-13/-14/-16, but its other
    # four supports 6:{1,3,4,7}, 8:{2,4,5,9}, 9:{0,3,6,8},
    # 11:{4,6,7,10} are new to the bank — a fresh sector of the
    # NONUNIT orbit rather than another -15..-19 neighbor.
    {
        "id": "forced-pair-core-654-20",
        "rows": {
            1: frozenset({0, 2, 7, 8, 9}),
            6: frozenset({1, 3, 4, 7}),
            7: frozenset({2, 6, 8, 10}),
            8: frozenset({2, 4, 5, 9}),
            9: frozenset({0, 3, 6, 8}),
            10: frozenset({0, 1, 5, 6}),
            11: frozenset({4, 6, 7, 10}),
        },
        "equality_count": 22,
        "forced_zero_squared_distance_pair": (7, 8),
        "exact_cas_status": "CROSSCHECKED_FORCED_ZERO_PAIR_CORE",
    },
    # 654 iteration-38 witness 8bb1f421… admitted 2026-07-16: 8-row /
    # 24-equality core forcing pair (7,8) — eleventh consecutive 654
    # NONUNIT-track witness (10.155 M nodes, first past the old 10 M
    # cap; inline UNDECIDED, killed by the self-contained cert per the
    # double-UNDECIDED decision); retained core Rabinowitsch UNIT x3,
    # 5 deletion TIMEOUTs fail-closed; no 5-support surplus row — all
    # eight rows are 4-supports; shares 5:{1,4,6,8} with 654-12,
    # 9:{0,3,6,7} with 654-13, 10:{0,1,5,6} with 654-20; supports
    # 2:{0,5,10,11}, 4:{2,3,6,11}, 6:{1,3,7,10} are new to the bank.
    {
        "id": "forced-pair-core-654-21",
        "rows": {
            0: frozenset({4, 6, 9, 11}),
            2: frozenset({0, 5, 10, 11}),
            4: frozenset({2, 3, 6, 11}),
            5: frozenset({1, 4, 6, 8}),
            6: frozenset({1, 3, 7, 10}),
            7: frozenset({2, 3, 5, 8}),
            9: frozenset({0, 3, 6, 7}),
            10: frozenset({0, 1, 5, 6}),
        },
        "equality_count": 24,
        "forced_zero_squared_distance_pair": (7, 8),
        "exact_cas_status": "CROSSCHECKED_FORCED_ZERO_PAIR_CORE",
    },
    # 654 iteration-40 witness 9c594158… admitted 2026-07-16: 8-row /
    # 25-equality core forcing pair (7,8) — twelfth NONUNIT-track 654
    # witness, first after the unit-grade interruption at iteration 39
    # (inline NONUNIT direct, 11.485 M nodes); retained core
    # Rabinowitsch UNIT x3, 7 deletion TIMEOUTs fail-closed; keeps the
    # surplus row 1:{0,2,7,8,9} and ties broadly into the orbit —
    # 2:{0,5,10,11} (654-21), 4:{1,5,9,11} (654-19), 7:{2,4,5,8}
    # (654-15/-16/-18), 9:{0,2,3,6} (654-16/-17/-18), 10:{0,1,5,6}
    # (654-20/-21); supports 8:{3,7,9,10} and 11:{3,5,8,10} are new
    # to the bank.
    {
        "id": "forced-pair-core-654-22",
        "rows": {
            1: frozenset({0, 2, 7, 8, 9}),
            2: frozenset({0, 5, 10, 11}),
            4: frozenset({1, 5, 9, 11}),
            7: frozenset({2, 4, 5, 8}),
            8: frozenset({3, 7, 9, 10}),
            9: frozenset({0, 2, 3, 6}),
            10: frozenset({0, 1, 5, 6}),
            11: frozenset({3, 5, 8, 10}),
        },
        "equality_count": 25,
        "forced_zero_squared_distance_pair": (7, 8),
        "exact_cas_status": "CROSSCHECKED_FORCED_ZERO_PAIR_CORE",
    },
    # 654 iteration-41 witness b2a6ec69… admitted 2026-07-16: 7-row /
    # 22-equality core forcing pair (7,8) — thirteenth NONUNIT-track
    # 654 witness, surfacing just 3 nodes past iteration 40's
    # (11,485,031 -> 11,485,034; 20 M run, caps=0) after the banked
    # 654-22 core killed the neighbouring branch; retained core
    # Rabinowitsch UNIT x3, 6 deletion TIMEOUTs fail-closed; shares
    # 6 of its 7 rows with 654-22 (1, 2, 8, 9, 10, 11), drops 654-22's
    # row 4, and its row 7 shifts {2,4,5,8} -> {2,4,5,9} — support
    # new to the bank.
    {
        "id": "forced-pair-core-654-23",
        "rows": {
            1: frozenset({0, 2, 7, 8, 9}),
            2: frozenset({0, 5, 10, 11}),
            7: frozenset({2, 4, 5, 9}),
            8: frozenset({3, 7, 9, 10}),
            9: frozenset({0, 2, 3, 6}),
            10: frozenset({0, 1, 5, 6}),
            11: frozenset({3, 5, 8, 10}),
        },
        "equality_count": 22,
        "forced_zero_squared_distance_pair": (7, 8),
        "exact_cas_status": "CROSSCHECKED_FORCED_ZERO_PAIR_CORE",
    },
    # 654 iteration-42 witness e50b99fc… admitted 2026-07-16: 6-row /
    # 19-equality core forcing pair (7,8) — fourteenth NONUNIT-track
    # 654 witness (11,499,531 nodes, ~14.5 k past iteration 41; 20 M
    # run, caps=0); smallest recent 654 forced-pair core; retained
    # core Rabinowitsch UNIT x3, 6 deletion TIMEOUTs fail-closed; not
    # a transposition image of any banked core; a FRESH orbit sector —
    # keeps the surplus row 1:{0,2,7,8,9} but supports 3:{1,4,8,11},
    # 4:{3,5,7,11}, 5:{1,3,6,9}, 9:{0,3,4,7} are all new to the bank
    # and 11:{1,5,9,10} appeared only in unit-core-654-18.
    {
        "id": "forced-pair-core-654-24",
        "rows": {
            1: frozenset({0, 2, 7, 8, 9}),
            3: frozenset({1, 4, 8, 11}),
            4: frozenset({3, 5, 7, 11}),
            5: frozenset({1, 3, 6, 9}),
            9: frozenset({0, 3, 4, 7}),
            11: frozenset({1, 5, 9, 10}),
        },
        "equality_count": 19,
        "forced_zero_squared_distance_pair": (7, 8),
        "exact_cas_status": "CROSSCHECKED_FORCED_ZERO_PAIR_CORE",
    },
    # 654 iteration-43 witness 0ddb2d5f… admitted 2026-07-16: 8-row /
    # 24-equality core forcing pair (7,8) —
    # fifteenth NONUNIT-track 654 witness (11,540,705 nodes; 20 M run,
    # caps=0); inline oracle UNDECIDED, admitted via direct
    # membership_crosscheck --pair 7 8 --radical-only --core (third
    # direct-cert use, decision 01KXMXK5NR11WYEYYZAS0X7RGY); deletion
    # verdicts 4 UNIT / 4 TIMEOUT fail-closed / 4 NONUNIT — witness
    # rows 0, 1, 2, 3 dropped, INCLUDING the surplus row 1:{0,2,7,8,9}
    # (breaks the 654-22/-23/-24 run which all kept it; all supports
    # cardinality 4); not a transposition image of any banked
    # core — continues the iteration-42 fresh orbit sector: supports
    # 4:{1,3,5,8}, 5:{1,6,9,11}, 6:{1,4,7,10}, 8:{2,3,9,10},
    # 11:{4,6,8,10} are all new to the bank; max overlap with any
    # single banked core is 2 rows (unit-core-654-28,
    # forced-pair-core-654-13, forced-pair-core-654-21).
    {
        "id": "forced-pair-core-654-25",
        "rows": {
            4: frozenset({1, 3, 5, 8}),
            5: frozenset({1, 6, 9, 11}),
            6: frozenset({1, 4, 7, 10}),
            7: frozenset({2, 6, 8, 11}),
            8: frozenset({2, 3, 9, 10}),
            9: frozenset({0, 3, 6, 7}),
            10: frozenset({0, 1, 5, 6}),
            11: frozenset({4, 6, 8, 10}),
        },
        "equality_count": 24,
        "forced_zero_squared_distance_pair": (7, 8),
        "exact_cas_status": "CROSSCHECKED_FORCED_ZERO_PAIR_CORE",
    },
    # 654 iteration-44 witness 9bc44573… admitted 2026-07-16: 8-row /
    # 24-equality core forcing pair (7,8) — sixteenth NONUNIT-track
    # 654 witness (11,836,418 nodes, ~296 k past iteration 43; 20 M
    # run, caps=0); inline audit CROSSCHECKED_NONUNIT directly;
    # deletion verdicts 4 UNIT / 6 TIMEOUT fail-closed / 2 NONUNIT —
    # witness rows 1 (surplus), 2, 4, 6 dropped (second consecutive
    # core without the surplus row; all supports cardinality 4); not
    # a transposition image of any banked core; unlike the
    # iteration-42/-43 fresh sector this one bridges BACK into the
    # older orbit — closest kin forced-pair-core-654-22 (3 shared
    # rows: 7, 9, 10), row 8:{6,7,9,11} previously only in
    # unit-core-654-22, row 5:{1,3,6,9} links to the fresh sector via
    # forced-pair-core-654-24, row 3:{1,4,8,10} previously only in
    # forced-pair-core-654-19; supports 0:{3,4,9,10} and 11:{3,5,7,10}
    # new to the bank.
    {
        "id": "forced-pair-core-654-26",
        "rows": {
            0: frozenset({3, 4, 9, 10}),
            3: frozenset({1, 4, 8, 10}),
            5: frozenset({1, 3, 6, 9}),
            7: frozenset({2, 4, 5, 8}),
            8: frozenset({6, 7, 9, 11}),
            9: frozenset({0, 2, 3, 6}),
            10: frozenset({0, 1, 5, 6}),
            11: frozenset({3, 5, 7, 10}),
        },
        "equality_count": 24,
        "forced_zero_squared_distance_pair": (7, 8),
        "exact_cas_status": "CROSSCHECKED_FORCED_ZERO_PAIR_CORE",
    },
    # 654 iteration-45 witness 916dab7f… admitted 2026-07-16: 7-row /
    # 21-equality core forcing pair (7,8) — seventeenth NONUNIT-track
    # 654 witness (11,836,421 nodes — just 3 past iteration 44's,
    # repeating the iteration 40->41 tight-pocket adjacency; 20 M
    # run, caps=0); inline audit CROSSCHECKED_NONUNIT directly;
    # deletion verdicts 5 UNIT / 7 TIMEOUT fail-closed — witness rows
    # 1 (surplus), 2, 4, 5, 7 dropped (third consecutive core without
    # the surplus row); not a transposition image of any banked core;
    # sibling variation of forced-pair-core-654-26 (6 of 7 rows
    # shared: 0, 3, 8, 9, 10, 11), dropping its rows 5:{1,3,6,9} and
    # 7:{2,4,5,8}; support 6:{1,4,7,11} new to the bank.
    {
        "id": "forced-pair-core-654-27",
        "rows": {
            0: frozenset({3, 4, 9, 10}),
            3: frozenset({1, 4, 8, 10}),
            6: frozenset({1, 4, 7, 11}),
            8: frozenset({6, 7, 9, 11}),
            9: frozenset({0, 2, 3, 6}),
            10: frozenset({0, 1, 5, 6}),
            11: frozenset({3, 5, 7, 10}),
        },
        "equality_count": 21,
        "forced_zero_squared_distance_pair": (7, 8),
        "exact_cas_status": "CROSSCHECKED_FORCED_ZERO_PAIR_CORE",
    },
    # 654 iteration-46 witness 4b546937… admitted 2026-07-16: 7-row /
    # 22-equality core forcing pair (7,8) — eighteenth NONUNIT-track
    # 654 witness (11,836,444 nodes — just 23 past iteration 45's,
    # the tight pocket continuing; 20 M run, caps=0); inline audit
    # CROSSCHECKED_NONUNIT directly; deletion verdicts 5 UNIT /
    # 6 TIMEOUT fail-closed / 1 NONUNIT — witness rows 0, 2, 3, 4, 7
    # dropped; the surplus row 1:{0,2,7,8,9} is RETAINED again after
    # cores -25/-26/-27 all dropped it; not a transposition image of
    # any banked core; kin fp-654-26 (rows 5, 10, 11), fp-654-27
    # (rows 6, 10, 11 — its new row 6:{1,4,7,11} reused immediately),
    # unit-654-23 (rows 1, 8, 10); row 8:{2,6,9,11} previously only
    # in unit cores (555-10/-13, 654-13/-17/-23/-29/-30); support
    # 9:{0,4,6,7} new to the bank.
    {
        "id": "forced-pair-core-654-28",
        "rows": {
            1: frozenset({0, 2, 7, 8, 9}),
            5: frozenset({1, 3, 6, 9}),
            6: frozenset({1, 4, 7, 11}),
            8: frozenset({2, 6, 9, 11}),
            9: frozenset({0, 4, 6, 7}),
            10: frozenset({0, 1, 5, 6}),
            11: frozenset({3, 5, 7, 10}),
        },
        "equality_count": 22,
        "forced_zero_squared_distance_pair": (7, 8),
        "exact_cas_status": "CROSSCHECKED_FORCED_ZERO_PAIR_CORE",
    },
    # 654 iteration-47 witness a170733b… admitted 2026-07-16: 6-row /
    # 19-equality core forcing pair (7,8) — nineteenth NONUNIT-track
    # 654 witness (11,836,463 nodes — 19 past iteration 46's, pocket
    # steps now 3/23/19; 20 M run, caps=0); inline audit
    # CROSSCHECKED_NONUNIT directly; deletion verdicts 6 UNIT /
    # 6 TIMEOUT fail-closed — witness rows 2, 3, 4, 5, 6, 11 dropped;
    # surplus row 1:{0,2,7,8,9} retained (second consecutive after
    # fp-654-28); 6-row grade matches fp-654-13/-15/-17/-24 (only
    # fp-654-01 at 5 rows is smaller); not a transposition image of
    # any banked core; kin at 3 shared rows: unit-654-23/-30,
    # fp-654-20/-22/-28; row 9:{0,3,6,8} previously only in
    # fp-654-20, row 7:{2,4,5,8} returns after fp-654-27 dropped it;
    # support 0:{4,6,7,10} new to the bank.
    {
        "id": "forced-pair-core-654-29",
        "rows": {
            0: frozenset({4, 6, 7, 10}),
            1: frozenset({0, 2, 7, 8, 9}),
            7: frozenset({2, 4, 5, 8}),
            8: frozenset({2, 6, 9, 11}),
            9: frozenset({0, 3, 6, 8}),
            10: frozenset({0, 1, 5, 6}),
        },
        "equality_count": 19,
        "forced_zero_squared_distance_pair": (7, 8),
        "exact_cas_status": "CROSSCHECKED_FORCED_ZERO_PAIR_CORE",
    },
    # 654 iteration-48 witness da21b15f… admitted 2026-07-16: 7-row /
    # 22-equality core forcing pair (7,8) — twentieth NONUNIT-track
    # 654 witness (11,837,146 nodes — 683 past iteration 47's, pocket
    # steps now 3/23/19/683; 20 M run, caps=0); inline audit
    # UNDECIDED, so certified via direct membership_crosscheck.py
    # --pair 7 8 --radical-only --core (fourth direct-cert use);
    # Rabinowitsch UNIT x3 (Singular + msolve fwd/rev); deletion
    # verdicts 5 UNIT / 4 TIMEOUT fail-closed / 3 NONUNIT — witness
    # rows 0, 3, 4, 6, 10 dropped; surplus row 1:{0,2,7,8,9}
    # retained (third consecutive after fp-654-28/-29); not a
    # transposition image of any banked core; closest kin fp-654-26
    # (5 shared rows: 5, 7, 8, 9, 11); zero new supports — every
    # retained row already appears in banked cores.
    {
        "id": "forced-pair-core-654-30",
        "rows": {
            1: frozenset({0, 2, 7, 8, 9}),
            2: frozenset({0, 5, 10, 11}),
            5: frozenset({1, 3, 6, 9}),
            7: frozenset({2, 4, 5, 8}),
            8: frozenset({6, 7, 9, 11}),
            9: frozenset({0, 2, 3, 6}),
            11: frozenset({3, 5, 7, 10}),
        },
        "equality_count": 22,
        "forced_zero_squared_distance_pair": (7, 8),
        "exact_cas_status": "CROSSCHECKED_FORCED_ZERO_PAIR_CORE",
    },
    # 654 iteration-49 witness b27d13a4… admitted 2026-07-16: 7-row /
    # 22-equality core forcing pair (7,8) — twenty-first NONUNIT-track
    # 654 witness (11,837,149 nodes — 3 past iteration 48's, pocket
    # steps now 3/23/19/683/3; 20 M run, caps=0); inline audit
    # CROSSCHECKED_NONUNIT directly; Rabinowitsch UNIT x3 (Singular +
    # msolve fwd/rev); deletion verdicts 5 UNIT / 5 TIMEOUT
    # fail-closed / 2 NONUNIT — witness rows 0, 3, 4, 7, 9 dropped;
    # surplus row 1:{0,2,7,8,9} retained (fourth consecutive after
    # fp-654-28/-29/-30); not a transposition image of any banked
    # core; kin fp-654-28 and fp-654-30 (5 shared rows each); zero
    # new supports — second consecutive core drawn entirely from
    # banked rows.
    {
        "id": "forced-pair-core-654-31",
        "rows": {
            1: frozenset({0, 2, 7, 8, 9}),
            2: frozenset({0, 5, 10, 11}),
            5: frozenset({1, 3, 6, 9}),
            6: frozenset({1, 4, 7, 11}),
            8: frozenset({6, 7, 9, 11}),
            10: frozenset({0, 1, 5, 6}),
            11: frozenset({3, 5, 7, 10}),
        },
        "equality_count": 22,
        "forced_zero_squared_distance_pair": (7, 8),
        "exact_cas_status": "CROSSCHECKED_FORCED_ZERO_PAIR_CORE",
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
