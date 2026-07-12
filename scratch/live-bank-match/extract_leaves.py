#!/usr/bin/env python3
"""Extract the open-leaf hypothesis surfaces of u1_largeCap_routeB_tail_liveData_false.

Input : scratch/live-bank-match/routeBTail_HEAD.lean (committed snapshot,
        a317dc80, 5475 lines — line numbers below refer to this snapshot).
Output: scratch/live-bank-match/leaf_packets.json

Per leaf (79 open sorries + the 24 closed LIVE-T1 polarity branches, kept for
the encoding-validation gate) we record:
  - eqs        : point-identification atoms  (term = term), with provenance
  - diseqs     : disequality atoms (base-six pairwise + polarity negations)
  - rows       : available centered metric rows:
                 {center: term|None, members_at_radius: [terms], row: id}
                 (center None = blocker row with unknown/unpinned center)
  - placements : slot-level pins  (term  =  <src>row[slot])
  - closed_by  : for closed branches, the in-file lemma that closed them

Term vocabulary:
  base points  : p q t1 t2 t3 u
  f2 row labels: f2.l1 .. f2.l4          (f2CriticalRow.selected.lI)
  source slots : qrow[0..3] t1row[0..3] t2row[0..3] t3row[0..3] urow[0..3]
                 (rows.rowAt <src>).slotPoint i ; slot i point = selected.l(i+1)
  fresh center : fresh

Everything asserted here is cross-checked against the snapshot text; any
mismatch raises.
"""
import json
import re
from pathlib import Path

BASE = Path("/Users/adam/projects/math-projects/erdos-97-96-formalization/scratch/live-bank-match")
SNAP = BASE / "routeBTail_HEAD.lean"
OUT = BASE / "leaf_packets.json"

lines = SNAP.read_text().splitlines()
assert len(lines) == 5475, len(lines)


def L(n: int) -> str:  # 1-based
    return lines[n - 1]


def expect(n: int, frag: str) -> None:
    assert frag in L(n), f"line {n}: expected {frag!r}, got {L(n)!r}"


def indent_of(s: str) -> int:
    return len(s) - len(s.lstrip())


def bullets(start: int, end: int, indent: int) -> list[int]:
    """1-based line numbers of `·` bullets at exactly `indent` within [start,end]."""
    out = []
    for n in range(start, end + 1):
        s = L(n)
        if s.strip().startswith("·") and indent_of(s) == indent:
            out.append(n)
    return out


def bullet_regions(start: int, end: int, indent: int) -> list[tuple[int, int]]:
    bs = bullets(start, end, indent)
    regions = []
    for i, b in enumerate(bs):
        stop = bs[i + 1] - 1 if i + 1 < len(bs) else end
        regions.append((b, stop))
    return regions


BASE_SIX = ["p", "q", "t1", "t2", "t3", "u"]
BASE_DISEQS = [(a, b) for i, a in enumerate(BASE_SIX) for b in BASE_SIX[i + 1:]]

leaves = []


def mk_leaf(line: int, family: str, leaf_id: str, eqs, rows, placements,
            extra_diseqs=(), closed_by=None, notes=()):
    leaves.append({
        "line": line,
        "family": family,
        "leaf_id": leaf_id,
        "status": "closed" if closed_by else "open",
        "closed_by": closed_by,
        "eqs": [{"lhs": a, "rhs": b, "provenance": pv} for (a, b, pv) in eqs],
        "diseqs": [{"lhs": a, "rhs": b, "provenance": "hbase (base-six pairwise)"}
                   for (a, b) in BASE_DISEQS] +
                  [{"lhs": a, "rhs": b, "provenance": pv} for (a, b, pv) in extra_diseqs],
        "rows": rows,
        "placements": [{"lhs": a, "slot": s, "provenance": pv} for (a, s, pv) in placements],
        "notes": list(notes),
    })


