#!/usr/bin/env python3
"""Parametric multi-center joint token census.

This is the implementation scaffold for
docs/multi-center-joint-census-spec-2026-07-07.md.  It keeps the local
class layer abstract (finite support-incidence types) and materializes
concrete representatives only when a GLOBAL DFS witness check needs one.
"""
from __future__ import annotations

import argparse
import json
import os
import sys
import time
from concurrent.futures import ProcessPoolExecutor, as_completed
from dataclasses import dataclass
from functools import lru_cache
from itertools import combinations, permutations, product
from typing import Iterable, Mapping

HERE = os.path.dirname(os.path.abspath(__file__))
ROOT = os.path.normpath(os.path.join(HERE, "..", ".."))
Q2 = os.path.join(ROOT, "census", "candidate_d_probe")
Q3 = os.path.join(ROOT, "census", "q3_two_center")
sys.path.insert(0, Q2)
sys.path.insert(0, Q3)

import q2_token as qt  # noqa: E402
import q3_token as q3  # noqa: E402


MOSER = (0, 1, 2)
MOSER_SET = frozenset(MOSER)
CAPS = ("S", "O1", "O2")
CAP_VERTS = {
    "S": frozenset((1, 2)),
    "O1": frozenset((0, 2)),
    "O2": frozenset((0, 1)),
}
VERT_CAPS = {
    0: ("O1", "O2"),
    1: ("S", "O2"),
    2: ("S", "O1"),
}
LEFT_RIGHT = {
    "S": ("O1", "O2"),
    "O1": ("O2", "S"),
    "O2": ("S", "O1"),
}
PROVEN_ROWS = {(2, 1, 0, 1), (2, 2, 0, 0)}
PLUS_ROWS = PROVEN_ROWS | {(0, 3, 0, 1), (0, 4, 0, 0), (1, 3, 0, 0)}
_CANDIDATE_CACHE: dict[
    tuple[tuple[int, int, int], tuple[tuple[int, int, int, int], ...]],
    tuple[Frame, dict[int, list[frozenset[int]]] | None],
] = {}


@dataclass(frozen=True)
class Frame:
    profile: tuple[int, int, int]
    n: int
    S: frozenset[int]
    O1: frozenset[int]
    O2: frozenset[int]
    ints: Mapping[str, tuple[int, ...]]
    caps_int: Mapping[str, frozenset[int]]
    cap_of_int: Mapping[int, str]
    sizes: Mapping[str, int]


def build_frame(profile: tuple[int, int, int]) -> Frame:
    cS, cO1, cO2 = profile
    n, S, O1, O2, intS, intO1, intO2 = qt.build_labels(cS, cO1, cO2)
    ints = {"S": tuple(intS), "O1": tuple(intO1), "O2": tuple(intO2)}
    caps_int = {cap: frozenset(vals) for cap, vals in ints.items()}
    cap_of_int = {p: cap for cap, vals in ints.items() for p in vals}
    sizes = {"S": cS, "O1": cO1, "O2": cO2}
    return Frame(
        profile=profile,
        n=n,
        S=frozenset(S),
        O1=frozenset(O1),
        O2=frozenset(O2),
        ints=ints,
        caps_int=caps_int,
        cap_of_int=cap_of_int,
        sizes=sizes,
    )


def bit(v: int) -> int:
    return 1 << v


def popcount(x: int) -> int:
    return x.bit_count()


def cap_image(perm: tuple[int, int, int], cap: str) -> str:
    image = frozenset(perm[v] for v in CAP_VERTS[cap])
    for name, verts in CAP_VERTS.items():
        if verts == image:
            return name
    raise ValueError(f"bad cap image for {cap}: {image}")


def permute_mask(mask: int, perm: tuple[int, int, int]) -> int:
    out = 0
    for v in MOSER:
        if mask & bit(v):
            out |= bit(perm[v])
    return out


@lru_cache(maxsize=None)
def allowed_profile_perms(profile: tuple[int, int, int]) -> tuple[tuple[int, int, int], ...]:
    sizes = dict(zip(CAPS, profile))
    out = []
    for p in permutations(MOSER):
        if all(sizes[cap] == sizes[cap_image(p, cap)] for cap in CAPS):
            out.append(p)
    return tuple(out)


