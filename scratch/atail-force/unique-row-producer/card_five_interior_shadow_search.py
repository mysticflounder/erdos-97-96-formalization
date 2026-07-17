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
    # 654 iteration-50 witness: twenty-second NONUNIT-track 654
    # witness (11,995,904 nodes — 158,755 past iteration 49's, the
    # largest 654 step yet — 20 M run, caps=0; inline audit decided
    # NONUNIT directly); certified by membership_crosscheck.py
    # --pair 7 8 --radical-only --core; its retained 6-row deletion
    # core (6 deletion timeouts fail-closed) is
    # forced-pair-core-654-32.
    "fb1e0dd98436f49670a06e989a92a2486bd22607289633c98290d2cbb1f0e527": {
        "equality_sha256":
            "963bc0e0861d8de474f7906b56e97d2ca55ea5c668b1190957704f8e9afe2b3d",
        "exact_cas_status": "CROSSCHECKED_REAL_INFEASIBLE_RADICAL_MEMBERSHIP",
        "forced_zero_squared_distance_pair": [7, 8],
        "singular_direct_reduction": "SKIPPED_RADICAL_ONLY",
        "msolve_rabinowitsch_radical_membership": True,
    },
    # 654 iteration-51 witness: twenty-third NONUNIT-track 654
    # witness (12,011,137 nodes — 15,233 past iteration 50's — 20 M
    # run, caps=0; inline audit decided NONUNIT directly); certified
    # by membership_crosscheck.py --pair 7 8 --radical-only --core;
    # its retained 8-row deletion core (7 deletion timeouts
    # fail-closed) is forced-pair-core-654-33.
    "e55df416d59f35143f62bcc745500987cddd93b426581683370011f5e400d065": {
        "equality_sha256":
            "e41fabd38aed5a9750aee545093b4a0e018688dc002b0501e625b65bdc52ef46",
        "exact_cas_status": "CROSSCHECKED_REAL_INFEASIBLE_RADICAL_MEMBERSHIP",
        "forced_zero_squared_distance_pair": [7, 8],
        "singular_direct_reduction": "SKIPPED_RADICAL_ONLY",
        "msolve_rabinowitsch_radical_membership": True,
    },
    # 654 iteration-52 witness: twenty-fourth NONUNIT-track 654
    # witness (12,011,489 nodes — 352 past iteration 51's — 20 M
    # run, caps=0; inline audit decided NONUNIT directly); certified
    # by membership_crosscheck.py --pair 7 8 --radical-only --core;
    # its retained 8-row deletion core (7 deletion timeouts
    # fail-closed) is forced-pair-core-654-34.
    "e188012bdeef049ffc01f4d73b7a6d82d988f383fc0d7eab17b20df85fd9c326": {
        "equality_sha256":
            "473ad791f0b0f87c7177b434f7acfb4cda2f7574557c57483cc2ae4350129fab",
        "exact_cas_status": "CROSSCHECKED_REAL_INFEASIBLE_RADICAL_MEMBERSHIP",
        "forced_zero_squared_distance_pair": [7, 8],
        "singular_direct_reduction": "SKIPPED_RADICAL_ONLY",
        "msolve_rabinowitsch_radical_membership": True,
    },
    # 654 iteration-54 witness: twenty-fifth NONUNIT-track 654
    # witness (13,095,453 nodes — 1,067 past iteration 53's — 20 M
    # run, caps=0; inline audit decided NONUNIT directly); certified
    # by membership_crosscheck.py --pair 7 8 --radical-only --core;
    # its retained 8-row deletion core (7 deletion timeouts
    # fail-closed) is forced-pair-core-654-35.
    "6331dec67820700bcefb2bd6186d8cbdc2099289c59bf8b502c3105c90e60de4": {
        "equality_sha256":
            "f3236b169765faf1acf2769d9dc62dc20ab49bae615f463c04c590afd08900a0",
        "exact_cas_status": "CROSSCHECKED_REAL_INFEASIBLE_RADICAL_MEMBERSHIP",
        "forced_zero_squared_distance_pair": [7, 8],
        "singular_direct_reduction": "SKIPPED_RADICAL_ONLY",
        "msolve_rabinowitsch_radical_membership": True,
    },
    # 654 iteration-55 witness: twenty-sixth NONUNIT-track 654
    # witness (13,095,457 nodes — 4 past iteration 54's — 20 M
    # run, caps=0; inline audit decided NONUNIT directly); certified
    # by membership_crosscheck.py --pair 7 8 --radical-only --core;
    # its retained 8-row deletion core (7 deletion timeouts
    # fail-closed) is forced-pair-core-654-36.
    "1ff0d20b65fac8e8db1be2f91ed87724ee214cdc47291841bae80c045fa03263": {
        "equality_sha256":
            "ef68bf48468d262c53a710afbe631ee6312f89df94769e74bfcc899377f48b62",
        "exact_cas_status": "CROSSCHECKED_REAL_INFEASIBLE_RADICAL_MEMBERSHIP",
        "forced_zero_squared_distance_pair": [7, 8],
        "singular_direct_reduction": "SKIPPED_RADICAL_ONLY",
        "msolve_rabinowitsch_radical_membership": True,
    },
    # 654 iteration-56 witness: twenty-seventh NONUNIT-track 654
    # witness (13,348,599 nodes — +253,142 past iteration 55's,
    # breaking the ~13.0955M pocket — 20 M run, caps=0; inline audit
    # decided NONUNIT directly); certified by
    # membership_crosscheck.py --pair 7 8 --radical-only --core; its
    # retained 8-row deletion core (7 deletion timeouts fail-closed)
    # is forced-pair-core-654-37.
    "fcaeae53f4cf17cf4efef5a1f636a79c17413ceb38105f028e9286a18fccc04a": {
        "equality_sha256":
            "fc90302c1871959491f2e78f062cd394b8bb21220a4deac572f185c155c510d6",
        "exact_cas_status": "CROSSCHECKED_REAL_INFEASIBLE_RADICAL_MEMBERSHIP",
        "forced_zero_squared_distance_pair": [7, 8],
        "singular_direct_reduction": "SKIPPED_RADICAL_ONLY",
        "msolve_rabinowitsch_radical_membership": True,
    },
    # 654 iteration-57 witness: twenty-eighth NONUNIT-track 654
    # witness (13,349,122 nodes — +523 past iteration 56's, a new
    # pocket forming after the +253k jump — 20 M run, caps=0; inline
    # audit decided NONUNIT directly); certified by
    # membership_crosscheck.py --pair 7 8 --radical-only --core; its
    # retained 8-row deletion core (6 deletion timeouts fail-closed)
    # is forced-pair-core-654-38.
    "ba42681dc075a1dee30f0f924c0b15295c13f8d0d580ed6bc1039e83c5bfc245": {
        "equality_sha256":
            "bb1bc81ca96a838d123dbe298f6e27d4199f5f14ba76d17f3a914dc16aa4eb27",
        "exact_cas_status": "CROSSCHECKED_REAL_INFEASIBLE_RADICAL_MEMBERSHIP",
        "forced_zero_squared_distance_pair": [7, 8],
        "singular_direct_reduction": "SKIPPED_RADICAL_ONLY",
        "msolve_rabinowitsch_radical_membership": True,
    },
    # 654 iteration-58 witness: twenty-ninth NONUNIT-track 654
    # witness (13,349,669 nodes — +547 past iteration 57's, second
    # witness in the ~13.349M pocket — 20 M run, caps=0; inline
    # audit decided NONUNIT directly); certified by
    # membership_crosscheck.py --pair 7 8 --radical-only --core; its
    # retained 8-row deletion core (3 deletion timeouts fail-closed)
    # is forced-pair-core-654-39.
    "80b4089304214dd10bc62fba820c6d17e76e3c7dbb9711dbea5c71758691b2c9": {
        "equality_sha256":
            "481113fd752534f8fed526817c369b1bdf66029e529f1d20924a38bc04510ec8",
        "exact_cas_status": "CROSSCHECKED_REAL_INFEASIBLE_RADICAL_MEMBERSHIP",
        "forced_zero_squared_distance_pair": [7, 8],
        "singular_direct_reduction": "SKIPPED_RADICAL_ONLY",
        "msolve_rabinowitsch_radical_membership": True,
    },
    # 654 iteration-59 witness admitted 2026-07-16: thirtieth
    # NONUNIT-track 654 witness (13,349,673 nodes — +4 past
    # iteration 58's, fourth witness in the ~13.349M pocket — 20 M
    # run, caps=0; inline audit decided NONUNIT directly); certified
    # by membership_crosscheck.py --pair 7 8 --radical-only --core;
    # its retained 6-row deletion core (5 deletion timeouts
    # fail-closed) is forced-pair-core-654-40.
    "8cfc23afa0137c6031098b1fad03c4bb634d82d85a1408bcba3c60a6875bc285": {
        "equality_sha256":
            "9dff08005d88d2fc434350c8b7dc3893687d81b6f7b84d3902a4f3154c906614",
        "exact_cas_status": "CROSSCHECKED_REAL_INFEASIBLE_RADICAL_MEMBERSHIP",
        "forced_zero_squared_distance_pair": [7, 8],
        "singular_direct_reduction": "SKIPPED_RADICAL_ONLY",
        "msolve_rabinowitsch_radical_membership": True,
    },
    # 654 iteration-60 witness admitted 2026-07-16: thirty-first
    # NONUNIT-track 654 witness (13,349,703 nodes — +30 past
    # iteration 59's, fifth witness in the ~13.349M pocket — 20 M
    # run, caps=0; inline audit decided NONUNIT directly); certified
    # by membership_crosscheck.py --pair 7 8 --radical-only --core;
    # its retained 7-row deletion core (5 deletion timeouts
    # fail-closed) is forced-pair-core-654-41.
    "0a20db6fbbf886bfe3c9d840f0f7dbed93121ce63c629e661efbdb9460a51935": {
        "equality_sha256":
            "65da7838470cbea674b9e579cb94a9cf3da62187050fa2248879ad03aec0eeaf",
        "exact_cas_status": "CROSSCHECKED_REAL_INFEASIBLE_RADICAL_MEMBERSHIP",
        "forced_zero_squared_distance_pair": [7, 8],
        "singular_direct_reduction": "SKIPPED_RADICAL_ONLY",
        "msolve_rabinowitsch_radical_membership": True,
    },
    # 654 iteration-61 witness admitted 2026-07-16: thirty-second
    # NONUNIT-track 654 witness (13,350,142 nodes — +439 past
    # iteration 60's, sixth witness in the ~13.349M pocket — 20 M
    # run, caps=0; inline audit decided NONUNIT directly); certified
    # by membership_crosscheck.py --pair 7 8 --radical-only --core;
    # its retained 7-row deletion core (5 deletion timeouts
    # fail-closed) is forced-pair-core-654-42.
    "48979979966f09e900d332845f225b97dd82876c28ff02146423c4b5c0294974": {
        "equality_sha256":
            "c9ad2e48ff36fe0f3f6814bd555ea546fa197565cf458ecd608ef7cffc44f02a",
        "exact_cas_status": "CROSSCHECKED_REAL_INFEASIBLE_RADICAL_MEMBERSHIP",
        "forced_zero_squared_distance_pair": [7, 8],
        "singular_direct_reduction": "SKIPPED_RADICAL_ONLY",
        "msolve_rabinowitsch_radical_membership": True,
    },
    # 654 iteration-62 witness admitted 2026-07-16: thirty-third
    # NONUNIT-track 654 witness (13,350,144 nodes — +2 past
    # iteration 61's, seventh witness in the ~13.35M pocket — 20 M
    # run, caps=0; inline audit decided NONUNIT directly); certified
    # by membership_crosscheck.py --pair 7 8 --radical-only --core;
    # its retained 7-row deletion core (7 deletion timeouts
    # fail-closed) is forced-pair-core-654-43.
    "9b85bb11b327191b4c7a2e32c9919fa31b610bc438efa9ae8c9c117578c0ee5a": {
        "equality_sha256":
            "926a274922f97db6d41761043d81ebd5e0f632b6890445c52b711ccb737f14f3",
        "exact_cas_status": "CROSSCHECKED_REAL_INFEASIBLE_RADICAL_MEMBERSHIP",
        "forced_zero_squared_distance_pair": [7, 8],
        "singular_direct_reduction": "SKIPPED_RADICAL_ONLY",
        "msolve_rabinowitsch_radical_membership": True,
    },
    # 654 iteration-63 witness admitted 2026-07-16: thirty-fourth
    # NONUNIT-track 654 witness (13,350,167 nodes — +23 past
    # iteration 62's, eighth witness in the ~13.35M pocket — 20 M
    # run, caps=0; inline audit decided NONUNIT directly); certified
    # by membership_crosscheck.py --pair 7 8 --radical-only --core;
    # its retained 8-row deletion core (5 deletion timeouts
    # fail-closed) is forced-pair-core-654-44.
    "e2fca9d51fc38eb4be2f46f9eee5bee730aeb6549b4c53c09dbcbab11a83c89e": {
        "equality_sha256":
            "558146cb3b7e2a3329c93196c3db499d90510a4d3ff3a57feeb62e844f070e14",
        "exact_cas_status": "CROSSCHECKED_REAL_INFEASIBLE_RADICAL_MEMBERSHIP",
        "forced_zero_squared_distance_pair": [7, 8],
        "singular_direct_reduction": "SKIPPED_RADICAL_ONLY",
        "msolve_rabinowitsch_radical_membership": True,
    },
    # 654 iteration-64 witness admitted 2026-07-16: thirty-fifth
    # NONUNIT-track 654 witness (13,350,337 nodes — +170 past
    # iteration 63's, ninth witness in the ~13.35M pocket — 20 M
    # run, caps=0; inline audit decided NONUNIT directly); certified
    # by membership_crosscheck.py --pair 7 8 --radical-only --core;
    # its retained 8-row deletion core (4 deletion timeouts
    # fail-closed) is forced-pair-core-654-45.
    "cdd23026cffb444f21245580bbce8f4fddcddf472295ac5ae3531d53aaeab81c": {
        "equality_sha256":
            "90f9f9a94e2253f3a4eb8fe23648c08a30c1b6b152d87303aa359c3a85fbbb71",
        "exact_cas_status": "CROSSCHECKED_REAL_INFEASIBLE_RADICAL_MEMBERSHIP",
        "forced_zero_squared_distance_pair": [7, 8],
        "singular_direct_reduction": "SKIPPED_RADICAL_ONLY",
        "msolve_rabinowitsch_radical_membership": True,
    },
    # 654 iteration-65 witness admitted 2026-07-16: thirty-sixth
    # NONUNIT-track 654 witness (13,350,350 nodes — +13 past
    # iteration 64's, tenth witness in the ~13.35M pocket — 20 M
    # run, caps=0; inline audit decided NONUNIT directly); certified
    # by membership_crosscheck.py --pair 7 8 --radical-only --core;
    # its retained 8-row deletion core (4 deletion timeouts
    # fail-closed) is forced-pair-core-654-46.
    "4999f098030c54a80358aa463d12fac09dbb3bfab3af97ee2b096fd20f4d2169": {
        "equality_sha256":
            "ea8dffe26fd0c9255d27d2fc84b33e8a0a1b1e88ed3b37f17bccf31bed4a78c5",
        "exact_cas_status": "CROSSCHECKED_REAL_INFEASIBLE_RADICAL_MEMBERSHIP",
        "forced_zero_squared_distance_pair": [7, 8],
        "singular_direct_reduction": "SKIPPED_RADICAL_ONLY",
        "msolve_rabinowitsch_radical_membership": True,
    },
    # 654 iteration-66 witness admitted 2026-07-16: thirty-seventh
    # NONUNIT-track 654 witness (13,350,373 nodes — +23 past
    # iteration 65's, eleventh witness in the ~13.35M pocket — 20 M
    # run, caps=0; inline audit decided NONUNIT directly); certified
    # by membership_crosscheck.py --pair 7 8 --radical-only --core;
    # its retained 7-row deletion core (7 deletion timeouts
    # fail-closed) is forced-pair-core-654-47.
    "ebce302fe399c726745be5c70f25cd6697ff9aa879c66b9b7d0675054611f0c6": {
        "equality_sha256":
            "8f9263971592d8ca67cc346619a19abb31f57108ace0c1d16e9cda602bb92dc5",
        "exact_cas_status": "CROSSCHECKED_REAL_INFEASIBLE_RADICAL_MEMBERSHIP",
        "forced_zero_squared_distance_pair": [7, 8],
        "singular_direct_reduction": "SKIPPED_RADICAL_ONLY",
        "msolve_rabinowitsch_radical_membership": True,
    },
    # 654 iteration-68 witness admitted 2026-07-16: thirty-eighth
    # NONUNIT-track 654 witness and the deepest 654 witness yet
    # (13,869,343 nodes — +504,933 past iteration 67's 13,364,410,
    # stepping out of the ~13.35M pocket — 20 M run, caps=0; inline
    # msolve NONUNIT x2).  Production-order fp cert hit Singular
    # TIMEOUT at 900 s; a 12-job flux strategy race was won by slimgb
    # + the seed-4 permuted variable order (UNIT in 20 s — same
    # winner as cf0a86c8; see ff2eb8fb-flux-race/RACE.md), so this
    # cert (ff2eb8fb_admit_cert.py) runs every Singular call in the
    # perm4 order, msolve canonical fwd/rev.  Its retained 7-row
    # deletion core (5 deletion timeouts fail-closed) is
    # forced-pair-core-654-48.
    "ff2eb8fbf191b1daebd984a73cb9226d43ad98cc1818f0715503f9ff94774aab": {
        "equality_sha256":
            "c64c87d1b52e8d252f5fa6278eeddfb318d7da6f19ce7f8c487f2998a98eff77",
        "exact_cas_status": "CROSSCHECKED_REAL_INFEASIBLE_RADICAL_MEMBERSHIP",
        "forced_zero_squared_distance_pair": [7, 8],
        "singular_direct_reduction": "SKIPPED_RADICAL_ONLY",
        "msolve_rabinowitsch_radical_membership": True,
    },
    # 654 iteration-70 witness admitted 2026-07-16: thirty-ninth
    # NONUNIT-track 654 witness and the deepest 654 witness yet
    # (17,262,366 nodes — +897,723 past iteration 69's 16,364,643;
    # 20 M run, caps=0; inline msolve NONUNIT x2); certified by
    # membership_crosscheck.py --pair 7 8 --radical-only --core at
    # the production order (no race needed, unlike ff2eb8fb); its
    # retained 7-row deletion core (5 deletion timeouts
    # fail-closed) is forced-pair-core-654-49.
    "0e70fb54234ab561d9caa1334aea9112f3de012062c92769ef9422ef7fcb1fe3": {
        "equality_sha256":
            "1f1bdcb2685c179bf4e305224883ae377f62a6eaafe6745f5d24c3ecd46cf75e",
        "exact_cas_status": "CROSSCHECKED_REAL_INFEASIBLE_RADICAL_MEMBERSHIP",
        "forced_zero_squared_distance_pair": [7, 8],
        "singular_direct_reduction": "SKIPPED_RADICAL_ONLY",
        "msolve_rabinowitsch_radical_membership": True,
    },
    # 555 iteration-94 witness admitted 2026-07-16: first
    # NONUNIT-track 555 witness after the 74-witness unit-grade run
    # (iterations 20-93); 19,474 nodes, caps=14; inline msolve
    # NONUNIT x2; certified by membership_crosscheck.py --pair 6 7
    # --radical-only --core at the production order; its retained
    # 7-row deletion core (5 deletion timeouts fail-closed) is
    # forced-pair-core-555-14 — the first fp-555 admission since
    # the original bank of 13.
    "42fbda90d111dc4c9f448c15d9dd4a345ea4ea1ecd062ba1e3d1d2f3f4501b4b": {
        "equality_sha256":
            "ab72776e2089a1b680dc9c3ef03e4c2efaa33a92a7872b4abc071c63b0b51fe3",
        "exact_cas_status": "CROSSCHECKED_REAL_INFEASIBLE_RADICAL_MEMBERSHIP",
        "forced_zero_squared_distance_pair": [6, 7],
        "singular_direct_reduction": "SKIPPED_RADICAL_ONLY",
        "msolve_rabinowitsch_radical_membership": True,
    },
    # 555 iteration-95 witness admitted 2026-07-16: second consecutive
    # NONUNIT-track 555 witness; 52,942 nodes, caps=14; inline msolve
    # NONUNIT x2; certified by membership_crosscheck.py --pair 6 7
    # --radical-only --core at the production order; its retained
    # 8-row deletion core (7 deletion timeouts fail-closed) is
    # forced-pair-core-555-15.
    "cd5f382b17510b8d7cb86250a72bb80624c6a12bfa0ced8e876942ed9d806fd2": {
        "equality_sha256":
            "e8f56191fee4302c302f4e711f4493cdcf493a84caf11119a350a91bab84cb14",
        "exact_cas_status": "CROSSCHECKED_REAL_INFEASIBLE_RADICAL_MEMBERSHIP",
        "forced_zero_squared_distance_pair": [6, 7],
        "singular_direct_reduction": "SKIPPED_RADICAL_ONLY",
        "msolve_rabinowitsch_radical_membership": True,
    },
    # 654 iteration-72 witness admitted 2026-07-16: fortieth
    # NONUNIT-track 654 witness, deepest 654 witness yet (17,838,635
    # nodes caps=0, fourth consecutive depth record); inline msolve
    # NONUNIT x2; certified by membership_crosscheck.py --pair 7 8
    # --radical-only --core at the production order; its retained
    # 8-row deletion core (7 deletion timeouts fail-closed) is
    # forced-pair-core-654-50.
    "ed7e977f3c5fbcf72936e4c36d7b3638814426a3b4948c1a9e97f292f1bee22f": {
        "equality_sha256":
            "4af705c99870c02d4cba2b46beecb7ce26e7ea9ebc71f0047cdaa1167ee1ccc2",
        "exact_cas_status": "CROSSCHECKED_REAL_INFEASIBLE_RADICAL_MEMBERSHIP",
        "forced_zero_squared_distance_pair": [7, 8],
        "singular_direct_reduction": "SKIPPED_RADICAL_ONLY",
        "msolve_rabinowitsch_radical_membership": True,
    },
    # 555 iteration-96 witness admitted 2026-07-16: third consecutive
    # NONUNIT-track 555 witness; 53,196 nodes, caps=14; inline msolve
    # NONUNIT x2; certified by membership_crosscheck.py --pair 6 7
    # --radical-only --core at the production order; its retained
    # 7-row deletion core (7 deletion timeouts fail-closed) is
    # forced-pair-core-555-16.
    "29e715ed5f69538a12777e9f35fb0d9406c91e9092d1d3bea41a57ce0673b25a": {
        "equality_sha256":
            "f616fcfa5383d234e641399c5c68a731b3fac2682ccff60a747e33bb379b609e",
        "exact_cas_status": "CROSSCHECKED_REAL_INFEASIBLE_RADICAL_MEMBERSHIP",
        "forced_zero_squared_distance_pair": [6, 7],
        "singular_direct_reduction": "SKIPPED_RADICAL_ONLY",
        "msolve_rabinowitsch_radical_membership": True,
    },
    # 555 iteration-97 witness admitted 2026-07-16: fourth
    # consecutive NONUNIT-track 555 witness; 56,116 nodes, caps=14;
    # inline msolve NONUNIT x2; certified by membership_crosscheck.py
    # --pair 6 7 --radical-only --core at the production order; its
    # retained 8-row deletion core (5 deletion timeouts fail-closed)
    # is forced-pair-core-555-17.
    "b3dcc77588805714274753fdbe74e3067a23c94b99565e43c9e340518607063f": {
        "equality_sha256":
            "2deb2468616fbf86b7ae08b1a6b25a9f92ac007c114b0ca3b4e019297ee78888",
        "exact_cas_status": "CROSSCHECKED_REAL_INFEASIBLE_RADICAL_MEMBERSHIP",
        "forced_zero_squared_distance_pair": [6, 7],
        "singular_direct_reduction": "SKIPPED_RADICAL_ONLY",
        "msolve_rabinowitsch_radical_membership": True,
    },
    # 654 iteration-73 witness admitted 2026-07-16: forty-first
    # NONUNIT-track 654 witness, deepest 654 witness yet (17,951,372
    # nodes caps=0, fifth consecutive depth record); inline msolve
    # NONUNIT x2; certified by membership_crosscheck.py --pair 7 8
    # --radical-only --core at the production order; its retained
    # 7-row deletion core (6 deletion timeouts fail-closed) is
    # forced-pair-core-654-51.
    "14c491e75fbf26ea8ad5d643595681c7b11ec72d2e6ca3f85694276fcf08ac9e": {
        "equality_sha256":
            "bff312a7f6e89217721ddaf29080e64ae0aa4f3315a8573ccaae315e0d1db51e",
        "exact_cas_status": "CROSSCHECKED_REAL_INFEASIBLE_RADICAL_MEMBERSHIP",
        "forced_zero_squared_distance_pair": [7, 8],
        "singular_direct_reduction": "SKIPPED_RADICAL_ONLY",
        "msolve_rabinowitsch_radical_membership": True,
    },
    # 654 iteration-74 witness admitted 2026-07-16: forty-second
    # NONUNIT-track 654 witness, deepest 654 witness yet (18,556,391
    # nodes caps=0, sixth consecutive depth record); inline msolve
    # NONUNIT x2; certified by membership_crosscheck.py --pair 7 8
    # --radical-only --core at the production order; its retained
    # 6-row deletion core (5 deletion timeouts fail-closed) is
    # forced-pair-core-654-52.
    "a41eb4e4281725fb240554bdb073e7919c381a5232a903acfed72e0de5c3f7d6": {
        "equality_sha256":
            "0be62c8eca53b5e7eabcb836f77048daaeb89553f62960a225a33657d03e1b2e",
        "exact_cas_status": "CROSSCHECKED_REAL_INFEASIBLE_RADICAL_MEMBERSHIP",
        "forced_zero_squared_distance_pair": [7, 8],
        "singular_direct_reduction": "SKIPPED_RADICAL_ONLY",
        "msolve_rabinowitsch_radical_membership": True,
    },
    # 654 iteration-75 witness admitted 2026-07-16: forty-third
    # NONUNIT-track 654 witness, deepest 654 witness yet (19,675,874
    # nodes caps=0, seventh consecutive depth record); inline msolve
    # NONUNIT x2; certified by membership_crosscheck.py --pair 7 8
    # --radical-only --core at the production order; its retained
    # 7-row deletion core (6 deletion timeouts fail-closed) is
    # forced-pair-core-654-53.
    "1dfe7188e1d5adc1dc8140394de64c3f673eb6d95509e3dcfca12904afb2e963": {
        "equality_sha256":
            "e6db83e6c24725217ca59ed157be88a4d54d630141f19e1afd56f4bc7a10af90",
        "exact_cas_status": "CROSSCHECKED_REAL_INFEASIBLE_RADICAL_MEMBERSHIP",
        "forced_zero_squared_distance_pair": [7, 8],
        "singular_direct_reduction": "SKIPPED_RADICAL_ONLY",
        "msolve_rabinowitsch_radical_membership": True,
    },
    # 654 iteration-78 witness admitted 2026-07-16: forty-fourth
    # NONUNIT-track 654 witness (6,053,746 nodes caps=1, back to the
    # NONUNIT track after the iters 76-77 unit pair); inline msolve
    # NONUNIT x2; certified by membership_crosscheck.py --pair 7 8
    # --radical-only --core at the production order; its retained
    # 7-row deletion core (5 deletion timeouts fail-closed) is
    # forced-pair-core-654-54.
    "0a68e92dd7932e575d5ae50675ceb0017836c5ce6162cbdd5c01178bc2df2e35": {
        "equality_sha256":
            "1aaa33cc7c049f0796c31bca8447f0cf8dba9d880b1c9d7afb6da83866a73de3",
        "exact_cas_status": "CROSSCHECKED_REAL_INFEASIBLE_RADICAL_MEMBERSHIP",
        "forced_zero_squared_distance_pair": [7, 8],
        "singular_direct_reduction": "SKIPPED_RADICAL_ONLY",
        "msolve_rabinowitsch_radical_membership": True,
    },
    # 654 iteration-79 witness admitted 2026-07-16: forty-fifth
    # NONUNIT-track 654 witness (6,081,265 nodes caps=1, second
    # consecutive at the ~6M depth band); inline NONUNIT x3
    # (Singular + msolve fwd/rev); certified by membership_crosscheck.py
    # --pair 7 8 --radical-only --core at the production order; its
    # retained 8-row deletion core (7 deletion timeouts fail-closed)
    # is forced-pair-core-654-55.
    "5e15de6cc16abf2d13a994ea9dcd2bccfaf61f5c18e36ae6f16ef9645bb98053": {
        "equality_sha256":
            "491074bd0b2f8355a9f8d4d0887f25fd1cf5ee745ee8e78c13b1599ac08c7717",
        "exact_cas_status": "CROSSCHECKED_REAL_INFEASIBLE_RADICAL_MEMBERSHIP",
        "forced_zero_squared_distance_pair": [7, 8],
        "singular_direct_reduction": "SKIPPED_RADICAL_ONLY",
        "msolve_rabinowitsch_radical_membership": True,
    },
    # 654 iteration-80 witness admitted 2026-07-16: forty-sixth
    # NONUNIT-track 654 witness (6,081,547 nodes caps=1, third
    # consecutive at the ~6M depth band); inline NONUNIT x3
    # (Singular + msolve fwd/rev); certified by membership_crosscheck.py
    # --pair 7 8 --radical-only --core at the production order; its
    # retained 7-row deletion core (6 deletion timeouts fail-closed)
    # is forced-pair-core-654-56.
    "f3d4e7c82abb06f0d45e9cb05ba44ed9185647ee76a13ebe67c74fe3d7ca1878": {
        "equality_sha256":
            "445aea7c6ec5188507ca3f5fb06da2757dce80c5753ac0d5b459c019a1b055e9",
        "exact_cas_status": "CROSSCHECKED_REAL_INFEASIBLE_RADICAL_MEMBERSHIP",
        "forced_zero_squared_distance_pair": [7, 8],
        "singular_direct_reduction": "SKIPPED_RADICAL_ONLY",
        "msolve_rabinowitsch_radical_membership": True,
    },
    # 654 iteration-81 witness admitted 2026-07-16: forty-seventh
    # NONUNIT-track 654 witness (6,084,777 nodes caps=1, fourth
    # consecutive at the ~6M depth band); inline NONUNIT x3
    # (Singular + msolve fwd/rev); certified by membership_crosscheck.py
    # --pair 7 8 --radical-only --core at the production order; its
    # retained 7-row deletion core (6 deletion timeouts fail-closed)
    # is forced-pair-core-654-57.
    "5cb4bee1cb18866355a8a48886b8a39737c72e93bd0e305592a96910386e57de": {
        "equality_sha256":
            "e043dbbec1955d73c5e26d1c1c8c77753215430f92f45dd0b0c1b476e4477300",
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
    # 555 iter-58 witness 2c6db120 (SAT at 497,475 nodes — a
    # +31,604 step past iter-57; sources (6,7), inline
    # CROSSCHECKED_UNIT): system_unit_recheck.py 900 s deletion
    # retained 7 rows / 21 equalities (deletion verdicts 5 UNIT /
    # 4 TIMEOUT fail-closed / 3 NONUNIT), retained core
    # CROSSCHECKED_UNIT (Singular + msolve fwd/rev); not a
    # transposition image of any banked core; nearest kin
    # unit-core-555-19 (3 shared rows 0,2,11) — a throwback core:
    # row 2:{0,1,9,11} returns from the 555-14..19 sector
    # (displacing the recent {0,1,9,10}), row 11:{0,1,5,6} from
    # the 555-19..34 anchor sector; ONE new support 8:{4,5,9,10};
    # row 7:{2,6,8,9} previously only 555-42, row 10:{4,6,9,11}
    # previously only 555-02, row 9:{0,3,10,11} from 555-13/-32.
    {
        "id": "unit-core-555-46",
        "rows": {
            0: frozenset({1, 2, 3, 4}),
            2: frozenset({0, 1, 9, 11}),
            7: frozenset({2, 6, 8, 9}),
            8: frozenset({4, 5, 9, 10}),
            9: frozenset({0, 3, 10, 11}),
            10: frozenset({4, 6, 9, 11}),
            11: frozenset({0, 1, 5, 6}),
        },
        "equality_count": 21,
    },
    # 555 iter-59 witness 473fb7e4 (SAT at 18,799 nodes — a sharp
    # collapse from the ~500k pocket after the 555-46 admission;
    # sources (6,7), inline CROSSCHECKED_UNIT):
    # system_unit_recheck.py 900 s deletion retained 8 rows / 24
    # equalities (deletion verdicts 4 UNIT / 6 TIMEOUT fail-closed /
    # 2 NONUNIT), retained core CROSSCHECKED_UNIT (Singular + msolve
    # fwd/rev); not a transposition image of any banked core; kin
    # capped at 3 shared rows (555-20..34 sector via anchors
    # 0, 2, 11; 555-38 via 0, 2, 6); 8-row grade matches
    # 555-09/-18/-26/-30/-38/-42; row 2:{0,1,9,10} returns after
    # 555-46 displaced it; TWO new supports 9:{0,3,7,10},
    # 10:{3,5,8,9}; row 6:{0,4,5,8} previously only 555-38; rows
    # 7:{3,6,8,11} (654-10) and 8:{2,5,9,11} (654-15/-20) are
    # cross-profile imports.
    {
        "id": "unit-core-555-47",
        "rows": {
            0: frozenset({1, 2, 3, 4}),
            2: frozenset({0, 1, 9, 10}),
            6: frozenset({0, 4, 5, 8}),
            7: frozenset({3, 6, 8, 11}),
            8: frozenset({2, 5, 9, 11}),
            9: frozenset({0, 3, 7, 10}),
            10: frozenset({3, 5, 8, 9}),
            11: frozenset({0, 1, 5, 6}),
        },
        "equality_count": 24,
    },
    # 555 iter-60 witness c6f569b6 (SAT at 20,348 nodes — +1,549
    # past iter-59, second witness in the shallow post-555-46
    # pocket; sources (6,7), inline CROSSCHECKED_UNIT):
    # system_unit_recheck.py 900 s deletion retained 6 rows / 18
    # equalities (deletion verdicts 6 UNIT / 3 TIMEOUT fail-closed /
    # 3 NONUNIT), retained core CROSSCHECKED_UNIT (Singular + msolve
    # fwd/rev); not a transposition image of any banked core; kin
    # capped at 3 shared rows (555-22/-23/-24/-26/-28/-33 via
    # 0, 2, 8; 555-47 via 0, 2, 9); 6-row grade matches
    # 555-04/-05/-12/-16/-17/-32/-37; ZERO new supports — row
    # 9:{0,3,7,10} (new in 555-47) immediately re-used, rows
    # 7:{0,3,6,8} (555-06, fp-555-01..04/-11/-12) and 10:{3,8,9,11}
    # (555-05, fp-555-01/-04) return from the early forced-pair
    # sector.
    {
        "id": "unit-core-555-48",
        "rows": {
            0: frozenset({1, 2, 3, 4}),
            2: frozenset({0, 1, 9, 10}),
            7: frozenset({0, 3, 6, 8}),
            8: frozenset({2, 6, 10, 11}),
            9: frozenset({0, 3, 7, 10}),
            10: frozenset({3, 8, 9, 11}),
        },
        "equality_count": 18,
    },
    # 555 iter-61 witness 5697fca7 (SAT at 20,362 nodes — +14 past
    # iter-60, third witness in the shallow post-555-46 pocket;
    # sources (6,7), inline CROSSCHECKED_UNIT):
    # system_unit_recheck.py 900 s deletion retained 7 rows / 21
    # equalities (deletion verdicts 5 UNIT / 3 TIMEOUT fail-closed /
    # 4 NONUNIT), retained core CROSSCHECKED_UNIT (Singular + msolve
    # fwd/rev); not a transposition image of any banked core;
    # structurally it is 555-48 with row 8's support swapped
    # ({2,6,10,11} -> {2,6,9,11}) plus row 11:{0,1,5,6} appended —
    # kin 555-48 via 5 shared rows, then 555-47 via 4; 7-row/21-eq
    # is the modal 555 grade; ZERO new supports — row 9:{0,3,7,10}
    # (new in 555-47) used a third consecutive time, row
    # 8:{2,6,9,11} returns from 555-10/-13 and recurs in 654
    # (654-13/-17/-23/-29/-30, fp-654-28/-29), row 11:{0,1,5,6}
    # from the 555-19..34 sector and 555-46/-47.
    {
        "id": "unit-core-555-49",
        "rows": {
            0: frozenset({1, 2, 3, 4}),
            2: frozenset({0, 1, 9, 10}),
            7: frozenset({0, 3, 6, 8}),
            8: frozenset({2, 6, 9, 11}),
            9: frozenset({0, 3, 7, 10}),
            10: frozenset({3, 8, 9, 11}),
            11: frozenset({0, 1, 5, 6}),
        },
        "equality_count": 21,
    },
    # 555 iter-62 witness ca905218 (SAT at 25,330 nodes — +4,968
    # past iter-61, fourth witness in the post-555-46 pocket;
    # sources (6,7), inline CROSSCHECKED_UNIT):
    # system_unit_recheck.py 900 s deletion retained 6 rows / 18
    # equalities (deletion verdicts 6 UNIT / 4 TIMEOUT fail-closed /
    # 2 NONUNIT), retained core CROSSCHECKED_UNIT (Singular + msolve
    # fwd/rev); not a transposition image of any banked core; kin
    # capped at 2 shared rows — breaks the 555-47/-48/-49 chain
    # despite staying in the pocket; 6-row grade matches
    # 555-04/-05/-12/-16/-17/-32/-37/-48; TWO new supports
    # 8:{2,5,7,10}, 9:{0,3,8,10}; row 7:{2,6,9,11} is a
    # cross-profile import previously only in 654-02/-03/-04, row
    # 10:{3,7,9,11} returns from unit-core-555-01.
    {
        "id": "unit-core-555-50",
        "rows": {
            0: frozenset({1, 2, 3, 4}),
            2: frozenset({0, 1, 9, 10}),
            7: frozenset({2, 6, 9, 11}),
            8: frozenset({2, 5, 7, 10}),
            9: frozenset({0, 3, 8, 10}),
            10: frozenset({3, 7, 9, 11}),
        },
        "equality_count": 18,
    },
    # 555 iter-63 witness 62c5cf71 (SAT at 26,469 nodes — +1,139
    # past iter-62, fifth witness in the post-555-46 pocket;
    # sources (6,7), inline CROSSCHECKED_UNIT):
    # system_unit_recheck.py 900 s deletion retained 8 rows / 24
    # equalities (deletion verdicts 4 UNIT / 7 TIMEOUT fail-closed /
    # 1 NONUNIT), retained core CROSSCHECKED_UNIT (Singular + msolve
    # fwd/rev) on this literal row set; IS the (3,4)-transposition
    # image of unit-core-555-26 — banked in its own right because
    # --bank-negative blocks literal row sets only (the bank already
    # held eleven single-transposition-image pairs, e.g.
    # 555-26/555-38, 654-29/654-30); kin 5 shared rows with 555-26
    # and 555-23; 8-row grade matches
    # 555-09/-18/-26/-30/-38/-42/-47; ZERO new supports — row
    # 7:{0,3,5,8} previously only in 555-07, row 10:{4,5,9,11}
    # previously only in 555-42, row 9:{0,3,7,10} in four of the
    # five admissions since 555-47.
    {
        "id": "unit-core-555-51",
        "rows": {
            0: frozenset({1, 2, 3, 4}),
            2: frozenset({0, 1, 9, 10}),
            6: frozenset({2, 5, 7, 9}),
            7: frozenset({0, 3, 5, 8}),
            8: frozenset({2, 6, 10, 11}),
            9: frozenset({0, 3, 7, 10}),
            10: frozenset({4, 5, 9, 11}),
            11: frozenset({0, 1, 5, 6}),
        },
        "equality_count": 24,
    },
    # 555 iter-64 witness b5a642f8 (SAT at 26,491 nodes — +22 past
    # iter-63, sixth witness in the post-555-46 pocket; sources
    # (6,7), inline CROSSCHECKED_UNIT): system_unit_recheck.py 900 s
    # deletion retained 7 rows / 21 equalities (deletion verdicts
    # 5 UNIT / 5 TIMEOUT fail-closed / 2 NONUNIT), retained core
    # CROSSCHECKED_UNIT (Singular + msolve fwd/rev) on this literal
    # row set; not a transposition image of any banked core; kin
    # unit-core-555-51 at 6 shared rows, 555-49 at 5; ZERO new
    # supports — row 9:{0,3,7,10} in five of the six admissions
    # since 555-47, row 10:{4,5,9,11} previously only in
    # 555-42/-51.
    {
        "id": "unit-core-555-52",
        "rows": {
            0: frozenset({1, 2, 3, 4}),
            2: frozenset({0, 1, 9, 10}),
            6: frozenset({2, 5, 7, 9}),
            7: frozenset({0, 3, 6, 8}),
            9: frozenset({0, 3, 7, 10}),
            10: frozenset({4, 5, 9, 11}),
            11: frozenset({0, 1, 5, 6}),
        },
        "equality_count": 21,
    },
    # 555 iter-65 witness 7234a008 (SAT at 59,780 nodes — +33,289
    # past iter-64, breaking the ~26.5k post-555-46 pocket; sources
    # (6,7), inline CROSSCHECKED_UNIT): system_unit_recheck.py 900 s
    # deletion retained 8 rows / 24 equalities (deletion verdicts
    # 4 UNIT / 7 TIMEOUT fail-closed / 1 NONUNIT), retained core
    # CROSSCHECKED_UNIT (Singular + msolve fwd/rev) on this literal
    # row set; DOUBLE image hit — IS both the (3,4)-transposition
    # image of unit-core-555-38 and the (6,7)-transposition image of
    # unit-core-555-51 (so 555-38 and 555-51 are related by the
    # double transposition (3,4)(6,7), outside the single-
    # transposition census scope) — banked in its own right because
    # --bank-negative blocks literal row sets only (precedent
    # 555-51/fp-654-37); kin 555-38 and 555-42 at 5 shared rows;
    # TWO new supports 6:{0,3,5,8}, 9:{0,3,6,10}.
    {
        "id": "unit-core-555-53",
        "rows": {
            0: frozenset({1, 2, 3, 4}),
            2: frozenset({0, 1, 9, 10}),
            6: frozenset({0, 3, 5, 8}),
            7: frozenset({2, 5, 6, 9}),
            8: frozenset({2, 7, 10, 11}),
            9: frozenset({0, 3, 6, 10}),
            10: frozenset({4, 5, 9, 11}),
            11: frozenset({0, 1, 5, 7}),
        },
        "equality_count": 24,
    },
    # 555 iter-66 witness 1bc4db7e (SAT at 59,875 nodes — +95 past
    # iter-65, new pocket forming at ~59.8k; sources (6,7), inline
    # CROSSCHECKED_UNIT): system_unit_recheck.py 900 s deletion
    # retained 7 rows / 21 equalities (deletion verdicts 5 UNIT /
    # 5 TIMEOUT fail-closed / 2 NONUNIT), retained core
    # CROSSCHECKED_UNIT (Singular + msolve fwd/rev) on this literal
    # row set; not a transposition image of any banked core; kin
    # capped at 3 shared rows (555-42/-51/-53) — off the recent
    # cluster: first 555 unit core without a center-2 row since
    # 555-32 (8 of 53 prior lack one), center-4 rows previously
    # only in 555-07/-16; TWO new supports 3:{1,5,8,11},
    # 4:{0,3,6,11}; row 9:{0,3,8,10} previously only in 555-50.
    {
        "id": "unit-core-555-54",
        "rows": {
            0: frozenset({1, 2, 3, 4}),
            3: frozenset({1, 5, 8, 11}),
            4: frozenset({0, 3, 6, 11}),
            8: frozenset({2, 6, 10, 11}),
            9: frozenset({0, 3, 8, 10}),
            10: frozenset({4, 5, 9, 11}),
            11: frozenset({0, 1, 5, 7}),
        },
        "equality_count": 21,
    },
    # 555 iter-67 witness 4caae8ca (SAT at 59,939 nodes — +64 past
    # iter-66, third witness in the ~59.9k pocket; sources (6,7),
    # inline CROSSCHECKED_UNIT): system_unit_recheck.py 900 s
    # deletion retained 8 rows / 24 equalities (deletion verdicts
    # 4 UNIT / 7 TIMEOUT fail-closed / 1 NONUNIT), retained core
    # CROSSCHECKED_UNIT (Singular + msolve fwd/rev) on this literal
    # row set; not a transposition image of any banked core; kin
    # 555-51 and 555-54 each at 5 shared rows — bridges the
    # 51/52/53 cluster and the off-cluster 555-54; ONE new support
    # 7:{0,3,5,6}.
    {
        "id": "unit-core-555-55",
        "rows": {
            0: frozenset({1, 2, 3, 4}),
            2: frozenset({0, 1, 9, 10}),
            6: frozenset({2, 5, 7, 9}),
            7: frozenset({0, 3, 5, 6}),
            8: frozenset({2, 6, 10, 11}),
            9: frozenset({0, 3, 8, 10}),
            10: frozenset({4, 5, 9, 11}),
            11: frozenset({0, 1, 5, 7}),
        },
        "equality_count": 24,
    },
    # 555 iter-68 witness cac11455 (SAT at 59,940 nodes — +1 past
    # iter-67, fourth witness in the ~59.9k pocket; sources (6,7),
    # inline CROSSCHECKED_UNIT): system_unit_recheck.py 900 s
    # deletion retained 8 rows / 24 equalities (deletion verdicts
    # 4 UNIT / 7 TIMEOUT fail-closed / 1 NONUNIT), retained core
    # CROSSCHECKED_UNIT (Singular + msolve fwd/rev) on this literal
    # row set; not a transposition image of any banked core; kin
    # 555-55 at 7 shared rows — tightest kin pair in the 555 bank
    # (no prior pair shares more than 6), differing from 555-55
    # only in row 7's support; ONE new support 7:{3,5,6,8}.
    {
        "id": "unit-core-555-56",
        "rows": {
            0: frozenset({1, 2, 3, 4}),
            2: frozenset({0, 1, 9, 10}),
            6: frozenset({2, 5, 7, 9}),
            7: frozenset({3, 5, 6, 8}),
            8: frozenset({2, 6, 10, 11}),
            9: frozenset({0, 3, 8, 10}),
            10: frozenset({4, 5, 9, 11}),
            11: frozenset({0, 1, 5, 7}),
        },
        "equality_count": 24,
    },
    # 555 iter-69 witness dec50b4a (SAT at 59,946 nodes — +6 past
    # iter-68, fifth witness in the ~59.9k pocket; sources (6,7),
    # inline CROSSCHECKED_UNIT): system_unit_recheck.py 900 s
    # deletion retained 7 rows / 21 equalities (deletion verdicts
    # 5 UNIT / 7 TIMEOUT fail-closed), retained core
    # CROSSCHECKED_UNIT (Singular + msolve fwd/rev) on this literal
    # row set; not a transposition image of any banked core; kin
    # 555-55 at 6 shared rows; ZERO new supports — row 7:{0,3,5,6}
    # previously only in 555-55; modal bank shape (7 rows: 36 of 56
    # prior, 21 eq: 33 of 56 prior).
    {
        "id": "unit-core-555-57",
        "rows": {
            0: frozenset({1, 2, 3, 4}),
            2: frozenset({0, 1, 9, 10}),
            7: frozenset({0, 3, 5, 6}),
            8: frozenset({2, 7, 10, 11}),
            9: frozenset({0, 3, 8, 10}),
            10: frozenset({4, 5, 9, 11}),
            11: frozenset({0, 1, 5, 7}),
        },
        "equality_count": 21,
    },
    # 555 iter-70 witness 61193d31 (SAT at 93,704 nodes — +33,758
    # jump past iter-69, breaking the ~59.9k pocket after five
    # witnesses; sources (6,7), inline CROSSCHECKED_UNIT):
    # system_unit_recheck.py 900 s deletion retained 6 rows /
    # 18 equalities (deletion verdicts 6 UNIT / 5 TIMEOUT
    # fail-closed / 1 NONUNIT), retained core CROSSCHECKED_UNIT
    # (Singular + msolve fwd/rev) on this literal row set; not a
    # transposition image of any banked core; kin capped at 3
    # shared rows (off-cluster); ZERO new supports — row
    # 10:{3,6,9,11} in a 555 core for the first time (previously
    # only unit-cores 654-12/-15).
    {
        "id": "unit-core-555-58",
        "rows": {
            0: frozenset({1, 2, 3, 4}),
            2: frozenset({0, 1, 9, 10}),
            6: frozenset({4, 5, 7, 9}),
            7: frozenset({2, 5, 6, 10}),
            9: frozenset({0, 3, 7, 10}),
            10: frozenset({3, 6, 9, 11}),
        },
        "equality_count": 18,
    },
    # 555 iter-71 witness 4253de5d (SAT at 95,510 nodes — +1,806
    # past iter-70, post-pocket regime; sources (6,7), inline
    # CROSSCHECKED_UNIT): system_unit_recheck.py 900 s deletion
    # retained 8 rows / 24 equalities (deletion verdicts 4 UNIT /
    # 7 TIMEOUT fail-closed / 1 NONUNIT), retained core
    # CROSSCHECKED_UNIT (Singular + msolve fwd/rev) on this literal
    # row set; the core IS the transposition (7,8) image of
    # unit-core-555-55 — banked anyway per policy on its literal
    # row set (--bank-negative blocks literal row sets only); kin
    # capped at 4 shared rows (555-21/-51/-52); ONE new support
    # 8:{0,3,5,6}; row 11:{0,1,5,8} previously only in
    # unit-cores 555-08/-09.
    {
        "id": "unit-core-555-59",
        "rows": {
            0: frozenset({1, 2, 3, 4}),
            2: frozenset({0, 1, 9, 10}),
            6: frozenset({2, 5, 8, 9}),
            7: frozenset({2, 6, 10, 11}),
            8: frozenset({0, 3, 5, 6}),
            9: frozenset({0, 3, 7, 10}),
            10: frozenset({4, 5, 9, 11}),
            11: frozenset({0, 1, 5, 8}),
        },
        "equality_count": 24,
    },
    # 555 iter-72 witness 1886dbe2 (SAT at 133,712 nodes — +38,202
    # past iter-71, post-pocket climb; sources (6,7), inline
    # CROSSCHECKED_UNIT): system_unit_recheck.py 900 s deletion
    # retained 8 rows / 24 equalities (deletion verdicts 4 UNIT /
    # 4 TIMEOUT fail-closed / 4 NONUNIT), retained core
    # CROSSCHECKED_UNIT (Singular + msolve fwd/rev) on this literal
    # row set; not a transposition image of any banked core; single
    # kin at 4 shared rows (555-50); THREE new supports
    # 6:{0,4,7,11}, 7:{3,6,8,9}, 11:{0,3,5,8}; row 9:{0,6,10,11}
    # previously only in forced-pair-core-555-05.
    {
        "id": "unit-core-555-60",
        "rows": {
            0: frozenset({1, 2, 3, 4}),
            2: frozenset({0, 1, 9, 10}),
            6: frozenset({0, 4, 7, 11}),
            7: frozenset({3, 6, 8, 9}),
            8: frozenset({2, 5, 7, 10}),
            9: frozenset({0, 6, 10, 11}),
            10: frozenset({3, 7, 9, 11}),
            11: frozenset({0, 3, 5, 8}),
        },
        "equality_count": 24,
    },
    # 555 iter-73 witness 669c15f9 (SAT at 159,229 nodes — +25,517
    # past iter-72, post-pocket climb; sources (6,7), inline
    # CROSSCHECKED_UNIT): system_unit_recheck.py 900 s deletion
    # retained 6 rows / 18 equalities (deletion verdicts 6 UNIT /
    # 5 TIMEOUT fail-closed / 1 NONUNIT), retained core
    # CROSSCHECKED_UNIT (Singular + msolve fwd/rev) on this literal
    # row set; not a transposition image of any banked core; kin
    # capped at 3 shared rows (555-10/-11, off-cluster); TWO new
    # supports 5:{2,4,8,9} and 10:{0,3,5,8} (the latter's support
    # set recurs from 555-60's row 11); row 8:{3,7,9,11} previously
    # only in 654-bank cores (unit-core-654-32, fp-654-02).
    {
        "id": "unit-core-555-61",
        "rows": {
            0: frozenset({1, 2, 3, 4}),
            2: frozenset({0, 1, 9, 10}),
            5: frozenset({2, 4, 8, 9}),
            8: frozenset({3, 7, 9, 11}),
            9: frozenset({0, 4, 10, 11}),
            10: frozenset({0, 3, 5, 8}),
        },
        "equality_count": 18,
    },
    # 555 iter-74 witness bf3fa535 (SAT at 239,909 nodes — +80,680
    # past iter-73, largest post-pocket step to date; sources (6,7),
    # inline CROSSCHECKED_UNIT): system_unit_recheck.py 900 s
    # deletion retained 7 rows / 21 equalities (deletion verdicts
    # 5 UNIT / 5 TIMEOUT fail-closed / 2 NONUNIT), retained core
    # CROSSCHECKED_UNIT (Singular + msolve fwd/rev) on this literal
    # row set; not a transposition image of any banked core; kin at
    # 5 shared rows (555-10); ONE new support 11:{3,5,7,9}; row
    # 7:{0,3,8,11} previously only in 555-33; row 8:{2,6,9,11}
    # mostly 654-bank (8 of 11 prior appearances).
    {
        "id": "unit-core-555-62",
        "rows": {
            0: frozenset({1, 2, 3, 4}),
            2: frozenset({0, 1, 9, 10}),
            7: frozenset({0, 3, 8, 11}),
            8: frozenset({2, 6, 9, 11}),
            9: frozenset({0, 4, 10, 11}),
            10: frozenset({0, 1, 5, 6}),
            11: frozenset({3, 5, 7, 9}),
        },
        "equality_count": 21,
    },
    # 555 iter-75 witness d5220e3a (SAT at 140,769 nodes — down
    # 99,140 from iter-74, climb reversed; caps=12; sources (6,7),
    # inline CROSSCHECKED_UNIT): system_unit_recheck.py 900 s
    # deletion retained 6 rows / 18 equalities (deletion verdicts
    # 6 UNIT / 4 TIMEOUT fail-closed / 2 NONUNIT), retained core
    # CROSSCHECKED_UNIT (Singular + msolve fwd/rev) on this literal
    # row set; not a transposition image of any banked core; kin
    # capped at 2 shared rows — off-cluster; TWO new supports
    # 9:{0,1,5,6} (support set recurs from the recurrent center-10
    # row, here at center 9) and 11:{3,8,9,10}; row 2:{0,1,9,11}
    # last seen in 555-46; row 5:{2,4,7,9} previously only in
    # 555-37/-44.
    {
        "id": "unit-core-555-63",
        "rows": {
            0: frozenset({1, 2, 3, 4}),
            2: frozenset({0, 1, 9, 11}),
            5: frozenset({2, 4, 7, 9}),
            9: frozenset({0, 1, 5, 6}),
            10: frozenset({4, 5, 9, 11}),
            11: frozenset({3, 8, 9, 10}),
        },
        "equality_count": 18,
    },
    # 555 iter-76 witness 502349e4 (SAT at 144,707 nodes — +3,938
    # past iter-75; caps=12; sources (6,7), inline
    # CROSSCHECKED_UNIT): system_unit_recheck.py 900 s deletion
    # retained 7 rows / 21 equalities (deletion verdicts 5 UNIT /
    # 5 TIMEOUT fail-closed / 2 NONUNIT), retained core
    # CROSSCHECKED_UNIT (Singular + msolve fwd/rev) on this literal
    # row set; not a transposition image of any banked core; kin
    # capped at 3 shared rows (555-19/-46/-51/-52/-63); ONE new
    # support 8:{0,3,5,7}; row 7:{3,6,8,9} previously only in
    # 555-60; row 9:{0,7,10,11} previously only in
    # forced-pair-core-555-07; row 2:{0,1,9,11} in consecutive
    # cores (555-63 and here).
    {
        "id": "unit-core-555-64",
        "rows": {
            0: frozenset({1, 2, 3, 4}),
            2: frozenset({0, 1, 9, 11}),
            7: frozenset({3, 6, 8, 9}),
            8: frozenset({0, 3, 5, 7}),
            9: frozenset({0, 7, 10, 11}),
            10: frozenset({4, 5, 9, 11}),
            11: frozenset({0, 1, 5, 6}),
        },
        "equality_count": 21,
    },
    # 555 iter-77 witness ac23742c (SAT at 149,747 nodes — +5,040
    # past iter-76; caps=12; sources (6,7), inline
    # CROSSCHECKED_UNIT): system_unit_recheck.py 900 s deletion
    # retained 7 rows / 21 equalities (deletion verdicts 5 UNIT /
    # 3 TIMEOUT fail-closed / 4 NONUNIT), retained core
    # CROSSCHECKED_UNIT (Singular + msolve fwd/rev) on this literal
    # row set; not a transposition image of any banked core; kin 5
    # shared rows with the immediately preceding core 555-64 (rows
    # 0,2,8,9,11); ONE new support 7:{0,4,8,10}; row 2:{0,1,9,11}
    # in three consecutive cores (555-63/-64/here); rows 8:{0,3,5,7}
    # and 9:{0,7,10,11} repeat from 555-64.
    {
        "id": "unit-core-555-65",
        "rows": {
            0: frozenset({1, 2, 3, 4}),
            2: frozenset({0, 1, 9, 11}),
            7: frozenset({0, 4, 8, 10}),
            8: frozenset({0, 3, 5, 7}),
            9: frozenset({0, 7, 10, 11}),
            10: frozenset({3, 8, 9, 11}),
            11: frozenset({0, 1, 5, 6}),
        },
        "equality_count": 21,
    },
    # 555 iter-78 witness 9e494850 (SAT at 164,561 nodes — +14,814
    # past iter-77, third consecutive climb since the reversal;
    # caps=12; sources (6,7), inline CROSSCHECKED_UNIT):
    # system_unit_recheck.py 900 s deletion retained 7 rows / 21
    # equalities (deletion verdicts 5 UNIT / 6 TIMEOUT fail-closed /
    # 1 NONUNIT), retained core CROSSCHECKED_UNIT (Singular + msolve
    # fwd/rev) on this literal row set; not a transposition image of
    # any banked core; kin capped at 3 shared rows (555-63); NO new
    # supports — rows 8:{3,7,9,10} and 11:{3,5,8,10} previously
    # attested only in forced-pair-core-654-22/-23 (cross-profile);
    # row 5:{2,4,8,9} previously only 555-61; row 10:{5,7,9,11}
    # previously only 555-33.
    {
        "id": "unit-core-555-66",
        "rows": {
            0: frozenset({1, 2, 3, 4}),
            2: frozenset({0, 1, 9, 11}),
            5: frozenset({2, 4, 8, 9}),
            8: frozenset({3, 7, 9, 10}),
            9: frozenset({0, 1, 5, 6}),
            10: frozenset({5, 7, 9, 11}),
            11: frozenset({3, 5, 8, 10}),
        },
        "equality_count": 21,
    },
    # 555 iter-79 witness 6ecb3dd9 (SAT at 224,467 nodes — +59,906
    # past iter-78, fourth consecutive climb; caps=12; sources
    # (6,7), inline CROSSCHECKED_UNIT): system_unit_recheck.py 900 s
    # deletion retained 7 rows / 21 equalities (deletion verdicts
    # 5 UNIT / 5 TIMEOUT fail-closed / 2 NONUNIT), retained core
    # CROSSCHECKED_UNIT (Singular + msolve fwd/rev) on this literal
    # row set; not a transposition image of any banked core; kin
    # capped at 4 shared rows (555-55/-57); NO new supports — second
    # consecutive 555 core with none; row 8:{3,7,9,10} cross-profile
    # (555-66 + fp-654-22/-23) in consecutive 555 cores; row
    # 2:{0,1,9,11} in its fifth consecutive core (63-67; a
    # six-consecutive run exists at 555-14..-19); row 7:{0,3,5,6}
    # previously only 555-55/-57.
    {
        "id": "unit-core-555-67",
        "rows": {
            0: frozenset({1, 2, 3, 4}),
            2: frozenset({0, 1, 9, 11}),
            7: frozenset({0, 3, 5, 6}),
            8: frozenset({3, 7, 9, 10}),
            9: frozenset({0, 6, 10, 11}),
            10: frozenset({4, 5, 9, 11}),
            11: frozenset({0, 1, 5, 7}),
        },
        "equality_count": 21,
    },
    # 555 iter-80 witness cd3e8c16 (SAT at 246,442 nodes — +21,975
    # past iter-79, fifth consecutive climb; caps=12; sources (6,7),
    # inline CROSSCHECKED_UNIT): system_unit_recheck.py 900 s
    # deletion retained 7 rows / 21 equalities (deletion verdicts
    # 5 UNIT / 4 TIMEOUT fail-closed / 3 NONUNIT), retained core
    # CROSSCHECKED_UNIT (Singular + msolve fwd/rev) on this literal
    # row set; IS the (10,11) transposition image of unit-core-555-62
    # (banked per single-image precedent 555-59, double 555-53); kin
    # capped at 3 literal shared rows (555-19/-46/-64/-65); three NEW
    # supports 7:{0,3,8,10}, 8:{2,6,9,10}, 10:{3,5,7,9} after two
    # consecutive no-new-support cores; row 2:{0,1,9,11} in its sixth
    # consecutive core (63-68) — ties the record streak of 6 at
    # 555-14..-19.
    {
        "id": "unit-core-555-68",
        "rows": {
            0: frozenset({1, 2, 3, 4}),
            2: frozenset({0, 1, 9, 11}),
            7: frozenset({0, 3, 8, 10}),
            8: frozenset({2, 6, 9, 10}),
            9: frozenset({0, 4, 10, 11}),
            10: frozenset({3, 5, 7, 9}),
            11: frozenset({0, 1, 5, 6}),
        },
        "equality_count": 21,
    },
    # 555 iter-81 witness 3ea3a372 (SAT at 253,987 nodes — +7,545
    # past iter-80, sixth consecutive climb; caps=12; sources (6,7),
    # inline CROSSCHECKED_UNIT): system_unit_recheck.py 900 s
    # deletion retained 7 rows / 21 equalities (deletion verdicts
    # 5 UNIT / 5 TIMEOUT fail-closed / 2 NONUNIT), retained core
    # CROSSCHECKED_UNIT (Singular + msolve fwd/rev) on this literal
    # row set; not a transposition image of any banked core; kin
    # capped at 3 shared rows (ten cores); two NEW supports
    # 9:{0,3,7,11}, 11:{0,5,8,10}; row 2:{0,1,9,11} in its SEVENTH
    # consecutive core (63-69) — new record streak, past the
    # six-consecutive run at 555-14..-19; row 6:{2,5,7,9}
    # cross-track (ten unit-555 cores + fp-555-05).
    {
        "id": "unit-core-555-69",
        "rows": {
            0: frozenset({1, 2, 3, 4}),
            2: frozenset({0, 1, 9, 11}),
            6: frozenset({2, 5, 7, 9}),
            7: frozenset({2, 6, 10, 11}),
            9: frozenset({0, 3, 7, 11}),
            10: frozenset({4, 5, 9, 11}),
            11: frozenset({0, 5, 8, 10}),
        },
        "equality_count": 21,
    },
    # 555 iter-82 witness a28441e5 (SAT at 254,316 nodes — +329
    # past iter-81, seventh consecutive climb; caps=12; sources
    # (6,7), inline CROSSCHECKED_UNIT): system_unit_recheck.py 900 s
    # deletion retained 7 rows / 21 equalities (deletion verdicts
    # 5 UNIT / 3 TIMEOUT fail-closed / 4 NONUNIT), retained core
    # CROSSCHECKED_UNIT (Singular + msolve fwd/rev) on this literal
    # row set; not a transposition image of any banked core; kin 5
    # with the immediately preceding 555-69 (rows 0,2,6,9,10 —
    # kin-5 precedent 555-65/-64); one NEW support 8:{0,5,7,10};
    # row 2:{0,1,9,11} in its EIGHTH consecutive core (63-70),
    # extending its own record; row 9:{0,3,7,11} (new in 555-69)
    # repeats immediately.
    {
        "id": "unit-core-555-70",
        "rows": {
            0: frozenset({1, 2, 3, 4}),
            2: frozenset({0, 1, 9, 11}),
            6: frozenset({2, 5, 7, 9}),
            8: frozenset({0, 5, 7, 10}),
            9: frozenset({0, 3, 7, 11}),
            10: frozenset({4, 5, 9, 11}),
            11: frozenset({0, 1, 5, 6}),
        },
        "equality_count": 21,
    },
    # 555 iter-83 witness 356aa276 (SAT at 328,652 nodes — +74,336
    # past iter-82, eighth consecutive climb; caps=12; sources
    # (6,7), inline CROSSCHECKED_UNIT): system_unit_recheck.py 900 s
    # deletion retained 7 rows / 21 equalities (deletion verdicts
    # 5 UNIT / 5 TIMEOUT fail-closed / 2 NONUNIT), retained core
    # CROSSCHECKED_UNIT (Singular + msolve fwd/rev) on this literal
    # row set; not a transposition image of any banked core; kin 6
    # with 555-67 (rows 0,2,7,8,9,10; bank max kin is 7 at
    # 555-55/-56); NO new supports — all seven rows previously
    # banked (precedent: 11 earlier zero-new-support 555 unit
    # cores, most recently 555-67); row 2:{0,1,9,11} in its NINTH
    # consecutive core (63-71), extending its own record.
    {
        "id": "unit-core-555-71",
        "rows": {
            0: frozenset({1, 2, 3, 4}),
            2: frozenset({0, 1, 9, 11}),
            7: frozenset({0, 3, 5, 6}),
            8: frozenset({3, 7, 9, 10}),
            9: frozenset({0, 6, 10, 11}),
            10: frozenset({4, 5, 9, 11}),
            11: frozenset({0, 1, 5, 8}),
        },
        "equality_count": 21,
    },
    # 555 iter-84 witness f61c2073 (SAT at 337,501 nodes — +8,849
    # past iter-83, ninth consecutive climb; caps=12; sources
    # (6,7), inline CROSSCHECKED_UNIT): system_unit_recheck.py 900 s
    # deletion retained 7 rows / 21 equalities (deletion verdicts
    # 5 UNIT / 4 TIMEOUT fail-closed / 3 NONUNIT), retained core
    # CROSSCHECKED_UNIT (Singular + msolve fwd/rev) on this literal
    # row set; not a transposition image of any banked core; kin 6
    # with the immediately preceding 555-71 — near-twin differing
    # only in row 10 ({4,5,9,11} -> {5,7,9,11}; near-twin precedent
    # 555-10/-11); NO new supports — all seven rows previously
    # banked (13th zero-new-support 555 unit core); row 2:{0,1,9,11}
    # in its TENTH consecutive core (63-72), extending its own
    # record.
    {
        "id": "unit-core-555-72",
        "rows": {
            0: frozenset({1, 2, 3, 4}),
            2: frozenset({0, 1, 9, 11}),
            7: frozenset({0, 3, 5, 6}),
            8: frozenset({3, 7, 9, 10}),
            9: frozenset({0, 6, 10, 11}),
            10: frozenset({5, 7, 9, 11}),
            11: frozenset({0, 1, 5, 8}),
        },
        "equality_count": 21,
    },
    # 555 iter-85 witness b1656948 (SAT at 347,410 nodes — +9,909
    # past iter-84, tenth consecutive climb; caps=12; sources
    # (6,7), inline CROSSCHECKED_UNIT): system_unit_recheck.py 900 s
    # deletion retained 7 rows / 21 equalities (deletion verdicts
    # 5 UNIT / 3 TIMEOUT fail-closed / 4 NONUNIT), retained core
    # CROSSCHECKED_UNIT (Singular + msolve fwd/rev) on this literal
    # row set; not a transposition image of any banked core; kin 5
    # with both 555-71 and 555-72 (the same rows 0,2,7,9,11); one
    # NEW support 8:{2,5,7,9} (support set previously banked only
    # at center 6, in 555-69/-70); row 2:{0,1,9,11} in its
    # ELEVENTH consecutive core (63-73), extending its own record.
    {
        "id": "unit-core-555-73",
        "rows": {
            0: frozenset({1, 2, 3, 4}),
            2: frozenset({0, 1, 9, 11}),
            7: frozenset({0, 3, 5, 6}),
            8: frozenset({2, 5, 7, 9}),
            9: frozenset({0, 6, 10, 11}),
            10: frozenset({3, 7, 9, 11}),
            11: frozenset({0, 1, 5, 8}),
        },
        "equality_count": 21,
    },
    # 555 iter-86 witness 319efd87 (SAT at 347,413 nodes — +3 past
    # iter-85, eleventh consecutive climb; caps=12; sources (6,7),
    # inline CROSSCHECKED_UNIT): system_unit_recheck.py 900 s
    # deletion retained 7 rows / 21 equalities (deletion verdicts
    # 5 UNIT / 4 TIMEOUT fail-closed / 3 NONUNIT), retained core
    # CROSSCHECKED_UNIT (Singular + msolve fwd/rev) on this literal
    # row set; not a transposition image of any banked core; kin 6
    # with the immediately preceding 555-73 — near-twin differing
    # only in row 8 ({2,5,7,9} -> {2,5,7,10}; near-twin precedents
    # 555-10/-11, 555-71/-72); NO new supports — all seven rows
    # previously banked (8:{2,5,7,10} in 555-50/-60); row
    # 2:{0,1,9,11} in its TWELFTH consecutive core (63-74),
    # extending its own record.
    {
        "id": "unit-core-555-74",
        "rows": {
            0: frozenset({1, 2, 3, 4}),
            2: frozenset({0, 1, 9, 11}),
            7: frozenset({0, 3, 5, 6}),
            8: frozenset({2, 5, 7, 10}),
            9: frozenset({0, 6, 10, 11}),
            10: frozenset({3, 7, 9, 11}),
            11: frozenset({0, 1, 5, 8}),
        },
        "equality_count": 21,
    },
    # 555 iter-87 witness 6375ec09 (SAT at 347,429 nodes — +16 past
    # iter-86, twelfth consecutive climb; caps=12; sources (6,7),
    # inline CROSSCHECKED_UNIT): system_unit_recheck.py 900 s
    # deletion retained 7 rows / 21 equalities (deletion verdicts
    # 5 UNIT / 5 TIMEOUT fail-closed / 2 NONUNIT), retained core
    # CROSSCHECKED_UNIT (Singular + msolve fwd/rev) on this literal
    # row set; not a transposition image of any banked core; kin 6
    # with 555-73 (rows 0,2,8,9,10,11); NO new supports — all seven
    # rows previously banked (7:{3,5,6,8} only in 555-56,
    # 8:{2,5,7,9} only in 555-73); row 2:{0,1,9,11} in its
    # THIRTEENTH consecutive core (63-75), extending its own record.
    {
        "id": "unit-core-555-75",
        "rows": {
            0: frozenset({1, 2, 3, 4}),
            2: frozenset({0, 1, 9, 11}),
            7: frozenset({3, 5, 6, 8}),
            8: frozenset({2, 5, 7, 9}),
            9: frozenset({0, 6, 10, 11}),
            10: frozenset({3, 7, 9, 11}),
            11: frozenset({0, 1, 5, 8}),
        },
        "equality_count": 21,
    },
    # 555 iter-88 witness 4b536aea (SAT at 358,528 nodes — +11,099
    # past iter-87, thirteenth consecutive climb; caps=12; sources
    # (6,7), inline CROSSCHECKED_UNIT): system_unit_recheck.py 900 s
    # deletion retained 7 rows / 21 equalities (deletion verdicts
    # 5 UNIT / 4 TIMEOUT fail-closed / 3 NONUNIT), retained core
    # CROSSCHECKED_UNIT (Singular + msolve fwd/rev) on this literal
    # row set; not a transposition image of any banked core; kin
    # capped at 4, uniquely with 555-63 (rows 0,2,5,9); ONE new
    # support 11:{3,5,8,9}; row 10:{0,3,7,11} returns (its only
    # prior core is unit-core-555-07), row 9:{0,1,5,6}
    # previously only in 555-63/-66; row 2:{0,1,9,11} in its
    # FOURTEENTH consecutive core (63-76), extending its own record.
    {
        "id": "unit-core-555-76",
        "rows": {
            0: frozenset({1, 2, 3, 4}),
            2: frozenset({0, 1, 9, 11}),
            5: frozenset({2, 4, 7, 9}),
            7: frozenset({0, 3, 6, 8}),
            9: frozenset({0, 1, 5, 6}),
            10: frozenset({0, 3, 7, 11}),
            11: frozenset({3, 5, 8, 9}),
        },
        "equality_count": 21,
    },
    # 555 iter-89 witness a1b4c6ec (SAT at 362,616 nodes — +4,088
    # past iter-88, fourteenth consecutive climb; caps=12; sources
    # (6,7), inline CROSSCHECKED_UNIT): system_unit_recheck.py 900 s
    # deletion retained 7 rows / 21 equalities (deletion verdicts
    # 5 UNIT / 5 TIMEOUT fail-closed / 2 NONUNIT), retained core
    # CROSSCHECKED_UNIT (Singular + msolve fwd/rev) on this literal
    # row set; IS the (7,8)-transposition image of unit-core-555-69
    # — banked in its own right since --bank-negative blocks literal
    # row sets only; third admission-time image hit (after 555-51,
    # fp-654-37), second on a unit core; literal kin capped at 3
    # shared rows (14 cores, incl. the image parent via rows
    # 0,2,10); TWO new supports 9:{0,3,8,11}, 11:{0,5,7,10}; row
    # 2:{0,1,9,11} in its FIFTEENTH consecutive core (63-77),
    # extending its own record.
    {
        "id": "unit-core-555-77",
        "rows": {
            0: frozenset({1, 2, 3, 4}),
            2: frozenset({0, 1, 9, 11}),
            6: frozenset({2, 5, 8, 9}),
            8: frozenset({2, 6, 10, 11}),
            9: frozenset({0, 3, 8, 11}),
            10: frozenset({4, 5, 9, 11}),
            11: frozenset({0, 5, 7, 10}),
        },
        "equality_count": 21,
    },
    # 555 iter-90 witness 83ae8519 (SAT at 363,751 nodes — +1,135
    # past iter-89, fifteenth consecutive climb; caps=12; sources
    # (6,7), inline CROSSCHECKED_UNIT): system_unit_recheck.py 900 s
    # deletion retained 7 rows / 21 equalities (deletion verdicts
    # 5 UNIT / 3 TIMEOUT fail-closed / 4 NONUNIT), retained core
    # CROSSCHECKED_UNIT (Singular + msolve fwd/rev) on this literal
    # row set; not a transposition image of any banked core; kin 6
    # with 555-70 (rows 0,2,8,9,10,11); ZERO new supports — all
    # seven rows previously banked (8:{0,5,7,10} only in 555-70,
    # 9:{0,3,7,11} only in 555-69/-70); row 2:{0,1,9,11} in its
    # SIXTEENTH consecutive core (63-78), extending its own record.
    {
        "id": "unit-core-555-78",
        "rows": {
            0: frozenset({1, 2, 3, 4}),
            2: frozenset({0, 1, 9, 11}),
            6: frozenset({2, 5, 8, 9}),
            8: frozenset({0, 5, 7, 10}),
            9: frozenset({0, 3, 7, 11}),
            10: frozenset({4, 5, 9, 11}),
            11: frozenset({0, 1, 5, 6}),
        },
        "equality_count": 21,
    },
    # 555 iter-91 witness 77743ff0 (SAT at 363,757 nodes — +6 past
    # iter-90, sixteenth consecutive climb; caps=12; sources (6,7),
    # inline CROSSCHECKED_UNIT): system_unit_recheck.py 900 s
    # deletion retained 7 rows / 21 equalities (deletion verdicts
    # 5 UNIT / 5 TIMEOUT fail-closed / 2 NONUNIT), retained core
    # CROSSCHECKED_UNIT (Singular + msolve fwd/rev) on this literal
    # row set; not a transposition image of any banked core; kin 5
    # with 555-69/-70/-78; ZERO new supports — all seven rows
    # previously banked (8:{0,5,7,10} only in 555-70/-78,
    # 7:{2,6,10,11} last unit appearance 555-69); row 2:{0,1,9,11}
    # in its SEVENTEENTH consecutive core (63-79), extending its
    # own record.
    {
        "id": "unit-core-555-79",
        "rows": {
            0: frozenset({1, 2, 3, 4}),
            2: frozenset({0, 1, 9, 11}),
            7: frozenset({2, 6, 10, 11}),
            8: frozenset({0, 5, 7, 10}),
            9: frozenset({0, 3, 7, 11}),
            10: frozenset({4, 5, 9, 11}),
            11: frozenset({0, 1, 5, 8}),
        },
        "equality_count": 21,
    },
    # 555 iter-92 witness fe94967e (SAT at 83,242 nodes — lowest
    # 555 node count since iter-69's 59,946, ending the sixteen-
    # climb streak (76-91); caps=13; sources (6,7), inline
    # CROSSCHECKED_UNIT): system_unit_recheck.py 900 s deletion
    # retained 7 rows / 21 equalities (deletion verdicts 5 UNIT /
    # 4 TIMEOUT fail-closed / 3 NONUNIT), retained core
    # CROSSCHECKED_UNIT (Singular + msolve fwd/rev) on this literal
    # row set; not a transposition image of any banked core; kin
    # capped at 2 shared rows; TWO new supports 8:{3,4,6,9},
    # 9:{2,4,7,10}; row 0:{1,2,3,5} (non-Moser) only prior in
    # 555-05; row 11:{1,4,9,10} previously only in 654 unit cores
    # (654-11/-13) — its first 555 core; row 2:{0,1,9,11} in its
    # EIGHTEENTH consecutive core (63-80), extending its own record.
    {
        "id": "unit-core-555-80",
        "rows": {
            0: frozenset({1, 2, 3, 5}),
            2: frozenset({0, 1, 9, 11}),
            7: frozenset({0, 4, 5, 8}),
            8: frozenset({3, 4, 6, 9}),
            9: frozenset({2, 4, 7, 10}),
            10: frozenset({0, 3, 7, 11}),
            11: frozenset({1, 4, 9, 10}),
        },
        "equality_count": 21,
    },
    # 555 iter-93 witness 4710c9b4 (SAT at 106,071 nodes — +22,829
    # past iter-92; caps=13; sources (6,7), inline
    # CROSSCHECKED_UNIT): system_unit_recheck.py 900 s deletion
    # retained 6 rows / 18 equalities (deletion verdicts 6 UNIT /
    # 4 TIMEOUT fail-closed / 2 NONUNIT), retained core
    # CROSSCHECKED_UNIT (Singular + msolve fwd/rev) on this literal
    # row set; not a transposition image of any banked core; kin
    # capped at 2 shared rows; THREE new supports 3:{1,4,5,10},
    # 5:{0,4,7,10}, 10:{2,4,8,11}; row 8:{3,4,7,9} previously ONLY
    # in fp-654-12 — its first unit core; row 0:{1,2,3,5}
    # (non-Moser) second consecutive after 555-80; row 2:{0,1,9,11}
    # DELETED here — its consecutive-core streak ends at eighteen
    # (63-80).
    {
        "id": "unit-core-555-81",
        "rows": {
            0: frozenset({1, 2, 3, 5}),
            3: frozenset({1, 4, 5, 10}),
            5: frozenset({0, 4, 7, 10}),
            8: frozenset({3, 4, 7, 9}),
            9: frozenset({0, 3, 8, 10}),
            10: frozenset({2, 4, 8, 11}),
        },
        "equality_count": 18,
    },
    # 555 iter-98 witness e2c379ae (73,984 nodes, caps=14; sources
    # (6,7), inline CROSSCHECKED_UNIT — unit track resumes after the
    # four-witness NONUNIT run at iters 94-97): system_unit_recheck.py
    # 900 s deletion retained 7 rows / 21 equalities (deletion
    # verdicts 5 UNIT / 2 TIMEOUT fail-closed / 5 NONUNIT), retained
    # core CROSSCHECKED_UNIT (Singular + msolve fwd/rev) on this
    # literal row set; not a transposition image of any banked core;
    # kin reaches 3 shared rows with unit-core-555-48/-49 (rows 2,
    # 9, 10); THREE new supports 7:{0,3,4,8}, 8:{2,4,7,9},
    # 11:{0,1,4,6}; non-Moser row 0:{1,2,3,5} third in four unit
    # admissions (555-80/-81/-82); rows 9:{0,3,7,10}, 10:{3,8,9,11}
    # shared with the just-admitted fp-555-17; 7-row/21-eq is the
    # modal 555 unit grade.
    {
        "id": "unit-core-555-82",
        "rows": {
            0: frozenset({1, 2, 3, 5}),
            2: frozenset({0, 1, 9, 10}),
            7: frozenset({0, 3, 4, 8}),
            8: frozenset({2, 4, 7, 9}),
            9: frozenset({0, 3, 7, 10}),
            10: frozenset({3, 8, 9, 11}),
            11: frozenset({0, 1, 4, 6}),
        },
        "equality_count": 21,
    },
    # 555 iter-99 witness 52336a96 (77,256 nodes, caps=14; sources
    # (6,7), inline CROSSCHECKED_UNIT — unit track continues):
    # system_unit_recheck.py 900 s deletion retained 7 rows / 21
    # equalities (deletion verdicts 5 UNIT / 4 TIMEOUT fail-closed /
    # 3 NONUNIT, card-five row dropped), retained core
    # CROSSCHECKED_UNIT (Singular + msolve fwd/rev) on this literal
    # row set; not a transposition image of any banked core; kin
    # reaches 4 shared rows with unit-core-555-58 (rows 2, 6, 9, 10)
    # and 4 with unit-core-555-82 (rows 0, 2, 9, 11); ONE new
    # support 7:{0,5,8,11}; row 11:{0,1,4,6} in a third consecutive
    # admission across tracks (555-82, fp-654-52, here); non-Moser
    # row 0:{1,2,3,5} in four consecutive 555 unit admissions
    # (555-80/-81/-82/-83); 10:{3,6,9,11} shared with
    # unit-core-654-12/-15 cross-profile.
    {
        "id": "unit-core-555-83",
        "rows": {
            0: frozenset({1, 2, 3, 5}),
            2: frozenset({0, 1, 9, 10}),
            6: frozenset({4, 5, 7, 9}),
            7: frozenset({0, 5, 8, 11}),
            9: frozenset({0, 3, 7, 10}),
            10: frozenset({3, 6, 9, 11}),
            11: frozenset({0, 1, 4, 6}),
        },
        "equality_count": 21,
    },
    # 555 iter-100 witness b403dfdb (79,372 nodes, caps=14; sources
    # (6,7), inline CROSSCHECKED_UNIT — third consecutive unit-track
    # 555 witness): system_unit_recheck.py 900 s deletion retained
    # 8 rows / 24 equalities (deletion verdicts 4 UNIT / 4 TIMEOUT
    # fail-closed / 4 NONUNIT, card-five row dropped), retained core
    # CROSSCHECKED_UNIT (Singular + msolve fwd/rev) on this literal
    # row set; not a transposition image of any banked core; kin
    # reaches 6 shared rows with unit-core-555-82 (rows 0, 2, 8, 9,
    # 10, 11 — rows 5, 7 differ, not a superset) and 4 with
    # unit-core-555-83; ONE new support 5:{2,4,10,11}; non-Moser
    # row 0:{1,2,3,5} in five consecutive 555 unit admissions
    # (555-80..-84); row 11:{0,1,4,6} in four of the last five
    # admissions across tracks (555-82, fp-654-52, 555-83, here).
    {
        "id": "unit-core-555-84",
        "rows": {
            0: frozenset({1, 2, 3, 5}),
            2: frozenset({0, 1, 9, 10}),
            5: frozenset({2, 4, 10, 11}),
            7: frozenset({0, 4, 5, 8}),
            8: frozenset({2, 4, 7, 9}),
            9: frozenset({0, 3, 7, 10}),
            10: frozenset({3, 8, 9, 11}),
            11: frozenset({0, 1, 4, 6}),
        },
        "equality_count": 24,
    },
    # 555 iter-101 witness d251c6df (79,377 nodes, caps=14; sources
    # (6,7), inline CROSSCHECKED_UNIT — fourth consecutive
    # unit-track 555 witness): system_unit_recheck.py 900 s deletion
    # retained 8 rows / 24 equalities (deletion verdicts 4 UNIT / 5
    # TIMEOUT fail-closed / 3 NONUNIT, card-five row dropped),
    # retained core CROSSCHECKED_UNIT (Singular + msolve fwd/rev) on
    # this literal row set; not a transposition image of any banked
    # core; kin reaches 6 shared rows with unit-core-555-82 (rows 0,
    # 2, 7, 9, 10, 11 — row 8 differs, not a superset), 5 with
    # 555-83 and 5 with 555-84; ZERO new supports (every row
    # previously banked, row set distinct); non-Moser row 0:{1,2,3,5}
    # in six consecutive 555 unit admissions (555-80..-85); row
    # 11:{0,1,4,6} in five of the last six admissions across tracks;
    # 8:{2,7,9,11} shared with fp-654-01/-08 cross-profile.
    {
        "id": "unit-core-555-85",
        "rows": {
            0: frozenset({1, 2, 3, 5}),
            2: frozenset({0, 1, 9, 10}),
            6: frozenset({4, 5, 7, 9}),
            7: frozenset({0, 3, 4, 8}),
            8: frozenset({2, 7, 9, 11}),
            9: frozenset({0, 3, 7, 10}),
            10: frozenset({3, 8, 9, 11}),
            11: frozenset({0, 1, 4, 6}),
        },
        "equality_count": 24,
    },
    # 555 iter-102 witness 204f91a2 (100,781 nodes, caps=14; sources
    # (6,7), inline CROSSCHECKED_UNIT — fifth consecutive unit-track
    # 555 witness; node count jumps past the recent 53-79k range):
    # system_unit_recheck.py 900 s deletion retained 6 rows / 18
    # equalities (deletion verdicts 6 UNIT / 2 TIMEOUT fail-closed /
    # 4 NONUNIT, card-five row dropped), retained core
    # CROSSCHECKED_UNIT (Singular + msolve fwd/rev) on this literal
    # row set; not a transposition image of any banked core; kin at
    # most 2 shared rows — the 555-82..-85 high-kin pattern breaks;
    # TWO new supports 5:{2,4,7,11}, 9:{0,5,10,11}; row 11:{0,1,4,7}
    # previously only in forced-pair cores (fp-654-08,
    # fp-555-10/-11/-13), first unit core containing it; non-Moser
    # row 0:{1,2,3,5} in seven consecutive 555 unit admissions
    # (555-80..-86).
    {
        "id": "unit-core-555-86",
        "rows": {
            0: frozenset({1, 2, 3, 5}),
            2: frozenset({0, 1, 9, 10}),
            5: frozenset({2, 4, 7, 11}),
            9: frozenset({0, 5, 10, 11}),
            10: frozenset({3, 7, 9, 11}),
            11: frozenset({0, 1, 4, 7}),
        },
        "equality_count": 18,
    },
    # 555 iter-103 witness a978af98 (116,956 nodes, caps=14; sources
    # (6,7), inline CROSSCHECKED_UNIT — sixth consecutive unit-track
    # 555 witness, node counts climbing 79k -> 100k -> 117k):
    # system_unit_recheck.py 900 s deletion retained 7 rows / 21
    # equalities (deletion verdicts 5 UNIT / 3 TIMEOUT fail-closed /
    # 4 NONUNIT, card-five row dropped), retained core
    # CROSSCHECKED_UNIT (Singular + msolve fwd/rev) on this literal
    # row set; not a transposition image of any banked core; kin
    # reaches 5 shared rows with unit-core-555-82 and 5 with
    # unit-core-555-84 (rows 0, 2, 8, 9, 10 both); ONE new support
    # 7:{0,3,4,6}; row 11:{0,1,4,8} previously only in fp-654-09 —
    # second consecutive unit admission whose row 11 was previously
    # fp-only; non-Moser row 0:{1,2,3,5} in eight consecutive 555
    # unit admissions (555-80..-87).
    {
        "id": "unit-core-555-87",
        "rows": {
            0: frozenset({1, 2, 3, 5}),
            2: frozenset({0, 1, 9, 10}),
            7: frozenset({0, 3, 4, 6}),
            8: frozenset({2, 4, 7, 9}),
            9: frozenset({0, 3, 7, 10}),
            10: frozenset({3, 8, 9, 11}),
            11: frozenset({0, 1, 4, 8}),
        },
        "equality_count": 21,
    },
    # 555 iter-104 witness c18d09c9 (123,232 nodes, caps=14; sources
    # (6,7), inline CROSSCHECKED_UNIT — seventh consecutive
    # unit-track 555 witness, node climb 79k -> 100k -> 117k ->
    # 123k): system_unit_recheck.py 900 s deletion retained 6 rows /
    # 18 equalities (deletion verdicts 6 UNIT / 2 TIMEOUT
    # fail-closed / 4 NONUNIT, card-five row dropped), retained core
    # CROSSCHECKED_UNIT (Singular + msolve fwd/rev) on this literal
    # row set. NOTE: this core is the transposition (7,8) image of
    # unit-core-555-86 — the FIRST image admission; the
    # --bank-negative constraint operates on literal row sets (this
    # witness was found with 555-86 banked), so the image is banked
    # to exclude the shape, and its certificate is independent of
    # the image relation. Kin 4 with unit-core-555-87 (rows 0, 2,
    # 10, 11); literal-new support 5:{2,4,8,11}; non-Moser row
    # 0:{1,2,3,5} in nine consecutive 555 unit admissions
    # (555-80..-88).
    {
        "id": "unit-core-555-88",
        "rows": {
            0: frozenset({1, 2, 3, 5}),
            2: frozenset({0, 1, 9, 10}),
            5: frozenset({2, 4, 8, 11}),
            9: frozenset({0, 5, 10, 11}),
            10: frozenset({3, 8, 9, 11}),
            11: frozenset({0, 1, 4, 8}),
        },
        "equality_count": 18,
    },
    # 555 iter-105 witness 0f697c99 (135,986 nodes, caps=14; sources
    # (6,7), inline CROSSCHECKED_UNIT — eighth consecutive
    # unit-track 555 witness, node climb 79k -> 100k -> 117k ->
    # 123k -> 136k): system_unit_recheck.py 900 s deletion retained
    # 7 rows / 21 equalities (deletion verdicts 5 UNIT / 5 TIMEOUT
    # fail-closed / 2 NONUNIT, card-five row dropped), retained core
    # CROSSCHECKED_UNIT (Singular + msolve fwd/rev) on this literal
    # row set; NOT a transposition image (checker-verified) despite
    # kin 6 with unit-core-555-83 (rows 0, 2, 6, 7, 9, 10 — only
    # row 11 differs: {0,2,4,6} here vs {0,1,4,6} there, and no
    # label swap produces it without disturbing rows 0/2); ONE new
    # support 11:{0,2,4,6}; non-Moser row 0:{1,2,3,5} in ten
    # consecutive 555 unit admissions (555-80..-89).
    {
        "id": "unit-core-555-89",
        "rows": {
            0: frozenset({1, 2, 3, 5}),
            2: frozenset({0, 1, 9, 10}),
            6: frozenset({4, 5, 7, 9}),
            7: frozenset({0, 5, 8, 11}),
            9: frozenset({0, 3, 7, 10}),
            10: frozenset({3, 6, 9, 11}),
            11: frozenset({0, 2, 4, 6}),
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
    # 654 iteration-53 witness 9e8fd600… admitted 2026-07-16: FIRST
    # unit-grade 654 witness since iteration 39 — ends the
    # thirteen-witness NONUNIT run (iterations 40-52, fp-654-22..34)
    # — and the deepest 654 witness yet (13,094,386 nodes, caps=0,
    # 20 M run); system_unit_recheck.py 900 s deletion retained
    # 6 rows / 19 equalities (deletion verdicts 6 UNIT / 4 TIMEOUT
    # fail-closed / 2 NONUNIT), retained core CROSSCHECKED_UNIT
    # (Singular + msolve fwd/rev); not a transposition image of any
    # banked core; keeps the recurring surplus row 1:{0,2,7,8,9};
    # kin capped at 3 shared rows, all forced-pair cores
    # (fp-654-16/-22/-30 via rows 1, 7, 9 — no unit core shares
    # more than 2); row 8:{3,7,9,11} previously only in fp-654-02;
    # TWO new supports 0:{1,5,6,7}, 6:{2,3,4,10}; 6-row/19-eq is
    # the modal 654 unit grade.
    {
        "id": "unit-core-654-32",
        "rows": {
            0: frozenset({1, 5, 6, 7}),
            1: frozenset({0, 2, 7, 8, 9}),
            6: frozenset({2, 3, 4, 10}),
            7: frozenset({2, 4, 5, 8}),
            8: frozenset({3, 7, 9, 11}),
            9: frozenset({0, 2, 3, 6}),
        },
        "equality_count": 19,
    },
    # 654 iteration-67 witness cf0a86c8… admitted 2026-07-16: FIRST
    # unit-grade 654 witness since iteration 53 — ends the
    # thirteen-witness NONUNIT run (iterations 54-66, fp-654-35..47)
    # — and the deepest 654 witness yet (13,364,410 nodes, caps=0,
    # 20 M run, +14,037 past iter-66). Inline/long-budget Singular
    # TIMED OUT at 45 s / 900 s / 3600 s against msolve UNIT ×2;
    # resolved by the flux.local strategy race (see
    # cf0a86c8-flux-race/RACE.md): slimgb over the seed-4 permuted
    # dp order returned UNIT in 20 s. Admission recheck (perm4
    # Singular order, msolve canonical fwd/rev) retained 6 rows /
    # 19 equalities (deletion verdicts 6 UNIT / 6 TIMEOUT
    # fail-closed), retained core CROSSCHECKED_UNIT; not a
    # transposition image of any banked core; kin capped at 2
    # shared rows; keeps the recurring surplus row 1:{0,2,7,8,9};
    # 0:{3,6,9,10} in a unit core for the first time (previously
    # fp-654-11/-12 only); THREE new supports 5:{1,6,7,10},
    # 9:{1,3,5,7}, 10:{1,4,6,8}; 6-row/19-eq is the modal 654
    # unit grade.
    {
        "id": "unit-core-654-33",
        "rows": {
            0: frozenset({3, 6, 9, 10}),
            1: frozenset({0, 2, 7, 8, 9}),
            5: frozenset({1, 6, 7, 10}),
            8: frozenset({2, 6, 9, 11}),
            9: frozenset({1, 3, 5, 7}),
            10: frozenset({1, 4, 6, 8}),
        },
        "equality_count": 19,
    },
    # 654 iter-69 witness 925ac51d (SAT at 16,364,643 nodes — NEW
    # deepest 654 witness, +2,495,300 past iter-68, decisively out
    # of the ~13.35M pocket; caps=0, 20 M run; sources (7,8), inline
    # CROSSCHECKED_UNIT — unit track resumes after the single
    # NONUNIT interruption at iter-68): system_unit_recheck.py 900 s
    # deletion retained 5 rows / 16 equalities incl. surplus row
    # 1:{0,2,7,8,9} (deletion verdicts 7 UNIT / 3 TIMEOUT
    # fail-closed / 2 NONUNIT), retained core CROSSCHECKED_UNIT
    # (Singular + msolve fwd/rev) on this literal row set; not a
    # transposition image of any banked core; kin capped at 2
    # shared rows; TWO new supports 7:{2,3,6,9}, 9:{0,2,4,5}; rows
    # 0:{1,3,4,8} and 8:{4,7,9,10} previously appeared ONLY in 555
    # unit cores (555-06, 555-14) — first 654 core for each.
    {
        "id": "unit-core-654-34",
        "rows": {
            0: frozenset({1, 3, 4, 8}),
            1: frozenset({0, 2, 7, 8, 9}),
            7: frozenset({2, 3, 6, 9}),
            8: frozenset({4, 7, 9, 10}),
            9: frozenset({0, 2, 4, 5}),
        },
        "equality_count": 16,
    },
    # 654 iter-71 witness 3ece9f69 (SAT at 17,421,886 nodes — THIRD
    # consecutive depth record, +159,520 past iter-70, 87% of the
    # 20 M budget; caps=0; sources (7,8), inline CROSSCHECKED_UNIT):
    # system_unit_recheck.py 900 s deletion retained 7 rows / 22
    # equalities incl. surplus row 1:{0,2,7,8,9} (deletion verdicts
    # 5 UNIT / 3 TIMEOUT fail-closed / 4 NONUNIT), retained core
    # CROSSCHECKED_UNIT (Singular + msolve fwd/rev) on this literal
    # row set; not a transposition image of any banked core; kin
    # capped at 2 shared rows; FOUR new supports 0:{1,5,6,8},
    # 6:{1,3,4,8}, 8:{2,4,6,9}, 10:{0,4,5,11}; rows 9:{0,3,5,7} and
    # 11:{3,6,9,10} shared with the just-admitted fp-654-49; FIRST
    # 7-row and first 22-eq 654 unit core (all prior 31 are 5-6
    # rows / <=19 eq).
    {
        "id": "unit-core-654-35",
        "rows": {
            0: frozenset({1, 5, 6, 8}),
            1: frozenset({0, 2, 7, 8, 9}),
            6: frozenset({1, 3, 4, 8}),
            8: frozenset({2, 4, 6, 9}),
            9: frozenset({0, 3, 5, 7}),
            10: frozenset({0, 4, 5, 11}),
            11: frozenset({3, 6, 9, 10}),
        },
        "equality_count": 22,
    },
    # 654 iter-76 witness 9f8185ed (3,755,885 nodes, caps=1; sources
    # (7,8), inline CROSSCHECKED_UNIT — first 654 unit-track witness
    # since iter-71, ending the five-witness NONUNIT run at iters
    # 72-75 and the seven-record depth climb): system_unit_recheck.py
    # 900 s deletion retained 6 rows / 19 equalities (deletion
    # verdicts 6 UNIT / 5 TIMEOUT fail-closed / 1 NONUNIT, retaining
    # the 5-element row 1:{0,3,7,8,9}), retained core
    # CROSSCHECKED_UNIT (Singular + msolve fwd/rev) on this literal
    # row set; not a transposition image of any banked core; kin at
    # most 2 shared rows; THREE new supports 1:{0,3,7,8,9},
    # 7:{3,6,9,10}, 9:{2,5,8,10}; row 3:{1,4,5,9} previously only in
    # unit-core-555-05 and row 10:{0,5,6,11} previously only in
    # unit-core-555-45, both cross-profile; 6-row/19-eq is the modal
    # 654 unit grade.
    {
        "id": "unit-core-654-36",
        "rows": {
            1: frozenset({0, 3, 7, 8, 9}),
            3: frozenset({1, 4, 5, 9}),
            7: frozenset({3, 6, 9, 10}),
            9: frozenset({2, 5, 8, 10}),
            10: frozenset({0, 5, 6, 11}),
            11: frozenset({1, 5, 7, 10}),
        },
        "equality_count": 19,
    },
    # 654 iter-77 witness 0b6a2123 (3,767,949 nodes, caps=1; sources
    # (7,8), inline CROSSCHECKED_UNIT — second consecutive 654
    # unit-track witness, nearly the same depth as iter-76's
    # 3,755,885): system_unit_recheck.py 900 s deletion retained 6
    # rows / 19 equalities (deletion verdicts 6 UNIT / 5 TIMEOUT
    # fail-closed / 1 NONUNIT, retaining the 5-element row
    # 1:{0,3,7,8,9} — same 5-row as unit-core-654-36, two
    # consecutive), retained core CROSSCHECKED_UNIT (Singular +
    # msolve fwd/rev) on this literal row set; not a transposition
    # image of any banked core; kin at most 2 shared rows; ONE new
    # support 7:{3,6,8,10}; row 3:{1,4,5,8} previously only in
    # fp-555-06/-07 and row 8:{2,5,9,10} previously only in
    # fp-654-19, both fp-only before; 6-row/19-eq is the modal 654
    # unit grade.
    {
        "id": "unit-core-654-37",
        "rows": {
            1: frozenset({0, 3, 7, 8, 9}),
            3: frozenset({1, 4, 5, 8}),
            5: frozenset({1, 4, 6, 9}),
            7: frozenset({3, 6, 8, 10}),
            8: frozenset({2, 5, 9, 10}),
            11: frozenset({1, 5, 7, 10}),
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
    # 555 iteration-94 witness 42fbda90… admitted 2026-07-16: 7-row /
    # 21-equality core forcing pair (6,7) — FIRST NONUNIT-track 555
    # witness after the 74-witness consecutive unit-grade run
    # (iterations 20-93), and the first fp-555 admission since the
    # original bank of 13; 19,474 nodes, caps=14; inline msolve
    # NONUNIT x2; cert passed at the production order; Rabinowitsch
    # UNIT x3 on full system and retained core; deletion verdicts
    # 5 UNIT / 5 TIMEOUT / 2 NONUNIT fail-closed — apex/surplus row
    # and witness rows 2, 4, 5, 8 dropped, Moser row 0:{1,2,3,4}
    # retained; not a transposition image of any banked core; kin
    # capped at 2 shared rows; THREE new supports 3:{1,4,7,11},
    # 7:{2,5,10,11}, 11:{0,3,5,9}; row 6:{0,4,5,7} previously only
    # in fp-654-05/-06.
    {
        "id": "forced-pair-core-555-14",
        "rows": {
            0: frozenset({1, 2, 3, 4}),
            3: frozenset({1, 4, 7, 11}),
            6: frozenset({0, 4, 5, 7}),
            7: frozenset({2, 5, 10, 11}),
            9: frozenset({0, 4, 6, 10}),
            10: frozenset({4, 8, 9, 11}),
            11: frozenset({0, 3, 5, 9}),
        },
        "equality_count": 21,
        "forced_zero_squared_distance_pair": (6, 7),
        "exact_cas_status": "CROSSCHECKED_FORCED_ZERO_PAIR_CORE",
    },
    # 555 iteration-95 witness cd5f382b… admitted 2026-07-16: 8-row /
    # 24-equality core forcing pair (6,7) — second consecutive
    # NONUNIT-track 555 witness; 52,942 nodes, caps=14; inline msolve
    # NONUNIT x2; cert passed at the production order; Rabinowitsch
    # UNIT x3 on full system and retained core; deletion verdicts
    # 4 UNIT / 7 TIMEOUT / 1 NONUNIT fail-closed — apex/surplus row
    # and witness rows 2, 4, 5 dropped, Moser row 0:{1,2,3,4}
    # retained; not a transposition image of any banked core; kin
    # reaches 3 shared rows with unit-core-555-53 (rows 0, 6, 9 —
    # 6:{0,3,5,8} and 9:{0,3,6,10} previously ONLY there); TWO new
    # supports 8:{2,5,10,11}, 11:{0,4,5,9}; row 3:{1,4,8,11}
    # previously only in fp-654-24; 8-row/24-eq ties the largest
    # existing fp-555 grade (4 prior).
    {
        "id": "forced-pair-core-555-15",
        "rows": {
            0: frozenset({1, 2, 3, 4}),
            3: frozenset({1, 4, 8, 11}),
            6: frozenset({0, 3, 5, 8}),
            7: frozenset({2, 6, 8, 9}),
            8: frozenset({2, 5, 10, 11}),
            9: frozenset({0, 3, 6, 10}),
            10: frozenset({3, 7, 9, 11}),
            11: frozenset({0, 4, 5, 9}),
        },
        "equality_count": 24,
        "forced_zero_squared_distance_pair": (6, 7),
        "exact_cas_status": "CROSSCHECKED_FORCED_ZERO_PAIR_CORE",
    },
    # 555 iteration-96 witness 29e715ed… admitted 2026-07-16: 7-row /
    # 21-equality core forcing pair (6,7) — third consecutive
    # NONUNIT-track 555 witness; 53,196 nodes, caps=14; inline msolve
    # NONUNIT x2; cert passed at the production order; Rabinowitsch
    # UNIT x3 on full system and retained core; deletion verdicts
    # 5 UNIT / 7 TIMEOUT / 0 NONUNIT fail-closed — witness rows 0,
    # 1, 2, 4, 5 dropped: Moser row dropped (unlike fp-555-14/-15),
    # apexless like 7 of the original 13 fp-555 cores; not a
    # transposition image of any banked core; kin reaches 4 shared
    # rows with fp-555-15 (rows 3, 8, 10, 11); TWO new supports
    # 6:{3,5,8,9}, 7:{0,4,6,10}; row 9:{0,3,8,10} previously only
    # in 555 unit cores (50, 54-57, 81).
    {
        "id": "forced-pair-core-555-16",
        "rows": {
            3: frozenset({1, 4, 8, 11}),
            6: frozenset({3, 5, 8, 9}),
            7: frozenset({0, 4, 6, 10}),
            8: frozenset({2, 5, 10, 11}),
            9: frozenset({0, 3, 8, 10}),
            10: frozenset({3, 7, 9, 11}),
            11: frozenset({0, 4, 5, 9}),
        },
        "equality_count": 21,
        "forced_zero_squared_distance_pair": (6, 7),
        "exact_cas_status": "CROSSCHECKED_FORCED_ZERO_PAIR_CORE",
    },
    # 555 iteration-97 witness b3dcc775… admitted 2026-07-16: 8-row /
    # 24-equality core forcing pair (6,7) — fourth consecutive
    # NONUNIT-track 555 witness; 56,116 nodes, caps=14; inline msolve
    # NONUNIT x2; cert passed at the production order; Rabinowitsch
    # UNIT x3 on full system and retained core; deletion verdicts
    # 4 UNIT / 5 TIMEOUT / 3 NONUNIT fail-closed — witness rows 1,
    # 2, 3, 4 dropped, Moser row 0:{1,2,3,4} retained; not a
    # transposition image of any banked core; kin reaches 3 shared
    # rows with unit-core-555-48/-49 (rows 0, 9, 10); THREE new
    # supports 5:{0,2,8,11}, 6:{3,5,7,9}, 8:{0,4,6,10}; row
    # 11:{0,4,5,9} now in fp-555-15/-16/-17 — three consecutive
    # fp-555 admissions.
    {
        "id": "forced-pair-core-555-17",
        "rows": {
            0: frozenset({1, 2, 3, 4}),
            5: frozenset({0, 2, 8, 11}),
            6: frozenset({3, 5, 7, 9}),
            7: frozenset({2, 5, 10, 11}),
            8: frozenset({0, 4, 6, 10}),
            9: frozenset({0, 3, 7, 10}),
            10: frozenset({3, 8, 9, 11}),
            11: frozenset({0, 4, 5, 9}),
        },
        "equality_count": 24,
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
    # 654 iteration-50 witness fb1e0dd9… admitted 2026-07-16: 6-row /
    # 18-equality core forcing pair (7,8) — twenty-second
    # NONUNIT-track 654 witness (11,995,904 nodes — 158,755 past
    # iteration 49's, the largest 654 step yet; 20 M run, caps=0);
    # inline audit CROSSCHECKED_NONUNIT directly; Rabinowitsch UNIT
    # x3 (Singular + msolve fwd/rev); deletion verdicts 6 UNIT /
    # 6 TIMEOUT fail-closed — witness rows 0, 1, 2, 4, 7, 9 dropped,
    # ending the surplus row's four-core retention streak
    # (fp-654-28..31); 6-row grade matches fp-654-13/-15/-17/-24/-29
    # and 18-equality grade matches fp-654-15/-17 (only fp-654-01 at
    # 5 rows / 15 equalities is smaller on both counts); not a
    # transposition image of any banked core; only kin fp-654-27
    # (3 shared rows); TWO new supports 5:{3,6,8,11}, 8:{0,3,6,7}.
    {
        "id": "forced-pair-core-654-32",
        "rows": {
            3: frozenset({1, 4, 8, 10}),
            5: frozenset({3, 6, 8, 11}),
            6: frozenset({1, 4, 7, 11}),
            8: frozenset({0, 3, 6, 7}),
            10: frozenset({0, 1, 5, 6}),
            11: frozenset({1, 3, 9, 10}),
        },
        "equality_count": 18,
        "forced_zero_squared_distance_pair": (7, 8),
        "exact_cas_status": "CROSSCHECKED_FORCED_ZERO_PAIR_CORE",
    },
    # 654 iteration-51 witness e55df416… admitted 2026-07-16: 8-row /
    # 24-equality core forcing pair (7,8) — twenty-third
    # NONUNIT-track 654 witness (12,011,137 nodes — 15,233 past
    # iteration 50's; 20 M run, caps=0); inline audit
    # CROSSCHECKED_NONUNIT directly; Rabinowitsch UNIT x3 (Singular
    # + msolve fwd/rev); deletion verdicts 4 UNIT / 7 TIMEOUT
    # fail-closed / 1 NONUNIT — witness rows 0, 1, 8, 9 dropped, the
    # surplus row out for a second consecutive core; not a
    # transposition image of any banked core; nearest kin fp-654-32
    # (4 shared rows 3, 6, 10, 11); ONE new support 4:{3,5,7,10};
    # row 5:{3,6,9,11} previously banked only in unit-core-555-42
    # (cross-profile), row 2:{0,5,10,11} from the
    # 654-21..23/-30/-31 sector, row 7:{2,6,8,11} from the
    # 654-11..14/-25 sector.
    {
        "id": "forced-pair-core-654-33",
        "rows": {
            2: frozenset({0, 5, 10, 11}),
            3: frozenset({1, 4, 8, 10}),
            4: frozenset({3, 5, 7, 10}),
            5: frozenset({3, 6, 9, 11}),
            6: frozenset({1, 4, 7, 11}),
            7: frozenset({2, 6, 8, 11}),
            10: frozenset({0, 1, 5, 6}),
            11: frozenset({1, 3, 9, 10}),
        },
        "equality_count": 24,
        "forced_zero_squared_distance_pair": (7, 8),
        "exact_cas_status": "CROSSCHECKED_FORCED_ZERO_PAIR_CORE",
    },
    # 654 iteration-52 witness e188012b… admitted 2026-07-16: 8-row /
    # 24-equality core forcing pair (7,8) — twenty-fourth
    # NONUNIT-track 654 witness (12,011,489 nodes — 352 past
    # iteration 51's; 20 M run, caps=0); inline audit
    # CROSSCHECKED_NONUNIT directly; Rabinowitsch UNIT x3 (Singular
    # + msolve fwd/rev); deletion verdicts 4 UNIT / 7 TIMEOUT
    # fail-closed / 1 NONUNIT — witness rows 1, 2, 3, 4 dropped, the
    # surplus row out for a third consecutive core; not a
    # transposition image of any banked core; nearest kin fp-654-33
    # (4 shared rows 5, 6, 7, 10 — chains directly off the previous
    # admission; the ex-555-42 row 5:{3,6,9,11} consolidates in the
    # 654 family); TWO new supports 0:{4,6,8,10}, 8:{2,3,4,5}; row
    # 9:{0,3,6,7} from fp-654-13/-21/-25, row 11:{1,3,8,10} from
    # 654-21/fp-654-11/-12.
    {
        "id": "forced-pair-core-654-34",
        "rows": {
            0: frozenset({4, 6, 8, 10}),
            5: frozenset({3, 6, 9, 11}),
            6: frozenset({1, 4, 7, 11}),
            7: frozenset({2, 6, 8, 11}),
            8: frozenset({2, 3, 4, 5}),
            9: frozenset({0, 3, 6, 7}),
            10: frozenset({0, 1, 5, 6}),
            11: frozenset({1, 3, 8, 10}),
        },
        "equality_count": 24,
        "forced_zero_squared_distance_pair": (7, 8),
        "exact_cas_status": "CROSSCHECKED_FORCED_ZERO_PAIR_CORE",
    },
    # 654 iteration-54 witness 6331dec6… admitted 2026-07-16: 8-row /
    # 24-equality core forcing pair (7,8) — twenty-fifth
    # NONUNIT-track 654 witness, first after the unit-grade
    # interruption at iteration 53 (13,095,453 nodes — 1,067 past
    # iteration 53's; 20 M run, caps=0); inline audit
    # CROSSCHECKED_NONUNIT directly; Rabinowitsch UNIT x3 (Singular
    # + msolve fwd/rev); deletion verdicts 4 UNIT / 7 TIMEOUT
    # fail-closed / 1 NONUNIT — witness rows 1, 2, 3, 6 dropped, the
    # surplus row out for a fourth consecutive forced-pair core; not
    # a transposition image of any banked core; kin capped at 2
    # shared rows — the fp-654-33/-34 chain is broken; FIVE new
    # supports 0:{2,4,6,11}, 4:{1,5,7,10}, 5:{1,4,6,9}, 7:{2,3,5,9},
    # 10:{1,3,7,11}; row 8:{6,7,9,10} from fp-654-15/-16/-17, row
    # 9:{0,3,6,8} from fp-654-20/-29, row 11:{0,1,5,6} is the
    # cross-profile 555-19..34-sector row (also fp-654-05/-06).
    {
        "id": "forced-pair-core-654-35",
        "rows": {
            0: frozenset({2, 4, 6, 11}),
            4: frozenset({1, 5, 7, 10}),
            5: frozenset({1, 4, 6, 9}),
            7: frozenset({2, 3, 5, 9}),
            8: frozenset({6, 7, 9, 10}),
            9: frozenset({0, 3, 6, 8}),
            10: frozenset({1, 3, 7, 11}),
            11: frozenset({0, 1, 5, 6}),
        },
        "equality_count": 24,
        "forced_zero_squared_distance_pair": (7, 8),
        "exact_cas_status": "CROSSCHECKED_FORCED_ZERO_PAIR_CORE",
    },
    # 654 iteration-55 witness 1ff0d20b… admitted 2026-07-16: 8-row /
    # 24-equality core forcing pair (7,8) — twenty-sixth
    # NONUNIT-track 654 witness (13,095,457 nodes — 4 past
    # iteration 54's; 20 M run, caps=0); inline audit
    # CROSSCHECKED_NONUNIT directly; Rabinowitsch UNIT x3 (Singular
    # + msolve fwd/rev); deletion verdicts 4 UNIT / 7 TIMEOUT
    # fail-closed / 1 NONUNIT — witness rows 1, 2, 3, 6 dropped, the
    # surplus row out for a fifth consecutive forced-pair core; not
    # a transposition image of any banked core; structurally
    # fp-654-35 with row 4's support swapped ({1,5,7,10} ->
    # {1,5,8,10}) — kin fp-654-35 at 7 shared rows; ONE new
    # support 4:{1,5,8,10}.
    {
        "id": "forced-pair-core-654-36",
        "rows": {
            0: frozenset({2, 4, 6, 11}),
            4: frozenset({1, 5, 8, 10}),
            5: frozenset({1, 4, 6, 9}),
            7: frozenset({2, 3, 5, 9}),
            8: frozenset({6, 7, 9, 10}),
            9: frozenset({0, 3, 6, 8}),
            10: frozenset({1, 3, 7, 11}),
            11: frozenset({0, 1, 5, 6}),
        },
        "equality_count": 24,
        "forced_zero_squared_distance_pair": (7, 8),
        "exact_cas_status": "CROSSCHECKED_FORCED_ZERO_PAIR_CORE",
    },
    # 654 iteration-56 witness fcaeae53… admitted 2026-07-16: 8-row /
    # 24-equality core forcing pair (7,8) — twenty-seventh
    # NONUNIT-track 654 witness (13,348,599 nodes — +253,142 past
    # iteration 55's, breaking the ~13.0955M pocket; 20 M run,
    # caps=0); inline audit CROSSCHECKED_NONUNIT directly;
    # Rabinowitsch UNIT x3 (Singular + msolve fwd/rev); deletion
    # verdicts 4 UNIT / 7 TIMEOUT fail-closed / 1 NONUNIT — witness
    # rows 1, 2, 3, 6 dropped, the surplus row out for a sixth
    # consecutive forced-pair core; IS the (10,11)-transposition
    # image of forced-pair-core-654-35 — banked in its own right
    # because --bank-negative blocks literal row sets only
    # (precedent unit-core-555-51), second admission-time image hit
    # and first on a forced-pair core; kin fp-654-35/-36 and
    # unit-core-654-22 each at 3 shared rows; TWO new supports
    # 0:{2,4,6,10}, 4:{1,5,7,11}.
    {
        "id": "forced-pair-core-654-37",
        "rows": {
            0: frozenset({2, 4, 6, 10}),
            4: frozenset({1, 5, 7, 11}),
            5: frozenset({1, 4, 6, 9}),
            7: frozenset({2, 3, 5, 9}),
            8: frozenset({6, 7, 9, 11}),
            9: frozenset({0, 3, 6, 8}),
            10: frozenset({0, 1, 5, 6}),
            11: frozenset({1, 3, 7, 10}),
        },
        "equality_count": 24,
        "forced_zero_squared_distance_pair": (7, 8),
        "exact_cas_status": "CROSSCHECKED_FORCED_ZERO_PAIR_CORE",
    },
    # 654 iteration-57 witness ba42681d… admitted 2026-07-16: 8-row /
    # 24-equality core forcing pair (7,8) — twenty-eighth
    # NONUNIT-track 654 witness (13,349,122 nodes — +523 past
    # iteration 56's, a new pocket forming after the +253k jump;
    # 20 M run, caps=0); inline audit CROSSCHECKED_NONUNIT directly;
    # Rabinowitsch UNIT x3 (Singular + msolve fwd/rev); deletion
    # verdicts 4 UNIT / 6 TIMEOUT fail-closed / 2 NONUNIT — witness
    # rows 1, 2, 3, 8 dropped (drop set shifts from the 35/36/37
    # {1,2,3,6}), the surplus row out for a seventh consecutive
    # forced-pair core; not a transposition image of any banked
    # core; kin fp-654-37 at 4 shared rows (rows 4, 5, 10, 11 chain
    # into the 35/36/37 family); TWO new supports 0:{3,6,8,10},
    # 6:{2,3,4,11}.
    {
        "id": "forced-pair-core-654-38",
        "rows": {
            0: frozenset({3, 6, 8, 10}),
            4: frozenset({1, 5, 7, 11}),
            5: frozenset({1, 4, 6, 9}),
            6: frozenset({2, 3, 4, 11}),
            7: frozenset({2, 3, 5, 8}),
            9: frozenset({0, 4, 6, 7}),
            10: frozenset({0, 1, 5, 6}),
            11: frozenset({1, 3, 7, 10}),
        },
        "equality_count": 24,
        "forced_zero_squared_distance_pair": (7, 8),
        "exact_cas_status": "CROSSCHECKED_FORCED_ZERO_PAIR_CORE",
    },
    # 654 iteration-58 witness 80b40893… admitted 2026-07-16: 8-row /
    # 24-equality core forcing pair (7,8) — twenty-ninth
    # NONUNIT-track 654 witness (13,349,669 nodes — +547 past
    # iteration 57's, second witness in the ~13.349M pocket; 20 M
    # run, caps=0); inline audit CROSSCHECKED_NONUNIT directly;
    # Rabinowitsch UNIT x3 (Singular + msolve fwd/rev); deletion
    # verdicts 4 UNIT / 3 TIMEOUT fail-closed / 5 NONUNIT — witness
    # rows 1, 3, 6, 8 dropped, the surplus row out for an eighth
    # consecutive forced-pair core; not a transposition image of
    # any banked core; kin fp-654-37 and fp-654-38 each at 5 shared
    # rows — deep in the 35–38 family; ZERO new supports — row
    # 0:{4,6,7,10} previously only in fp-654-29.
    {
        "id": "forced-pair-core-654-39",
        "rows": {
            0: frozenset({4, 6, 7, 10}),
            2: frozenset({0, 5, 10, 11}),
            4: frozenset({1, 5, 7, 11}),
            5: frozenset({1, 4, 6, 9}),
            7: frozenset({2, 3, 5, 8}),
            9: frozenset({0, 3, 6, 8}),
            10: frozenset({0, 1, 5, 6}),
            11: frozenset({1, 3, 7, 10}),
        },
        "equality_count": 24,
        "forced_zero_squared_distance_pair": (7, 8),
        "exact_cas_status": "CROSSCHECKED_FORCED_ZERO_PAIR_CORE",
    },
    # 654 iteration-59 witness 8cfc23af… admitted 2026-07-16: 6-row /
    # 19-equality core forcing pair (7,8) — thirtieth NONUNIT-track
    # 654 witness (13,349,673 nodes — +4 past iteration 58's, fourth
    # witness in the ~13.349M pocket; 20 M run, caps=0); inline
    # audit CROSSCHECKED_NONUNIT directly; Rabinowitsch UNIT x3
    # (Singular + msolve fwd/rev); deletion verdicts 6 UNIT /
    # 5 TIMEOUT fail-closed / 1 NONUNIT — witness rows 0, 3, 4, 5,
    # 6, 7 dropped (six of twelve, vs four in recent cores), the
    # surplus row 1:{0,2,7,8,9} RETAINED after eight
    # consecutive cores without it (last seen fp-654-31); not a
    # transposition image of any banked core; kin fp-654-29 and
    # fp-654-39 each at 4 shared rows; ZERO new supports; 6-row
    # cores previously 6 of 39, 19-eq previously 3 of 39.
    {
        "id": "forced-pair-core-654-40",
        "rows": {
            1: frozenset({0, 2, 7, 8, 9}),
            2: frozenset({0, 5, 10, 11}),
            8: frozenset({2, 6, 9, 11}),
            9: frozenset({0, 3, 6, 8}),
            10: frozenset({0, 1, 5, 6}),
            11: frozenset({1, 3, 7, 10}),
        },
        "equality_count": 19,
        "forced_zero_squared_distance_pair": (7, 8),
        "exact_cas_status": "CROSSCHECKED_FORCED_ZERO_PAIR_CORE",
    },
    # 654 iteration-60 witness 0a20db6f… admitted 2026-07-16: 7-row /
    # 21-equality core forcing pair (7,8) — thirty-first
    # NONUNIT-track 654 witness (13,349,703 nodes — +30 past
    # iteration 59's, fifth witness in the ~13.349M pocket; 20 M
    # run, caps=0); inline audit CROSSCHECKED_NONUNIT directly;
    # Rabinowitsch UNIT x3 (Singular + msolve fwd/rev); deletion
    # verdicts 5 UNIT / 5 TIMEOUT fail-closed / 2 NONUNIT — witness
    # rows 1, 3, 5, 8, 9 dropped, the surplus row back out after
    # its single-core return in fp-654-40; not a transposition
    # image of any banked core; kin fp-654-39 at 4 shared rows;
    # ONE new support 4:{1,3,7,10}; row 11:{4,5,9,10} in an fp core
    # for the first time (previously only unit-cores 654-24/-25).
    {
        "id": "forced-pair-core-654-41",
        "rows": {
            0: frozenset({4, 6, 7, 10}),
            2: frozenset({0, 5, 10, 11}),
            4: frozenset({1, 3, 7, 10}),
            6: frozenset({2, 3, 4, 11}),
            7: frozenset({2, 3, 5, 8}),
            10: frozenset({0, 1, 5, 6}),
            11: frozenset({4, 5, 9, 10}),
        },
        "equality_count": 21,
        "forced_zero_squared_distance_pair": (7, 8),
        "exact_cas_status": "CROSSCHECKED_FORCED_ZERO_PAIR_CORE",
    },
    # 654 iteration-61 witness 48979979… admitted 2026-07-16: 7-row /
    # 21-equality core forcing pair (7,8) — thirty-second
    # NONUNIT-track 654 witness (13,350,142 nodes — +439 past
    # iteration 60's, sixth witness in the ~13.349M pocket; 20 M
    # run, caps=0); inline audit CROSSCHECKED_NONUNIT directly;
    # Rabinowitsch UNIT x3 (Singular + msolve fwd/rev); deletion
    # verdicts 5 UNIT / 5 TIMEOUT fail-closed / 2 NONUNIT — witness
    # rows 1, 2, 3, 6, 11 dropped; not a transposition image of any
    # banked core; kin fp-654-26 at 4 shared rows; ONE new support
    # 4:{3,5,8,10}; row 5:{1,4,6,9} in its sixth fp core of the
    # last eight (fp-654-35 through -39, skipping -40/-41).
    {
        "id": "forced-pair-core-654-42",
        "rows": {
            0: frozenset({4, 6, 8, 10}),
            4: frozenset({3, 5, 8, 10}),
            5: frozenset({1, 4, 6, 9}),
            7: frozenset({2, 4, 5, 8}),
            8: frozenset({6, 7, 9, 11}),
            9: frozenset({0, 2, 3, 6}),
            10: frozenset({0, 1, 5, 6}),
        },
        "equality_count": 21,
        "forced_zero_squared_distance_pair": (7, 8),
        "exact_cas_status": "CROSSCHECKED_FORCED_ZERO_PAIR_CORE",
    },
    # 654 iteration-62 witness 9b85bb11… admitted 2026-07-16: 7-row /
    # 21-equality core forcing pair (7,8) — thirty-third
    # NONUNIT-track 654 witness (13,350,144 nodes — +2 past
    # iteration 61's, seventh witness in the ~13.35M pocket; 20 M
    # run, caps=0); inline audit CROSSCHECKED_NONUNIT directly;
    # Rabinowitsch UNIT x3 (Singular + msolve fwd/rev); deletion
    # verdicts 5 UNIT / 7 TIMEOUT fail-closed — witness rows
    # 0, 1, 2, 5, 7 dropped; not a transposition image of any
    # banked core; kin capped at 3 shared rows (654-26/-27/-42,
    # off-cluster); ONE new support 4:{3,5,9,10}; row 3:{1,4,7,10}
    # previously only in fp-654-11.
    {
        "id": "forced-pair-core-654-43",
        "rows": {
            3: frozenset({1, 4, 7, 10}),
            4: frozenset({3, 5, 9, 10}),
            6: frozenset({2, 3, 4, 11}),
            8: frozenset({6, 7, 9, 11}),
            9: frozenset({0, 2, 3, 6}),
            10: frozenset({0, 1, 5, 6}),
            11: frozenset({1, 3, 8, 10}),
        },
        "equality_count": 21,
        "forced_zero_squared_distance_pair": (7, 8),
        "exact_cas_status": "CROSSCHECKED_FORCED_ZERO_PAIR_CORE",
    },
    # 654 iteration-63 witness e2fca9d5… admitted 2026-07-16: 8-row /
    # 25-equality core forcing pair (7,8) — thirty-fourth
    # NONUNIT-track 654 witness (13,350,167 nodes — +23 past
    # iteration 62's, eighth witness in the ~13.35M pocket; 20 M
    # run, caps=0); inline audit CROSSCHECKED_NONUNIT directly;
    # Rabinowitsch UNIT x3 (Singular + msolve fwd/rev); deletion
    # verdicts 4 UNIT / 5 TIMEOUT fail-closed / 3 NONUNIT — witness
    # rows 0, 3, 4, 6 dropped; not a transposition image of any
    # banked core; kin at 5 shared rows (fp-654-22/-30/-42); ONE
    # new support 11:{3,5,9,10}; surplus row 1:{0,2,7,8,9} retained
    # (last fp appearance fp-654-40); second 25-equality fp-654
    # core (prior: fp-654-22); row 5:{1,4,6,9} in its seventh fp
    # core of the last nine.
    {
        "id": "forced-pair-core-654-44",
        "rows": {
            1: frozenset({0, 2, 7, 8, 9}),
            2: frozenset({0, 5, 10, 11}),
            5: frozenset({1, 4, 6, 9}),
            7: frozenset({2, 4, 5, 8}),
            8: frozenset({6, 7, 9, 11}),
            9: frozenset({0, 2, 3, 6}),
            10: frozenset({0, 1, 5, 6}),
            11: frozenset({3, 5, 9, 10}),
        },
        "equality_count": 25,
        "forced_zero_squared_distance_pair": (7, 8),
        "exact_cas_status": "CROSSCHECKED_FORCED_ZERO_PAIR_CORE",
    },
    # 654 iteration-64 witness cdd23026… admitted 2026-07-16: 8-row /
    # 24-equality core forcing pair (7,8) — thirty-fifth
    # NONUNIT-track 654 witness (13,350,337 nodes — +170 past
    # iteration 63's, ninth witness in the ~13.35M pocket; 20 M
    # run, caps=0); inline audit CROSSCHECKED_NONUNIT directly;
    # Rabinowitsch UNIT x3 (Singular + msolve fwd/rev); deletion
    # verdicts 4 UNIT / 4 TIMEOUT fail-closed / 4 NONUNIT — witness
    # rows 1, 2, 4, 8 dropped; not a transposition image of any
    # banked core; kin capped at 4 shared rows (fp-654-34/-42/-43);
    # NO new supports — all eight rows previously banked; row
    # 5:{1,4,6,9} in its eighth fp core; row 9:{0,3,6,7} returns
    # (last fp appearance fp-654-34).
    {
        "id": "forced-pair-core-654-45",
        "rows": {
            0: frozenset({4, 6, 8, 10}),
            3: frozenset({1, 4, 7, 10}),
            5: frozenset({1, 4, 6, 9}),
            6: frozenset({2, 3, 4, 11}),
            7: frozenset({2, 4, 5, 8}),
            9: frozenset({0, 3, 6, 7}),
            10: frozenset({0, 1, 5, 6}),
            11: frozenset({1, 3, 8, 10}),
        },
        "equality_count": 24,
        "forced_zero_squared_distance_pair": (7, 8),
        "exact_cas_status": "CROSSCHECKED_FORCED_ZERO_PAIR_CORE",
    },
    # 654 iteration-65 witness 4999f098… admitted 2026-07-16: 8-row /
    # 24-equality core forcing pair (7,8) — thirty-sixth
    # NONUNIT-track 654 witness (13,350,350 nodes — +13 past
    # iteration 64's, tenth witness in the ~13.35M pocket; 20 M
    # run, caps=0); inline audit CROSSCHECKED_NONUNIT directly;
    # Rabinowitsch UNIT x3 (Singular + msolve fwd/rev); deletion
    # verdicts 4 UNIT / 4 TIMEOUT fail-closed / 4 NONUNIT — witness
    # rows 0, 1, 8, 11 dropped; not a transposition image of any
    # banked core; kin at 6 shared rows with fp-654-45 (three
    # banked pairs already share 6; bank max is 7, fp-654-35/-36);
    # NO new supports — all eight rows previously banked (as in
    # fp-654-45); row 5:{1,4,6,9} in its ninth fp core; row
    # 4:{3,5,8,10} previously only in fp-654-42.
    {
        "id": "forced-pair-core-654-46",
        "rows": {
            2: frozenset({0, 5, 10, 11}),
            3: frozenset({1, 4, 7, 10}),
            4: frozenset({3, 5, 8, 10}),
            5: frozenset({1, 4, 6, 9}),
            6: frozenset({2, 3, 4, 11}),
            7: frozenset({2, 4, 5, 8}),
            9: frozenset({0, 3, 6, 7}),
            10: frozenset({0, 1, 5, 6}),
        },
        "equality_count": 24,
        "forced_zero_squared_distance_pair": (7, 8),
        "exact_cas_status": "CROSSCHECKED_FORCED_ZERO_PAIR_CORE",
    },
    # 654 iteration-66 witness ebce302f… admitted 2026-07-16: 7-row /
    # 22-equality core forcing pair (7,8) — thirty-seventh
    # NONUNIT-track 654 witness (13,350,373 nodes — +23 past
    # iteration 65's, eleventh witness in the ~13.35M pocket; 20 M
    # run, caps=0); inline audit CROSSCHECKED_NONUNIT directly;
    # Rabinowitsch UNIT x3 (Singular + msolve fwd/rev); deletion
    # verdicts 5 UNIT / 7 TIMEOUT fail-closed — witness rows 2, 3,
    # 4, 5, 7 dropped; not a transposition image of any banked
    # core; kin capped at 4 shared rows (fp-654-45); NO new
    # supports — third consecutive fp core with all rows previously
    # banked (-45/-46/-47); surplus row 1:{0,2,7,8,9} returns (last
    # fp appearance fp-654-44); row 11:{3,5,9,10} previously only
    # in fp-654-44; row 5:{1,4,6,9} absent for the first time since
    # fp-654-43.
    {
        "id": "forced-pair-core-654-47",
        "rows": {
            0: frozenset({4, 6, 8, 10}),
            1: frozenset({0, 2, 7, 8, 9}),
            6: frozenset({2, 3, 4, 11}),
            8: frozenset({2, 6, 9, 11}),
            9: frozenset({0, 3, 6, 7}),
            10: frozenset({0, 1, 5, 6}),
            11: frozenset({3, 5, 9, 10}),
        },
        "equality_count": 22,
        "forced_zero_squared_distance_pair": (7, 8),
        "exact_cas_status": "CROSSCHECKED_FORCED_ZERO_PAIR_CORE",
    },
    # 654 iteration-68 witness ff2eb8fb… admitted 2026-07-16: 7-row /
    # 21-equality core forcing pair (7,8) — thirty-eighth
    # NONUNIT-track 654 witness and the deepest 654 witness yet
    # (13,869,343 nodes — +504,933 past iteration 67's 13,364,410,
    # stepping out of the ~13.35M pocket; 20 M run, caps=0); inline
    # msolve NONUNIT x2; production-order cert hit Singular TIMEOUT,
    # resolved by a 12-job flux strategy race won by slimgb + the
    # seed-4 permuted order (UNIT in 20 s, same winner as cf0a86c8;
    # ff2eb8fb-flux-race/RACE.md) — all Singular calls in this cert
    # use the perm4 order, msolve canonical fwd/rev; Rabinowitsch
    # UNIT x3 on full system and retained core; deletion verdicts
    # 5 UNIT / 5 TIMEOUT / 2 NONUNIT fail-closed — the apex/surplus
    # row and witness rows 0, 2, 7, 9 dropped; not a transposition
    # image of any banked core; kin 5 shared rows (fp-654-43: rows
    # 3, 4, 8, 10, 11); ONE new support — row 6:{3,4,7,11} — ending
    # the three-core all-banked run (-45/-46/-47); row 4:{3,5,9,10}
    # previously only in fp-654-43.
    {
        "id": "forced-pair-core-654-48",
        "rows": {
            3: frozenset({1, 4, 7, 10}),
            4: frozenset({3, 5, 9, 10}),
            5: frozenset({1, 4, 6, 9}),
            6: frozenset({3, 4, 7, 11}),
            8: frozenset({6, 7, 9, 11}),
            10: frozenset({0, 1, 5, 6}),
            11: frozenset({1, 3, 8, 10}),
        },
        "equality_count": 21,
        "forced_zero_squared_distance_pair": (7, 8),
        "exact_cas_status": "CROSSCHECKED_FORCED_ZERO_PAIR_CORE",
    },
    # 654 iteration-70 witness 0e70fb54… admitted 2026-07-16: 7-row /
    # 21-equality core forcing pair (7,8) — thirty-ninth
    # NONUNIT-track 654 witness and the deepest 654 witness yet
    # (17,262,366 nodes — +897,723 past iteration 69's 16,364,643;
    # 20 M run, caps=0); inline msolve NONUNIT x2; cert passed at
    # the production order (no strategy race needed, unlike
    # ff2eb8fb); Rabinowitsch UNIT x3 on full system and retained
    # core; deletion verdicts 5 UNIT / 5 TIMEOUT / 2 NONUNIT
    # fail-closed — the apex/surplus row and witness rows 2, 5, 6,
    # 8 dropped; not a transposition image of any banked core; kin
    # capped at 2 shared rows; THREE new supports 0:{3,4,8,10},
    # 4:{1,3,9,11}, 11:{3,6,9,10}; row 9:{0,3,5,7} previously only
    # in fp-654-11; row 7:{2,5,8,10} previously in 654 unit cores
    # -25/-26 and fp-555 -07/-09.
    {
        "id": "forced-pair-core-654-49",
        "rows": {
            0: frozenset({3, 4, 8, 10}),
            3: frozenset({1, 4, 7, 10}),
            4: frozenset({1, 3, 9, 11}),
            7: frozenset({2, 5, 8, 10}),
            9: frozenset({0, 3, 5, 7}),
            10: frozenset({0, 1, 5, 6}),
            11: frozenset({3, 6, 9, 10}),
        },
        "equality_count": 21,
        "forced_zero_squared_distance_pair": (7, 8),
        "exact_cas_status": "CROSSCHECKED_FORCED_ZERO_PAIR_CORE",
    },
    # 654 iteration-72 witness ed7e977f… admitted 2026-07-16: 8-row /
    # 24-equality core forcing pair (7,8) — fortieth NONUNIT-track
    # 654 witness and the deepest 654 witness yet (17,838,635 nodes
    # — +416,749 past iteration 71's 17,421,886, FOURTH consecutive
    # depth record, 89% of the 20 M budget; caps=0); inline msolve
    # NONUNIT x2; cert passed at the production order; Rabinowitsch
    # UNIT x3 on full system and retained core; deletion verdicts
    # 4 UNIT / 7 TIMEOUT / 1 NONUNIT fail-closed — witness rows 0,
    # 1, 4, 6 dropped, leaving an APEXLESS core (no row centered at
    # 0 or 1, like fp-654-48); not a transposition image of any
    # banked core; kin capped at 2 shared rows; FOUR new supports
    # 2:{0,6,10,11}, 5:{2,3,6,11}, 7:{0,2,3,5}, 9:{3,4,6,8}; row
    # 8:{5,7,9,11} previously ONLY in fp-555-10..13 — first 654
    # core containing it.
    {
        "id": "forced-pair-core-654-50",
        "rows": {
            2: frozenset({0, 6, 10, 11}),
            3: frozenset({1, 4, 7, 10}),
            5: frozenset({2, 3, 6, 11}),
            7: frozenset({0, 2, 3, 5}),
            8: frozenset({5, 7, 9, 11}),
            9: frozenset({3, 4, 6, 8}),
            10: frozenset({0, 1, 5, 6}),
            11: frozenset({1, 3, 9, 10}),
        },
        "equality_count": 24,
        "forced_zero_squared_distance_pair": (7, 8),
        "exact_cas_status": "CROSSCHECKED_FORCED_ZERO_PAIR_CORE",
    },
    # 654 iteration-73 witness 14c491e7… admitted 2026-07-16: 7-row /
    # 21-equality core forcing pair (7,8) — forty-first
    # NONUNIT-track 654 witness and the deepest 654 witness yet
    # (17,951,372 nodes — +112,737 past iteration 72's 17,838,635,
    # FIFTH consecutive depth record, ~90% of the 20 M budget;
    # caps=0); inline msolve NONUNIT x2; cert passed at the
    # production order; Rabinowitsch UNIT x3 on full system and
    # retained core; deletion verdicts 5 UNIT / 6 TIMEOUT / 1
    # NONUNIT fail-closed — witness rows 0, 1, 2, 6, 8 dropped,
    # APEXLESS core like fp-654-48/-50; not a transposition image
    # of any banked core; kin reaches 4 shared rows with fp-654-49
    # (rows 3, 7, 9, 10) and 3 with fp-654-50 (rows 3, 10, 11); TWO
    # new supports 4:{3,5,9,11}, 5:{1,6,8,11}.
    {
        "id": "forced-pair-core-654-51",
        "rows": {
            3: frozenset({1, 4, 7, 10}),
            4: frozenset({3, 5, 9, 11}),
            5: frozenset({1, 6, 8, 11}),
            7: frozenset({2, 5, 8, 10}),
            9: frozenset({0, 3, 5, 7}),
            10: frozenset({0, 1, 5, 6}),
            11: frozenset({1, 3, 9, 10}),
        },
        "equality_count": 21,
        "forced_zero_squared_distance_pair": (7, 8),
        "exact_cas_status": "CROSSCHECKED_FORCED_ZERO_PAIR_CORE",
    },
    # 654 iteration-74 witness a41eb4e4… admitted 2026-07-16: 6-row /
    # 18-equality core forcing pair (7,8) — forty-second
    # NONUNIT-track 654 witness and the deepest 654 witness yet
    # (18,556,391 nodes — +605,019 past iteration 73's 17,951,372,
    # SIXTH consecutive depth record, ~93% of the 20 M budget;
    # caps=0); inline msolve NONUNIT x2; cert passed at the
    # production order; Rabinowitsch UNIT x3 on full system and
    # retained core; deletion verdicts 6 UNIT / 5 TIMEOUT / 1
    # NONUNIT fail-closed — witness rows 1, 2, 4, 8, 9, 10 dropped
    # (row 8 of the forced pair dropped, row 7 retained), APEXLESS
    # core; eighth 6-row and fourth 18-equality fp-654 core; not a
    # transposition image of any banked core; kin at most 2 shared
    # rows; TWO new supports 0:{3,5,6,7}, 6:{1,5,8,10}; row
    # 11:{0,1,4,6} previously only in unit-core-555-82 and row
    # 3:{1,4,7,11} previously only in fp-555-14.
    {
        "id": "forced-pair-core-654-52",
        "rows": {
            0: frozenset({3, 5, 6, 7}),
            3: frozenset({1, 4, 7, 11}),
            5: frozenset({1, 3, 6, 9}),
            6: frozenset({1, 5, 8, 10}),
            7: frozenset({2, 3, 8, 11}),
            11: frozenset({0, 1, 4, 6}),
        },
        "equality_count": 18,
        "forced_zero_squared_distance_pair": (7, 8),
        "exact_cas_status": "CROSSCHECKED_FORCED_ZERO_PAIR_CORE",
    },
    # 654 iteration-75 witness 1dfe7188… admitted 2026-07-16: 7-row /
    # 21-equality core forcing pair (7,8) — forty-third
    # NONUNIT-track 654 witness and the deepest 654 witness yet
    # (19,675,874 nodes — +1,119,483 past iteration 74's 18,556,391,
    # SEVENTH consecutive depth record, ~98% of the 20 M budget;
    # caps=0); inline msolve NONUNIT x2; cert passed at the
    # production order; Rabinowitsch UNIT x3 on full system and
    # retained core; deletion verdicts 5 UNIT / 6 TIMEOUT / 1
    # NONUNIT fail-closed — witness rows 0, 1, 2, 3, 9 dropped
    # (both pair rows 7 and 8 retained), APEXLESS core; not a
    # transposition image of any banked core; kin at most 2 shared
    # rows; ONE new support 11:{3,6,7,10}; row 4:{2,3,5,10}
    # previously only in fp-555-11, row 8:{2,4,6,9} previously only
    # in unit-core-654-35, row 7:{2,3,8,11} repeats from the
    # just-admitted fp-654-52.
    {
        "id": "forced-pair-core-654-53",
        "rows": {
            4: frozenset({2, 3, 5, 10}),
            5: frozenset({1, 6, 9, 11}),
            6: frozenset({1, 3, 4, 7}),
            7: frozenset({2, 3, 8, 11}),
            8: frozenset({2, 4, 6, 9}),
            10: frozenset({0, 1, 5, 6}),
            11: frozenset({3, 6, 7, 10}),
        },
        "equality_count": 21,
        "forced_zero_squared_distance_pair": (7, 8),
        "exact_cas_status": "CROSSCHECKED_FORCED_ZERO_PAIR_CORE",
    },
    # 654 iteration-78 witness 0a68e92d… admitted 2026-07-16: 7-row /
    # 21-equality core forcing pair (7,8) — forty-fourth
    # NONUNIT-track 654 witness (6,053,746 nodes caps=1 — back to
    # the NONUNIT track after the two unit witnesses at iters 76-77,
    # at an intermediate depth between the 3.8 M unit pair and the
    # 19.7 M peak); inline msolve NONUNIT x2; cert passed at the
    # production order; Rabinowitsch UNIT x3 on full system and
    # retained core; deletion verdicts 5 UNIT / 5 TIMEOUT / 2
    # NONUNIT fail-closed — witness rows 1, 3, 4, 6, 9 dropped
    # (both pair rows 7 and 8 retained), APEXLESS core; not a
    # transposition image of any banked core; kin at most 2 shared
    # rows; THREE new supports 0:{2,3,6,11}, 5:{2,3,4,7},
    # 10:{1,2,5,8}; rows 7:{3,5,8,10}, 8:{2,4,9,10}, 11:{1,6,7,10}
    # previously unit-only (555u-08/-09, 654u-28, 654u-05/-06).
    {
        "id": "forced-pair-core-654-54",
        "rows": {
            0: frozenset({2, 3, 6, 11}),
            2: frozenset({0, 1, 10, 11}),
            5: frozenset({2, 3, 4, 7}),
            7: frozenset({3, 5, 8, 10}),
            8: frozenset({2, 4, 9, 10}),
            10: frozenset({1, 2, 5, 8}),
            11: frozenset({1, 6, 7, 10}),
        },
        "equality_count": 21,
        "forced_zero_squared_distance_pair": (7, 8),
        "exact_cas_status": "CROSSCHECKED_FORCED_ZERO_PAIR_CORE",
    },
    # 654 iteration-79 witness 5e15de6c… admitted 2026-07-16: 8-row /
    # 24-equality retained core forcing pair (7,8) (witness at
    # 6,081,265 nodes caps=1, forty-fifth NONUNIT-track, second
    # consecutive at the ~6M depth band); inline NONUNIT x3; cert
    # passed at the production order; Rabinowitsch UNIT x3 on full
    # system and retained core; deletion verdicts 4 UNIT / 7 TIMEOUT /
    # 1 NONUNIT fail-closed — witness rows 0, 1, 2, 6 dropped (both
    # pair rows 7 and 8 retained), APEXLESS core; not a transposition
    # image of any banked core; kin at most 2 shared rows; THREE new
    # supports 3:{2,4,8,11}, 7:{4,6,9,10}, 11:{1,6,8,10}; row
    # 8:{5,7,9,11} previously in fp555-10..13 and fp654-50.
    {
        "id": "forced-pair-core-654-55",
        "rows": {
            3: frozenset({2, 4, 8, 11}),
            4: frozenset({1, 3, 5, 8}),
            5: frozenset({1, 4, 6, 7}),
            7: frozenset({4, 6, 9, 10}),
            8: frozenset({5, 7, 9, 11}),
            9: frozenset({0, 3, 4, 5}),
            10: frozenset({1, 2, 5, 9}),
            11: frozenset({1, 6, 8, 10}),
        },
        "equality_count": 24,
        "forced_zero_squared_distance_pair": (7, 8),
        "exact_cas_status": "CROSSCHECKED_FORCED_ZERO_PAIR_CORE",
    },
    # 654 iteration-80 witness f3d4e7c8… admitted 2026-07-16: 7-row /
    # 21-equality retained core forcing pair (7,8) (witness at
    # 6,081,547 nodes caps=1, forty-sixth NONUNIT-track, third
    # consecutive at the ~6M depth band); inline NONUNIT x3; cert
    # passed at the production order; Rabinowitsch UNIT x3 on full
    # system and retained core; deletion verdicts 5 UNIT / 6 TIMEOUT /
    # 1 NONUNIT fail-closed — witness rows 0, 1, 2, 6, 10 dropped
    # (both pair rows 7 and 8 retained), APEXLESS core; NOT a
    # transposition image of any banked core (checker-verified)
    # despite kin 5 with forced-pair-core-654-55 (rows 3, 4, 5, 8, 11
    # identical; rows 7 and 9 differ, no row 10, 7 rows vs 8); TWO
    # new supports 7:{3,4,9,10}, 9:{0,4,5,6}; row 8:{5,7,9,11} stays
    # fp-only (sixth fp appearance).
    {
        "id": "forced-pair-core-654-56",
        "rows": {
            3: frozenset({2, 4, 8, 11}),
            4: frozenset({1, 3, 5, 8}),
            5: frozenset({1, 4, 6, 7}),
            7: frozenset({3, 4, 9, 10}),
            8: frozenset({5, 7, 9, 11}),
            9: frozenset({0, 4, 5, 6}),
            11: frozenset({1, 6, 8, 10}),
        },
        "equality_count": 21,
        "forced_zero_squared_distance_pair": (7, 8),
        "exact_cas_status": "CROSSCHECKED_FORCED_ZERO_PAIR_CORE",
    },
    # 654 iteration-81 witness 5cb4bee1… admitted 2026-07-16: 7-row /
    # 21-equality retained core forcing pair (7,8) (witness at
    # 6,084,777 nodes caps=1, forty-seventh NONUNIT-track, fourth
    # consecutive at the ~6M depth band); inline NONUNIT x3; cert
    # passed at the production order; Rabinowitsch UNIT x3 on full
    # system and retained core; deletion verdicts 5 UNIT / 6 TIMEOUT /
    # 1 NONUNIT fail-closed — witness rows 0, 1, 2, 6, 10 dropped
    # (both pair rows 7 and 8 retained), APEXLESS core; NOT a
    # transposition image of any banked core (checker-verified; kin 4
    # with fp-654-55/-56). Verified relation: under the swap 7<->9 its
    # row set equals fp-654-55 minus row 10:{1,2,5,9}, but the forced
    # pair transports to (8,9), not (7,8) — distinct statement. TWO
    # new supports 7:{0,3,4,5}, 9:{4,6,7,10}; row 8:{5,7,9,11} stays
    # fp-only (seventh fp appearance).
    {
        "id": "forced-pair-core-654-57",
        "rows": {
            3: frozenset({2, 4, 8, 11}),
            4: frozenset({1, 3, 5, 8}),
            5: frozenset({1, 4, 6, 9}),
            7: frozenset({0, 3, 4, 5}),
            8: frozenset({5, 7, 9, 11}),
            9: frozenset({4, 6, 7, 10}),
            11: frozenset({1, 6, 8, 10}),
        },
        "equality_count": 21,
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
