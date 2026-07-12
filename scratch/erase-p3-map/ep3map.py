#!/usr/bin/env python3
"""ERASE-P3-MAP: deterministic map erased-pin row/site -> multi-center census
class code + orientation.

Vocabulary (chosen per matrix row ERASE-P3-MAP, closure-plan-full-spec
2026-07-09 line ~1334 "erased-pin row-to-multi-center-class map", and
census/multi_center/STATE.md item 9 "erased-pin row-to-class mapping"):
the multi-center joint token census, census/multi_center/multi_center_census.py
(spec docs/multi-center-joint-census-spec-2026-07-07.md).

- Non-Moser center (opp-cap interior Pw/Pu/Q1/Q2, surplus interior s_i):
  class code = the census's canonical single-center type
  min((m,s,l,r),(m,s,r,l)) (q2_token.type_of / multi_center type_of_fast),
  bucket convention own cap X -> (left,right) cyclic: S->(O1,O2),
  O1->(O2,S), O2->(S,O1). This matches the Lean erased-pin count-row
  convention verbatim (SurplusM44Packet.lean:293-320: left of cap i =
  cap i+1, right = cap i-1 mod 3; cross-checked in
  scratch/erased-pin-row-truth/STATE.md "Semantics cross-check PASSED").
- Moser center u (surplus-opposite apex): class code =
  class_key(canon_joint(profile, (0,), moser_masks, cap_counts, "EP1"))
  -- the census's own canonicalization/serialization, at the single-
  participant layer tagged "EP1" (so the keys cannot collide with the
  L1/L2 layers of the swept census state).

Orientation: the census canonical code forgets (a) which opp cap the
center sits in and (b) the local left/right chirality. The orientation
component restores exactly that data so that (code, orientation) is
lossless on the feature set:
  side ∈ {O1, O2} (opp-cap rows only; S/U sites are automorphism-fixed),
  chi  ∈ {direct, reflected, symmetric}
where chi = direct if the presented ordered signature is strictly the
canonical representative, reflected if strictly its mirror image, and
symmetric if the signature is mirror-fixed.

Frames: erased-pin card 10 = cap profile (5,4,4), n = 10; card 11 =
(6,4,4), n = 11 (closed-cap cards include the 2 chord endpoints;
n = cS+cO1+cO2-3). These profiles are OUTSIDE the census's swept family
(q3_token.profiles_for requires two caps >= 5), so aliveness is decided
by (i) the census LOCAL cut vocabulary (hard encoding gate) and (ii) a
fresh run of the census's own GLOBAL engine solve_global at the mapped
profile (EMPIRICAL SAT/UNSAT).

This module makes NO claim of geometric necessity; it is diagnostic
tooling only.
"""
from __future__ import annotations

import json
import os
import sys
from itertools import product

HERE = os.path.dirname(os.path.abspath(__file__))
ROOT = os.path.normpath(os.path.join(HERE, "..", ".."))
sys.path.insert(0, os.path.join(ROOT, "census", "multi_center"))
sys.path.insert(0, os.path.join(ROOT, "census", "candidate_d_probe"))

import multi_center_census as mc  # noqa: E402
import q2_token as qt  # noqa: E402

# ---------------------------------------------------------------------------
# Frames

PROFILES = {10: (5, 4, 4), 11: (6, 4, 4)}

# Erased-pin probe label alphabet (scratch/erased-pin-row-truth/rowlib.py):
# hull [u, Q1, Q2, v, s1..s3(4), w, Pw, Pu]; caps: S = surplus = [v..w]
# (interior s_i, endpoints v,w), O1 = oppIndex1 = [w..u] (interior Pw,Pu,
# endpoints w,u), O2 = oppIndex2 = [u..v] (interior Q1,Q2, endpoints u,v).
# Census frame (q2_token.build_labels): U=0,V=1,W=2; S ∋ {V,W},
# O1 ∋ {U,W}, O2 ∋ {U,V}; intS = 3.., then intO1, then intO2.