def normalize_counts(
    cap_counts: Mapping[str, Mapping[int, int]],
) -> tuple[tuple[str, int, int], ...]:
    rows: list[tuple[str, int, int]] = []
    for cap in CAPS:
        for mask in range(1, 8):
            count = cap_counts.get(cap, {}).get(mask, 0)
            if count:
                rows.append((cap, mask, count))
    return tuple(rows)


def canon_joint(
    profile: tuple[int, int, int],
    participants: Iterable[int],
    moser_masks: Mapping[int, int],
    cap_counts: Mapping[str, Mapping[int, int]],
    layer: str,
) -> tuple:
    """Canonical support-incidence class under size-preserving profile symmetries."""
    participants = tuple(sorted(participants))
    best = None
    for perm in allowed_profile_perms(profile):
        new_participants = tuple(sorted(perm[p] for p in participants))
        new_moser = [0, 0, 0]
        for z in MOSER:
            new_moser[perm[z]] = permute_mask(moser_masks.get(z, 0), perm)
        new_counts: dict[str, dict[int, int]] = {cap: {} for cap in CAPS}
        for cap, counts in cap_counts.items():
            new_cap = cap_image(perm, cap)
            for mask, count in counts.items():
                if not count:
                    continue
                new_mask = permute_mask(mask, perm)
                new_counts[new_cap][new_mask] = (
                    new_counts[new_cap].get(new_mask, 0) + count
                )
        enc = (layer, new_participants, tuple(new_moser), normalize_counts(new_counts))
        if best is None or enc < best:
            best = enc
    assert best is not None
    return best


def class_key(canon: tuple) -> str:
    return json.dumps(canon, separators=(",", ":"))


def class_from_key(key: str) -> tuple:
    def tuples(x):
        if isinstance(x, list):
            return tuple(tuples(y) for y in x)
        return x

    return tuples(json.loads(key))


def h1_moser_ok(frame: Frame, p: int, kp: frozenset[int]) -> bool:
    if p == 0:
        return len(kp & (frame.O1 - {0})) <= 1 and len(kp & (frame.O2 - {0})) <= 1
    if p == 1:
        return len(kp & (frame.S - {1})) <= 1 and len(kp & (frame.O2 - {1})) <= 1
    if p == 2:
        return len(kp & (frame.S - {2})) <= 1 and len(kp & (frame.O1 - {2})) <= 1
    return True


def point_mask(kp: frozenset[int]) -> int:
    out = 0
    for p in kp:
        out |= 1 << p
    return out


def candidate_pairs(kp: frozenset[int]) -> tuple[tuple[int, int], ...]:
    return tuple(combinations(sorted(kp), 2))


def type_of_fast(frame: Frame, c: int, kc: frozenset[int]) -> tuple[int, int, int, int]:
    m = len(kc & MOSER_SET)
    own = frame.cap_of_int[c]
    left, right = LEFT_RIGHT[own]
    s = len(kc & frame.caps_int[own])
    l = len(kc & frame.caps_int[left])
    r = len(kc & frame.caps_int[right])
    return min((m, s, l, r), (m, s, r, l))


def joint_kills_ok(
    participants: tuple[int, ...],
    cap_counts: Mapping[str, Mapping[int, int]],
) -> bool:
    for a, b in combinations(participants, 2):
        x, y, z = q3.PAIR_CAP[frozenset((a, b))]
        ab = bit(a) | bit(b)
        shared_x = sum(
            count for mask, count in cap_counts.get(x, {}).items()
            if (mask & ab) == ab
        )
        if shared_x:
            return False
        shared_y = sum(
            count for mask, count in cap_counts.get(y, {}).items()
            if (mask & ab) == ab
        )
        shared_z = sum(
            count for mask, count in cap_counts.get(z, {}).items()
            if (mask & ab) == ab
        )
        if shared_y and shared_z:
            return False
    return True


