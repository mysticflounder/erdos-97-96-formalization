#!/usr/bin/env python3
"""Solver-independent replay for a SAT result from ``decision.py``."""

from __future__ import annotations

import argparse
import itertools
import json
import sys
from fractions import Fraction
from pathlib import Path


HERE=Path(__file__).resolve().parent
ROOT=HERE.parents[2]
B0=ROOT/"scratch/atail-force/exact5-global-cover-parent-gate"
sys.path.insert(0,str(B0))

from verify import (  # noqa: E402
    FIRST_APEX,N,OPP_CAP1,PHYSICAL_CAP,PHYSICAL_INTERIOR,SECOND_APEX,
    SURPLUS_CAP,VERTICES,strongly_connected,verify_decoded,
)

STRICT=set(OPP_CAP1)-set(SURPLUS_CAP)-set(PHYSICAL_CAP)


def edge(a:int,b:int)->tuple[int,int]: return (a,b) if a<b else (b,a)


def replay(payload:dict)->list[str]:
    errors:list[str]=[]
    if payload.get("status")!="SAT": return ["payload is not SAT"]
    decoded=payload["decoded"]
    errors.extend(verify_decoded(decoded))
    rows={int(c):set(s) for c,s in decoded["rows"].items()}
    covers=[{int(c):set(s) for c,s in raw.items()} for raw in decoded["cover_rows"]]
    first=set(decoded["parent_first"]);second=set(decoded["parent_second"])
    double=set(decoded["b1"]);shell=set(decoded["shell"]);q=int(decoded["q"])
    if len(first)!=4 or FIRST_APEX in first or q in first: errors.append("parent B1")
    if len(second)!=4 or SECOND_APEX in second or q in second: errors.append("parent B2")
    if len(first&second)>2 or not second<=shell: errors.append("parent overlap/subset")
    if len(first&set(PHYSICAL_INTERIOR))>1: errors.append("parent B1 physical hits")
    if len(second&set(PHYSICAL_INTERIOR))<2: errors.append("parent B2 physical hits")
    if len(rows[FIRST_APEX]&STRICT)<2 or len(double&STRICT)<2:
        errors.append("first-apex strict hits")
    arm=decoded["radius_arm"]
    if arm=="same":
        complete=rows[FIRST_APEX]|double
        if len(complete)!=6 or not STRICT<=complete: errors.append("same exact-six roles")
        for other in (covers[0][FIRST_APEX],covers[1][FIRST_APEX],first):
            if other&complete and not other<=complete: errors.append("same synchronization")
    else:
        if rows[FIRST_APEX]&double: errors.append("distinct support overlap")
        if ((rows[FIRST_APEX]&STRICT)|(double&STRICT))!=STRICT:
            errors.append("distinct strict partition")
        for other in (covers[0][FIRST_APEX],covers[1][FIRST_APEX],first):
            if other&rows[FIRST_APEX] and other!=rows[FIRST_APEX]:
                errors.append("distinct retained synchronization")
            if other&double and other!=double:
                errors.append("distinct double synchronization")
    for family in (rows,*covers):
        if not strongly_connected(family): errors.append("row table not strongly connected")

    values={tuple(map(int,key.split(","))):Fraction(value)
            for key,value in payload["distances"].items()}
    D=lambda a,b:Fraction(0) if a==b else values[edge(a,b)]
    if set(values)!=set(itertools.combinations(VERTICES,2)):
        errors.append("distance domain")
        return errors
    if any(value<1 for value in values.values()): errors.append("distance positivity")
    for a,b,c in itertools.combinations(VERTICES,3):
        if not (D(a,b)+D(b,c)>=D(a,c)+1 and
                D(a,c)+D(b,c)>=D(a,b)+1 and
                D(a,b)+D(a,c)>=D(b,c)+1): errors.append(f"triangle {a,b,c}")
    for a,b,c,d in itertools.combinations(VERTICES,4):
        diagonal=D(a,c)+D(b,d)
        if not (diagonal>=D(a,b)+D(c,d)+1 and
                diagonal>=D(a,d)+D(b,c)+1): errors.append(f"Kalmanson {a,b,c,d}")
    selected=[*((c,s) for family in (rows,*covers) for c,s in family.items()),
              (FIRST_APEX,double),(SECOND_APEX,shell),(FIRST_APEX,first),
              (SECOND_APEX,second)]
    for center,support in selected:
        if len({D(center,p) for p in support})!=1:
            errors.append(f"row equality {center}:{sorted(support)}")
    def radius_classes(center:int)->list[set[int]]:
        classes:dict[Fraction,set[int]]={}
        for p in VERTICES:
            if p!=center: classes.setdefault(D(center,p),set()).add(p)
        return [support for support in classes.values() if len(support)>=4]
    if radius_classes(SECOND_APEX)!=[shell]: errors.append("second apex unique exact five")
    blocker_image=set(map(int,decoded["blockers"]))
    for center in blocker_image:
        if radius_classes(center)!=[rows[center]]:
            errors.append(f"critical radius semantics {center}")
    rr=D(FIRST_APEX,min(rows[FIRST_APEX]));dr=D(FIRST_APEX,min(double))
    if arm=="same":
        if rr!=dr or {p for p in VERTICES if p!=FIRST_APEX and D(FIRST_APEX,p)==rr} \
                != rows[FIRST_APEX]|double: errors.append("same radius metric class")
    else:
        if rr==dr: errors.append("distinct radii equal")
        if {p for p in VERTICES if p!=FIRST_APEX and D(FIRST_APEX,p)==rr}!=rows[FIRST_APEX]:
            errors.append("retained exact four")
        if {p for p in VERTICES if p!=FIRST_APEX and D(FIRST_APEX,p)==dr}!=double:
            errors.append("double exact four")
    if D(SECOND_APEX,int(decoded["q"]))==D(SECOND_APEX,int(decoded["w"])):
        errors.append("second-apex frontier separation")
    return errors


def main()->None:
    p=argparse.ArgumentParser();p.add_argument("result",type=Path);a=p.parse_args()
    errors=replay(json.loads(a.result.read_text()))
    if errors:
        print("FAIL");print("\n".join(errors));raise SystemExit(1)
    print("PASS: independently replayed exact-card-13 focused survivor")


if __name__=="__main__":main()