def label_map(model_n: int) -> dict[str, int]:
    cS, cO1, cO2 = PROFILES[model_n]
    n, S, O1, O2, intS, intO1, intO2 = qt.build_labels(cS, cO1, cO2)
    assert n == model_n
    m = {"u": 0, "v": 1, "w": 2}
    for i, lab in enumerate([f"s{j+1}" for j in range(len(intS))]):
        m[lab] = intS[i]
    for i, lab in enumerate(["Pw", "Pu"]):
        m[lab] = intO1[i]
    for i, lab in enumerate(["Q1", "Q2"]):
        m[lab] = intO2[i]
    return m


def frame_data(model_n: int):
    cS, cO1, cO2 = PROFILES[model_n]
    n, S, O1, O2, intS, intO1, intO2 = qt.build_labels(cS, cO1, cO2)
    caps_int = {"S": frozenset(intS), "O1": frozenset(intO1), "O2": frozenset(intO2)}
    cap_of_int = {}
    for c in intS:
        cap_of_int[c] = "S"
    for c in intO1:
        cap_of_int[c] = "O1"
    for c in intO2:
        cap_of_int[c] = "O2"
    return caps_int, cap_of_int


SITES = ("O1int", "O2int", "Sint", "U")
SITE_OF_LABEL_CAP = {"S": "Sint", "O1": "O1int", "O2": "O2int"}
OWN_CAP = {"O1int": "O1", "O2int": "O2", "Sint": "S"}
# census cyclic bucket convention (q2_token.type_of / mc.LEFT_RIGHT)
LEFT_RIGHT = {"S": ("O1", "O2"), "O1": ("O2", "S"), "O2": ("S", "O1")}


# ---------------------------------------------------------------------------
# Features
#
# F = {profile_card: 10|11, site: O1int|O2int|Sint|U, sig: tuple}
#   sig for non-Moser sites: ordered census row (m, s, l, r)
#   sig for site U:          ordered apex tuple (mv, mw, kS, kO1, kO2)


def features_of_witness(w: dict) -> dict:
    model_n = w["model_n"]
    lm = label_map(model_n)
    caps_int, cap_of_int = frame_data(model_n)
    center = lm[w["center"]]
    cls = frozenset(lm[x] for x in w["class"])
    if len(cls) != 4 or center in cls:
        raise ValueError(f"witness {w.get('tag')}: class not a valid C1 4-class")
    if center == 0:
        mv = 1 if 1 in cls else 0
        mw = 1 if 2 in cls else 0
        kS = len(cls & caps_int["S"])
        kO1 = len(cls & caps_int["O1"])
        kO2 = len(cls & caps_int["O2"])
        sig = (mv, mw, kS, kO1, kO2)
        site = "U"
    elif center in (1, 2):
        raise ValueError("v/w-centered sites are not erased-pin sites")
    else:
        own = cap_of_int[center]
        site = SITE_OF_LABEL_CAP[own]
        left, right = LEFT_RIGHT[own]
        m = len(cls & {0, 1, 2})
        s = len(cls & caps_int[own])
        l = len(cls & caps_int[left])
        r = len(cls & caps_int[right])
        sig = (m, s, l, r)
    return {
        "profile_card": model_n,
        "site": site,
        "sig": sig,
        "_center": center,
        "_class": cls,
    }


# ---------------------------------------------------------------------------
# Map: features -> (class code, orientation)


def reflect_row(sig):
    m, s, l, r = sig
    return (m, s, r, l)


def reflect_apex(sig):
    mv, mw, kS, kO1, kO2 = sig
    return (mw, mv, kS, kO2, kO1)


TAU = (0, 2, 1)  # the V<->W / O1<->O2 profile automorphism


