#!/usr/bin/env python3
"""Independent replay validator for the named-placement census.

Unlike the producer, this validator enumerates ordered role tuples first and
checks the dangerous support afterward.  It independently reconstructs the
cyclic automorphisms and orbit partition before comparing the saved artifacts.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import sys
from collections import Counter
from itertools import permutations
from pathlib import Path
from typing import Any, Mapping, Sequence


HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[2]
QUERY_DIR = HERE.parent / "second_center_query"
for path in (str(ROOT), str(QUERY_DIR)):
    if path not in sys.path:
        sys.path.insert(0, path)

from census.global_confinement import shadow  # noqa: E402
from census.multi_center import multi_center_census as mc  # noqa: E402
import query as source_query  # noqa: E402


PROFILES = ((4, 5, 6), (5, 5, 5))
CAPS = ("S", "O1", "O2")
ROLES = ("p", "q", "t1", "t2", "t3", "u")
CHECKPOINT = HERE / "checkpoint.json"
REPRESENTATIVES = HERE / "representatives.json"
MANIFEST = HERE / "manifest.json"
VALIDATION = HERE / "validation.json"

SOURCE_PATHS = {
    "second_center_query_py_sha256": QUERY_DIR / "query.py",
    "second_center_validator_py_sha256": QUERY_DIR / "validator.py",
    "second_center_manifest_sha256": QUERY_DIR / "manifest.json",
    "second_center_checkpoint_sha256": QUERY_DIR / "checkpoint.json",
    "multi_center_census_py_sha256": ROOT / "census/multi_center/multi_center_census.py",
    "global_shadow_py_sha256": ROOT / "census/global_confinement/shadow.py",
}


def file_sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def canonical_sha256(value: object) -> str:
    data = json.dumps(value, sort_keys=True, separators=(",", ":")).encode()
    return hashlib.sha256(data).hexdigest()


def cap_sets(frame: mc.Frame) -> dict[str, frozenset[int]]:
    return {"S": frame.S, "O1": frame.O1, "O2": frame.O2}


def independent_automorphisms(frame: mc.Frame) -> tuple[dict[str, Any], ...]:
    order = tuple(shadow.hull_order(frame))
    caps = cap_sets(frame)
    result = []
    for moser_perm in mc.allowed_profile_perms(frame.profile):
        matches = []
        for orientation in (1, -1):
            for shift in range(frame.n):
                image = [0] * frame.n
                for index, source in enumerate(order):
                    image[source] = order[(orientation * index + shift) % frame.n]
                image_tuple = tuple(image)
                if tuple(image_tuple[x] for x in mc.MOSER) != moser_perm:
                    continue
                cap_mapping = tuple(mc.cap_image(moser_perm, cap) for cap in CAPS)
                if any(
                    frozenset(image_tuple[x] for x in caps[cap])
                    != caps[cap_mapping[CAPS.index(cap)]]
                    for cap in CAPS
                ):
                    continue
                if any(
                    frozenset(image_tuple[x] for x in frame.caps_int[cap])
                    != frame.caps_int[cap_mapping[CAPS.index(cap)]]
                    for cap in CAPS
                ):
                    continue
                matches.append((orientation, shift, image_tuple, cap_mapping))
        assert len(matches) == 1, (frame.profile, moser_perm, matches)
        orientation, shift, image, cap_mapping = matches[0]
        result.append({
            "name": ("rotation" if orientation == 1 else "reflection") + f"_{shift}",
            "orientation": orientation,
            "shift": shift,
            "image": image,
            "cap_mapping": cap_mapping,
        })
    return tuple(sorted(result, key=lambda auto: auto["image"]))


def decode(code: int) -> tuple[str, str, tuple[int, ...]]:
    labels = []
    for _ in ROLES:
        labels.append(code % 12)
        code //= 12
    second = CAPS[code % 3]
    code //= 3
    surplus = CAPS[code]
    return surplus, second, tuple(reversed(labels))


def encode(surplus: str, second: str, labels: Sequence[int]) -> int:
    code = CAPS.index(surplus) * 3 + CAPS.index(second)
    for label in labels:
        code = code * 12 + label
    return code


def apply_auto(
    auto: Mapping[str, Any], surplus: str, second: str, labels: Sequence[int]
) -> tuple[str, str, tuple[int, ...]]:
    image = auto["image"]
    cap_mapping = auto["cap_mapping"]
    return (
        cap_mapping[CAPS.index(surplus)],
        cap_mapping[CAPS.index(second)],
        tuple(image[label] for label in labels),
    )


def source_domains(
    frame: mc.Frame, candidates: Mapping[int, Sequence[frozenset[int]]]
) -> dict[int, bool]:
    return {
        source: any(
            center != source and source in support
            for center in range(frame.n)
            for support in candidates[center]
        )
        for source in range(frame.n)
    }


def admitted(
    frame: mc.Frame,
    candidates: Mapping[int, Sequence[frozenset[int]]],
    domains: Mapping[int, bool],
    surplus: str,
    second: str,
    labels: Sequence[int],
) -> bool:
    caps = cap_sets(frame)
    if surplus == second or len(caps[surplus]) < 5 or len(caps[second]) < 5:
        return False
    if len(labels) != len(ROLES) or len(set(labels)) != len(labels):
        return False
    if any(not 0 <= label < frame.n for label in labels):
        return False
    p, q, t1, t2, t3, u = labels
    dangerous = frozenset((q, t1, t2, t3))
    if q not in frame.caps_int[surplus] or q in mc.MOSER_SET:
        return False
    if dangerous not in candidates[p]:
        return False
    if not mc.candidate_ok(frame, set(mc.PROVEN_ROWS), p, dangerous):
        return False
    if not all(domains[x] for x in (q, t1, t3, u)):
        return False
    p_caps = [caps[cap] for cap in CAPS if p in caps[cap]]
    if not p_caps or any(len(dangerous - cap) < 2 for cap in p_caps):
        return False
    if all(len(caps[cap]) == 4 for cap in CAPS if cap != surplus):
        return False
    return True


def validate_profile(
    profile: tuple[int, int, int],
    saved_case: Mapping[str, Any],
    saved_representatives: Sequence[int],
) -> dict[str, Any]:
    frame, candidates = mc.cached_candidate_lists(profile, set(mc.PROVEN_ROWS))
    assert candidates is not None
    domains = source_domains(frame, candidates)
    automorphisms = independent_automorphisms(frame)
    saved_images = {tuple(auto["image"]) for auto in saved_case["automorphisms"]}
    assert saved_images == {auto["image"] for auto in automorphisms}
    assert len(automorphisms) == saved_case["automorphism_count"]

    raw_count = 0
    cap_counts: Counter[str] = Counter()
    p_counts: Counter[int] = Counter()
    fixed_counts: Counter[str] = Counter()
    orbit_population: Counter[int] = Counter()
    caps = cap_sets(frame)
    role_pairs = tuple(
        (surplus, second)
        for surplus in CAPS
        for second in CAPS
        if surplus != second and len(caps[surplus]) >= 5 and len(caps[second]) >= 5
    )
    for surplus, second in role_pairs:
        for p in range(frame.n):
            remaining = tuple(x for x in range(frame.n) if x != p)
            for q in sorted(frame.caps_int[surplus] - {p}):
                tail = tuple(x for x in remaining if x != q)
                for t1, t2, t3 in permutations(tail, 3):
                    dangerous = frozenset((q, t1, t2, t3))
                    if dangerous not in candidates[p]:
                        continue
                    if any(
                        len(dangerous - caps[cap]) < 2
                        for cap in CAPS if p in caps[cap]
                    ):
                        continue
                    used = {p, q, t1, t2, t3}
                    for u in range(frame.n):
                        if u in used:
                            continue
                        labels = (p, q, t1, t2, t3, u)
                        assert admitted(
                            frame, candidates, domains, surplus, second, labels
                        )
                        code = encode(surplus, second, labels)
                        orbit_codes = []
                        for auto in automorphisms:
                            transformed = apply_auto(auto, surplus, second, labels)
                            assert admitted(
                                frame, candidates, domains, *transformed
                            )
                            transformed_code = encode(*transformed)
                            orbit_codes.append(transformed_code)
                            if transformed_code == code:
                                fixed_counts[auto["name"]] += 1
                        orbit_population[min(orbit_codes)] += 1
                        raw_count += 1
                        cap_counts[f"{surplus}->{second}"] += 1
                        p_counts[p] += 1

    rebuilt_representatives = sorted(orbit_population)
    assert list(saved_representatives) == rebuilt_representatives
    assert raw_count == saved_case["raw_placement_count"]
    assert len(rebuilt_representatives) == saved_case["orbit_count"]
    assert canonical_sha256(rebuilt_representatives) == saved_case["representative_codes_sha256"]
    assert dict(sorted(cap_counts.items())) == saved_case["raw_counts_by_cap_roles"]
    assert {str(x): p_counts[x] for x in range(frame.n)} == saved_case["raw_counts_by_p"]
    expected_fixed = {
        auto["name"]: fixed_counts[auto["name"]] for auto in automorphisms
    }
    assert expected_fixed == saved_case["fixed_placement_counts"]
    histogram = Counter(orbit_population.values())
    assert {str(k): v for k, v in sorted(histogram.items())} == saved_case["orbit_size_histogram"]
    assert sum(expected_fixed.values()) // len(automorphisms) == len(rebuilt_representatives)

    rep_set = set(rebuilt_representatives)
    seed = next(
        seed for seed in source_query.CASE_SEEDS
        if tuple(seed["profile"]) == profile
    )
    seed_labels = tuple(int(seed["labels"][role]) for role in ROLES)
    assert admitted(
        frame,
        candidates,
        domains,
        str(seed["surplus_cap"]),
        str(seed["second_large_cap"]),
        seed_labels,
    )
    seed_orbit_rep = min(
        encode(*apply_auto(
            auto,
            str(seed["surplus_cap"]),
            str(seed["second_large_cap"]),
            seed_labels,
        ))
        for auto in automorphisms
    )
    assert seed_orbit_rep in rep_set
    return {
        "profile": list(profile),
        "raw_placement_count": raw_count,
        "orbit_count": len(rebuilt_representatives),
        "automorphism_count": len(automorphisms),
        "saved_seed_orbit_representative": seed_orbit_rep,
        "status": "INDEPENDENTLY_REENUMERATED",
    }


def validate() -> dict[str, Any]:
    checkpoint = json.loads(CHECKPOINT.read_text(encoding="utf-8"))
    representatives = json.loads(REPRESENTATIVES.read_text(encoding="utf-8"))
    manifest = json.loads(MANIFEST.read_text(encoding="utf-8"))
    assert checkpoint["scope"]["target_faithful"] is False
    assert checkpoint["scope"]["row_system_existence_checked"] is False
    assert manifest["omitted_fail_closed"]
    observed_sources = {name: file_sha256(path) for name, path in SOURCE_PATHS.items()}
    assert checkpoint["source"] == observed_sources == manifest["source"]
    assert file_sha256(REPRESENTATIVES) == checkpoint["representatives"]["file_sha256"]
    assert representatives["encoding"]["label_order"] == list(ROLES)
    case_by_profile = {tuple(case["profile"]): case for case in checkpoint["cases"]}
    reps_by_profile = {
        tuple(case["profile"]): case["representative_codes"]
        for case in representatives["cases"]
    }
    reports = [
        validate_profile(profile, case_by_profile[profile], reps_by_profile[profile])
        for profile in PROFILES
    ]
    assert sum(report["raw_placement_count"] for report in reports) == checkpoint["totals"]["raw_placement_count"]
    assert sum(report["orbit_count"] for report in reports) == checkpoint["totals"]["orbit_count"]
    return {
        "schema": "p97-atail-second-center-placement-census-validation-v1",
        "status": "INDEPENDENT_EXACT_REENUMERATION_PASSED",
        "reports": reports,
        "target_faithful": False,
        "row_system_existence_checked": False,
    }


if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("--write", action="store_true")
    args = parser.parse_args()
    report = validate()
    if args.write:
        VALIDATION.write_text(
            json.dumps(report, indent=2, sort_keys=True) + "\n",
            encoding="utf-8",
        )
    print(json.dumps(report, indent=2, sort_keys=True))
