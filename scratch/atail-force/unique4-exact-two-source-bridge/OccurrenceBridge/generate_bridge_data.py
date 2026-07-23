#!/usr/bin/env python3
"""Generate chunked Lean BridgeEntry data from the trimmed occurrence map.

Reads TrimmedOccurrenceGenerator/p5-largest.trimmed-occurrence-map.json
(sha256-pinned), derives each clause's ClauseShape parameters, re-computes
the shape's instantiated literals with the same semantics as the Lean
`instLits` (closed-form dense variable numbering, mirrored Kalmanson
schema tables), checks them against the stored clause, and emits:

  BridgeChunkNN.lean  -- data + per-chunk `by decide` WF theorem
  BridgeChunkAll.lean -- imports, concatenated entry list, assembled WF

The Lean-side `entryWF` kernel checks are authoritative; every check here
is a pre-flight that fails fast on generation bugs.
"""

import hashlib
import json
import sys
from pathlib import Path

HERE = Path(__file__).resolve().parent
MAP_PATH = HERE.parent / "TrimmedOccurrenceGenerator" / \
    "p5-largest.trimmed-occurrence-map.json"
EXPECTED_SHA = \
    "7ddd7a6fcdf46a8185bab0672a54130776322d24ad1dd74828b1d3812d4a6249"
CHUNK_SIZE = 220

# --- dense variable numbering (verified against all 616 map name pairs) ---


def m_var(c, p):
    assert c != p
    return 1 + 10 * c + (p if p < c else p - 1)


def eq_pairs(c):
    return [(l, r) for l in range(11) for r in range(11)
            if l < r and l != c and r != c]


def eq_var(c, l, r):
    assert l < r and l != c and r != c
    return 111 + 45 * c + eq_pairs(c).index((l, r))


def class_var(p):
    return 606 + p


# --- Kalmanson schema tables (mirrors of the Lean definitions) ---

BANK = {
    0: [(0, 1), (0, 2), (4, 1), (4, 3), (5, 2), (5, 3)],
    1: [(0, 1), (0, 3), (4, 2), (4, 3), (5, 1), (5, 2)],
    2: [(0, 1), (0, 2), (1, 2), (1, 3), (2, 1), (2, 3)],
    3: [(0, 1), (0, 5), (1, 0), (1, 2), (2, 0), (2, 1), (2, 5),
        (3, 0), (3, 2)],
    4: [(0, 1), (0, 3), (2, 3), (2, 4), (3, 1), (3, 4)],
    5: [(0, 1), (0, 2), (0, 4), (2, 3), (2, 4), (3, 2), (3, 4),
        (4, 1), (4, 3)],
    6: [(0, 3), (0, 4), (1, 0), (1, 4), (2, 0), (2, 3)],
    7: [(0, 1), (0, 5), (1, 0), (1, 3), (1, 4), (2, 0), (2, 5),
        (3, 1), (3, 4), (6, 0), (6, 3)],
    8: [(0, 1), (0, 2), (0, 7), (5, 1), (5, 4), (5, 6), (6, 3),
        (6, 4), (6, 7), (7, 2), (7, 3), (7, 6)],
    9: [(0, 1), (0, 3), (0, 5), (4, 1), (4, 2), (5, 2), (5, 3)],
}
BANK_RC = {0: 6, 1: 6, 2: 4, 3: 6, 4: 5, 5: 5, 6: 6, 7: 7, 8: 8, 9: 6}
# retainedBankSchemas order in IndexedSourceValuation.lean
BANK_IDX = {
    (0, "forward"): 0, (0, "reflected"): 1,
    (1, "forward"): 2, (1, "reflected"): 3,
    (2, "forward"): 4, (2, "reflected"): 5,
    (3, "forward"): 6, (3, "reflected"): 7,
    (4, "forward"): 8, (4, "reflected"): 9,
    (5, "reflected"): 10,
    (6, "forward"): 11, (6, "reflected"): 12,
    (7, "forward"): 13, (7, "reflected"): 14,
    (8, "reflected"): 15,
    (9, "forward"): 16, (9, "reflected"): 17,
}

P4_FOUR_K2 = [(0, 2), (0, 4), (0, 6), (1, 0), (1, 6), (1, 7),
              (3, 2), (3, 4), (3, 7)]
P5_TWO_K1_TWO_K2 = [(0, 1), (0, 3), (0, 5), (1, 0), (1, 5),
                    (2, 1), (2, 3), (2, 4), (5, 0), (5, 4)]
P5_TRIANGLE_A = [(0, 3), (0, 5), (1, 4), (1, 5), (2, 3), (2, 4)]
P5_TRIANGLE_B = [(0, 4), (0, 5), (1, 3), (1, 4), (2, 3), (2, 5)]