def apex_struct(profile, sig, layer="EP1"):
    """Census encoding tuple of an apex signature under the identity perm."""
    mv, mw, kS, kO1, kO2 = sig
    moser_masks = {0: 0, 1: mv, 2: mw}  # bit 0 = participant U
    cap_counts = {}
    for cap, k in (("S", kS), ("O1", kO1), ("O2", kO2)):
        if k:
            cap_counts[cap] = {1: k}
    enc = (layer, (0,), (0, mv, mw), mc.normalize_counts(cap_counts))
    return moser_masks, cap_counts, enc


def map_features(F: dict) -> dict:
    profile = PROFILES[F["profile_card"]]
    site, sig = F["site"], tuple(F["sig"])
    if site == "U":
        moser_masks, cap_counts, enc_id = apex_struct(profile, sig)
        _, _, enc_tau = apex_struct(profile, reflect_apex(sig))
        canon = mc.canon_joint(profile, (0,), moser_masks, cap_counts, "EP1")
        assert canon == min(enc_id, enc_tau), (sig, canon, enc_id, enc_tau)
        assert TAU in mc.allowed_profile_perms(profile)
        code = mc.class_key(canon)
        if enc_id == enc_tau:
            chi = "symmetric"
        elif enc_id == canon:
            chi = "direct"
        else:
            chi = "reflected"
        return {
            "profile_card": F["profile_card"],
            "code_kind": "apexClass",
            "class_code": code,
            "orientation": {"side": "U", "chi": chi},
        }
    # non-Moser row sites
    canon_row = min(sig, reflect_row(sig))
    if sig == reflect_row(sig):
        chi = "symmetric"
    elif sig == canon_row:
        chi = "direct"
    else:
        chi = "reflected"
    kind = "surplusCapRow" if site == "Sint" else "oppCapRow"
    return {
        "profile_card": F["profile_card"],
        "code_kind": kind,
        "class_code": json.dumps(list(canon_row)),
        "orientation": {"side": OWN_CAP[site], "chi": chi},
    }


def unmap(code: dict) -> dict:
    kind = code["code_kind"]
    chi = code["orientation"]["chi"]
    side = code["orientation"]["side"]
    if kind == "apexClass":
        canon = mc.class_from_key(code["class_code"])
        layer, participants, moser_tuple, count_rows = canon
        assert layer == "EP1" and participants == (0,)
        mv = 1 if (moser_tuple[1] & 1) else 0
        mw = 1 if (moser_tuple[2] & 1) else 0
        k = {"S": 0, "O1": 0, "O2": 0}
        for cap, mask, count in count_rows:
            assert mask == 1
            k[cap] += count
        sig = (mv, mw, k["S"], k["O1"], k["O2"])
        if chi == "reflected":
            sig = reflect_apex(sig)
        return {"profile_card": code["profile_card"], "site": "U", "sig": sig}
    canon_row = tuple(json.loads(code["class_code"]))
    sig = canon_row if chi in ("direct", "symmetric") else reflect_row(canon_row)
    site = "Sint" if kind == "surplusCapRow" else SITE_OF_LABEL_CAP[side]
    return {"profile_card": code["profile_card"], "site": site, "sig": sig}


# ---------------------------------------------------------------------------
# Census LOCAL cut vocabulary (the hard encoding gate) and structural bounds


def local_checks(F: dict) -> dict:
    """Census LOCAL constraints on the single mapped class.

    For non-Moser centers: C1 (implicit in features), m <= 2 (PROVEN cut),
    canonical row not in PROVEN kills; PLUS-tier kill membership reported.
    For the Moser apex U: C1 + full H1 (<= 1 class member in each of
    O1-{u}, O2-{u}, i.e. mw+kO1 <= 1 and mv+kO2 <= 1).
    """
    site, sig = F["site"], tuple(F["sig"])
    out = {}
    if site == "U":
        mv, mw, kS, kO1, kO2 = sig
        out["h1_ok"] = (mw + kO1 <= 1) and (mv + kO2 <= 1)
        out["killed_proven"] = False  # census row kills apply to non-Moser only
        out["killed_plus"] = False
        out["local_ok"] = out["h1_ok"]
    else:
        m = sig[0]
        canon_row = min(sig, reflect_row(sig))
        out["m_le_2"] = m <= 2
        out["killed_proven"] = canon_row in mc.PROVEN_ROWS
        out["killed_plus"] = canon_row in mc.PLUS_ROWS
        out["local_ok"] = out["m_le_2"] and not out["killed_proven"]
    return out