def local_structures(
    profile: tuple[int, int, int],
    participants: tuple[int, ...],
    *,
    kills: bool = True,
    layer: str = "L2",
) -> dict[tuple, dict]:
    """Enumerate LOCAL support-incidence classes for the participating centers."""
    participants = tuple(sorted(participants))
    participant_mask = sum(bit(p) for p in participants)
    cap_avail = {cap: size - 2 for cap, size in zip(CAPS, profile)}
    allowed_masks = [m for m in range(1, 8) if m & ~participant_mask == 0]
    participant_pairs = tuple(combinations(participants, 2))
    pair_masks = {(a, b): bit(a) | bit(b) for a, b in participant_pairs}
    mask_points = {
        mask: tuple(c for c in participants if mask & bit(c)) for mask in allowed_masks
    }
    mask_pairs = {
        mask: tuple(
            pair
            for pair in participant_pairs
            if (mask & pair_masks[pair]) == pair_masks[pair]
        )
        for mask in allowed_masks
    }
    mask_h1_points = {
        (cap, mask): tuple(c for c in mask_points[mask] if cap in VERT_CAPS[c])
        for cap in CAPS
        for mask in allowed_masks
    }

    moser_choices = []
    for z in MOSER:
        choices = []
        for mask in range(0, 8):
            if mask & ~participant_mask:
                continue
            if z in participants and (mask & bit(z)):
                continue
            choices.append(mask)
        moser_choices.append(choices)

    variables = tuple((cap, mask) for cap in CAPS for mask in allowed_masks)
    out: dict[tuple, dict] = {}

    for masks_tuple in product(*moser_choices):
        moser_masks = dict(zip(MOSER, masks_tuple))
        need = {
            c: 4 - sum(1 for z in MOSER if moser_masks[z] & bit(c))
            for c in participants
        }
        if any(v < 0 for v in need.values()):
            continue

        h1_used: dict[tuple[int, str], int] = {}
        h1_bad = False
        for c in participants:
            for cap in VERT_CAPS[c]:
                used = sum(
                    1
                    for z in CAP_VERTS[cap]
                    if z != c and (moser_masks[z] & bit(c))
                )
                if used > 1:
                    h1_bad = True
                    break
                h1_used[(c, cap)] = used
            if h1_bad:
                break
        if h1_bad:
            continue

        shared = {}
        shared_bad = False
        for a, b in participant_pairs:
            ab = pair_masks[(a, b)]
            count = sum(1 for z in MOSER if (moser_masks[z] & ab) == ab)
            if count > 2:
                shared_bad = True
                break
            shared[(a, b)] = count
        if shared_bad:
            continue

        cap_counts: dict[str, dict[int, int]] = {cap: {} for cap in CAPS}
        cap_used = {cap: 0 for cap in CAPS}
        mask111_count = 0

        def rec(i: int, mask111: int) -> None:
            if i == len(variables):
                if any(need[c] != 0 for c in participants):
                    return
                if kills and not joint_kills_ok(participants, cap_counts):
                    return
                canon = canon_joint(profile, participants, moser_masks, cap_counts, layer)
                key = canon
                out.setdefault(
                    key,
                    {
                        "class": canon,
                        "participants": participants,
                        "moser_masks": tuple(moser_masks[z] for z in MOSER),
                        "cap_counts": normalize_counts(cap_counts),
                    },
                )
                return

            cap, mask = variables[i]
            max_count = cap_avail[cap] - cap_used[cap]
            for c in mask_points[mask]:
                max_count = min(max_count, need[c])
            for c in mask_h1_points[(cap, mask)]:
                max_count = min(max_count, 1 - h1_used[(c, cap)])
            for a, b in mask_pairs[mask]:
                max_count = min(max_count, 2 - shared[(a, b)])
            if mask == 7:
                max_count = min(max_count, 1 - mask111)
            if max_count < 0:
                return

            for count in range(max_count + 1):
                if count:
                    cap_counts[cap][mask] = count
                    cap_used[cap] += count
                    for c in mask_points[mask]:
                        need[c] -= count
                    for c in mask_h1_points[(cap, mask)]:
                        h1_used[(c, cap)] += count
                    for a, b in mask_pairs[mask]:
                        shared[(a, b)] += count
                rec(i + 1, mask111 + (count if mask == 7 else 0))
                if count:
                    for a, b in mask_pairs[mask]:
                        shared[(a, b)] -= count
                    for c in mask_h1_points[(cap, mask)]:
                        h1_used[(c, cap)] -= count
                    for c in mask_points[mask]:
                        need[c] += count
                    cap_used[cap] -= count
                    del cap_counts[cap][mask]

        rec(0, mask111_count)

    return out


def l1_local(profile: tuple[int, int, int], *, kills: bool = True) -> dict[tuple, dict]:
    out: dict[tuple, dict] = {}
    for pair in combinations(MOSER, 2):
        out.update(local_structures(profile, pair, kills=kills, layer="L1"))
    return out


