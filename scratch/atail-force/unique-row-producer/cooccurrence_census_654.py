"""Pair co-occurrence / chained-equidistance census across banked 654 cores.

Tabulates, over the forced-pair-core-654 bank (all of which force the
zero-squared-distance pair (7,8)):

  1. distinct-row frequency (center:support) across cores;
  2. pairwise row co-occurrence;
  3. universal / near-universal rows and the all-core intersection;
  4. per-core (7,8) incidence structure — bisector rows (7 and 8 both in
     the support, so the center lies on the perpendicular bisector of
     (7,8)) vs spoke rows (center 7 or 8, linking d(7,8) into the row's
     equidistance chain when the other endpoint is in the support);
  5. the same summary aggregated over the unit-core-654 bank for
     contrast.

Pure tabulation over REAL_INFEASIBLE_ROW_CORES — no CAS calls.
Emits markdown on stdout.
"""

import importlib.util
import sys
from collections import Counter
from itertools import combinations

BANK = (
    "/Users/adam/projects/math-projects/erdos-97-96-formalization/"
    "scratch/atail-force/unique-row-producer/card_five_interior_shadow_search.py"
)


def load_cores():
    spec = importlib.util.spec_from_file_location("bank", BANK)
    mod = importlib.util.module_from_spec(spec)
    sys.modules["bank"] = mod
    spec.loader.exec_module(mod)
    return mod.REAL_INFEASIBLE_ROW_CORES


def row_key(center, support):
    return (center, tuple(sorted(support)))


def fmt_row(key):
    center, support = key
    return f"{center}:{{{','.join(str(p) for p in support)}}}"


def core_rowset(core):
    return frozenset(row_key(c, s) for c, s in core["rows"].items())


def main():
    cores = load_cores()
    fp654 = [c for c in cores if c["id"].startswith("forced-pair-core-654")]
    unit654 = [c for c in cores if c["id"].startswith("unit-core-654")]
    n = len(fp654)

    print("# Pair co-occurrence / chained-equidistance census — 654 bank")
    print()
    print(f"fp-654 cores: {n}; 654-unit cores: {len(unit654)} (contrast set).")
    print("All fp-654 cores force the zero-squared-distance pair (7,8).")
    print()

    rowsets = {c["id"]: core_rowset(c) for c in fp654}

    # 1. row frequency
    freq = Counter()
    for rs in rowsets.values():
        freq.update(rs)
    print(f"## 1. Distinct-row frequency across {n} fp-654 cores")
    print()
    print(f"Distinct rows: {len(freq)}")
    print()
    print("| row | cores | share |")
    print("|---|---|---|")
    for key, cnt in freq.most_common():
        print(f"| `{fmt_row(key)}` | {cnt} | {cnt}/{n} |")
    print()

    # 2. pairwise co-occurrence (top 20)
    pair_freq = Counter()
    for rs in rowsets.values():
        for a, b in combinations(sorted(rs), 2):
            pair_freq[(a, b)] += 1
    print("## 2. Top row-pair co-occurrence (top 20)")
    print()
    print("| pair | cores |")
    print("|---|---|")
    for (a, b), cnt in pair_freq.most_common(20):
        print(f"| `{fmt_row(a)}` + `{fmt_row(b)}` | {cnt} |")
    print()

    # 3. universal / near-universal rows
    inter = None
    for rs in rowsets.values():
        inter = rs if inter is None else inter & rs
    print("## 3. Universal and near-universal rows")
    print()
    print(
        "All-core intersection: "
        + (
            ", ".join(f"`{fmt_row(k)}`" for k in sorted(inter))
            if inter
            else "EMPTY"
        )
    )
    print()
    thresh = int(0.8 * n)
    near = [(k, c) for k, c in freq.most_common() if c >= thresh]
    print(f"Rows in >= {thresh}/{n} cores (80%):")
    for k, c in near:
        print(f"- `{fmt_row(k)}` — {c}/{n}")
    print()

    # 4. (7,8) incidence structure
    print("## 4. (7,8) incidence structure per fp-654 core")
    print()
    print(
        "bisector row: support contains both 7 and 8 (center equidistant "
        "from 7 and 8). spoke row: center is 7 or 8 and the other endpoint "
        "is in the support (d(7,8) chained directly)."
    )
    print()
    print("| core | bisector rows | center-7/8 rows | 7/8-support rows |")
    print("|---|---|---|---|")
    bis_freq = Counter()
    spoke78 = 0
    for c in fp654:
        bis, spokes, touch = [], [], []
        for center, support in sorted(c["rows"].items()):
            key = row_key(center, support)
            if 7 in support and 8 in support:
                bis.append(key)
                bis_freq[key] += 1
            if center in (7, 8):
                spokes.append(key)
                if (center == 7 and 8 in support) or (
                    center == 8 and 7 in support
                ):
                    spoke78 += 1
            elif 7 in support or 8 in support:
                touch.append(key)
        cid = c["id"].replace("forced-pair-core-", "fp-")
        print(
            f"| {cid} "
            f"| {', '.join(f'`{fmt_row(k)}`' for k in bis) or '—'} "
            f"| {', '.join(f'`{fmt_row(k)}`' for k in spokes) or '—'} "
            f"| {len(touch)} |"
        )
    print()
    print("Bisector-row frequency:")
    for k, cnt in bis_freq.most_common():
        print(f"- `{fmt_row(k)}` — {cnt}/{n}")
    print()
    print(f"Direct spoke rows containing the opposite endpoint: {spoke78}")
    print()

    # 4b. universal direct-chain check: does every core carry d(7,8)
    # directly — via a spoke row whose support holds the opposite
    # endpoint, or via a bisector row holding both?
    print("## 4b. Direct-chain coverage")
    print()
    no_direct = []
    for c in fp654:
        direct = False
        for center, support in c["rows"].items():
            if 7 in support and 8 in support:
                direct = True
            if center == 7 and 8 in support:
                direct = True
            if center == 8 and 7 in support:
                direct = True
        if not direct:
            no_direct.append(c["id"])
    if no_direct:
        print(f"Cores with NO direct (7,8) chain: {', '.join(no_direct)}")
    else:
        print(
            f"ALL {n}/{n} fp-654 cores chain d(7,8) directly: every core "
            "has a spoke row (center 7 or 8) whose support contains the "
            "opposite endpoint, or a bisector row containing both 7 and 8."
        )
    print()

    # 5. contrast: unit-654 bank
    ufreq = Counter()
    for c in unit654:
        ufreq.update(core_rowset(c))
    shared = set(freq) & set(ufreq)
    print("## 5. Contrast with the 654-unit bank")
    print()
    print(
        f"Distinct rows in {len(unit654)} unit-654 cores: {len(ufreq)}; "
        f"rows shared with the fp-654 row inventory: {len(shared)}"
    )
    print()
    print("Top shared rows (fp count / unit count):")
    for k in sorted(shared, key=lambda k: -(freq[k] + ufreq[k]))[:15]:
        print(f"- `{fmt_row(k)}` — {freq[k]}/{n} fp, {ufreq[k]}/{len(unit654)} unit")


if __name__ == "__main__":
    main()
