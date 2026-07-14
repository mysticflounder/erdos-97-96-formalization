#!/usr/bin/env python3
"""Exhaustive named-placement surface for the card-12 second-center shadow.

This enumerates only the placement-level hypotheses used by
``second_center_query``.  It does not run the row-system DFS and therefore does
not claim that every admitted placement has a SAT incidence witness.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import sys
from collections import Counter
from dataclasses import dataclass
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
LABEL_ROLES = ("p", "q", "t1", "t2", "t3", "u")
SOURCE_CHOICE_ROLES = ("q", "t1", "t3", "u")
MAX_RAW_PLACEMENTS_PER_PROFILE = 1_000_000

REPRESENTATIVES = HERE / "representatives.json"
CHECKPOINT = HERE / "checkpoint.json"
MANIFEST = HERE / "manifest.json"

SOURCE_PATHS = {
    "second_center_query_py_sha256": QUERY_DIR / "query.py",
    "second_center_validator_py_sha256": QUERY_DIR / "validator.py",
    "second_center_manifest_sha256": QUERY_DIR / "manifest.json",
    "second_center_checkpoint_sha256": QUERY_DIR / "checkpoint.json",
    "multi_center_census_py_sha256": ROOT / "census/multi_center/multi_center_census.py",
    "global_shadow_py_sha256": ROOT / "census/global_confinement/shadow.py",
}
EXPECTED_SOURCE_HASHES = {
    "second_center_query_py_sha256":
        "bcf3368bd1c733100d04ebc1118f344396f6c7ab6a85ac497a8164d778dc2b5d",
    "second_center_validator_py_sha256":
        "789c886835d01b500eeadc7bf2e32fda7a47ef2cb93e8125a9d9e8e9f98290f0",
    "second_center_manifest_sha256":
        "ad02273cdba024d5e45c8c30d751ef932d16efdca05de114199a2a9ef58c78d9",
    "second_center_checkpoint_sha256":
        "f8608bc9b70576254cf1def8cd510f1e021c06ee0127c1b6ae767c3d620b4809",
    "multi_center_census_py_sha256":
        "3c0b9cc574cbc2e2ae66cb6eae8710d51b578cf9732acda867d220d1ed0ab679",
    "global_shadow_py_sha256":
        "a9ab1452444cd4e79d7a4ea6fc291a1522394cad3a841c4bb439fcf67da82e62",
}


def file_sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def canonical_sha256(value: object) -> str:
    payload = json.dumps(value, sort_keys=True, separators=(",", ":")).encode()
    return hashlib.sha256(payload).hexdigest()


def compact_json(value: object) -> bytes:
    return (json.dumps(value, sort_keys=True, separators=(",", ":")) + "\n").encode()


def source_hashes() -> dict[str, str]:
    return {name: file_sha256(path) for name, path in SOURCE_PATHS.items()}


def validate_source_hashes() -> dict[str, str]:
    observed = source_hashes()
    if observed != EXPECTED_SOURCE_HASHES:
        raise RuntimeError(
            "source placement predicates drifted:\n"
            + json.dumps(
                {"expected": EXPECTED_SOURCE_HASHES, "observed": observed},
                indent=2,
                sort_keys=True,
            )
        )
    return observed


@dataclass(frozen=True)
class Placement:
    surplus_cap: str
    second_large_cap: str
    labels: tuple[int, int, int, int, int, int]

    def label_map(self) -> dict[str, int]:
        return dict(zip(LABEL_ROLES, self.labels))


@dataclass(frozen=True)
class CyclicAutomorphism:
    name: str
    orientation: int
    shift: int
    image: tuple[int, ...]
    induced_moser_permutation: tuple[int, int, int]
    cap_mapping: tuple[str, str, str]

    def map_cap(self, cap: str) -> str:
        return self.cap_mapping[CAPS.index(cap)]

    def apply(self, placement: Placement) -> Placement:
        return Placement(
            self.map_cap(placement.surplus_cap),
            self.map_cap(placement.second_large_cap),
            tuple(self.image[label] for label in placement.labels),
        )

    def as_dict(self) -> dict[str, Any]:
        return {
            "name": self.name,
            "orientation": self.orientation,
            "shift": self.shift,
            "image": list(self.image),
            "mapping_sha256": canonical_sha256(list(self.image)),
            "induced_moser_permutation": list(self.induced_moser_permutation),
            "cap_mapping": {
                cap: self.map_cap(cap) for cap in CAPS
            },
        }


def cap_sets(frame: mc.Frame) -> dict[str, frozenset[int]]:
    return {"S": frame.S, "O1": frame.O1, "O2": frame.O2}


def role_pairs(frame: mc.Frame) -> tuple[tuple[str, str], ...]:
    caps = cap_sets(frame)
    return tuple(
        (surplus, second)
        for surplus in CAPS
        for second in CAPS
        if surplus != second
        and len(caps[surplus]) >= 5
        and len(caps[second]) >= 5
    )


def source_domains(
    frame: mc.Frame,
    candidates: Mapping[int, Sequence[frozenset[int]]],
) -> dict[int, bool]:
    return {
        source: bool(
            source_query.row_choice_candidates(frame, candidates, source=source)
        )
        for source in range(frame.n)
    }


def admitted(
    frame: mc.Frame,
    candidates: Mapping[int, Sequence[frozenset[int]]],
    domains: Mapping[int, bool],
    placement: Placement,
) -> bool:
    if (placement.surplus_cap, placement.second_large_cap) not in role_pairs(frame):
        return False
    labels = placement.label_map()
    if len(set(placement.labels)) != len(LABEL_ROLES):
        return False
    if any(not 0 <= label < frame.n for label in placement.labels):
        return False
    p = labels["p"]
    q = labels["q"]
    dangerous = frozenset(labels[role] for role in ("q", "t1", "t2", "t3"))
    if p in dangerous:
        return False
    if q not in frame.caps_int[placement.surplus_cap] or q in mc.MOSER_SET:
        return False
    if not mc.candidate_ok(frame, set(mc.PROVEN_ROWS), p, dangerous):
        return False
    if dangerous not in candidates[p]:
        return False
    if any(not domains[labels[role]] for role in SOURCE_CHOICE_ROLES):
        return False
    caps = cap_sets(frame)
    p_caps = [caps[cap] for cap in CAPS if p in caps[cap]]
    if not p_caps or any(len(dangerous - cap) < 2 for cap in p_caps):
        return False
    other_caps = [cap for cap in CAPS if cap != placement.surplus_cap]
    if all(len(caps[cap]) == 4 for cap in other_caps):
        return False
    return True


def _is_rotation_or_reflection(
    order: tuple[int, ...], image: tuple[int, ...], orientation: int, shift: int
) -> bool:
    n = len(order)
    return all(
        image[order[index]] == order[(orientation * index + shift) % n]
        for index in range(n)
    )


def cyclic_automorphisms(
    frame: mc.Frame,
    candidates: Mapping[int, Sequence[frozenset[int]]],
) -> tuple[CyclicAutomorphism, ...]:
    order = tuple(shadow.hull_order(frame))
    caps = cap_sets(frame)
    allowed_moser = set(mc.allowed_profile_perms(frame.profile))
    found: dict[tuple[int, ...], CyclicAutomorphism] = {}
    for orientation in (1, -1):
        for shift in range(frame.n):
            image_list = [0] * frame.n
            for index, source in enumerate(order):
                image_list[source] = order[(orientation * index + shift) % frame.n]
            image = tuple(image_list)
            induced = tuple(image[v] for v in mc.MOSER)
            if induced not in allowed_moser:
                continue
            mapping = tuple(mc.cap_image(induced, cap) for cap in CAPS)
            if any(
                frozenset(image[x] for x in caps[cap]) != caps[mapping[CAPS.index(cap)]]
                for cap in CAPS
            ):
                continue
            if any(
                frozenset(image[x] for x in frame.caps_int[cap])
                != frame.caps_int[mapping[CAPS.index(cap)]]
                for cap in CAPS
            ):
                continue
            name = ("rotation" if orientation == 1 else "reflection") + f"_{shift}"
            found[image] = CyclicAutomorphism(
                name, orientation, shift, image, induced, mapping
            )
    automorphisms = tuple(
        sorted(
            found.values(),
            key=lambda auto: (
                auto.image != tuple(range(frame.n)),
                auto.orientation != 1,
                auto.shift,
                auto.image,
            ),
        )
    )
    verify_automorphism_group(frame, candidates, automorphisms)
    return automorphisms


def verify_automorphism_group(
    frame: mc.Frame,
    candidates: Mapping[int, Sequence[frozenset[int]]],
    automorphisms: Sequence[CyclicAutomorphism],
) -> None:
    images = {auto.image for auto in automorphisms}
    identity = tuple(range(frame.n))
    assert identity in images
    assert len(images) == len(automorphisms)
    order = tuple(shadow.hull_order(frame))
    candidate_domain = frozenset(
        (center, tuple(sorted(support)))
        for center in range(frame.n)
        for support in candidates[center]
    )
    for auto in automorphisms:
        assert sorted(auto.image) == list(range(frame.n))
        assert _is_rotation_or_reflection(
            order, auto.image, auto.orientation, auto.shift
        )
        mapped_domain = frozenset(
            (
                auto.image[center],
                tuple(sorted(auto.image[x] for x in support)),
            )
            for center, support in candidate_domain
        )
        assert mapped_domain == candidate_domain
        inverse = tuple(auto.image.index(x) for x in range(frame.n))
        assert inverse in images
    for left in automorphisms:
        for right in automorphisms:
            composition = tuple(left.image[right.image[x]] for x in range(frame.n))
            assert composition in images


def encode_placement(placement: Placement) -> int:
    code = CAPS.index(placement.surplus_cap)
    code = code * len(CAPS) + CAPS.index(placement.second_large_cap)
    for label in placement.labels:
        code = code * 12 + label
    return code


def decode_placement(code: int) -> Placement:
    labels_reversed = []
    for _ in LABEL_ROLES:
        labels_reversed.append(code % 12)
        code //= 12
    second = CAPS[code % len(CAPS)]
    code //= len(CAPS)
    surplus = CAPS[code]
    return Placement(surplus, second, tuple(reversed(labels_reversed)))


def enumerate_profile(profile: tuple[int, int, int]) -> tuple[dict[str, Any], list[int]]:
    frame, candidates = mc.cached_candidate_lists(profile, set(mc.PROVEN_ROWS))
    assert candidates is not None
    domains = source_domains(frame, candidates)
    assert all(domains.values())
    automorphisms = cyclic_automorphisms(frame, candidates)
    caps = cap_sets(frame)
    cap_pair_counts: Counter[str] = Counter()
    p_counts: Counter[int] = Counter()
    fixed_counts: Counter[str] = Counter()
    orbit_population: Counter[int] = Counter()
    raw_count = 0

    for surplus, second in role_pairs(frame):
        for p in range(frame.n):
            p_caps = [caps[cap] for cap in CAPS if p in caps[cap]]
            for dangerous in candidates[p]:
                if any(len(dangerous - cap) < 2 for cap in p_caps):
                    continue
                for q in sorted(dangerous & frame.caps_int[surplus]):
                    rest = sorted(dangerous - {q})
                    for t1, t2, t3 in permutations(rest):
                        used = {p, q, t1, t2, t3}
                        for u in range(frame.n):
                            if u in used or not domains[u]:
                                continue
                            placement = Placement(
                                surplus, second, (p, q, t1, t2, t3, u)
                            )
                            assert admitted(frame, candidates, domains, placement)
                            code = encode_placement(placement)
                            transformed_codes = []
                            for auto in automorphisms:
                                transformed = auto.apply(placement)
                                assert admitted(frame, candidates, domains, transformed)
                                transformed_code = encode_placement(transformed)
                                transformed_codes.append(transformed_code)
                                if transformed_code == code:
                                    fixed_counts[auto.name] += 1
                            representative = min(transformed_codes)
                            orbit_population[representative] += 1
                            raw_count += 1
                            cap_pair_counts[f"{surplus}->{second}"] += 1
                            p_counts[p] += 1
                            if raw_count > MAX_RAW_PLACEMENTS_PER_PROFILE:
                                raise RuntimeError("placement census exceeded declared bound")

    representatives = sorted(orbit_population)
    orbit_size_histogram = Counter(orbit_population.values())
    assert sum(size * count for size, count in orbit_size_histogram.items()) == raw_count
    burnside_numerator = sum(fixed_counts[auto.name] for auto in automorphisms)
    assert burnside_numerator % len(automorphisms) == 0
    assert burnside_numerator // len(automorphisms) == len(representatives)
    for code in representatives:
        placement = decode_placement(code)
        assert admitted(frame, candidates, domains, placement)
        assert code == min(
            encode_placement(auto.apply(placement)) for auto in automorphisms
        )
    result = {
        "profile": list(profile),
        "raw_placement_count": raw_count,
        "orbit_count": len(representatives),
        "automorphism_count": len(automorphisms),
        "automorphisms": [auto.as_dict() for auto in automorphisms],
        "automorphism_group_sha256": canonical_sha256(
            [list(auto.image) for auto in automorphisms]
        ),
        "raw_counts_by_cap_roles": dict(sorted(cap_pair_counts.items())),
        "raw_counts_by_p": {str(p): p_counts[p] for p in range(frame.n)},
        "fixed_placement_counts": {
            auto.name: fixed_counts[auto.name] for auto in automorphisms
        },
        "burnside_numerator": burnside_numerator,
        "orbit_size_histogram": {
            str(size): count for size, count in sorted(orbit_size_histogram.items())
        },
        "representative_codes_sha256": canonical_sha256(representatives),
        "representative_count": len(representatives),
        "source_domain_nonempty": {str(x): domains[x] for x in range(frame.n)},
    }
    return result, representatives


def load_manifest() -> dict[str, Any]:
    manifest = json.loads(MANIFEST.read_text(encoding="utf-8"))
    assert manifest["scope"]["target_faithful"] is False
    assert manifest["omitted_fail_closed"]
    return manifest


def build_artifacts() -> tuple[dict[str, Any], dict[str, Any]]:
    sources = validate_source_hashes()
    cases = []
    representative_cases = []
    for profile in PROFILES:
        result, representatives = enumerate_profile(profile)
        cases.append(result)
        representative_cases.append({
            "profile": list(profile),
            "representative_codes": representatives,
        })
    representative_document = {
        "schema": "p97-atail-second-center-placement-representatives-v1",
        "encoding": {
            "cap_order": list(CAPS),
            "label_order": list(LABEL_ROLES),
            "radices": [3, 3, 12, 12, 12, 12, 12, 12],
            "decode": "two cap digits followed by p,q,t1,t2,t3,u; mixed-radix most-significant first",
        },
        "cases": representative_cases,
    }
    representative_bytes = compact_json(representative_document)
    checkpoint = {
        "schema": "p97-atail-second-center-placement-census-v1",
        "manifest_sha256": canonical_sha256(load_manifest()),
        "source": sources,
        "scope": {
            "profiles": [list(profile) for profile in PROFILES],
            "placement_surface_exhaustive": True,
            "row_system_existence_checked": False,
            "target_faithful": False,
            "producer_proved": False,
        },
        "cases": cases,
        "totals": {
            "raw_placement_count": sum(case["raw_placement_count"] for case in cases),
            "orbit_count": sum(case["orbit_count"] for case in cases),
        },
        "representatives": {
            "file": "representatives.json",
            "file_sha256": hashlib.sha256(representative_bytes).hexdigest(),
            "total_count": sum(case["representative_count"] for case in cases),
        },
        "validation": {
            "source_hashes_checked": True,
            "cyclic_action_checked": True,
            "candidate_domain_invariance_checked": True,
            "group_closure_and_inverses_checked": True,
            "placement_predicate_invariance_checked_exhaustively": True,
            "burnside_orbit_count_checked": True,
            "representative_minimality_checked": True,
        },
        "epistemic_status": "EXACT_PLACEMENT_SURFACE_ONLY",
    }
    return checkpoint, representative_document


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--write", action="store_true")
    parser.add_argument("--check", action="store_true")
    args = parser.parse_args()
    checkpoint, representatives = build_artifacts()
    representative_bytes = compact_json(representatives)
    if args.write:
        REPRESENTATIVES.write_bytes(representative_bytes)
        CHECKPOINT.write_text(
            json.dumps(checkpoint, indent=2, sort_keys=True) + "\n",
            encoding="utf-8",
        )
    if args.check:
        assert REPRESENTATIVES.read_bytes() == representative_bytes
        expected = json.loads(CHECKPOINT.read_text(encoding="utf-8"))
        assert expected == checkpoint
    print(json.dumps(checkpoint, indent=2, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