# Facts present at EVERY leaf (theorem hypothesis surface):
#   hfixed : U3FixedTriplePacket D q p t1 t2 t3
#     -> p-centered same-radius row over {q,t1,t2,t3}  (t*_same_radius fields)
#   rows : five blocker rows, centers unknown, each with 4 slots on its shell;
#     rowAt_center_ne_sourcePoint proves center != own source point.
HFIXED_ROW = {"row": "hfixed", "center": "p",
              "members_at_radius": ["q", "t1", "t2", "t3"],
              "provenance": "hfixed.t1/t2/t3_same_radius (dist p tI = dist p q)"}


def blocker_rows(pinned: dict[str, str], l1_resolutions: dict[str, str]) -> list[dict]:
    """The five source rows. pinned: src -> center term. l1_resolutions:
    src -> term for that row's slot-0 label (selected.l1) when identified."""
    out = [dict(HFIXED_ROW)]
    for src in ["q", "t1", "t2", "t3", "u"]:
        members = [f"{src}row[{i}]" for i in range(4)]
        if src in l1_resolutions:
            members[0] = l1_resolutions[src]
        out.append({
            "row": f"{src}row",
            "center": pinned.get(src),
            "members_at_radius": members,
            "provenance": (f"rows.rowAt {src}: slotPoint_on_shell"
                           + (f"; center = {pinned[src]}" if src in pinned else
                              "; center unknown (center != source by rowAt_center_ne_sourcePoint)")),
        })
    return out


# =====================================================================
# Region map of the case tree (verified against the snapshot line by line)
# =====================================================================
expect(3585, "rcases")
expect(3586, "f2CriticalRow_center_baseSix_or_fresh")
expect(3588, "hcenter_p | hcenter_q | hcenter_t1 | hcenter_t2 | hcenter_t3")
expect(3589, "hcenter_u | hcenter_fresh")

outer = bullet_regions(3590, 5191, 2)
assert len(outer) == 7, [r[0] for r in outer]
(r_p, r_q, r_t1, r_t2, r_t3, r_u, r_fresh) = outer
assert r_p == (3590, 5179), r_p
assert r_q[0] == 5180 and r_t1[0] == 5181 and r_t2[0] == 5182
assert r_t3[0] == 5189 and r_u[0] == 5190 and r_fresh[0] == 5191

# --------------------------------------------------------------
# hcenter_p block: by_cases hq_t20 at :3598
# --------------------------------------------------------------
expect(3598, "by_cases hq_t20")
expect(3599, "q = rows.pointOfChoice")
hq_regions = bullet_regions(3601, 5179, 4)
assert len(hq_regions) == 2, hq_regions
r_liveQ, r_hq_neg = hq_regions
assert r_liveQ == (3601, 3943), r_liveQ

PERM_BINDER = re.compile(r"hl(\d)_t(\d)")


def parse_perm_alternatives(n_start: int, n_end: int) -> list[list[tuple[int, int]]]:
    """Parse `⟨hlA_tB, ...⟩ | ⟨...⟩ ...` alternatives from an rcases pattern
    spanning lines [n_start, n_end]. Returns per-alternative binder lists."""
    text = " ".join(L(n) for n in range(n_start, n_end + 1))
    alts = []
    for grp in re.findall(r"⟨([^⟩]*)⟩", text):
        alts.append([(int(a), int(b)) for a, b in PERM_BINDER.findall(grp)])
    return alts


# ---------------- LIVE-Q (24 leaves) --------------------------
expect(3609, "hqRow_center_p")
expect(3610, "(rows.rowAt U1Depth5.CriticalSource.q).center = p")
expect(3621, "rcases hq_named with hq_slot0 | hq_slot1 | hq_slot2 | hq_slot3")
qslot_regions = bullet_regions(3622, 3943, 6)
assert len(qslot_regions) == 4, qslot_regions