def l2_local(profile: tuple[int, int, int], *, kills: bool = True) -> dict[tuple, dict]:
    return local_structures(profile, MOSER, kills=kills, layer="L2")


def materialize_representative(
    frame: Frame,
    participants: tuple[int, ...],
    moser_masks: tuple[int, int, int],
    cap_counts: tuple[tuple[str, int, int], ...],
) -> dict[int, frozenset[int]]:
    next_idx = {cap: 0 for cap in CAPS}
    assign = {c: set() for c in participants}
    for z, mask in enumerate(moser_masks):
        for c in participants:
            if mask & bit(c):
                assign[c].add(z)
    for cap, mask, count in cap_counts:
        labels = frame.ints[cap]
        start = next_idx[cap]
        chosen = labels[start:start + count]
        if len(chosen) != count:
            raise ValueError((frame.profile, cap, mask, count, len(labels)))
        next_idx[cap] += count
        for label in chosen:
            for c in participants:
                if mask & bit(c):
                    assign[c].add(label)
    frozen = {c: frozenset(vals) for c, vals in assign.items()}
    for c, vals in frozen.items():
        if len(vals) != 4 or c in vals or not h1_moser_ok(frame, c, vals):
            raise ValueError((frame.profile, participants, c, sorted(vals)))
    return frozen


def candidate_lists(
    frame: Frame,
    killed_rows: set[tuple[int, int, int, int]],
    fixed: Mapping[int, frozenset[int]] | None = None,
) -> dict[int, list[frozenset[int]]] | None:
    fixed = fixed or {}
    cands: dict[int, list[frozenset[int]]] = {}
    for p in range(frame.n):
        cl: list[frozenset[int]] = []
        if p in fixed:
            pool = [fixed[p]]
        else:
            pool = (
                frozenset(c)
                for c in combinations([q for q in range(frame.n) if q != p], 4)
            )
        for fc in pool:
            if not candidate_ok(frame, killed_rows, p, fc):
                continue
            cl.append(fc)
        if not cl:
            return None
        cands[p] = cl
    return cands


def candidate_ok(
    frame: Frame,
    killed_rows: set[tuple[int, int, int, int]],
    p: int,
    fc: frozenset[int],
) -> bool:
    if len(fc) != 4 or p in fc:
        return False
    if not h1_moser_ok(frame, p, fc):
        return False
    if p >= 3 and len(fc & MOSER_SET) > 2:
        return False
    if p >= 3 and type_of_fast(frame, p, fc) in killed_rows:
        return False
    return True


def cached_candidate_lists(
    profile: tuple[int, int, int],
    killed_rows: set[tuple[int, int, int, int]],
) -> tuple[Frame, dict[int, list[frozenset[int]]]] | tuple[Frame, None]:
    key = (profile, tuple(sorted(killed_rows)))
    if key not in _CANDIDATE_CACHE:
        frame = build_frame(profile)
        cands = candidate_lists(frame, killed_rows)
        _CANDIDATE_CACHE[key] = (frame, cands)
    return _CANDIDATE_CACHE[key]


def candidate_lists_with_fixed(
    frame: Frame,
    base_cands: dict[int, list[frozenset[int]]],
    killed_rows: set[tuple[int, int, int, int]],
    fixed: Mapping[int, frozenset[int]] | None,
) -> dict[int, list[frozenset[int]]] | None:
    if not fixed:
        return base_cands
    cands = dict(base_cands)
    for p, fc in fixed.items():
        if not candidate_ok(frame, killed_rows, p, fc):
            return None
        cands[p] = [fc]
    return cands