# record_id -> (seededCutSchemas forward index, role count, base schema)
SEEDED = {
    "corrected-owncap-p4-four-k2": (0, 8, P4_FOUR_K2),
    "corrected-owncap-p5-two-k1-two-k2": (2, 6, P5_TWO_K1_TWO_K2),
    "corrected-unseeded-p5-six-role-k2-triangle": (4, 6, P5_TRIANGLE_A),
    "corrected-p5-six-role-k2-triangle-block-reflected":
        (6, 6, P5_TRIANGLE_B),
}


def reflect(rc, schema):
    return [(rc - 1 - a, rc - 1 - b) for a, b in schema]


CAPS = {0: [0, 1, 2, 3, 4], 1: [4, 5, 6, 7, 8], 2: [8, 9, 10, 0]}
CAP_ENDPOINTS = {0: [0, 4], 1: [4, 8], 2: [8, 0]}


def parse_atom(atom):
    """name -> (kind, params) with encode cross-check vs dense_literal."""
    parts = atom["name"].split("_")
    lit = atom["dense_literal"]
    if parts[0] == "m":
        c, p = int(parts[1]), int(parts[2])
        var = m_var(c, p)
        kind = ("m", c, p)
    elif parts[0] == "eq":
        c, l, r = int(parts[1]), int(parts[2]), int(parts[3])
        var = eq_var(c, l, r)
        kind = ("eq", c, l, r)
    elif parts[0] == "class":
        p = int(parts[1])
        var = class_var(p)
        kind = ("class", p)
    else:
        raise ValueError(f"unknown atom name {atom['name']}")
    assert var == abs(lit), (atom["name"], var, lit)
    neg = lit < 0
    assert (atom["polarity"] == "negative") == neg, atom
    return kind, neg


def sorted_eq_var(c, a, b):
    l, r = (a, b) if a < b else (b, a)
    return eq_var(c, l, r)


def cut_shape(ctor, lits, matches, label):
    """Pick the first schema match that instantiates into the clause."""
    lit_set = set(lits)
    for mt in matches:
        idx0, rc, base = mt["base"]
        orient = mt["orientation"]
        idx = idx0 if orient == "forward" else idx0 + 1
        oriented = base if orient == "forward" else reflect(rc, base)
        ts = mt["target_vertices"]
        if len(ts) != rc or any(ts[i] >= ts[i + 1] for i in range(rc - 1)):
            continue
        inst = []
        ok = True
        for a, b in oriented:
            if a >= rc or b >= rc or ts[a] == ts[b]:
                ok = False
                break
            inst.append(-m_var(ts[a], ts[b]))
        if ok and set(inst) <= lit_set:
            return f".{ctor} {idx} [{', '.join(map(str, ts))}]", inst
    raise ValueError(f"no schema match instantiates clause {label}")