liveq_count = 0
for slot_idx, (qs, qe) in enumerate(qslot_regions):
    k = slot_idx + 1                      # q = f2.l{k}
    expect(qs, f"`q = f2CriticalRow.selected.l{k}`")
    # find the 6-way perm rcases pattern: last `rcases perm_of_finset_eq_triple`
    perm_line = next(n for n in range(qs, qe + 1)
                     if "perm_of_finset_eq_triple" in L(n) and "rcases" in L(n - 0))
    # pattern lines: from the line containing "with" up to the line before first bullet
    perm_bullets = bullet_regions(perm_line, qe, 8)
    assert len(perm_bullets) == 6, (qs, perm_bullets)
    with_line = next(n for n in range(perm_line, perm_bullets[0][0]) if " with" in L(n))
    alts = parse_perm_alternatives(with_line, perm_bullets[0][0] - 1)
    assert len(alts) == 6 and all(len(a) == 3 for a in alts), alts
    for alt_idx, ((bs, be), binders) in enumerate(zip(perm_bullets, alts)):
        sorry_lines = [n for n in range(bs, be + 1) if L(n).strip() == "sorry"]
        assert len(sorry_lines) == 1, (bs, be, sorry_lines)
        n_sorry = sorry_lines[0]
        eqs = [
            ("f2row.center", "p", "hcenter_p"),
            ("q", "t2row[0]", "hq_t20"),
            ("q", f"f2.l{k}", f"hq_slot{k-1}"),
            ("qrow.center", "p", "hqRow_center_p (:3609)"),
            ("f2.l1", "qrow[0]",
             "hf2Selected_l1_eq_rowAt_l1 @ CriticalSource.q with hq_t20.symm (1-step)"),
        ]
        for (a, b) in binders:
            eqs.append((f"f2.l{a}", f"t{b}", f"hl{a}_t{b} (perm rcases)"))
        # resolve qrow slot-0 label: qrow[0] = f2.l1 -> its point
        f2l1_pt = "q" if k == 1 else next(f"t{b}" for (a, b) in binders if a == 1)
        rows_avail = [
            {"row": "f2row", "center": "p",
             "members_at_radius": ["f2.l1", "f2.l2", "f2.l3", "f2.l4"],
             "provenance": "f2CriticalRow.labels_on_shell + hcenter_p; labels pinned to {q,t1,t2,t3} by hselected_support_eq_base"},
        ] + blocker_rows({"q": "p"}, {"q": f2l1_pt})
        placements = [
            ("q", "t2row[0]", "hq_t20"),
            (f2l1_pt, "qrow[0]", "hf2Selected_l1 transport + slot resolution"),
        ]
        perm_desc = ",".join(f"l{a}=t{b}" for (a, b) in binders)
        mk_leaf(n_sorry, "LIVE-Q", f"LIVE-Q/q=l{k}/{perm_desc}",
                eqs, rows_avail, placements,
                notes=[f"cube q=f2.l{k}, tail perm {perm_desc}",
                       "all f2 labels resolved to {q,t1,t2,t3}"])
        liveq_count += 1
assert liveq_count == 24, liveq_count

# ---------------- T1 cube (24 open + 24 closed) ----------------
expect(3944, "by_cases ht1_t20")
t1_regions = bullet_regions(3947, 5179, 6)
assert len(t1_regions) == 2, t1_regions
r_T1, r_t1_neg = t1_regions
assert r_T1 == (3947, 4720), r_T1

expect(3947, "by_cases hq_named")
t1_named_regions = bullet_regions(3950, 4720, 8)
assert len(t1_named_regions) == 2
r_T1_pos, r_T1_qnn = t1_named_regions
assert r_T1_pos == (3950, 4717)
expect(4718, "· exact")
expect(4719, "false_of_f2CriticalRow_center_p_q_not_named")

expect(3954, "ht1Row_center_p")
expect(3955, "(rows.rowAt U1Depth5.CriticalSource.t1).center = p")
expect(3962, "hf2_l1_eq_t1Row_l1")
expect(4003, "rcases hq_named with hq_slot0 | hq_slot1 | hq_slot2 | hq_slot3")

