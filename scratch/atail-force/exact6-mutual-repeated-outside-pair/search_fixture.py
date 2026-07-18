#!/usr/bin/env python3
"""Search a finite exact-six mutual-pair regression fixture.

This is a finite incidence/cap search only.  It deliberately does not claim
Euclidean realizability.  The cyclic support design is linear (two distinct
rows meet in at most one point), so it tests whether the total critical map,
two omitted blocker values, exact cap six, selected-row closure, and blocker
multiplicity alone can force the repeated outside pair used by the geometric
consumer.
"""

from collections import Counter
from itertools import combinations


N = 14
CARRIER = set(range(N))
FIRST_APEX = 0
SECOND_APEX = 1
REMAINING_APEX = 2


def row(center: int) -> frozenset[int]:
    return frozenset((center + delta) % N for delta in (1, 2, 5, 7))


ROWS = tuple(row(center) for center in range(N))


def blocker_options(source: int) -> list[int]:
    return [
        center
        for center in range(N)
        if source in ROWS[center] and center not in {FIRST_APEX, SECOND_APEX}
    ]


def cap_hit_bounds(caps: list[set[int]]) -> bool:
    return all(len(ROWS[center] & cap) <= 2 for cap in caps for center in cap)


def first_cap_configuration():
    second_row_non_apex = sorted(ROWS[SECOND_APEX] - {FIRST_APEX, SECOND_APEX, REMAINING_APEX})
    for inside_pair in combinations(second_row_non_apex, 2):
        for deleted in sorted(CARRIER - ROWS[SECOND_APEX] - {FIRST_APEX, SECOND_APEX, REMAINING_APEX}):
            physical_class = set(ROWS[SECOND_APEX]) | {deleted}
            for unused in sorted(CARRIER - physical_class - {FIRST_APEX, SECOND_APEX, REMAINING_APEX, deleted}):
                physical_interior = set(inside_pair) | {deleted, unused}
                remaining = sorted(CARRIER - {FIRST_APEX, SECOND_APEX, REMAINING_APEX} - physical_interior)
                for surplus_interior_tuple in combinations(remaining, 3):
                    surplus_interior = set(surplus_interior_tuple)
                    first_opposite_interior = set(remaining) - surplus_interior
                    caps = [
                        {FIRST_APEX, SECOND_APEX} | surplus_interior,
                        {SECOND_APEX, REMAINING_APEX} | first_opposite_interior,
                        {FIRST_APEX, REMAINING_APEX} | physical_interior,
                    ]
                    if not cap_hit_bounds(caps):
                        continue
                    physical_vertices = sorted(physical_class & physical_interior)
                    if len(physical_vertices) != 3:
                        continue
                    yield caps, physical_class, physical_interior, physical_vertices, deleted, unused


def choose_blockers(caps, physical_vertices, deleted, unused):
    continuation_candidates = [x for x in physical_vertices if x != deleted]
    if len(continuation_candidates) != 2:
        return None
    continuation_second, partner = continuation_candidates

    choices = [blocker_options(source) for source in range(N)]
    for source, opts in enumerate(choices):
        if not opts:
            return None

    for unused_blocker in choices[unused]:
        if deleted in ROWS[unused_blocker] or continuation_second in ROWS[unused_blocker]:
            continue
        for partner_blocker in choices[partner]:
            if partner_blocker == unused_blocker:
                continue
            if deleted in ROWS[partner_blocker]:
                continue
            for deleted_blocker in choices[deleted]:
                if partner in ROWS[deleted_blocker]:
                    continue
                same_cap = next(
                    (
                        k
                        for k, cap in enumerate(caps)
                        if unused_blocker in cap
                        and partner_blocker in cap
                        and unused not in cap
                        and partner not in cap
                    ),
                    None,
                )
                if same_cap is None:
                    continue

                blocker = [opts[0] for opts in choices]
                blocker[unused] = unused_blocker
                blocker[partner] = partner_blocker
                blocker[deleted] = deleted_blocker

                # Force two distinct repeated fibers while preserving all source
                # membership constraints.  A small local search over the remaining
                # sources is enough because every source has several legal centers.
                free = [s for s in range(N) if s not in {unused, partner, deleted}]
                for a, b in combinations(free, 2):
                    common = sorted(set(choices[a]) & set(choices[b]))
                    if not common:
                        continue
                    blocker[a] = blocker[b] = common[0]
                    counts = Counter(blocker)
                    repeated = [value for value, count in counts.items() if count >= 2]
                    if len(repeated) < 2:
                        continue
                    return {
                        "blocker": blocker,
                        "unused_blocker": unused_blocker,
                        "partner_blocker": partner_blocker,
                        "deleted_blocker": deleted_blocker,
                        "same_cap": same_cap,
                        "continuation_second": continuation_second,
                        "partner": partner,
                        "repeated": repeated,
                    }
    return None


def repeated_outside_pair(caps, blocker):
    hits = []
    for source, target in combinations(range(N), 2):
        first_center = blocker[source]
        second_center = blocker[target]
        if first_center == second_center:
            continue
        shared = ROWS[first_center] & ROWS[second_center]
        for cap_index, cap in enumerate(caps):
            outside = shared - cap
            if first_center in cap and second_center in cap and len(outside) >= 2:
                hits.append((source, target, cap_index, sorted(outside)))
    return hits


def main() -> None:
    for data in first_cap_configuration():
        caps, physical_class, physical_interior, physical_vertices, deleted, unused = data
        selected = choose_blockers(caps, physical_vertices, deleted, unused)
        if selected is None:
            continue
        blocker = selected["blocker"]
        hits = repeated_outside_pair(caps, blocker)
        assert not hits
        assert all(len(ROWS[a] & ROWS[b]) <= 1 for a, b in combinations(range(N), 2))
        assert all(source in ROWS[blocker[source]] for source in range(N))
        assert all(blocker[source] not in {FIRST_APEX, SECOND_APEX} for source in range(N))
        print("FOUND")
        print("caps =", [sorted(cap) for cap in caps])
        print("physical_class =", sorted(physical_class))
        print("physical_interior =", sorted(physical_interior))
        print("physical_vertices =", physical_vertices)
        print("deleted unused continuation_second partner =", deleted, unused,
              selected["continuation_second"], selected["partner"])
        print("blocker =", blocker)
        print("same_cap =", selected["same_cap"])
        print("blockers unused partner deleted =", selected["unused_blocker"],
              selected["partner_blocker"], selected["deleted_blocker"])
        print("repeated blocker values =", selected["repeated"])
        repeated_fibers = {
            value: [source for source, image in enumerate(blocker) if image == value]
            for value in selected["repeated"]
        }
        print("repeated fibers =", repeated_fibers)
        assert blocker[0] == blocker[1]
        assert blocker[3] == blocker[4]
        assert blocker[0] != blocker[3]
        assert blocker[0] in caps[1] and blocker[3] in caps[1]
        assert ROWS[blocker[0]] & ROWS[blocker[3]] == {deleted}
        print("same-cap repeated-fiber row intersection =", [deleted])
        print("rows =", [sorted(support) for support in ROWS])
        print("repeated_outside_pair_hits =", hits)
        return
    raise SystemExit("NO_FIXTURE")


if __name__ == "__main__":
    main()