def shape_of_clause(rec):
    fam = rec["retained_family"]
    lits = rec["exact_dense_signed_clause"]
    lit_set = set(lits)
    atoms = [parse_atom(a) for a in rec["named_source_atoms"]]

    def only(pred):
        found = [a for a in atoms if pred(a)]
        return found

    if fam == "radius_partition_transitivity":
        negs = [k for k, n in atoms if n]
        pos = [k for k, n in atoms if not n]
        assert len(negs) == 2 and len(pos) == 1
        # each kind is ("eq", c, l, r)
        c = negs[0][1]
        assert negs[1][1] == c and pos[0][1] == c
        pair1 = frozenset(negs[0][2:4])
        pair2 = frozenset(negs[1][2:4])
        pair3 = frozenset(pos[0][2:4])
        shared = pair1 & pair2
        assert len(shared) == 1, rec["trimmed_clause_index"]
        w = next(iter(shared))
        u = next(iter(pair1 - shared))
        v = next(iter(pair2 - shared))
        assert pair3 == {u, v}, rec["trimmed_clause_index"]
        inst = [-sorted_eq_var(c, w, u), -sorted_eq_var(c, w, v),
                sorted_eq_var(c, u, v)]
        shape = f".transitivity {c} {w} {u} {v}"
    elif fam == "full_class_cyclic_alternation":
        assert all(n for _, n in atoms) and len(atoms) == 2
        (_, c1, p1, q1), (_, c2, p2, q2) = atoms[0][0], atoms[1][0]
        assert (p1, q1) == (p2, q2)
        l, r = sorted((c1, c2))
        inst = [-eq_var(l, p1, q1), -eq_var(r, p1, q1)]
        shape = f".cyclicAlternation {l} {r} {p1} {q1}"
    elif fam == "row_at_least_4":
        assert all(not n for _, n in atoms) and len(atoms) == 7
        c = atoms[0][0][1]
        ps = [k[2] for k, _ in atoms]
        assert all(k[1] == c for k, _ in atoms)
        assert len(set(ps)) == 7 and c not in ps
        inst = [m_var(c, p) for p in ps]
        shape = f".rowAtLeastFour {c} [{', '.join(map(str, ps))}]"
    elif fam == "selected_row_subset_radius_class":
        eqs = only(lambda a: a[0][0] == "eq")
        ms = only(lambda a: a[0][0] == "m")
        assert len(eqs) == 1 and not eqs[0][1] and len(ms) == 2
        _, c, l, r = eqs[0][0]
        assert all(n for _, n in ms)
        assert {k[1:] for k, _ in ms} == {(c, l), (c, r)}
        inst = [-m_var(c, l), -m_var(c, r), eq_var(c, l, r)]
        shape = f".rowSubsetRadius {c} {l} {r}"
    elif fam == "mutual_triangle_cross_center_radius_transport":
        eqs = only(lambda a: a[0][0] == "eq")
        ms = only(lambda a: a[0][0] == "m")
        assert len(eqs) == 1 and not eqs[0][1] and len(ms) == 4
        _, bc, x, y = eqs[0][0]
        assert all(n for _, n in ms)
        assert {k[1:] for k, _ in ms} == \
            {(x, y), (y, x), (x, bc), (y, bc)}, rec["trimmed_clause_index"]
        inst = [-m_var(x, y), -m_var(x, bc), -m_var(y, x), -m_var(y, bc),
                sorted_eq_var(bc, x, y)]
        shape = f".mutualTriangle {x} {y} {bc}"
    elif fam == "first_apex_row_eq_class":
        ms = only(lambda a: a[0][0] == "m")
        cls = only(lambda a: a[0][0] == "class")
        assert len(ms) == 1 and len(cls) == 1
        _, c, p = ms[0][0]
        assert c == 0 and cls[0][0][1] == p and p != 0
        m_neg, cl_neg = ms[0][1], cls[0][1]
        assert m_neg != cl_neg
        if not m_neg:  # positive m literal: class -> row direction
            inst = [m_var(0, p), -class_var(p)]
            shape = f".apexRowEqClass {p} true"
        else:
            inst = [-m_var(0, p), class_var(p)]
            shape = f".apexRowEqClass {p} false"
    elif fam == "first_apex_not_in_own_class":
        assert lits == [-606]
        inst = [-606]
        shape = ".apexNotOwnClass"
    elif fam == "exact_two_strict_hits_at_least_2":
        assert len(atoms) == 2 and all(not n for _, n in atoms)
        i, j = atoms[0][0][1], atoms[1][0][1]
        assert i in (5, 6, 7) and j in (5, 6, 7) and i != j
        inst = [class_var(i), class_var(j)]
        shape = f".strictHitsPair {i} {j}"
    elif fam == "exact_two_left_adjacent_hit_at_least_1":
        assert lit_set == {class_var(p) for p in CAPS[0]}
        inst = [class_var(p) for p in CAPS[0]]
        shape = ".leftAdjacent"
    elif fam == "exact_two_right_adjacent_hit_at_least_1":
        assert lit_set == {class_var(p) for p in CAPS[2]}
        inst = [class_var(p) for p in CAPS[2]]
        shape = ".rightAdjacent"
    elif fam.startswith("selected_row_endpoint_own_cap_at_most_one_"):
        k = int(fam.rsplit("_", 1)[1])
        assert len(atoms) == 2 and all(n for _, n in atoms)
        (_, c, p), (_, c2, q) = atoms[0][0], atoms[1][0]
        assert c == c2 and c in CAP_ENDPOINTS[k]
        assert p in CAPS[k] and q in CAPS[k]
        assert p != c and q != c and p != q
        inst = [-m_var(c, p), -m_var(c, q)]
        shape = f".endpointOwnCap {k} {c} {p} {q}"
    elif fam.startswith("selected_row_own_cap_at_most_two_"):
        k = int(fam.rsplit("_", 1)[1])
        assert len(atoms) == 3 and all(n for _, n in atoms)
        c = atoms[0][0][1]
        ps = [k2[2] for k2, _ in atoms]
        assert all(k2[1] == c for k2, _ in atoms)
        assert c in CAPS[k] and all(p in CAPS[k] for p in ps)
        assert len(set(ps)) == 3 and c not in ps
        inst = [-m_var(c, p) for p in ps]
        shape = f".ownCapAtMostTwo {k} {c} {ps[0]} {ps[1]} {ps[2]}"
    elif fam == "verified_kalmanson_order_schema_cut":
        sem = rec["semantic_parameters"]
        s = sem["schema_index"]
        orient = sem["orientation"]
        idx = BANK_IDX[(s, orient)]
        rc = BANK_RC[s]
        base = BANK[s]
        oriented = base if orient == "forward" else reflect(rc, base)
        ts = sem["target_vertices"]
        assert len(ts) == rc and \
            all(ts[i] < ts[i + 1] for i in range(rc - 1))
        inst = []
        for a, b in oriented:
            assert a < rc and b < rc and ts[a] != ts[b]
            inst.append(-m_var(ts[a], ts[b]))
        assert set(inst) <= lit_set, rec["trimmed_clause_index"]
        shape = f".bankCut {idx} [{', '.join(map(str, ts))}]"
    elif fam == "seeded_full_linear_kalmanson_cut":
        matches = []
        for mt in rec["semantic_parameters"]["schema_matches"]:
            matches.append({
                "base": SEEDED[mt["record_id"]],
                "orientation": mt["orientation"],
                "target_vertices": mt["target_vertices"],
            })
        shape, inst = cut_shape("seededCut", lits, matches,
                                rec["trimmed_clause_index"])
    else:
        raise ValueError(f"unknown family {fam}")

    assert set(inst) <= lit_set, \
        (fam, rec["trimmed_clause_index"], inst, lits)
    return shape