t1_qslot_regions = bullet_regions(4004, 4717, 10)
assert len(t1_qslot_regions) == 4, t1_qslot_regions

t1_open = 0
t1_closed = 0
HSOURCE = re.compile(r"hsource_l(\d) \| hsource_l(\d) \| hsource_l(\d)")
HORD = re.compile(r"⟨hl(\d)_t(\d), hl(\d)_t(\d)⟩")

for slot_idx, (qs, qe) in enumerate(t1_qslot_regions):
    j = slot_idx + 1                     # q = f2.l{j}
    expect(qs, f"`q = f2CriticalRow.selected.l{j}`")
    src_rcases = next(n for n in range(qs, qe + 1)
                      if "rcases hsource_named_except with" in L(n))
    msrc = HSOURCE.search(L(src_rcases + 1))
    assert msrc, L(src_rcases + 1)
    src_slots = [int(g) for g in msrc.groups()]
    src_regions = bullet_regions(src_rcases + 1, qe, 12)
    assert len(src_regions) == 3, (qs, src_regions)
    for s_idx, (ss, se) in enumerate(src_regions):
        s = src_slots[s_idx]             # t2row[0] = f2.l{s} hence f2.l{s} = t1
        expect(ss, f"`t20 = l{s}`")
        ord_bullets = [n for n in range(ss, se + 1)
                       if "rcases hordered with" in L(n)]
        assert len(ord_bullets) == 2, (ss, se, ord_bullets)
        ord_regions = bullet_regions(ss + 1, se, 14)
        assert len(ord_regions) == 2, (ss, ord_regions)
        for (os_, oe) in ord_regions:
            ord_line = next(n for n in range(os_, oe + 1)
                            if "rcases hordered with" in L(n))
            mo = HORD.search(L(ord_line))
            assert mo, L(ord_line)
            a, b, c, d = (int(g) for g in mo.groups())
            pair_binders = [(a, b), (c, d)]
            # polarity split
            pol_line = next(n for n in range(os_, oe + 1)
                            if "by_cases ht1Row_l1" in L(n))
            pol_regions = bullet_regions(pol_line + 1, oe, 16)
            assert len(pol_regions) == 2, (os_, pol_regions)
            for pol_idx, (ps, pe) in enumerate(pol_regions):
                polarity = "pos" if pol_idx == 0 else "neg"
                body = " ".join(L(n).strip() for n in range(ps, pe + 1))
                closed_by = None
                mcl = re.search(r"\(hfalse_of_(\w+) ", body)
                if "sorry" in body:
                    assert mcl is None, body
                else:
                    assert mcl, body
                    closed_by = "hfalse_of_" + mcl.group(1)
                eqs = [
                    ("f2row.center", "p", "hcenter_p"),
                    ("t1", "t2row[0]", "ht1_t20"),
                    ("q", f"f2.l{j}", f"hq_slot{j-1}"),
                    (f"f2.l{s}", "t1", f"hl{s}_t1 (hsource_l{s} + ht1_t20)"),
                    ("t1row.center", "p", "ht1Row_center_p (:3954)"),
                    ("f2.l1", "t1row[0]", "hf2_l1_eq_t1Row_l1 (:3962)"),
                ]
                for (x, y) in pair_binders:
                    eqs.append((f"f2.l{x}", f"t{y}", f"hl{x}_t{y} (hordered)"))
                extra_diseqs = []
                if polarity == "pos":
                    eqs.append(("t1", "t1row[0]", "ht1Row_l1 (by_cases pos)"))
                else:
                    extra_diseqs.append(("t1", "t1row[0]", "ht1Row_l1 (by_cases neg)"))
                # resolve f2.l1 point
                assign = {j: "q", s: "t1"}
                for (x, y) in pair_binders:
                    assign[x] = f"t{y}"
                assert set(assign) == {1, 2, 3, 4}, assign
                f2l1_pt = assign[1]
                rows_avail = [
                    {"row": "f2row", "center": "p",
                     "members_at_radius": ["f2.l1", "f2.l2", "f2.l3", "f2.l4"],
                     "provenance": "f2CriticalRow.labels_on_shell + hcenter_p; support pinned {q,t1,t2,t3}"},
                ] + blocker_rows({"t1": "p"}, {"t1": f2l1_pt})
                placements = [
                    ("t1", "t2row[0]", "ht1_t20"),
                    (f2l1_pt, "t1row[0]", "hf2_l1_eq_t1Row_l1 + slot resolution"),
                ]
                desc = (f"LIVE-T1/q=l{j}/t20=l{s}/"
                        + ",".join(f"l{x}=t{y}" for x, y in pair_binders)
                        + f"/{polarity}")
                sorry_lines = [n for n in range(ps, pe + 1) if L(n).strip() == "sorry"]
                leaf_line = sorry_lines[0] if sorry_lines else ps
                mk_leaf(leaf_line, "LIVE-T1", desc, eqs, rows_avail, placements,
                        extra_diseqs=extra_diseqs, closed_by=closed_by,
                        notes=[f"cube q=f2.l{j}, t2row[0]=f2.l{s}=t1, polarity {polarity}"])
                if closed_by:
                    t1_closed += 1
                else:
                    t1_open += 1