def structural_domain(profile_card: int, site: str):
    """All ordered signatures satisfying frame cardinality bounds (no cuts)."""
    cS, cO1, cO2 = PROFILES[profile_card]
    nS, nO1, nO2 = cS - 2, cO1 - 2, cO2 - 2  # interior sizes
    out = []
    if site == "U":
        for mv, mw in product((0, 1), repeat=2):
            for kS in range(nS + 1):
                for kO1 in range(nO1 + 1):
                    kO2 = 4 - mv - mw - kS - kO1
                    if 0 <= kO2 <= nO2:
                        out.append((mv, mw, kS, kO1, kO2))
        return out
    own = OWN_CAP[site]
    sizes = {"S": nS, "O1": nO1, "O2": nO2}
    left, right = LEFT_RIGHT[own]
    for m in range(0, 4):
        for s in range(0, sizes[own]):  # center excluded from own interior
            for l in range(0, sizes[left] + 1):
                r = 4 - m - s - l
                if 0 <= r <= sizes[right]:
                    out.append((m, s, l, r))
    return out


def pin_ok(site: str, sig) -> bool:
    """ErasedPinTriple requires the erased point x in intS and x in class."""
    if site == "U":
        return sig[2] >= 1  # kS >= 1
    if site == "Sint":
        return sig[1] >= 1  # s >= 1
    if site == "O1int":
        return sig[3] >= 1  # right bucket of O1 = S
    if site == "O2int":
        return sig[2] >= 1  # left bucket of O2 = S
    raise ValueError(site)


# ---------------------------------------------------------------------------
# Engine check: the census's own GLOBAL DFS at the mapped profile


def engine_alive(F: dict, tier: str = "proven", max_nodes: int = 4_000_000) -> dict:
    profile = PROFILES[F["profile_card"]]
    killed = mc.killed_rows_for(tier)
    fixed = {F["_center"]: frozenset(F["_class"])}
    got = mc.solve_global(profile, killed, fixed=fixed, max_nodes=max_nodes)
    return got


def engine_alive_sig(F: dict, tier: str = "proven", max_nodes: int = 4_000_000) -> dict:
    """Engine check from a bare signature (no witness class set): materialize
    a concrete class realizing the signature in the census frame."""
    profile = PROFILES[F["profile_card"]]
    caps_int, cap_of_int = frame_data(profile[0] + profile[1] + profile[2] - 3)
    site, sig = F["site"], tuple(F["sig"])
    ints = {cap: sorted(caps_int[cap]) for cap in ("S", "O1", "O2")}
    if site == "U":
        mv, mw, kS, kO1, kO2 = sig
        cls = set()
        if mv:
            cls.add(1)
        if mw:
            cls.add(2)
        cls |= set(ints["S"][:kS]) | set(ints["O1"][:kO1]) | set(ints["O2"][:kO2])
        center = 0
    else:
        own = OWN_CAP[site]
        left, right = LEFT_RIGHT[own]
        m, s, l, r = sig
        center = ints[own][0]
        cls = set([0, 1, 2][:m])
        pool_own = [x for x in ints[own] if x != center]
        cls |= set(pool_own[:s])
        cls |= set(ints[left][:l])
        cls |= set(ints[right][:r])
    if len(cls) != 4:
        return {"status": "MALFORMED", "nodes": 0}
    killed = mc.killed_rows_for(tier)
    return mc.solve_global(profile, killed, fixed={center: frozenset(cls)}, max_nodes=max_nodes)