def solve_global(
    profile: tuple[int, int, int],
    killed_rows: set[tuple[int, int, int, int]],
    *,
    fixed: Mapping[int, frozenset[int]] | None = None,
    max_nodes: int = 4_000_000,
    want_assignment: bool = False,
) -> dict:
    frame, base_cands = cached_candidate_lists(profile, killed_rows)
    if base_cands is None:
        return {"status": "UNSAT", "nodes": 0}
    cands = candidate_lists_with_fixed(frame, base_cands, killed_rows, fixed)
    if cands is None:
        return {"status": "UNSAT", "nodes": 0}

    order = sorted(range(frame.n), key=lambda p: len(cands[p]))
    assign: dict[int, frozenset[int]] = {}
    assign_masks: dict[int, int] = {}
    paircount: dict[tuple[int, int], int] = {}
    meta: dict[frozenset[int], tuple[int, tuple[tuple[int, int], ...]]] = {}
    for cl in cands.values():
        for kp in cl:
            if kp not in meta:
                meta[kp] = (point_mask(kp), candidate_pairs(kp))
    nodes = 0
    hit_cap = False

    def ok_with(p: int, kp: frozenset[int]) -> bool:
        kmask, pairs = meta[kp]
        for q, qmask in assign_masks.items():
            if (kmask & qmask).bit_count() > 2:
                return False
            kq = assign[q]
            if p < 3 and q < 3 and not q3.joint_ok(p, kp, q, kq, frame.caps_int):
                return False
        for e in pairs:
            if paircount.get(e, 0) + 1 > 2:
                return False
        return True

    def dfs(i: int) -> bool:
        nonlocal nodes, hit_cap
        if i == len(order):
            return True
        p = order[i]
        for kp in cands[p]:
            nodes += 1
            if nodes > max_nodes:
                hit_cap = True
                return False
            if not ok_with(p, kp):
                continue
            assign[p] = kp
            assign_masks[p] = meta[kp][0]
            for e in meta[kp][1]:
                paircount[e] = paircount.get(e, 0) + 1
            if dfs(i + 1):
                return True
            del assign[p]
            del assign_masks[p]
            for e in meta[kp][1]:
                paircount[e] -= 1
        return False

    sat = dfs(0)
    if sat:
        out = {"status": "SAT", "nodes": nodes}
        if want_assignment:
            out["assignment"] = {str(p): sorted(v) for p, v in sorted(assign.items())}
        return out
    if hit_cap:
        return {"status": "INDETERMINATE", "nodes": nodes}
    return {"status": "UNSAT", "nodes": nodes}


def killed_rows_for(name: str) -> set[tuple[int, int, int, int]]:
    if name == "proven":
        return set(PROVEN_ROWS)
    if name in {"plus", "conjectured"}:
        return set(PLUS_ROWS)
    raise ValueError(f"unknown tier {name!r}")


def summarize_local(n_min: int, n_max: int, *, kills: bool = True) -> dict:
    out = {"kills": kills, "n": {}}
    for n in range(n_min, n_max + 1):
        rows = {}
        for profile in q3.profiles_for(n):
            l1 = l1_local(profile, kills=kills)
            l2 = l2_local(profile, kills=kills)
            rows[str(profile)] = {"L1_LOCAL": len(l1), "L2_LOCAL": len(l2)}
        out["n"][str(n)] = rows
    return out


def parse_profile(text: str) -> tuple[int, int, int]:
    vals = tuple(int(x.strip()) for x in text.strip("()").split(",") if x.strip())
    if len(vals) != 3:
        raise argparse.ArgumentTypeError("profile must have three comma-separated ints")
    return vals


def global_profile(
    profile: tuple[int, int, int],
    *,
    tier: str = "proven",
    layer: str = "L2",
    limit: int | None = None,
    max_nodes: int = 4_000_000,
    include_classes: bool = True,
    include_fixed: bool = True,
) -> dict:
    killed_rows = killed_rows_for(tier)
    frame, base_cands = cached_candidate_lists(profile, killed_rows)
    if base_cands is None:
        return {
            "profile": profile,
            "tier": tier,
            "layer": layer,
            "base_status": "UNSAT",
            "classes": [],
            "summary": {"SAT": 0, "UNSAT": 0, "INDETERMINATE": 0},
        }
    locals_by_key = l2_local(profile, kills=True) if layer == "L2" else l1_local(profile, kills=True)
    rows = []
    counts = {"SAT": 0, "UNSAT": 0, "INDETERMINATE": 0}
    total_nodes = 0
    tested = 0
    start = time.perf_counter()
    for i, (key, rec) in enumerate(sorted(locals_by_key.items(), key=lambda kv: kv[0])):
        if limit is not None and i >= limit:
            break
        tested += 1
        fixed = materialize_representative(
            frame,
            tuple(rec["participants"]),
            tuple(rec["moser_masks"]),
            tuple(rec["cap_counts"]),
        )
        got = solve_global(profile, killed_rows, fixed=fixed, max_nodes=max_nodes)
        counts[got["status"]] += 1
        total_nodes += got["nodes"]
        if include_classes:
            row = {
                "class_key": class_key(key),
                "status": got["status"],
                "nodes": got["nodes"],
            }
            if include_fixed:
                row["fixed"] = {str(p): sorted(kp) for p, kp in sorted(fixed.items())}
            rows.append(row)
    elapsed = time.perf_counter() - start
    return {
        "profile": profile,
        "tier": tier,
        "layer": layer,
        "limit": limit,
        "local_classes": len(locals_by_key),
        "tested": tested,
        "summary": counts,
        "total_nodes": total_nodes,
        "elapsed_sec": elapsed,
        "nodes_per_sec": total_nodes / elapsed if elapsed else None,
        "classes": rows,
    }