assert (t1_open, t1_closed) == (24, 24), (t1_open, t1_closed)

# ---------------- T3 cube (24 leaves) --------------------------
expect(4721, "by_cases ht2_t20")
t2_regions = bullet_regions(4724, 5179, 8)
assert len(t2_regions) == 2, t2_regions
assert "false_of_center_p_t2_t20" in L(4725)
expect(4729, "by_cases ht3_t20")
t3_regions = bullet_regions(4732, 5179, 10)
assert len(t3_regions) == 2, t3_regions
r_T3_cube, r_t3_neg = t3_regions
expect(4732, "by_cases hq_named")
t3_named = bullet_regions(4735, r_T3_cube[1], 12)
assert len(t3_named) == 2, t3_named
r_T3_pos, r_T3_qnn = t3_named
assert "false_of_f2CriticalRow_center_p_q_not_named" in L(5165)
expect(4739, "ht3Row_center_p")
expect(4740, "(rows.rowAt U1Depth5.CriticalSource.t3).center = p")
expect(4747, "rcases hq_named with hq_slot0 | hq_slot1 | hq_slot2 | hq_slot3")

t3_qslot_regions = bullet_regions(4748, r_T3_pos[1], 14)
assert len(t3_qslot_regions) == 4, t3_qslot_regions