def main():
    data = MAP_PATH.read_bytes()
    sha = hashlib.sha256(data).hexdigest()
    assert sha == EXPECTED_SHA, f"occurrence map sha mismatch: {sha}"
    doc = json.loads(data)
    clauses = doc["clauses"]
    assert len(clauses) == 8703, len(clauses)
    entries = []
    for i, rec in enumerate(clauses):
        assert rec["trimmed_clause_index"] == i + 1
        shape = shape_of_clause(rec)
        lits = rec["exact_dense_signed_clause"]
        entries.append(
            f"⟨[{', '.join(map(str, lits))}], {shape}⟩")

    chunks = [entries[i:i + CHUNK_SIZE]
              for i in range(0, len(entries), CHUNK_SIZE)]
    limit = None
    if len(sys.argv) > 1 and sys.argv[1].startswith("--chunks="):
        limit = [int(x) for x in sys.argv[1].split("=")[1].split(",")]

    header = (
        "/-\nCopyright (c) 2026 Adam McKenna. All rights reserved.\n"
        "Released under Apache 2.0 license as described in the file "
        "LICENSE.\nAuthors: Adam McKenna\n-/\n\n"
    )
    names = []
    for ci, chunk in enumerate(chunks, start=1):
        name = f"BridgeChunk{ci:02d}"
        names.append(name)
        if limit is not None and ci not in limit:
            continue
        lines = [header, "import BridgeFamilies\n\n",
                 f"/-! # Trimmed-clause bridge entries, chunk {ci} "
                 "(generated) -/\n\n",
                 "namespace Problem97\n",
                 "namespace P5OccurrenceBridgeScratch\n\n",
                 f"def bridgeChunk{ci:02d} : List BridgeEntry := [\n"]
        lines.append(",\n".join(f"  {e}" for e in chunk))
        lines.append("]\n\n")
        lines.append(
            "set_option maxRecDepth 8192 in\n"
            f"theorem bridgeChunk{ci:02d}_wf : "
            f"bridgeChunk{ci:02d}.all entryWF = true := by decide\n\n")
        lines.append("end P5OccurrenceBridgeScratch\nend Problem97\n")
        (HERE / f"{name}.lean").write_text("".join(lines))
        print(f"wrote {name}.lean ({len(chunk)} entries)")

    if limit is None:
        lines = [header]
        for name in names:
            lines.append(f"import {name}\n")
        lines.append(
            "\n/-! # All trimmed-clause bridge entries (generated) -/\n\n"
            "namespace Problem97\nnamespace P5OccurrenceBridgeScratch\n\n"
            "def bridgeEntries : List BridgeEntry :=\n  ")
        lines.append(" ++\n  ".join(
            f"bridgeChunk{ci:02d}" for ci in range(1, len(names) + 1)))
        lines.append(
            "\n\ntheorem bridgeEntries_wf : "
            "bridgeEntries.all entryWF = true := by\n"
            "  simp only [bridgeEntries, List.all_append, "
            "Bool.and_eq_true]\n  exact ")
        wfs = [f"bridgeChunk{ci:02d}_wf" for ci in range(1, len(names) + 1)]
        # `++` is left-associative, so the split conjunction is
        # left-nested; fold the anonymous constructor the same way.
        nested = wfs[0]
        for wf in wfs[1:]:
            nested = f"⟨{nested}, {wf}⟩"
        lines.append(nested + "\n\n")
        lines.append("end P5OccurrenceBridgeScratch\nend Problem97\n")
        (HERE / "BridgeChunkAll.lean").write_text("".join(lines))
        print(f"wrote BridgeChunkAll.lean ({len(names)} chunks, "
              f"{len(entries)} entries)")


if __name__ == "__main__":
    main()