def _global_profile_job(args: tuple) -> tuple[int, dict]:
    (
        index,
        profile,
        tier,
        layer,
        max_nodes,
        include_classes,
        include_fixed,
    ) = args
    return index, global_profile(
        profile,
        tier=tier,
        layer=layer,
        max_nodes=max_nodes,
        include_classes=include_classes,
        include_fixed=include_fixed,
    )


def sweep_global(
    n_min: int,
    n_max: int,
    *,
    tier: str = "proven",
    layer: str = "L2",
    max_nodes: int = 4_000_000,
    out_path: str | None = None,
    include_classes: bool = True,
    include_fixed: bool = False,
    workers: int = 1,
) -> dict:
    if workers < 1:
        raise ValueError("--workers must be at least 1")
    started = time.strftime("%Y-%m-%dT%H:%M:%S%z")
    artifact = {
        "started": started,
        "tier": tier,
        "layer": layer,
        "n_min": n_min,
        "n_max": n_max,
        "max_nodes": max_nodes,
        "workers": workers,
        "n": [],
    }
    cumulative_local: set[str] = set()
    cumulative_global: set[str] = set()

    for n in range(n_min, n_max + 1):
        n_start = time.perf_counter()
        profiles = []
        n_local: set[str] = set()
        n_global: set[str] = set()
        counts = {"SAT": 0, "UNSAT": 0, "INDETERMINATE": 0}
        tested = 0
        total_nodes = 0

        profile_list = list(q3.profiles_for(n))
        jobs = [
            (j, profile, tier, layer, max_nodes, include_classes, include_fixed)
            for j, profile in enumerate(profile_list, start=1)
        ]
        profile_results: list[tuple[int, dict]] = []
        if workers == 1:
            for job in jobs:
                j, profile = job[0], job[1]
                print(
                    f"[{layer} {tier}] n={n} profile {j}/{len(profile_list)} {profile}",
                    file=sys.stderr,
                    flush=True,
                )
                profile_results.append(_global_profile_job(job))
        else:
            with ProcessPoolExecutor(max_workers=workers) as pool:
                futures = {}
                for job in jobs:
                    j, profile = job[0], job[1]
                    print(
                        f"[{layer} {tier}] n={n} submit profile {j}/{len(profile_list)} {profile}",
                        file=sys.stderr,
                        flush=True,
                    )
                    futures[pool.submit(_global_profile_job, job)] = (j, profile)
                for fut in as_completed(futures):
                    j, profile = futures[fut]
                    result = fut.result()
                    got = result[1]
                    print(
                        f"[{layer} {tier}] n={n} done profile {j}/{len(profile_list)} "
                        f"{profile} {got['summary']} nodes={got['total_nodes']}",
                        file=sys.stderr,
                        flush=True,
                    )
                    profile_results.append(result)

        for _, got in sorted(profile_results, key=lambda item: item[0]):
            profiles.append(got)
            tested += got["tested"]
            total_nodes += got["total_nodes"]
            for status, count in got["summary"].items():
                counts[status] += count
            for row in got["classes"]:
                key = row["class_key"]
                n_local.add(key)
                if row["status"] == "SAT":
                    n_global.add(key)

        fresh_local = n_local - cumulative_local
        fresh_global = n_global - cumulative_global
        cumulative_local |= n_local
        cumulative_global |= n_global
        elapsed = time.perf_counter() - n_start
        indet_ratio = counts["INDETERMINATE"] / tested if tested else 0.0
        n_row = {
            "n": n,
            "profiles": profiles,
            "profile_count": len(profile_list),
            "tested": tested,
            "summary": counts,
            "total_nodes": total_nodes,
            "elapsed_sec": elapsed,
            "nodes_per_sec": total_nodes / elapsed if elapsed else None,
            "local_distinct": len(n_local),
            "global_distinct": len(n_global),
            "fresh_local": len(fresh_local),
            "fresh_global": len(fresh_global),
            "cumulative_local": len(cumulative_local),
            "cumulative_global": len(cumulative_global),
            "indeterminate_ratio": indet_ratio,
        }
        artifact["n"].append(n_row)
        if out_path:
            write_json(out_path, artifact)
        print(json.dumps({k: v for k, v in n_row.items() if k != "profiles"}, sort_keys=True))
        if indet_ratio > 0.10:
            artifact["stop_reason"] = "INDETERMINATE_RATIO"
            artifact["stopped_at_n"] = n
            if out_path:
                write_json(out_path, artifact)
            break

    artifact["finished"] = time.strftime("%Y-%m-%dT%H:%M:%S%z")
    if out_path:
        write_json(out_path, artifact)
    return artifact