t3_count = 0
for slot_idx, (qs, qe) in enumerate(t3_qslot_regions):
    j = slot_idx + 1
    expect(qs, f"`q = f2CriticalRow.selected.l{j}`")
    src_rcases = next(n for n in range(qs, qe + 1)
                      if "rcases hsource_named_except with" in L(n))
    msrc = HSOURCE.search(L(src_rcases + 1))
    assert msrc, L(src_rcases + 1)
    src_slots = [int(g) for g in msrc.groups()]
    src_regions = bullet_regions(src_rcases + 1, qe, 16)
    assert len(src_regions) == 3, (qs, [r[0] for r in src_regions])
    for s_idx, (ss, se) in enumerate(src_regions):
        s = src_slots[s_idx]
        expect(ss, f"`t20 = l{s}`")
        ord_regions = bullet_regions(ss + 1, se, 18)
        assert len(ord_regions) == 2, (ss, ord_regions)
        for (os_, oe) in ord_regions:
            ord_line = next(n for n in range(os_, oe + 1)
                            if "rcases hordered with" in L(n))
            mo = HORD.search(L(ord_line))
            assert mo, L(ord_line)
            a, b, c, d = (int(g) for g in mo.groups())
            pair_binders = [(a, b), (c, d)]
            sorry_lines = [n for n in range(os_, oe + 1) if L(n).strip() == "sorry"]
            assert len(sorry_lines) == 1, (os_, oe)
            eqs = [
                ("f2row.center", "p", "hcenter_p"),
                ("t3", "t2row[0]", "ht3_t20"),
                ("q", f"f2.l{j}", f"hq_slot{j-1}"),
                (f"f2.l{s}", "t3", f"hl{s}_t3 (hsource_l{s} + ht3_t20)"),
                ("t3row.center", "p", "ht3Row_center_p (:4739)"),
                ("f2.l1", "t3row[0]",
                 "hf2Selected_l1_eq_rowAt_l1 @ CriticalSource.t3 with ht3_t20.symm (1-step)"),
            ]
            for (x, y) in pair_binders:
                eqs.append((f"f2.l{x}", f"t{y}", f"hl{x}_t{y} (hordered)"))
            assign = {j: "q", s: "t3"}
            for (x, y) in pair_binders:
                assign[x] = f"t{y}"
            assert set(assign) == {1, 2, 3, 4}, assign
            f2l1_pt = assign[1]
            rows_avail = [
                {"row": "f2row", "center": "p",
                 "members_at_radius": ["f2.l1", "f2.l2", "f2.l3", "f2.l4"],
                 "provenance": "f2CriticalRow.labels_on_shell + hcenter_p; support pinned {q,t1,t2,t3}"},
            ] + blocker_rows({"t3": "p"}, {"t3": f2l1_pt})
            placements = [
                ("t3", "t2row[0]", "ht3_t20"),
                (f2l1_pt, "t3row[0]", "hf2Selected_l1 transport + slot resolution"),
            ]
            desc = (f"LIVE-T3/q=l{j}/t20=l{s}/"
                    + ",".join(f"l{x}=t{y}" for x, y in pair_binders))
            mk_leaf(sorry_lines[0], "LIVE-T3", desc, eqs, rows_avail, placements,
                    notes=[f"cube q=f2.l{j}, t2row[0]=f2.l{s}=t3"])
            t3_count += 1
assert t3_count == 24, t3_count

# ---------------- LIVE-C (7 leaves) ----------------------------
# hcenter_q (:5180) and hcenter_t1 (:5181): bare sorries.
for line_no, ctr, fam in [(5180, "q", "LIVE-C-q"), (5181, "t1", "LIVE-C-t1")]:
    assert L(line_no).strip() == "· sorry", L(line_no)
    mk_leaf(line_no, "LIVE-C", fam,
            eqs=[("f2row.center", ctr, f"hcenter_{ctr}")],
            rows=[{"row": "f2row", "center": ctr,
                   "members_at_radius": ["t2row[0]"],
                   "provenance": f"hcenter_{ctr} + f2CriticalRow.source_on_shell; "
                                 "labels l1..l4 unpinned (only source t2row[0] known on shell)"}]
                 + blocker_rows({}, {}),
            placements=[],
            notes=["no support pinning available (audit LIVE-C-*)"])

# hcenter_t2 (:5182-5188): named/rowFailure split.
expect(5182, "rcases")
expect(5183, "f2CriticalRow_all_named_or_t2ResidualHRowFailure")
expect(5186, "rcases hnamed with ⟨hf5_named, hp_named, hq_named⟩")
assert L(5187).strip() == "sorry" and L(5188).strip() == "· sorry"
mk_leaf(5187, "LIVE-C", "LIVE-C-t2-named",
        eqs=[("f2row.center", "t2", "hcenter_t2")],
        rows=[{"row": "f2row", "center": "t2",
               "members_at_radius": ["t2row[0]", "t2row[1]", "p", "q"],
               "provenance": "hcenter_t2 + source_on_shell (t2row[0]); "
                             "hf5_named/hp_named/hq_named put t2row[1], p, q on the shell "
                             "(disjunctive slot, definite radius via point_on_shell_of_eq_named)"}]
             + blocker_rows({}, {}),
        placements=[],
        notes=["t2row[1], p, q are each SOME selected label of the t2-centered f2 row",
               "slot positions disjunctive; membership on shell definite"])
mk_leaf(5188, "LIVE-C", "LIVE-C-t2-rowFailure",
        eqs=[("f2row.center", "t2", "hcenter_t2")],
        rows=[{"row": "f2row", "center": "t2",
               "members_at_radius": ["t2row[0]"],
               "provenance": "hcenter_t2 + source_on_shell; hrowFailure gives a DISJUNCTION of "
                             "metric disequalities (t2row[1]|p|q off the shell) - no equality atoms"}]
             + blocker_rows({}, {}),
        placements=[],
        notes=["hrowFailure: dist t2 t2row[1] != dist t2 t2row[0] OR same for p OR q"])

for line_no, ctr, fam in [(5189, "t3", "LIVE-C-t3"), (5190, "u", "LIVE-C-u")]:
    assert L(line_no).strip() == "· sorry", L(line_no)
    mk_leaf(line_no, "LIVE-C", fam,
            eqs=[("f2row.center", ctr, f"hcenter_{ctr}")],
            rows=[{"row": "f2row", "center": ctr,
                   "members_at_radius": ["t2row[0]"],
                   "provenance": f"hcenter_{ctr} + source_on_shell; labels unpinned"}]
                 + blocker_rows({}, {}),
            placements=[],
            notes=["no support pinning available (audit LIVE-C-*)"])

assert L(5191).strip() == "· sorry"
mk_leaf(5191, "LIVE-C", "LIVE-C-fresh",
        eqs=[("f2row.center", "fresh", "hcenter_fresh (center in D.A, != p,q,t1,t2,t3,u,t2row[0])")],
        rows=[{"row": "f2row", "center": "fresh",
               "members_at_radius": ["t2row[0]"],
               "provenance": "source_on_shell; center fresh, labels unpinned"}]
             + blocker_rows({}, {}),
        placements=[],
        extra_diseqs=[("fresh", b, "hcenter_fresh") for b in BASE_SIX] +
                     [("fresh", "t2row[0]", "hcenter_fresh")],
        notes=["center is a fresh carrier point"])

# =====================================================================
open_leaves = [l for l in leaves if l["status"] == "open"]
closed_leaves = [l for l in leaves if l["status"] == "closed"]
assert len(open_leaves) == 79, len(open_leaves)
assert len(closed_leaves) == 24, len(closed_leaves)
open_lines = sorted(l["line"] for l in open_leaves)

# cross-check: the 79 open leaf lines must be exactly the sorry lines of the
# liveData theorem body (3433..5191), excluding the PAIR hole at 2561
all_sorries = [n for n in range(3433, 5192) if L(n).strip() in ("sorry", "· sorry")]
assert open_lines == all_sorries, (set(all_sorries) ^ set(open_lines))

OUT.write_text(json.dumps({
    "snapshot": "routeBTail_HEAD.lean @ a317dc806f24f6a9055e9704f946fbf9ef526611",
    "n_open": len(open_leaves),
    "n_closed_gate": len(closed_leaves),
    "families": {f: sum(1 for l in open_leaves if l["family"] == f)
                 for f in ["LIVE-Q", "LIVE-T1", "LIVE-T3", "LIVE-C"]},
    "leaves": leaves,
}, indent=2))
print(f"wrote {OUT}")
print(f"open: {len(open_leaves)}  (Q={sum(1 for l in open_leaves if l['family']=='LIVE-Q')}, "
      f"T1={sum(1 for l in open_leaves if l['family']=='LIVE-T1')}, "
      f"T3={sum(1 for l in open_leaves if l['family']=='LIVE-T3')}, "
      f"C={sum(1 for l in open_leaves if l['family']=='LIVE-C')})")
print(f"closed T1 gate branches: {len(closed_leaves)}")
for cl in closed_leaves[:5]:
    print("  e.g.", cl["leaf_id"], "closed_by", cl["closed_by"])