def write_json(path: str, obj: object) -> None:
    parent = os.path.dirname(path)
    if parent:
        os.makedirs(parent, exist_ok=True)
    with open(path, "w") as f:
        json.dump(obj, f, indent=1, sort_keys=True)
        f.write("\n")


def main() -> int:
    parser = argparse.ArgumentParser()
    sub = parser.add_subparsers(dest="cmd", required=True)
    loc = sub.add_parser("local-summary")
    loc.add_argument("--n-min", type=int, default=12)
    loc.add_argument("--n-max", type=int, default=12)
    loc.add_argument("--no-kills", action="store_true")
    loc.add_argument("--out", default=os.path.join(HERE, "local_summary.json"))
    glob = sub.add_parser("global-profile")
    glob.add_argument("--profile", type=parse_profile, required=True)
    glob.add_argument("--tier", choices=("proven", "plus", "conjectured"), default="proven")
    glob.add_argument("--layer", choices=("L1", "L2"), default="L2")
    glob.add_argument("--limit", type=int)
    glob.add_argument("--max-nodes", type=int, default=4_000_000)
    glob.add_argument("--summary-only", action="store_true")
    glob.add_argument("--include-fixed", action="store_true")
    glob.add_argument("--out", default=os.path.join(HERE, "global_profile.json"))
    sweep = sub.add_parser("sweep-global")
    sweep.add_argument("--n-min", type=int, default=12)
    sweep.add_argument("--n-max", type=int, default=30)
    sweep.add_argument("--tier", choices=("proven", "plus", "conjectured"), default="proven")
    sweep.add_argument("--layer", choices=("L1", "L2"), default="L2")
    sweep.add_argument("--max-nodes", type=int, default=4_000_000)
    sweep.add_argument("--summary-only", action="store_true")
    sweep.add_argument("--include-fixed", action="store_true")
    sweep.add_argument("--workers", type=int, default=1)
    sweep.add_argument("--out", default=os.path.join(HERE, "sweeps", "global_sweep.json"))
    args = parser.parse_args()

    if args.cmd == "local-summary":
        out = summarize_local(args.n_min, args.n_max, kills=not args.no_kills)
        write_json(args.out, out)
        print(json.dumps(out, indent=1, sort_keys=True))
        return 0
    if args.cmd == "global-profile":
        out = global_profile(
            args.profile,
            tier=args.tier,
            layer=args.layer,
            limit=args.limit,
            max_nodes=args.max_nodes,
            include_classes=not args.summary_only,
            include_fixed=args.include_fixed,
        )
        write_json(args.out, out)
        print(json.dumps(out, indent=1, sort_keys=True))
        return 0
    if args.cmd == "sweep-global":
        out = sweep_global(
            args.n_min,
            args.n_max,
            tier=args.tier,
            layer=args.layer,
            max_nodes=args.max_nodes,
            out_path=args.out,
            include_classes=not args.summary_only,
            include_fixed=args.include_fixed,
            workers=args.workers,
        )
        print(json.dumps({k: v for k, v in out.items() if k != "n"}, indent=1, sort_keys=True))
        return 0
    raise AssertionError(args.cmd)


if __name__ == "__main__":
    raise SystemExit(main())
