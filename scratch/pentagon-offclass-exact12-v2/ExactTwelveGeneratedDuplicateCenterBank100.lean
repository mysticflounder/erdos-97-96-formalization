/-
Generated from scratch/pentagon-offclass-exact12-v2/cegar-d0-v2-common-v7-u-q-mask-census-500/journal.jsonl
Journal SHA-256: 8b8c1c9022ce86ecae68b0ad7ee4a2ea6784d45b808bc48794bbefa58524d1aa
Duplicate-center records: 100

This file checks record validity only.  It is not a coverage or UNSAT proof.
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.GenericRowNogoodCertificate

namespace Problem97.ATailFrontierLiveClosure.ExactTwelveGeneratedDuplicateCenterBank

open Problem97.Census554.EqualityCore
open Problem97.ATailFrontierLiveClosure.GenericRowNogoodCertificate
open scoped EuclideanGeometry

abbrev Label := Fin 12

/-- Journal iteration 11351; certificate 474376bef45c02dc95c595d0c01966c6996ed9bcffd87892dcf413860573568c. -/
def record0 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 0, support := {3, 4, 5, 7} },
      { center := 2, support := {5, 9, 10, 11} },
      { center := 3, support := {0, 1, 7, 9} },
      { center := 5, support := {1, 2, 6, 7} },
      { center := 9, support := {0, 2, 3, 5} }
    ]
    data := {
      p := 0
      q := 1
      r := 7
      a := 3
      b := 5
      ap_aq := { first := (3, 0), steps := [.row 3 0 1], last := (3, 1) }
      ap_ar := { first := (3, 0), steps := [.row 3 0 7], last := (3, 7) }
      bp_bq := { first := (5, 0), steps := [.flip 5 0, .row 0 5 3, .flip 0 3, .row 3 0 9, .flip 3 9, .row 9 3 2, .flip 9 2, .row 2 9 5, .flip 2 5, .row 5 2 1], last := (5, 1) }
      bp_br := { first := (5, 0), steps := [.flip 5 0, .row 0 5 3, .flip 0 3, .row 3 0 9, .flip 3 9, .row 9 3 2, .flip 9 2, .row 2 9 5, .flip 2 5, .row 5 2 7], last := (5, 7) } } }

/-- Journal iteration 11352; certificate ca1e73d136c05042a710b6fc2900c294b9c8cd2581e6b67ba58d44960d55293c. -/
def record1 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 0, support := {3, 4, 5, 7} },
      { center := 1, support := {0, 2, 8, 9} },
      { center := 2, support := {5, 9, 10, 11} },
      { center := 3, support := {0, 1, 7, 9} },
      { center := 9, support := {0, 2, 3, 5} }
    ]
    data := {
      p := 0
      q := 2
      r := 9
      a := 1
      b := 5
      ap_aq := { first := (1, 0), steps := [.row 1 0 2], last := (1, 2) }
      ap_ar := { first := (1, 0), steps := [.row 1 0 9], last := (1, 9) }
      bp_bq := { first := (5, 0), steps := [.flip 5 0, .row 0 5 3, .flip 0 3, .row 3 0 9, .flip 3 9, .row 9 3 2, .flip 9 2, .row 2 9 5, .flip 2 5], last := (5, 2) }
      bp_br := { first := (5, 0), steps := [.flip 5 0, .row 0 5 3, .flip 0 3, .row 3 0 9, .flip 3 9, .row 9 3 5, .flip 9 5], last := (5, 9) } } }

/-- Journal iteration 11353; certificate ecc37bfeabf5f05931de5da171d7c79715395947fb33bd3a2ecac9c9b1f89fa9. -/
def record2 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 1, support := {0, 2, 6, 8} },
      { center := 2, support := {5, 9, 10, 11} },
      { center := 5, support := {0, 4, 6, 11} },
      { center := 11, support := {1, 2, 4, 5} }
    ]
    data := {
      p := 0
      q := 2
      r := 6
      a := 1
      b := 5
      ap_aq := { first := (1, 0), steps := [.row 1 0 2], last := (1, 2) }
      ap_ar := { first := (1, 0), steps := [.row 1 0 6], last := (1, 6) }
      bp_bq := { first := (5, 0), steps := [.row 5 0 11, .flip 5 11, .row 11 5 2, .flip 11 2, .row 2 11 5, .flip 2 5], last := (5, 2) }
      bp_br := { first := (5, 0), steps := [.row 5 0 6], last := (5, 6) } } }

/-- Journal iteration 11354; certificate 07a6bd21a59faf1f2b4c964aa40f79b38eac2e8e324e19cec923eaa71061ef34. -/
def record3 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 0, support := {3, 4, 5, 7} },
      { center := 1, support := {0, 2, 6, 8} },
      { center := 2, support := {5, 9, 10, 11} },
      { center := 3, support := {0, 1, 7, 9} },
      { center := 5, support := {0, 4, 6, 11} },
      { center := 9, support := {0, 2, 3, 5} }
    ]
    data := {
      p := 0
      q := 2
      r := 6
      a := 1
      b := 5
      ap_aq := { first := (1, 0), steps := [.row 1 0 2], last := (1, 2) }
      ap_ar := { first := (1, 0), steps := [.row 1 0 6], last := (1, 6) }
      bp_bq := { first := (5, 0), steps := [.flip 5 0, .row 0 5 3, .flip 0 3, .row 3 0 9, .flip 3 9, .row 9 3 2, .flip 9 2, .row 2 9 5, .flip 2 5], last := (5, 2) }
      bp_br := { first := (5, 0), steps := [.row 5 0 6], last := (5, 6) } } }

/-- Journal iteration 11355; certificate a93355f82ec4073f2e1298bf3a5132ab3443d4c93376b454d0ff89f1e7c61890. -/
def record4 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 1, support := {0, 2, 6, 8} },
      { center := 2, support := {5, 9, 10, 11} },
      { center := 5, support := {0, 4, 6, 11} },
      { center := 11, support := {1, 2, 5, 7} }
    ]
    data := {
      p := 0
      q := 2
      r := 6
      a := 1
      b := 5
      ap_aq := { first := (1, 0), steps := [.row 1 0 2], last := (1, 2) }
      ap_ar := { first := (1, 0), steps := [.row 1 0 6], last := (1, 6) }
      bp_bq := { first := (5, 0), steps := [.row 5 0 11, .flip 5 11, .row 11 5 2, .flip 11 2, .row 2 11 5, .flip 2 5], last := (5, 2) }
      bp_br := { first := (5, 0), steps := [.row 5 0 6], last := (5, 6) } } }

/-- Journal iteration 11356; certificate 657c7893ffac77427bfc8627f124b35a02b9a7efa75d3b3ab60955113bb1dfab. -/
def record5 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 0, support := {3, 4, 5, 7} },
      { center := 2, support := {5, 9, 10, 11} },
      { center := 3, support := {0, 1, 7, 9} },
      { center := 5, support := {0, 4, 6, 11} },
      { center := 9, support := {0, 2, 3, 10} },
      { center := 11, support := {0, 4, 5, 10} }
    ]
    data := {
      p := 0
      q := 2
      r := 4
      a := 5
      b := 11
      ap_aq := { first := (5, 0), steps := [.flip 5 0, .row 0 5 3, .flip 0 3, .row 3 0 9, .flip 3 9, .row 9 3 2, .flip 9 2, .row 2 9 5, .flip 2 5], last := (5, 2) }
      ap_ar := { first := (5, 0), steps := [.row 5 0 4], last := (5, 4) }
      bp_bq := { first := (11, 0), steps := [.row 11 0 5, .flip 11 5, .row 5 11 0, .flip 5 0, .row 0 5 3, .flip 0 3, .row 3 0 9, .flip 3 9, .row 9 3 2, .flip 9 2, .row 2 9 11, .flip 2 11], last := (11, 2) }
      bp_br := { first := (11, 0), steps := [.row 11 0 4], last := (11, 4) } } }

/-- Journal iteration 11357; certificate 0e5de95317b6594939ef6b950e9f998c0681bce1cb6cb46c49d389639d302b0e. -/
def record6 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 0, support := {3, 4, 5, 7} },
      { center := 1, support := {0, 2, 6, 8} },
      { center := 2, support := {5, 9, 10, 11} },
      { center := 3, support := {0, 1, 7, 9} },
      { center := 5, support := {0, 4, 6, 11} },
      { center := 9, support := {0, 2, 3, 10} }
    ]
    data := {
      p := 0
      q := 2
      r := 6
      a := 1
      b := 5
      ap_aq := { first := (1, 0), steps := [.row 1 0 2], last := (1, 2) }
      ap_ar := { first := (1, 0), steps := [.row 1 0 6], last := (1, 6) }
      bp_bq := { first := (5, 0), steps := [.flip 5 0, .row 0 5 3, .flip 0 3, .row 3 0 9, .flip 3 9, .row 9 3 2, .flip 9 2, .row 2 9 5, .flip 2 5], last := (5, 2) }
      bp_br := { first := (5, 0), steps := [.row 5 0 6], last := (5, 6) } } }

/-- Journal iteration 11358; certificate 11f0b2c581cce9bf179006f1cd21c37bbe256b4cd565408f7e679913219c7b65. -/
def record7 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 0, support := {3, 4, 5, 7} },
      { center := 1, support := {0, 2, 6, 8} },
      { center := 2, support := {5, 9, 10, 11} },
      { center := 3, support := {0, 1, 7, 9} },
      { center := 5, support := {0, 4, 6, 11} },
      { center := 9, support := {0, 2, 3, 11} }
    ]
    data := {
      p := 0
      q := 2
      r := 6
      a := 1
      b := 5
      ap_aq := { first := (1, 0), steps := [.row 1 0 2], last := (1, 2) }
      ap_ar := { first := (1, 0), steps := [.row 1 0 6], last := (1, 6) }
      bp_bq := { first := (5, 0), steps := [.flip 5 0, .row 0 5 3, .flip 0 3, .row 3 0 9, .flip 3 9, .row 9 3 2, .flip 9 2, .row 2 9 5, .flip 2 5], last := (5, 2) }
      bp_br := { first := (5, 0), steps := [.row 5 0 6], last := (5, 6) } } }

/-- Journal iteration 11359; certificate 384543575bdd2eb9502f0d8821b3e3dce1c2ea17a10441acc4a54431ac008b47. -/
def record8 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 2, support := {5, 9, 10, 11} },
      { center := 8, support := {1, 3, 6, 9} },
      { center := 9, support := {0, 2, 3, 10} },
      { center := 10, support := {1, 2, 3, 8} }
    ]
    data := {
      p := 1
      q := 3
      r := 9
      a := 8
      b := 10
      ap_aq := { first := (8, 1), steps := [.row 8 1 3], last := (8, 3) }
      ap_ar := { first := (8, 1), steps := [.row 8 1 9], last := (8, 9) }
      bp_bq := { first := (10, 1), steps := [.row 10 1 3], last := (10, 3) }
      bp_br := { first := (10, 1), steps := [.row 10 1 2, .flip 10 2, .row 2 10 9, .flip 2 9, .row 9 2 10, .flip 9 10], last := (10, 9) } } }

/-- Journal iteration 11360; certificate 320f098b8f41464cdabcf84115f89c86a49aa20686a7e25b919afcbef3b702ec. -/
def record9 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 2, support := {5, 9, 10, 11} },
      { center := 5, support := {0, 4, 6, 11} },
      { center := 9, support := {0, 2, 3, 11} },
      { center := 11, support := {1, 2, 4, 5} }
    ]
    data := {
      p := 0
      q := 2
      r := 11
      a := 5
      b := 9
      ap_aq := { first := (5, 0), steps := [.row 5 0 11, .flip 5 11, .row 11 5 2, .flip 11 2, .row 2 11 5, .flip 2 5], last := (5, 2) }
      ap_ar := { first := (5, 0), steps := [.row 5 0 11], last := (5, 11) }
      bp_bq := { first := (9, 0), steps := [.row 9 0 2], last := (9, 2) }
      bp_br := { first := (9, 0), steps := [.row 9 0 11], last := (9, 11) } } }

/-- Journal iteration 11361; certificate 61db6dabcfdbda2d245d9a29a5530ea9318cc50be897a78312cfa9e3bd5357c1. -/
def record10 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 0, support := {3, 4, 5, 7} },
      { center := 2, support := {5, 9, 10, 11} },
      { center := 3, support := {0, 1, 7, 9} },
      { center := 5, support := {0, 4, 6, 11} },
      { center := 9, support := {0, 2, 3, 11} }
    ]
    data := {
      p := 0
      q := 2
      r := 11
      a := 5
      b := 9
      ap_aq := { first := (5, 0), steps := [.flip 5 0, .row 0 5 3, .flip 0 3, .row 3 0 9, .flip 3 9, .row 9 3 2, .flip 9 2, .row 2 9 5, .flip 2 5], last := (5, 2) }
      ap_ar := { first := (5, 0), steps := [.row 5 0 11], last := (5, 11) }
      bp_bq := { first := (9, 0), steps := [.row 9 0 2], last := (9, 2) }
      bp_br := { first := (9, 0), steps := [.row 9 0 11], last := (9, 11) } } }

/-- Journal iteration 11362; certificate 619ae4b9bb54eb6814263c35506bfbd4fcc7703af993149524a1cd5e1a1559dd. -/
def record11 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 0, support := {3, 4, 5, 7} },
      { center := 2, support := {5, 9, 10, 11} },
      { center := 3, support := {0, 1, 9, 10} },
      { center := 9, support := {0, 2, 4, 10} },
      { center := 10, support := {3, 5, 8, 9} }
    ]
    data := {
      p := 0
      q := 2
      r := 10
      a := 5
      b := 9
      ap_aq := { first := (5, 0), steps := [.flip 5 0, .row 0 5 3, .flip 0 3, .row 3 0 10, .flip 3 10, .row 10 3 9, .flip 10 9, .row 9 10 2, .flip 9 2, .row 2 9 5, .flip 2 5], last := (5, 2) }
      ap_ar := { first := (5, 0), steps := [.flip 5 0, .row 0 5 3, .flip 0 3, .row 3 0 10, .flip 3 10, .row 10 3 5, .flip 10 5], last := (5, 10) }
      bp_bq := { first := (9, 0), steps := [.row 9 0 2], last := (9, 2) }
      bp_br := { first := (9, 0), steps := [.row 9 0 10], last := (9, 10) } } }

/-- Journal iteration 11363; certificate d3477ae9e90b9ca8bcce4905d79b4fea54f9b0cc74b391891e622a2c03ad36bf. -/
def record12 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 0, support := {1, 4, 5, 9} },
      { center := 1, support := {0, 2, 6, 9} },
      { center := 2, support := {1, 7, 10, 11} },
      { center := 3, support := {0, 9, 10, 11} },
      { center := 4, support := {3, 5, 7, 8} },
      { center := 5, support := {0, 4, 7, 10} },
      { center := 9, support := {0, 2, 5, 11} },
      { center := 11, support := {2, 3, 4, 5} }
    ]
    data := {
      p := 0
      q := 3
      r := 5
      a := 4
      b := 9
      ap_aq := { first := (4, 0), steps := [.flip 4 0, .row 0 4 5, .flip 0 5, .row 5 0 4, .flip 5 4, .row 4 5 3], last := (4, 3) }
      ap_ar := { first := (4, 0), steps := [.flip 4 0, .row 0 4 5, .flip 0 5, .row 5 0 4, .flip 5 4], last := (4, 5) }
      bp_bq := { first := (9, 0), steps := [.flip 9 0, .row 0 9 1, .flip 0 1, .row 1 0 2, .flip 1 2, .row 2 1 11, .flip 2 11, .row 11 2 3, .flip 11 3, .row 3 11 9, .flip 3 9], last := (9, 3) }
      bp_br := { first := (9, 0), steps := [.row 9 0 5], last := (9, 5) } } }

/-- Journal iteration 11364; certificate 6a4a2c65a384b3c318c2b95eb94b23ff3c05d8e5472ee375120abaacc245f17e. -/
def record13 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 1, support := {0, 2, 6, 9} },
      { center := 2, support := {1, 7, 10, 11} },
      { center := 3, support := {0, 9, 10, 11} },
      { center := 10, support := {1, 2, 7, 8} }
    ]
    data := {
      p := 0
      q := 9
      r := 10
      a := 1
      b := 3
      ap_aq := { first := (1, 0), steps := [.row 1 0 9], last := (1, 9) }
      ap_ar := { first := (1, 0), steps := [.row 1 0 2, .flip 1 2, .row 2 1 10, .flip 2 10, .row 10 2 1, .flip 10 1], last := (1, 10) }
      bp_bq := { first := (3, 0), steps := [.row 3 0 9], last := (3, 9) }
      bp_br := { first := (3, 0), steps := [.row 3 0 10], last := (3, 10) } } }

/-- Journal iteration 11365; certificate 3c9aeafeb0aaf5c2a449b4fdf4bca3464d48d1c968c87399c343be311e88c795. -/
def record14 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 1, support := {0, 2, 6, 9} },
      { center := 2, support := {1, 7, 10, 11} },
      { center := 9, support := {0, 2, 5, 11} },
      { center := 11, support := {1, 2, 4, 7} }
    ]
    data := {
      p := 0
      q := 2
      r := 11
      a := 1
      b := 9
      ap_aq := { first := (1, 0), steps := [.row 1 0 2], last := (1, 2) }
      ap_ar := { first := (1, 0), steps := [.row 1 0 2, .flip 1 2, .row 2 1 11, .flip 2 11, .row 11 2 1, .flip 11 1], last := (1, 11) }
      bp_bq := { first := (9, 0), steps := [.row 9 0 2], last := (9, 2) }
      bp_br := { first := (9, 0), steps := [.row 9 0 11], last := (9, 11) } } }

/-- Journal iteration 11366; certificate bb59bf7ad775205bb9cf98a2e4ddca8ee49a2d5b6176cc1bbf314eede003653f. -/
def record15 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 1, support := {0, 2, 6, 9} },
      { center := 2, support := {1, 7, 10, 11} },
      { center := 3, support := {0, 9, 10, 11} },
      { center := 9, support := {0, 2, 5, 11} },
      { center := 10, support := {2, 3, 5, 8} },
      { center := 11, support := {1, 3, 4, 10} }
    ]
    data := {
      p := 0
      q := 2
      r := 11
      a := 1
      b := 9
      ap_aq := { first := (1, 0), steps := [.row 1 0 2], last := (1, 2) }
      ap_ar := { first := (1, 0), steps := [.row 1 0 2, .flip 1 2, .row 2 1 10, .flip 2 10, .row 10 2 3, .flip 10 3, .row 3 10 11, .flip 3 11, .row 11 3 1, .flip 11 1], last := (1, 11) }
      bp_bq := { first := (9, 0), steps := [.row 9 0 2], last := (9, 2) }
      bp_br := { first := (9, 0), steps := [.row 9 0 11], last := (9, 11) } } }

/-- Journal iteration 11367; certificate 64f52834fef4b2d562f297998497c3a9affdb4325f5a1465b640907ea359a0e8. -/
def record16 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 0, support := {1, 4, 5, 9} },
      { center := 1, support := {0, 2, 6, 9} },
      { center := 2, support := {1, 7, 10, 11} },
      { center := 3, support := {0, 9, 10, 11} },
      { center := 6, support := {2, 3, 9, 11} },
      { center := 9, support := {0, 2, 5, 11} },
      { center := 10, support := {2, 3, 5, 8} },
      { center := 11, support := {3, 4, 5, 6} }
    ]
    data := {
      p := 0
      q := 2
      r := 6
      a := 1
      b := 9
      ap_aq := { first := (1, 0), steps := [.row 1 0 2], last := (1, 2) }
      ap_ar := { first := (1, 0), steps := [.row 1 0 6], last := (1, 6) }
      bp_bq := { first := (9, 0), steps := [.row 9 0 2], last := (9, 2) }
      bp_br := { first := (9, 0), steps := [.flip 9 0, .row 0 9 1, .flip 0 1, .row 1 0 2, .flip 1 2, .row 2 1 10, .flip 2 10, .row 10 2 3, .flip 10 3, .row 3 10 11, .flip 3 11, .row 11 3 6, .flip 11 6, .row 6 11 9, .flip 6 9], last := (9, 6) } } }

/-- Journal iteration 11368; certificate 8b5d219fee5753923c9822abb9f736a710065a3a42eb7f99d8452909089e6e3f. -/
def record17 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 0, support := {1, 4, 5, 9} },
      { center := 1, support := {0, 2, 6, 9} },
      { center := 2, support := {1, 7, 10, 11} },
      { center := 3, support := {0, 9, 10, 11} },
      { center := 9, support := {0, 2, 5, 11} },
      { center := 10, support := {2, 3, 5, 8} },
      { center := 11, support := {0, 3, 5, 7} }
    ]
    data := {
      p := 0
      q := 2
      r := 3
      a := 9
      b := 11
      ap_aq := { first := (9, 0), steps := [.row 9 0 2], last := (9, 2) }
      ap_ar := { first := (9, 0), steps := [.flip 9 0, .row 0 9 1, .flip 0 1, .row 1 0 2, .flip 1 2, .row 2 1 10, .flip 2 10, .row 10 2 3, .flip 10 3, .row 3 10 9, .flip 3 9], last := (9, 3) }
      bp_bq := { first := (11, 0), steps := [.row 11 0 3, .flip 11 3, .row 3 11 10, .flip 3 10, .row 10 3 2, .flip 10 2, .row 2 10 11, .flip 2 11], last := (11, 2) }
      bp_br := { first := (11, 0), steps := [.row 11 0 3], last := (11, 3) } } }

/-- Journal iteration 11369; certificate df34adf7f55d00ba183194f768722a977a90ad909f5b92cf328adc57b25f1e91. -/
def record18 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 0, support := {1, 4, 5, 9} },
      { center := 3, support := {0, 9, 10, 11} },
      { center := 4, support := {3, 7, 8, 11} },
      { center := 5, support := {0, 4, 7, 10} },
      { center := 9, support := {0, 2, 5, 11} },
      { center := 10, support := {2, 3, 5, 8} },
      { center := 11, support := {3, 4, 5, 7} }
    ]
    data := {
      p := 0
      q := 3
      r := 5
      a := 4
      b := 9
      ap_aq := { first := (4, 0), steps := [.flip 4 0, .row 0 4 5, .flip 0 5, .row 5 0 10, .flip 5 10, .row 10 5 3, .flip 10 3, .row 3 10 11, .flip 3 11, .row 11 3 4, .flip 11 4, .row 4 11 3], last := (4, 3) }
      ap_ar := { first := (4, 0), steps := [.flip 4 0, .row 0 4 5, .flip 0 5, .row 5 0 4, .flip 5 4], last := (4, 5) }
      bp_bq := { first := (9, 0), steps := [.flip 9 0, .row 0 9 5, .flip 0 5, .row 5 0 10, .flip 5 10, .row 10 5 3, .flip 10 3, .row 3 10 9, .flip 3 9], last := (9, 3) }
      bp_br := { first := (9, 0), steps := [.row 9 0 5], last := (9, 5) } } }

/-- Journal iteration 11370; certificate 2736b653fc4758eee439993c4972d1c458f13d55e20756ae884f4862454ec9b8. -/
def record19 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 1, support := {0, 2, 6, 9} },
      { center := 2, support := {1, 7, 10, 11} },
      { center := 3, support := {0, 9, 10, 11} },
      { center := 9, support := {0, 2, 5, 11} },
      { center := 10, support := {2, 3, 5, 8} },
      { center := 11, support := {1, 3, 5, 10} }
    ]
    data := {
      p := 0
      q := 2
      r := 11
      a := 1
      b := 9
      ap_aq := { first := (1, 0), steps := [.row 1 0 2], last := (1, 2) }
      ap_ar := { first := (1, 0), steps := [.row 1 0 2, .flip 1 2, .row 2 1 10, .flip 2 10, .row 10 2 3, .flip 10 3, .row 3 10 11, .flip 3 11, .row 11 3 1, .flip 11 1], last := (1, 11) }
      bp_bq := { first := (9, 0), steps := [.row 9 0 2], last := (9, 2) }
      bp_br := { first := (9, 0), steps := [.row 9 0 11], last := (9, 11) } } }

/-- Journal iteration 11371; certificate 29a3f167b10ec914b13f6ceab8fda9787b9b9b6a8e40c75436b5f745589601c5. -/
def record20 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 0, support := {1, 4, 5, 9} },
      { center := 3, support := {0, 9, 10, 11} },
      { center := 4, support := {3, 7, 8, 11} },
      { center := 5, support := {0, 4, 7, 10} },
      { center := 9, support := {0, 2, 5, 11} },
      { center := 10, support := {2, 3, 5, 8} },
      { center := 11, support := {3, 4, 5, 10} }
    ]
    data := {
      p := 0
      q := 3
      r := 5
      a := 4
      b := 9
      ap_aq := { first := (4, 0), steps := [.flip 4 0, .row 0 4 5, .flip 0 5, .row 5 0 10, .flip 5 10, .row 10 5 3, .flip 10 3, .row 3 10 11, .flip 3 11, .row 11 3 4, .flip 11 4, .row 4 11 3], last := (4, 3) }
      ap_ar := { first := (4, 0), steps := [.flip 4 0, .row 0 4 5, .flip 0 5, .row 5 0 4, .flip 5 4], last := (4, 5) }
      bp_bq := { first := (9, 0), steps := [.flip 9 0, .row 0 9 5, .flip 0 5, .row 5 0 10, .flip 5 10, .row 10 5 3, .flip 10 3, .row 3 10 9, .flip 3 9], last := (9, 3) }
      bp_br := { first := (9, 0), steps := [.row 9 0 5], last := (9, 5) } } }

/-- Journal iteration 11372; certificate e54a7dabc4c501c40b1f5d52af31006a5eb386888abe122965c7feee8f81c548. -/
def record21 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 0, support := {1, 4, 5, 9} },
      { center := 1, support := {0, 2, 6, 9} },
      { center := 2, support := {1, 7, 10, 11} },
      { center := 3, support := {0, 9, 10, 11} },
      { center := 6, support := {2, 3, 9, 11} },
      { center := 9, support := {0, 2, 5, 11} },
      { center := 10, support := {2, 3, 5, 8} },
      { center := 11, support := {3, 4, 6, 7} }
    ]
    data := {
      p := 0
      q := 2
      r := 6
      a := 1
      b := 9
      ap_aq := { first := (1, 0), steps := [.row 1 0 2], last := (1, 2) }
      ap_ar := { first := (1, 0), steps := [.row 1 0 6], last := (1, 6) }
      bp_bq := { first := (9, 0), steps := [.row 9 0 2], last := (9, 2) }
      bp_br := { first := (9, 0), steps := [.flip 9 0, .row 0 9 1, .flip 0 1, .row 1 0 2, .flip 1 2, .row 2 1 10, .flip 2 10, .row 10 2 3, .flip 10 3, .row 3 10 11, .flip 3 11, .row 11 3 6, .flip 11 6, .row 6 11 9, .flip 6 9], last := (9, 6) } } }

/-- Journal iteration 11373; certificate 58ae490eda8283f4f79933a2a78af97dbe2a7572269556f0417a72725f134846. -/
def record22 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 0, support := {1, 4, 5, 9} },
      { center := 1, support := {0, 2, 6, 9} },
      { center := 2, support := {1, 7, 10, 11} },
      { center := 3, support := {0, 9, 10, 11} },
      { center := 6, support := {2, 3, 9, 11} },
      { center := 9, support := {0, 2, 5, 11} },
      { center := 10, support := {2, 3, 5, 8} },
      { center := 11, support := {3, 5, 6, 7} }
    ]
    data := {
      p := 0
      q := 2
      r := 6
      a := 1
      b := 9
      ap_aq := { first := (1, 0), steps := [.row 1 0 2], last := (1, 2) }
      ap_ar := { first := (1, 0), steps := [.row 1 0 6], last := (1, 6) }
      bp_bq := { first := (9, 0), steps := [.row 9 0 2], last := (9, 2) }
      bp_br := { first := (9, 0), steps := [.flip 9 0, .row 0 9 1, .flip 0 1, .row 1 0 2, .flip 1 2, .row 2 1 10, .flip 2 10, .row 10 2 3, .flip 10 3, .row 3 10 11, .flip 3 11, .row 11 3 6, .flip 11 6, .row 6 11 9, .flip 6 9], last := (9, 6) } } }

/-- Journal iteration 11374; certificate 350f98ed64dd584a74ec28a2438632c0439a125c40c3f638da99f89433a33ed7. -/
def record23 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 0, support := {1, 4, 5, 9} },
      { center := 3, support := {0, 9, 10, 11} },
      { center := 5, support := {0, 4, 7, 10} },
      { center := 9, support := {0, 2, 5, 11} }
    ]
    data := {
      p := 0
      q := 9
      r := 10
      a := 3
      b := 5
      ap_aq := { first := (3, 0), steps := [.row 3 0 9], last := (3, 9) }
      ap_ar := { first := (3, 0), steps := [.row 3 0 10], last := (3, 10) }
      bp_bq := { first := (5, 0), steps := [.flip 5 0, .row 0 5 9, .flip 0 9, .row 9 0 5, .flip 9 5], last := (5, 9) }
      bp_br := { first := (5, 0), steps := [.row 5 0 10], last := (5, 10) } } }

/-- Journal iteration 11375; certificate 690931a28a27e42e8ef40573985fc04b3bc65024f20521d6e35381853b462835. -/
def record24 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 0, support := {1, 4, 5, 9} },
      { center := 1, support := {2, 6, 8, 9} },
      { center := 2, support := {1, 7, 10, 11} },
      { center := 5, support := {0, 4, 7, 10} },
      { center := 8, support := {1, 3, 6, 9} },
      { center := 9, support := {0, 2, 4, 11} },
      { center := 10, support := {2, 4, 5, 8} }
    ]
    data := {
      p := 0
      q := 2
      r := 8
      a := 1
      b := 9
      ap_aq := { first := (1, 0), steps := [.flip 1 0, .row 0 1 5, .flip 0 5, .row 5 0 10, .flip 5 10, .row 10 5 2, .flip 10 2, .row 2 10 1, .flip 2 1], last := (1, 2) }
      ap_ar := { first := (1, 0), steps := [.flip 1 0, .row 0 1 5, .flip 0 5, .row 5 0 10, .flip 5 10, .row 10 5 2, .flip 10 2, .row 2 10 1, .flip 2 1, .row 1 2 8], last := (1, 8) }
      bp_bq := { first := (9, 0), steps := [.row 9 0 2], last := (9, 2) }
      bp_br := { first := (9, 0), steps := [.flip 9 0, .row 0 9 5, .flip 0 5, .row 5 0 10, .flip 5 10, .row 10 5 2, .flip 10 2, .row 2 10 1, .flip 2 1, .row 1 2 8, .flip 1 8, .row 8 1 9, .flip 8 9], last := (9, 8) } } }

/-- Journal iteration 11376; certificate 61bc4462ee64dd307041a02e089670f5490d1e607dc82eb253dc83bc86b7e398. -/
def record25 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 0, support := {1, 4, 5, 9} },
      { center := 4, support := {3, 5, 7, 8} },
      { center := 5, support := {0, 4, 7, 10} },
      { center := 11, support := {0, 1, 3, 5} }
    ]
    data := {
      p := 0
      q := 3
      r := 5
      a := 4
      b := 11
      ap_aq := { first := (4, 0), steps := [.flip 4 0, .row 0 4 5, .flip 0 5, .row 5 0 4, .flip 5 4, .row 4 5 3], last := (4, 3) }
      ap_ar := { first := (4, 0), steps := [.flip 4 0, .row 0 4 5, .flip 0 5, .row 5 0 4, .flip 5 4], last := (4, 5) }
      bp_bq := { first := (11, 0), steps := [.row 11 0 3], last := (11, 3) }
      bp_br := { first := (11, 0), steps := [.row 11 0 5], last := (11, 5) } } }

/-- Journal iteration 11377; certificate 1d1968a4aa83f4e6f75171e9ca131c37817d5338ba49da5b72359f1c45bcf209. -/
def record26 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 0, support := {3, 4, 5, 11} },
      { center := 3, support := {0, 7, 9, 11} },
      { center := 9, support := {0, 2, 10, 11} },
      { center := 11, support := {2, 3, 7, 9} }
    ]
    data := {
      p := 0
      q := 2
      r := 3
      a := 9
      b := 11
      ap_aq := { first := (9, 0), steps := [.row 9 0 2], last := (9, 2) }
      ap_ar := { first := (9, 0), steps := [.row 9 0 11, .flip 9 11, .row 11 9 3, .flip 11 3, .row 3 11 9, .flip 3 9], last := (9, 3) }
      bp_bq := { first := (11, 0), steps := [.flip 11 0, .row 0 11 3, .flip 0 3, .row 3 0 11, .flip 3 11, .row 11 3 2], last := (11, 2) }
      bp_br := { first := (11, 0), steps := [.flip 11 0, .row 0 11 3, .flip 0 3, .row 3 0 11, .flip 3 11], last := (11, 3) } } }

/-- Journal iteration 11378; certificate ed6e457c59851cd0cf2e8c90e78822c7b72b815f44a99a26902961d0ffa3c055. -/
def record27 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 0, support := {3, 4, 5, 10} },
      { center := 2, support := {3, 6, 10, 11} },
      { center := 3, support := {0, 7, 9, 11} },
      { center := 4, support := {2, 5, 8, 10} },
      { center := 9, support := {0, 2, 10, 11} },
      { center := 10, support := {4, 5, 8, 9} },
      { center := 11, support := {2, 3, 7, 9} }
    ]
    data := {
      p := 0
      q := 2
      r := 5
      a := 4
      b := 10
      ap_aq := { first := (4, 0), steps := [.flip 4 0, .row 0 4 3, .flip 0 3, .row 3 0 11, .flip 3 11, .row 11 3 9, .flip 11 9, .row 9 11 10, .flip 9 10, .row 10 9 4, .flip 10 4, .row 4 10 2], last := (4, 2) }
      ap_ar := { first := (4, 0), steps := [.flip 4 0, .row 0 4 3, .flip 0 3, .row 3 0 11, .flip 3 11, .row 11 3 9, .flip 11 9, .row 9 11 10, .flip 9 10, .row 10 9 4, .flip 10 4, .row 4 10 5], last := (4, 5) }
      bp_bq := { first := (10, 0), steps := [.flip 10 0, .row 0 10 3, .flip 0 3, .row 3 0 11, .flip 3 11, .row 11 3 2, .flip 11 2, .row 2 11 10, .flip 2 10], last := (10, 2) }
      bp_br := { first := (10, 0), steps := [.flip 10 0, .row 0 10 3, .flip 0 3, .row 3 0 11, .flip 3 11, .row 11 3 9, .flip 11 9, .row 9 11 10, .flip 9 10, .row 10 9 5], last := (10, 5) } } }

/-- Journal iteration 11379; certificate a5b0e9ca5501d8f8e66e2ea8b84f01090809625bbbed3e257e0ed4a857c7fe1f. -/
def record28 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 0, support := {1, 4, 5, 9} },
      { center := 4, support := {3, 5, 7, 8} },
      { center := 5, support := {0, 4, 7, 10} },
      { center := 9, support := {0, 2, 4, 5} }
    ]
    data := {
      p := 0
      q := 7
      r := 9
      a := 4
      b := 5
      ap_aq := { first := (4, 0), steps := [.flip 4 0, .row 0 4 5, .flip 0 5, .row 5 0 4, .flip 5 4, .row 4 5 7], last := (4, 7) }
      ap_ar := { first := (4, 0), steps := [.flip 4 0, .row 0 4 9, .flip 0 9, .row 9 0 4, .flip 9 4], last := (4, 9) }
      bp_bq := { first := (5, 0), steps := [.row 5 0 7], last := (5, 7) }
      bp_br := { first := (5, 0), steps := [.flip 5 0, .row 0 5 9, .flip 0 9, .row 9 0 5, .flip 9 5], last := (5, 9) } } }

/-- Journal iteration 11380; certificate 324030fb1ade50eb40564857f80bfbaa93d6a1d66cd950ee5f686def3769b558. -/
def record29 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 0, support := {1, 4, 5, 9} },
      { center := 3, support := {0, 9, 10, 11} },
      { center := 5, support := {0, 4, 7, 10} },
      { center := 9, support := {0, 2, 4, 5} }
    ]
    data := {
      p := 0
      q := 9
      r := 10
      a := 3
      b := 5
      ap_aq := { first := (3, 0), steps := [.row 3 0 9], last := (3, 9) }
      ap_ar := { first := (3, 0), steps := [.row 3 0 10], last := (3, 10) }
      bp_bq := { first := (5, 0), steps := [.flip 5 0, .row 0 5 9, .flip 0 9, .row 9 0 5, .flip 9 5], last := (5, 9) }
      bp_br := { first := (5, 0), steps := [.row 5 0 10], last := (5, 10) } } }

/-- Journal iteration 11381; certificate b95c64537b489d2887b29cb2e5cb24fcf706343d1c894d538ba86824fe4df532. -/
def record30 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 0, support := {1, 4, 5, 9} },
      { center := 1, support := {2, 6, 8, 9} },
      { center := 2, support := {1, 7, 10, 11} },
      { center := 5, support := {0, 4, 7, 10} },
      { center := 8, support := {1, 3, 6, 9} },
      { center := 9, support := {0, 2, 4, 11} },
      { center := 10, support := {2, 5, 7, 8} }
    ]
    data := {
      p := 0
      q := 2
      r := 8
      a := 1
      b := 9
      ap_aq := { first := (1, 0), steps := [.flip 1 0, .row 0 1 5, .flip 0 5, .row 5 0 10, .flip 5 10, .row 10 5 2, .flip 10 2, .row 2 10 1, .flip 2 1], last := (1, 2) }
      ap_ar := { first := (1, 0), steps := [.flip 1 0, .row 0 1 5, .flip 0 5, .row 5 0 10, .flip 5 10, .row 10 5 2, .flip 10 2, .row 2 10 1, .flip 2 1, .row 1 2 8], last := (1, 8) }
      bp_bq := { first := (9, 0), steps := [.row 9 0 2], last := (9, 2) }
      bp_br := { first := (9, 0), steps := [.flip 9 0, .row 0 9 5, .flip 0 5, .row 5 0 10, .flip 5 10, .row 10 5 2, .flip 10 2, .row 2 10 1, .flip 2 1, .row 1 2 8, .flip 1 8, .row 8 1 9, .flip 8 9], last := (9, 8) } } }

/-- Journal iteration 11382; certificate 4ff877fb161d3f5a40a03f1a6f945cf544365b2d48b130f1496ebbff6d3f1595. -/
def record31 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 0, support := {1, 4, 5, 9} },
      { center := 1, support := {2, 6, 8, 9} },
      { center := 2, support := {1, 7, 10, 11} },
      { center := 3, support := {0, 9, 10, 11} },
      { center := 5, support := {0, 4, 7, 10} },
      { center := 9, support := {0, 2, 4, 11} },
      { center := 10, support := {2, 3, 5, 8} },
      { center := 11, support := {0, 1, 3, 7} }
    ]
    data := {
      p := 0
      q := 1
      r := 2
      a := 9
      b := 11
      ap_aq := { first := (9, 0), steps := [.flip 9 0, .row 0 9 5, .flip 0 5, .row 5 0 10, .flip 5 10, .row 10 5 2, .flip 10 2, .row 2 10 1, .flip 2 1, .row 1 2 9, .flip 1 9], last := (9, 1) }
      ap_ar := { first := (9, 0), steps := [.row 9 0 2], last := (9, 2) }
      bp_bq := { first := (11, 0), steps := [.row 11 0 1], last := (11, 1) }
      bp_br := { first := (11, 0), steps := [.row 11 0 3, .flip 11 3, .row 3 11 10, .flip 3 10, .row 10 3 2, .flip 10 2, .row 2 10 11, .flip 2 11], last := (11, 2) } } }

/-- Journal iteration 11383; certificate 502ee7928e41c277d63722f999689d7d9ad307d4b0da405f3a402ecce0e414f2. -/
def record32 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 0, support := {1, 4, 5, 9} },
      { center := 1, support := {2, 6, 8, 9} },
      { center := 2, support := {1, 7, 10, 11} },
      { center := 5, support := {0, 4, 7, 10} },
      { center := 8, support := {1, 3, 6, 9} },
      { center := 9, support := {0, 2, 4, 11} },
      { center := 10, support := {2, 3, 5, 8} }
    ]
    data := {
      p := 0
      q := 2
      r := 8
      a := 1
      b := 9
      ap_aq := { first := (1, 0), steps := [.flip 1 0, .row 0 1 5, .flip 0 5, .row 5 0 10, .flip 5 10, .row 10 5 2, .flip 10 2, .row 2 10 1, .flip 2 1], last := (1, 2) }
      ap_ar := { first := (1, 0), steps := [.flip 1 0, .row 0 1 5, .flip 0 5, .row 5 0 10, .flip 5 10, .row 10 5 2, .flip 10 2, .row 2 10 1, .flip 2 1, .row 1 2 8], last := (1, 8) }
      bp_bq := { first := (9, 0), steps := [.row 9 0 2], last := (9, 2) }
      bp_br := { first := (9, 0), steps := [.flip 9 0, .row 0 9 5, .flip 0 5, .row 5 0 10, .flip 5 10, .row 10 5 2, .flip 10 2, .row 2 10 1, .flip 2 1, .row 1 2 8, .flip 1 8, .row 8 1 9, .flip 8 9], last := (9, 8) } } }

/-- Journal iteration 11384; certificate 6e9f692d8e2b24f782d2987fc5d2e083491fa4ce8dbb451b258ef9bf0f926dbb. -/
def record33 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 0, support := {3, 4, 5, 10} },
      { center := 1, support := {0, 2, 6, 8} },
      { center := 5, support := {0, 4, 7, 10} },
      { center := 10, support := {1, 2, 5, 8} }
    ]
    data := {
      p := 0
      q := 2
      r := 8
      a := 1
      b := 10
      ap_aq := { first := (1, 0), steps := [.row 1 0 2], last := (1, 2) }
      ap_ar := { first := (1, 0), steps := [.row 1 0 8], last := (1, 8) }
      bp_bq := { first := (10, 0), steps := [.flip 10 0, .row 0 10 5, .flip 0 5, .row 5 0 10, .flip 5 10, .row 10 5 2], last := (10, 2) }
      bp_br := { first := (10, 0), steps := [.flip 10 0, .row 0 10 5, .flip 0 5, .row 5 0 10, .flip 5 10, .row 10 5 8], last := (10, 8) } } }

/-- Journal iteration 11385; certificate 91faabff8b7b4742e9d13786510020d58b41e2e330161363a6212d228a556d9f. -/
def record34 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 0, support := {3, 4, 5, 10} },
      { center := 1, support := {0, 2, 8, 9} },
      { center := 5, support := {0, 4, 7, 10} },
      { center := 10, support := {1, 2, 5, 8} }
    ]
    data := {
      p := 0
      q := 2
      r := 8
      a := 1
      b := 10
      ap_aq := { first := (1, 0), steps := [.row 1 0 2], last := (1, 2) }
      ap_ar := { first := (1, 0), steps := [.row 1 0 8], last := (1, 8) }
      bp_bq := { first := (10, 0), steps := [.flip 10 0, .row 0 10 5, .flip 0 5, .row 5 0 10, .flip 5 10, .row 10 5 2], last := (10, 2) }
      bp_br := { first := (10, 0), steps := [.flip 10 0, .row 0 10 5, .flip 0 5, .row 5 0 10, .flip 5 10, .row 10 5 8], last := (10, 8) } } }

/-- Journal iteration 11386; certificate 9e4e434fb03279becd59659b081fa33c5640ffa6034847558473723787f33092. -/
def record35 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 1, support := {0, 2, 6, 8} },
      { center := 2, support := {1, 7, 10, 11} },
      { center := 9, support := {0, 2, 4, 11} },
      { center := 11, support := {1, 2, 4, 5} }
    ]
    data := {
      p := 0
      q := 2
      r := 11
      a := 1
      b := 9
      ap_aq := { first := (1, 0), steps := [.row 1 0 2], last := (1, 2) }
      ap_ar := { first := (1, 0), steps := [.row 1 0 2, .flip 1 2, .row 2 1 11, .flip 2 11, .row 11 2 1, .flip 11 1], last := (1, 11) }
      bp_bq := { first := (9, 0), steps := [.row 9 0 2], last := (9, 2) }
      bp_br := { first := (9, 0), steps := [.row 9 0 11], last := (9, 11) } } }

/-- Journal iteration 11387; certificate b8fe2e9be8588348eed3f122ee6ed1cfb758b244075d9319a71b1c4359539584. -/
def record36 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 0, support := {3, 4, 5, 10} },
      { center := 3, support := {0, 9, 10, 11} },
      { center := 4, support := {3, 5, 7, 8} },
      { center := 5, support := {0, 4, 7, 10} }
    ]
    data := {
      p := 0
      q := 3
      r := 5
      a := 4
      b := 10
      ap_aq := { first := (4, 0), steps := [.flip 4 0, .row 0 4 5, .flip 0 5, .row 5 0 4, .flip 5 4, .row 4 5 3], last := (4, 3) }
      ap_ar := { first := (4, 0), steps := [.flip 4 0, .row 0 4 5, .flip 0 5, .row 5 0 4, .flip 5 4], last := (4, 5) }
      bp_bq := { first := (10, 0), steps := [.flip 10 0, .row 0 10 3, .flip 0 3, .row 3 0 10, .flip 3 10], last := (10, 3) }
      bp_br := { first := (10, 0), steps := [.flip 10 0, .row 0 10 5, .flip 0 5, .row 5 0 10, .flip 5 10], last := (10, 5) } } }

/-- Journal iteration 11388; certificate 8e1da365a74d180ac14ff9bd2ad06974dae4b8004a2ebb232ae43bfab161efdd. -/
def record37 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 4, support := {3, 7, 8, 11} },
      { center := 6, support := {2, 3, 9, 11} },
      { center := 7, support := {3, 4, 6, 8} },
      { center := 11, support := {1, 4, 5, 6} }
    ]
    data := {
      p := 3
      q := 7
      r := 11
      a := 4
      b := 6
      ap_aq := { first := (4, 3), steps := [.row 4 3 7], last := (4, 7) }
      ap_ar := { first := (4, 3), steps := [.row 4 3 11], last := (4, 11) }
      bp_bq := { first := (6, 3), steps := [.row 6 3 11, .flip 6 11, .row 11 6 4, .flip 11 4, .row 4 11 7, .flip 4 7, .row 7 4 6, .flip 7 6], last := (6, 7) }
      bp_br := { first := (6, 3), steps := [.row 6 3 11], last := (6, 11) } } }

/-- Journal iteration 11389; certificate 56ecda4a55edc17f55778c2a1cb40a3ac2ee6926493cbc0abbc8756b3ca8e7fd. -/
def record38 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 2, support := {3, 6, 10, 11} },
      { center := 6, support := {0, 7, 8, 10} },
      { center := 9, support := {0, 2, 4, 10} },
      { center := 10, support := {2, 6, 7, 11} }
    ]
    data := {
      p := 0
      q := 2
      r := 10
      a := 6
      b := 9
      ap_aq := { first := (6, 0), steps := [.row 6 0 10, .flip 6 10, .row 10 6 2, .flip 10 2, .row 2 10 6, .flip 2 6], last := (6, 2) }
      ap_ar := { first := (6, 0), steps := [.row 6 0 10], last := (6, 10) }
      bp_bq := { first := (9, 0), steps := [.row 9 0 2], last := (9, 2) }
      bp_br := { first := (9, 0), steps := [.row 9 0 10], last := (9, 10) } } }

/-- Journal iteration 11390; certificate 692753786e27b5e23ed05a9744774865834d04b478f735bb11af8c7387244c00. -/
def record39 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 0, support := {3, 5, 9, 10} },
      { center := 3, support := {0, 4, 5, 9} },
      { center := 5, support := {0, 1, 6, 11} },
      { center := 9, support := {0, 2, 4, 10} },
      { center := 10, support := {2, 3, 4, 11} },
      { center := 11, support := {2, 5, 7, 10} }
    ]
    data := {
      p := 0
      q := 2
      r := 3
      a := 9
      b := 10
      ap_aq := { first := (9, 0), steps := [.row 9 0 2], last := (9, 2) }
      ap_ar := { first := (9, 0), steps := [.flip 9 0, .row 0 9 3, .flip 0 3, .row 3 0 9, .flip 3 9], last := (9, 3) }
      bp_bq := { first := (10, 0), steps := [.flip 10 0, .row 0 10 5, .flip 0 5, .row 5 0 11, .flip 5 11, .row 11 5 10, .flip 11 10, .row 10 11 2], last := (10, 2) }
      bp_br := { first := (10, 0), steps := [.flip 10 0, .row 0 10 5, .flip 0 5, .row 5 0 11, .flip 5 11, .row 11 5 10, .flip 11 10, .row 10 11 3], last := (10, 3) } } }

/-- Journal iteration 11391; certificate 7052af03cef8a5404a9ed5beac446972ea3538ff002dc6cf44362166ca1c6c13. -/
def record40 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 0, support := {3, 5, 9, 10} },
      { center := 3, support := {0, 4, 5, 9} },
      { center := 9, support := {0, 2, 4, 10} },
      { center := 10, support := {2, 3, 4, 11} }
    ]
    data := {
      p := 2
      q := 3
      r := 4
      a := 9
      b := 10
      ap_aq := { first := (9, 2), steps := [.row 9 2 0, .flip 9 0, .row 0 9 3, .flip 0 3, .row 3 0 9, .flip 3 9], last := (9, 3) }
      ap_ar := { first := (9, 2), steps := [.row 9 2 4], last := (9, 4) }
      bp_bq := { first := (10, 2), steps := [.row 10 2 3], last := (10, 3) }
      bp_br := { first := (10, 2), steps := [.row 10 2 4], last := (10, 4) } } }

/-- Journal iteration 11392; certificate 45ab8e47db11bc577fd52e0ff2a7e1c1c2f76b07e0e3d1a72f0519fee3040340. -/
def record41 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 0, support := {3, 5, 8, 10} },
      { center := 2, support := {3, 6, 10, 11} },
      { center := 3, support := {0, 4, 5, 9} },
      { center := 5, support := {0, 1, 6, 11} },
      { center := 9, support := {0, 2, 4, 10} },
      { center := 10, support := {2, 3, 4, 11} },
      { center := 11, support := {5, 7, 9, 10} }
    ]
    data := {
      p := 0
      q := 2
      r := 4
      a := 3
      b := 9
      ap_aq := { first := (3, 0), steps := [.flip 3 0, .row 0 3 5, .flip 0 5, .row 5 0 11, .flip 5 11, .row 11 5 10, .flip 11 10, .row 10 11 2, .flip 10 2, .row 2 10 3, .flip 2 3], last := (3, 2) }
      ap_ar := { first := (3, 0), steps := [.row 3 0 4], last := (3, 4) }
      bp_bq := { first := (9, 0), steps := [.row 9 0 2], last := (9, 2) }
      bp_br := { first := (9, 0), steps := [.row 9 0 4], last := (9, 4) } } }

/-- Journal iteration 11393; certificate c6eb59c66633690496360b63693c8768c98b9a93bc67323b9845c2db83a6f214. -/
def record42 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 2, support := {3, 6, 10, 11} },
      { center := 4, support := {2, 5, 8, 11} },
      { center := 6, support := {0, 7, 8, 10} },
      { center := 7, support := {3, 4, 6, 8} },
      { center := 8, support := {1, 4, 6, 9} },
      { center := 10, support := {2, 3, 4, 11} },
      { center := 11, support := {5, 7, 9, 10} }
    ]
    data := {
      p := 2
      q := 5
      r := 7
      a := 4
      b := 11
      ap_aq := { first := (4, 2), steps := [.row 4 2 5], last := (4, 5) }
      ap_ar := { first := (4, 2), steps := [.row 4 2 8, .flip 4 8, .row 8 4 6, .flip 8 6, .row 6 8 7, .flip 6 7, .row 7 6 4, .flip 7 4], last := (4, 7) }
      bp_bq := { first := (11, 2), steps := [.flip 11 2, .row 2 11 10, .flip 2 10, .row 10 2 11, .flip 10 11, .row 11 10 5], last := (11, 5) }
      bp_br := { first := (11, 2), steps := [.flip 11 2, .row 2 11 10, .flip 2 10, .row 10 2 11, .flip 10 11, .row 11 10 7], last := (11, 7) } } }

/-- Journal iteration 11394; certificate ef022df968f3a553f8e097b68186e12eb2d9b6e746288e4a5b7176e7a90bd876. -/
def record43 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 0, support := {3, 5, 8, 10} },
      { center := 2, support := {3, 6, 10, 11} },
      { center := 3, support := {0, 4, 5, 9} },
      { center := 5, support := {0, 1, 6, 11} },
      { center := 9, support := {0, 2, 4, 10} },
      { center := 11, support := {2, 5, 7, 10} }
    ]
    data := {
      p := 0
      q := 2
      r := 4
      a := 3
      b := 9
      ap_aq := { first := (3, 0), steps := [.flip 3 0, .row 0 3 5, .flip 0 5, .row 5 0 11, .flip 5 11, .row 11 5 2, .flip 11 2, .row 2 11 3, .flip 2 3], last := (3, 2) }
      ap_ar := { first := (3, 0), steps := [.row 3 0 4], last := (3, 4) }
      bp_bq := { first := (9, 0), steps := [.row 9 0 2], last := (9, 2) }
      bp_br := { first := (9, 0), steps := [.row 9 0 4], last := (9, 4) } } }

/-- Journal iteration 11395; certificate 7a110760654e7ca4f61a62321c3f3203d22f30da2d3e3c2738b76347ab2672e3. -/
def record44 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 4, support := {2, 5, 8, 11} },
      { center := 6, support := {0, 7, 8, 10} },
      { center := 7, support := {3, 4, 6, 8} },
      { center := 8, support := {1, 4, 6, 9} },
      { center := 11, support := {2, 5, 7, 10} }
    ]
    data := {
      p := 2
      q := 5
      r := 7
      a := 4
      b := 11
      ap_aq := { first := (4, 2), steps := [.row 4 2 5], last := (4, 5) }
      ap_ar := { first := (4, 2), steps := [.row 4 2 8, .flip 4 8, .row 8 4 6, .flip 8 6, .row 6 8 7, .flip 6 7, .row 7 6 4, .flip 7 4], last := (4, 7) }
      bp_bq := { first := (11, 2), steps := [.row 11 2 5], last := (11, 5) }
      bp_br := { first := (11, 2), steps := [.row 11 2 7], last := (11, 7) } } }

/-- Journal iteration 11396; certificate df8e2372753701a30c8f1db545e43f7fc25c35fa784b53f2ef18f1f0786ef399. -/
def record45 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 0, support := {3, 5, 8, 10} },
      { center := 2, support := {3, 6, 10, 11} },
      { center := 3, support := {0, 4, 5, 9} },
      { center := 5, support := {0, 1, 6, 11} }
    ]
    data := {
      p := 3
      q := 6
      r := 11
      a := 2
      b := 5
      ap_aq := { first := (2, 3), steps := [.row 2 3 6], last := (2, 6) }
      ap_ar := { first := (2, 3), steps := [.row 2 3 11], last := (2, 11) }
      bp_bq := { first := (5, 3), steps := [.flip 5 3, .row 3 5 0, .flip 3 0, .row 0 3 5, .flip 0 5, .row 5 0 6], last := (5, 6) }
      bp_br := { first := (5, 3), steps := [.flip 5 3, .row 3 5 0, .flip 3 0, .row 0 3 5, .flip 0 5, .row 5 0 11], last := (5, 11) } } }

/-- Journal iteration 11397; certificate f9260293b319ac6b548915428ce461e1d169883599053f784bd4be423308221f. -/
def record46 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 5, support := {1, 7, 9, 10} },
      { center := 6, support := {0, 7, 8, 10} },
      { center := 7, support := {3, 4, 6, 8} },
      { center := 8, support := {1, 4, 6, 9} }
    ]
    data := {
      p := 1
      q := 7
      r := 9
      a := 5
      b := 8
      ap_aq := { first := (5, 1), steps := [.row 5 1 7], last := (5, 7) }
      ap_ar := { first := (5, 1), steps := [.row 5 1 9], last := (5, 9) }
      bp_bq := { first := (8, 1), steps := [.row 8 1 6, .flip 8 6, .row 6 8 7, .flip 6 7, .row 7 6 8, .flip 7 8], last := (8, 7) }
      bp_br := { first := (8, 1), steps := [.row 8 1 9], last := (8, 9) } } }

/-- Journal iteration 11399; certificate 799281c40b7eb2860cbfd66ff85e5b0f1d7bd91ce049684ddf6f91f7e1ef55bb. -/
def record47 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 0, support := {1, 4, 5, 9} },
      { center := 1, support := {0, 2, 6, 9} },
      { center := 5, support := {0, 1, 7, 11} },
      { center := 7, support := {1, 6, 8, 11} },
      { center := 11, support := {5, 6, 7, 10} }
    ]
    data := {
      p := 1
      q := 7
      r := 11
      a := 5
      b := 6
      ap_aq := { first := (5, 1), steps := [.row 5 1 7], last := (5, 7) }
      ap_ar := { first := (5, 1), steps := [.row 5 1 11], last := (5, 11) }
      bp_bq := { first := (6, 1), steps := [.flip 6 1, .row 1 6 0, .flip 1 0, .row 0 1 5, .flip 0 5, .row 5 0 11, .flip 5 11, .row 11 5 7, .flip 11 7, .row 7 11 6, .flip 7 6], last := (6, 7) }
      bp_br := { first := (6, 1), steps := [.flip 6 1, .row 1 6 0, .flip 1 0, .row 0 1 5, .flip 0 5, .row 5 0 11, .flip 5 11, .row 11 5 6, .flip 11 6], last := (6, 11) } } }

/-- Journal iteration 11400; certificate 4825d778a0161cd42284d6ddb91071cfe9a2fa3df2016e5ea9f410cfe1a5fc4a. -/
def record48 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 0, support := {1, 4, 5, 9} },
      { center := 1, support := {0, 2, 8, 9} },
      { center := 6, support := {0, 2, 4, 10} },
      { center := 8, support := {1, 3, 6, 9} },
      { center := 9, support := {2, 3, 4, 8} }
    ]
    data := {
      p := 0
      q := 2
      r := 4
      a := 6
      b := 9
      ap_aq := { first := (6, 0), steps := [.row 6 0 2], last := (6, 2) }
      ap_ar := { first := (6, 0), steps := [.row 6 0 4], last := (6, 4) }
      bp_bq := { first := (9, 0), steps := [.flip 9 0, .row 0 9 1, .flip 0 1, .row 1 0 8, .flip 1 8, .row 8 1 9, .flip 8 9, .row 9 8 2], last := (9, 2) }
      bp_br := { first := (9, 0), steps := [.flip 9 0, .row 0 9 1, .flip 0 1, .row 1 0 8, .flip 1 8, .row 8 1 9, .flip 8 9, .row 9 8 4], last := (9, 4) } } }

/-- Journal iteration 11401; certificate 963b57220d6a3e25090bf765bc49c3f370d4b0bcd47e67e34f9ba00b3a317c24. -/
def record49 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 0, support := {1, 4, 5, 9} },
      { center := 1, support := {0, 2, 6, 8} },
      { center := 6, support := {0, 2, 4, 10} },
      { center := 8, support := {1, 3, 6, 9} },
      { center := 9, support := {2, 3, 4, 8} }
    ]
    data := {
      p := 0
      q := 2
      r := 4
      a := 6
      b := 9
      ap_aq := { first := (6, 0), steps := [.row 6 0 2], last := (6, 2) }
      ap_ar := { first := (6, 0), steps := [.row 6 0 4], last := (6, 4) }
      bp_bq := { first := (9, 0), steps := [.flip 9 0, .row 0 9 1, .flip 0 1, .row 1 0 8, .flip 1 8, .row 8 1 9, .flip 8 9, .row 9 8 2], last := (9, 2) }
      bp_br := { first := (9, 0), steps := [.flip 9 0, .row 0 9 1, .flip 0 1, .row 1 0 8, .flip 1 8, .row 8 1 9, .flip 8 9, .row 9 8 4], last := (9, 4) } } }

/-- Journal iteration 11403; certificate da3daeac883971487be6a26595a649ada14c17ad290f5d05061a0dbcdc217134. -/
def record50 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 1, support := {0, 2, 8, 9} },
      { center := 2, support := {1, 8, 10, 11} },
      { center := 6, support := {2, 3, 9, 11} },
      { center := 8, support := {1, 3, 6, 9} }
    ]
    data := {
      p := 2
      q := 3
      r := 9
      a := 6
      b := 8
      ap_aq := { first := (6, 2), steps := [.row 6 2 3], last := (6, 3) }
      ap_ar := { first := (6, 2), steps := [.row 6 2 9], last := (6, 9) }
      bp_bq := { first := (8, 2), steps := [.flip 8 2, .row 2 8 1, .flip 2 1, .row 1 2 8, .flip 1 8, .row 8 1 3], last := (8, 3) }
      bp_br := { first := (8, 2), steps := [.flip 8 2, .row 2 8 1, .flip 2 1, .row 1 2 8, .flip 1 8, .row 8 1 9], last := (8, 9) } } }

/-- Journal iteration 11404; certificate 34e7a8ebb09c8bd7817cf3dab9dba278fc63d4c046411de31a2d0c32e17c7769. -/
def record51 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 0, support := {4, 5, 7, 10} },
      { center := 4, support := {1, 3, 5, 7} },
      { center := 5, support := {2, 3, 4, 10} },
      { center := 7, support := {3, 4, 6, 8} }
    ]
    data := {
      p := 4
      q := 5
      r := 7
      a := 0
      b := 3
      ap_aq := { first := (0, 4), steps := [.row 0 4 5], last := (0, 5) }
      ap_ar := { first := (0, 4), steps := [.row 0 4 7], last := (0, 7) }
      bp_bq := { first := (3, 4), steps := [.flip 3 4, .row 4 3 5, .flip 4 5, .row 5 4 3, .flip 5 3], last := (3, 5) }
      bp_br := { first := (3, 4), steps := [.flip 3 4, .row 4 3 7, .flip 4 7, .row 7 4 3, .flip 7 3], last := (3, 7) } } }

/-- Journal iteration 11409; certificate 9cf840ec1c107fef9bd68de1cd50062ea83322d07dde748fa18d078551db5b9d. -/
def record52 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 0, support := {2, 3, 4, 5} },
      { center := 2, support := {1, 7, 10, 11} },
      { center := 4, support := {1, 3, 5, 7} },
      { center := 5, support := {0, 3, 4, 10} },
      { center := 10, support := {2, 5, 7, 8} }
    ]
    data := {
      p := 0
      q := 1
      r := 7
      a := 2
      b := 4
      ap_aq := { first := (2, 0), steps := [.flip 2 0, .row 0 2 5, .flip 0 5, .row 5 0 10, .flip 5 10, .row 10 5 2, .flip 10 2, .row 2 10 1], last := (2, 1) }
      ap_ar := { first := (2, 0), steps := [.flip 2 0, .row 0 2 5, .flip 0 5, .row 5 0 10, .flip 5 10, .row 10 5 2, .flip 10 2, .row 2 10 7], last := (2, 7) }
      bp_bq := { first := (4, 0), steps := [.flip 4 0, .row 0 4 5, .flip 0 5, .row 5 0 4, .flip 5 4, .row 4 5 1], last := (4, 1) }
      bp_br := { first := (4, 0), steps := [.flip 4 0, .row 0 4 5, .flip 0 5, .row 5 0 4, .flip 5 4, .row 4 5 7], last := (4, 7) } } }

/-- Journal iteration 11410; certificate 43e05a5da28a3ad2668686c4930523d790e9b8372235ae49fba5366906418990. -/
def record53 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 0, support := {2, 3, 4, 5} },
      { center := 2, support := {1, 7, 10, 11} },
      { center := 4, support := {1, 3, 5, 7} },
      { center := 5, support := {0, 3, 4, 10} },
      { center := 10, support := {1, 2, 5, 8} }
    ]
    data := {
      p := 0
      q := 1
      r := 7
      a := 2
      b := 4
      ap_aq := { first := (2, 0), steps := [.flip 2 0, .row 0 2 5, .flip 0 5, .row 5 0 10, .flip 5 10, .row 10 5 2, .flip 10 2, .row 2 10 1], last := (2, 1) }
      ap_ar := { first := (2, 0), steps := [.flip 2 0, .row 0 2 5, .flip 0 5, .row 5 0 10, .flip 5 10, .row 10 5 2, .flip 10 2, .row 2 10 7], last := (2, 7) }
      bp_bq := { first := (4, 0), steps := [.flip 4 0, .row 0 4 5, .flip 0 5, .row 5 0 4, .flip 5 4, .row 4 5 1], last := (4, 1) }
      bp_br := { first := (4, 0), steps := [.flip 4 0, .row 0 4 5, .flip 0 5, .row 5 0 4, .flip 5 4, .row 4 5 7], last := (4, 7) } } }

/-- Journal iteration 11411; certificate 70633fc7586247cc925c5eadfe5742ee1ee2b225786f1ecc7fcd24532b1d12fe. -/
def record54 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 0, support := {1, 4, 5, 9} },
      { center := 2, support := {1, 7, 10, 11} },
      { center := 4, support := {1, 3, 5, 7} },
      { center := 5, support := {0, 3, 4, 10} },
      { center := 9, support := {0, 2, 4, 11} },
      { center := 10, support := {2, 5, 7, 8} }
    ]
    data := {
      p := 0
      q := 2
      r := 4
      a := 1
      b := 9
      ap_aq := { first := (1, 0), steps := [.flip 1 0, .row 0 1 5, .flip 0 5, .row 5 0 10, .flip 5 10, .row 10 5 2, .flip 10 2, .row 2 10 1, .flip 2 1], last := (1, 2) }
      ap_ar := { first := (1, 0), steps := [.flip 1 0, .row 0 1 5, .flip 0 5, .row 5 0 4, .flip 5 4, .row 4 5 1, .flip 4 1], last := (1, 4) }
      bp_bq := { first := (9, 0), steps := [.row 9 0 2], last := (9, 2) }
      bp_br := { first := (9, 0), steps := [.row 9 0 4], last := (9, 4) } } }

/-- Journal iteration 11412; certificate 9e18dc89753b2fab290138052546f9faf32d990491fcbc6c3a173b0617626fcc. -/
def record55 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 0, support := {1, 4, 5, 9} },
      { center := 1, support := {2, 6, 8, 9} },
      { center := 2, support := {1, 7, 10, 11} },
      { center := 4, support := {1, 3, 5, 7} },
      { center := 5, support := {0, 3, 4, 10} },
      { center := 9, support := {0, 2, 4, 5} },
      { center := 10, support := {2, 5, 7, 8} }
    ]
    data := {
      p := 0
      q := 1
      r := 5
      a := 4
      b := 9
      ap_aq := { first := (4, 0), steps := [.flip 4 0, .row 0 4 5, .flip 0 5, .row 5 0 4, .flip 5 4, .row 4 5 1], last := (4, 1) }
      ap_ar := { first := (4, 0), steps := [.flip 4 0, .row 0 4 5, .flip 0 5, .row 5 0 4, .flip 5 4], last := (4, 5) }
      bp_bq := { first := (9, 0), steps := [.flip 9 0, .row 0 9 5, .flip 0 5, .row 5 0 10, .flip 5 10, .row 10 5 2, .flip 10 2, .row 2 10 1, .flip 2 1, .row 1 2 9, .flip 1 9], last := (9, 1) }
      bp_br := { first := (9, 0), steps := [.row 9 0 5], last := (9, 5) } } }

/-- Journal iteration 11413; certificate 52d12293580ed280d7e557cbe8ed3071a4a6292c0a46ab7e5c33c94cd4359633. -/
def record56 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 0, support := {1, 4, 5, 9} },
      { center := 1, support := {0, 2, 6, 9} },
      { center := 4, support := {1, 3, 5, 7} },
      { center := 5, support := {0, 3, 4, 10} },
      { center := 9, support := {0, 2, 5, 11} }
    ]
    data := {
      p := 0
      q := 1
      r := 5
      a := 4
      b := 9
      ap_aq := { first := (4, 0), steps := [.flip 4 0, .row 0 4 5, .flip 0 5, .row 5 0 4, .flip 5 4, .row 4 5 1], last := (4, 1) }
      ap_ar := { first := (4, 0), steps := [.flip 4 0, .row 0 4 5, .flip 0 5, .row 5 0 4, .flip 5 4], last := (4, 5) }
      bp_bq := { first := (9, 0), steps := [.flip 9 0, .row 0 9 1, .flip 0 1, .row 1 0 9, .flip 1 9], last := (9, 1) }
      bp_br := { first := (9, 0), steps := [.row 9 0 5], last := (9, 5) } } }

/-- Journal iteration 11414; certificate 0a9056c7046bf6da6ff8c8944a818c9d571db1ca5fef70c4aaecddca3db56758. -/
def record57 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 0, support := {1, 4, 5, 9} },
      { center := 1, support := {2, 6, 8, 9} },
      { center := 2, support := {1, 7, 10, 11} },
      { center := 4, support := {1, 3, 5, 7} },
      { center := 5, support := {0, 3, 4, 10} },
      { center := 9, support := {0, 2, 5, 11} },
      { center := 10, support := {2, 5, 7, 8} }
    ]
    data := {
      p := 0
      q := 1
      r := 5
      a := 4
      b := 9
      ap_aq := { first := (4, 0), steps := [.flip 4 0, .row 0 4 5, .flip 0 5, .row 5 0 4, .flip 5 4, .row 4 5 1], last := (4, 1) }
      ap_ar := { first := (4, 0), steps := [.flip 4 0, .row 0 4 5, .flip 0 5, .row 5 0 4, .flip 5 4], last := (4, 5) }
      bp_bq := { first := (9, 0), steps := [.flip 9 0, .row 0 9 5, .flip 0 5, .row 5 0 10, .flip 5 10, .row 10 5 2, .flip 10 2, .row 2 10 1, .flip 2 1, .row 1 2 9, .flip 1 9], last := (9, 1) }
      bp_br := { first := (9, 0), steps := [.row 9 0 5], last := (9, 5) } } }

/-- Journal iteration 11415; certificate f5a9f23ebcb0e63947d5f460cdfa6b9cc2bd1661a29164bbcdde295820c5f3d1. -/
def record58 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 0, support := {1, 4, 5, 6} },
      { center := 1, support := {0, 2, 6, 8} },
      { center := 4, support := {1, 3, 5, 7} },
      { center := 5, support := {0, 3, 4, 10} },
      { center := 7, support := {3, 4, 6, 8} }
    ]
    data := {
      p := 0
      q := 1
      r := 7
      a := 4
      b := 6
      ap_aq := { first := (4, 0), steps := [.flip 4 0, .row 0 4 5, .flip 0 5, .row 5 0 4, .flip 5 4, .row 4 5 1], last := (4, 1) }
      ap_ar := { first := (4, 0), steps := [.flip 4 0, .row 0 4 5, .flip 0 5, .row 5 0 4, .flip 5 4, .row 4 5 7], last := (4, 7) }
      bp_bq := { first := (6, 0), steps := [.flip 6 0, .row 0 6 1, .flip 0 1, .row 1 0 6, .flip 1 6], last := (6, 1) }
      bp_br := { first := (6, 0), steps := [.flip 6 0, .row 0 6 5, .flip 0 5, .row 5 0 4, .flip 5 4, .row 4 5 7, .flip 4 7, .row 7 4 6, .flip 7 6], last := (6, 7) } } }

/-- Journal iteration 11418; certificate cc0296e70e591b252904e65b241a796f12f79d5c8fad3f8ab6117abbe05eaec8. -/
def record59 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 1, support := {0, 2, 6, 8} },
      { center := 2, support := {1, 7, 10, 11} },
      { center := 8, support := {1, 3, 6, 9} },
      { center := 10, support := {2, 5, 7, 8} },
      { center := 11, support := {1, 4, 9, 10} }
    ]
    data := {
      p := 1
      q := 9
      r := 10
      a := 8
      b := 11
      ap_aq := { first := (8, 1), steps := [.row 8 1 9], last := (8, 9) }
      ap_ar := { first := (8, 1), steps := [.flip 8 1, .row 1 8 2, .flip 1 2, .row 2 1 10, .flip 2 10, .row 10 2 8, .flip 10 8], last := (8, 10) }
      bp_bq := { first := (11, 1), steps := [.row 11 1 9], last := (11, 9) }
      bp_br := { first := (11, 1), steps := [.row 11 1 10], last := (11, 10) } } }

/-- Journal iteration 11420; certificate d59ee3da25766f1e7018259efcfb75a4f025ea0fac43dcfe2f23837de9f986f8. -/
def record60 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 0, support := {1, 4, 5, 6} },
      { center := 1, support := {0, 2, 6, 8} },
      { center := 4, support := {1, 3, 5, 7} },
      { center := 5, support := {0, 3, 4, 10} },
      { center := 11, support := {0, 4, 6, 7} }
    ]
    data := {
      p := 0
      q := 4
      r := 6
      a := 1
      b := 11
      ap_aq := { first := (1, 0), steps := [.flip 1 0, .row 0 1 5, .flip 0 5, .row 5 0 4, .flip 5 4, .row 4 5 1, .flip 4 1], last := (1, 4) }
      ap_ar := { first := (1, 0), steps := [.row 1 0 6], last := (1, 6) }
      bp_bq := { first := (11, 0), steps := [.row 11 0 4], last := (11, 4) }
      bp_br := { first := (11, 0), steps := [.row 11 0 6], last := (11, 6) } } }

/-- Journal iteration 11421; certificate 4d0fa6f02185c9b7fd5651860b5d3e68e0224609e3ee82ee92dd8837d106ec01. -/
def record61 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 0, support := {1, 4, 5, 6} },
      { center := 1, support := {0, 2, 6, 8} },
      { center := 2, support := {1, 7, 10, 11} },
      { center := 4, support := {1, 3, 5, 7} },
      { center := 5, support := {0, 3, 4, 10} },
      { center := 6, support := {2, 3, 9, 11} },
      { center := 11, support := {2, 6, 7, 10} }
    ]
    data := {
      p := 0
      q := 1
      r := 3
      a := 4
      b := 6
      ap_aq := { first := (4, 0), steps := [.flip 4 0, .row 0 4 5, .flip 0 5, .row 5 0 4, .flip 5 4, .row 4 5 1], last := (4, 1) }
      ap_ar := { first := (4, 0), steps := [.flip 4 0, .row 0 4 5, .flip 0 5, .row 5 0 4, .flip 5 4, .row 4 5 3], last := (4, 3) }
      bp_bq := { first := (6, 0), steps := [.flip 6 0, .row 0 6 1, .flip 0 1, .row 1 0 6, .flip 1 6], last := (6, 1) }
      bp_br := { first := (6, 0), steps := [.flip 6 0, .row 0 6 1, .flip 0 1, .row 1 0 2, .flip 1 2, .row 2 1 11, .flip 2 11, .row 11 2 6, .flip 11 6, .row 6 11 3], last := (6, 3) } } }

/-- Journal iteration 11422; certificate 240a469aaf6daa2fa935b37d29f93aa559baea666c6105f91808ff7d5dc257e4. -/
def record62 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 0, support := {1, 4, 5, 6} },
      { center := 1, support := {0, 2, 6, 8} },
      { center := 4, support := {1, 3, 5, 7} },
      { center := 5, support := {0, 3, 4, 10} },
      { center := 7, support := {3, 6, 8, 10} },
      { center := 10, support := {2, 5, 7, 8} }
    ]
    data := {
      p := 0
      q := 1
      r := 7
      a := 4
      b := 6
      ap_aq := { first := (4, 0), steps := [.flip 4 0, .row 0 4 5, .flip 0 5, .row 5 0 4, .flip 5 4, .row 4 5 1], last := (4, 1) }
      ap_ar := { first := (4, 0), steps := [.flip 4 0, .row 0 4 5, .flip 0 5, .row 5 0 4, .flip 5 4, .row 4 5 7], last := (4, 7) }
      bp_bq := { first := (6, 0), steps := [.flip 6 0, .row 0 6 1, .flip 0 1, .row 1 0 6, .flip 1 6], last := (6, 1) }
      bp_br := { first := (6, 0), steps := [.flip 6 0, .row 0 6 5, .flip 0 5, .row 5 0 10, .flip 5 10, .row 10 5 7, .flip 10 7, .row 7 10 6, .flip 7 6], last := (6, 7) } } }

/-- Journal iteration 11423; certificate 4e9e764bb08760208e7f179f5f372f76ba57c81269f0066c5fef8c2273f53b9a. -/
def record63 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 0, support := {1, 4, 5, 6} },
      { center := 1, support := {0, 2, 6, 8} },
      { center := 4, support := {1, 3, 5, 7} },
      { center := 5, support := {0, 3, 4, 10} },
      { center := 8, support := {1, 3, 6, 9} },
      { center := 11, support := {3, 4, 5, 8} }
    ]
    data := {
      p := 4
      q := 5
      r := 8
      a := 3
      b := 11
      ap_aq := { first := (3, 4), steps := [.flip 3 4, .row 4 3 5, .flip 4 5, .row 5 4 3, .flip 5 3], last := (3, 5) }
      ap_ar := { first := (3, 4), steps := [.flip 3 4, .row 4 3 5, .flip 4 5, .row 5 4 0, .flip 5 0, .row 0 5 1, .flip 0 1, .row 1 0 8, .flip 1 8, .row 8 1 3, .flip 8 3], last := (3, 8) }
      bp_bq := { first := (11, 4), steps := [.row 11 4 5], last := (11, 5) }
      bp_br := { first := (11, 4), steps := [.row 11 4 8], last := (11, 8) } } }

/-- Journal iteration 11425; certificate 6bbcb550407aceebc5ff55106afac867b5c19e67817d4fa0a475984c23722630. -/
def record64 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 0, support := {1, 4, 5, 6} },
      { center := 1, support := {0, 2, 6, 8} },
      { center := 4, support := {1, 3, 5, 7} },
      { center := 5, support := {0, 3, 4, 10} },
      { center := 8, support := {1, 3, 6, 9} },
      { center := 11, support := {4, 5, 8, 10} }
    ]
    data := {
      p := 4
      q := 5
      r := 8
      a := 3
      b := 11
      ap_aq := { first := (3, 4), steps := [.flip 3 4, .row 4 3 5, .flip 4 5, .row 5 4 3, .flip 5 3], last := (3, 5) }
      ap_ar := { first := (3, 4), steps := [.flip 3 4, .row 4 3 5, .flip 4 5, .row 5 4 0, .flip 5 0, .row 0 5 1, .flip 0 1, .row 1 0 8, .flip 1 8, .row 8 1 3, .flip 8 3], last := (3, 8) }
      bp_bq := { first := (11, 4), steps := [.row 11 4 5], last := (11, 5) }
      bp_br := { first := (11, 4), steps := [.row 11 4 8], last := (11, 8) } } }

/-- Journal iteration 11426; certificate f67bda0cc7b4bdde5e88c0e40ab012edfc9af4c10cc26339ef5d73d9384f7f6b. -/
def record65 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 0, support := {1, 4, 5, 6} },
      { center := 1, support := {0, 2, 6, 8} },
      { center := 4, support := {1, 3, 5, 7} },
      { center := 5, support := {0, 3, 4, 10} },
      { center := 7, support := {4, 6, 8, 10} }
    ]
    data := {
      p := 0
      q := 1
      r := 7
      a := 4
      b := 6
      ap_aq := { first := (4, 0), steps := [.flip 4 0, .row 0 4 5, .flip 0 5, .row 5 0 4, .flip 5 4, .row 4 5 1], last := (4, 1) }
      ap_ar := { first := (4, 0), steps := [.flip 4 0, .row 0 4 5, .flip 0 5, .row 5 0 4, .flip 5 4, .row 4 5 7], last := (4, 7) }
      bp_bq := { first := (6, 0), steps := [.flip 6 0, .row 0 6 1, .flip 0 1, .row 1 0 6, .flip 1 6], last := (6, 1) }
      bp_br := { first := (6, 0), steps := [.flip 6 0, .row 0 6 5, .flip 0 5, .row 5 0 4, .flip 5 4, .row 4 5 7, .flip 4 7, .row 7 4 6, .flip 7 6], last := (6, 7) } } }

/-- Journal iteration 11427; certificate 3a23ccd41e70bbc6be9851be11f6919b7bc4ae44c83876fddfafddfd364ee7ed. -/
def record66 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 0, support := {1, 4, 5, 6} },
      { center := 1, support := {0, 2, 6, 8} },
      { center := 4, support := {1, 3, 5, 7} },
      { center := 5, support := {0, 3, 4, 10} },
      { center := 7, support := {4, 6, 8, 11} }
    ]
    data := {
      p := 0
      q := 1
      r := 7
      a := 4
      b := 6
      ap_aq := { first := (4, 0), steps := [.flip 4 0, .row 0 4 5, .flip 0 5, .row 5 0 4, .flip 5 4, .row 4 5 1], last := (4, 1) }
      ap_ar := { first := (4, 0), steps := [.flip 4 0, .row 0 4 5, .flip 0 5, .row 5 0 4, .flip 5 4, .row 4 5 7], last := (4, 7) }
      bp_bq := { first := (6, 0), steps := [.flip 6 0, .row 0 6 1, .flip 0 1, .row 1 0 6, .flip 1 6], last := (6, 1) }
      bp_br := { first := (6, 0), steps := [.flip 6 0, .row 0 6 5, .flip 0 5, .row 5 0 4, .flip 5 4, .row 4 5 7, .flip 4 7, .row 7 4 6, .flip 7 6], last := (6, 7) } } }

/-- Journal iteration 11428; certificate 8925ee985bef58ae46175aadd40843a74f2357a7704ca40ec3f21422c5bcde8e. -/
def record67 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 2, support := {5, 6, 10, 11} },
      { center := 3, support := {2, 4, 9, 11} },
      { center := 4, support := {3, 7, 8, 9} },
      { center := 5, support := {0, 1, 6, 7} },
      { center := 6, support := {0, 5, 9, 11} },
      { center := 9, support := {0, 2, 4, 10} },
      { center := 11, support := {2, 3, 6, 10} }
    ]
    data := {
      p := 0
      q := 2
      r := 6
      a := 5
      b := 9
      ap_aq := { first := (5, 0), steps := [.row 5 0 6, .flip 5 6, .row 6 5 11, .flip 6 11, .row 11 6 2, .flip 11 2, .row 2 11 5, .flip 2 5], last := (5, 2) }
      ap_ar := { first := (5, 0), steps := [.row 5 0 6], last := (5, 6) }
      bp_bq := { first := (9, 0), steps := [.row 9 0 2], last := (9, 2) }
      bp_br := { first := (9, 0), steps := [.row 9 0 4, .flip 9 4, .row 4 9 3, .flip 4 3, .row 3 4 11, .flip 3 11, .row 11 3 6, .flip 11 6, .row 6 11 9, .flip 6 9], last := (9, 6) } } }

/-- Journal iteration 11429; certificate 1ba210581b942888d94abf102709bd693e894cab822521b7e5ae190b66fefe26. -/
def record68 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 0, support := {1, 2, 4, 5} },
      { center := 4, support := {0, 1, 6, 7} },
      { center := 5, support := {0, 3, 4, 7} },
      { center := 11, support := {0, 1, 3, 5} }
    ]
    data := {
      p := 0
      q := 1
      r := 5
      a := 4
      b := 11
      ap_aq := { first := (4, 0), steps := [.row 4 0 1], last := (4, 1) }
      ap_ar := { first := (4, 0), steps := [.flip 4 0, .row 0 4 5, .flip 0 5, .row 5 0 4, .flip 5 4], last := (4, 5) }
      bp_bq := { first := (11, 0), steps := [.row 11 0 1], last := (11, 1) }
      bp_br := { first := (11, 0), steps := [.row 11 0 5], last := (11, 5) } } }

/-- Journal iteration 11431; certificate 31561b63334f589bbd221211ec46688827fb35a55130b0167d023c600453e765. -/
def record69 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 2, support := {5, 6, 10, 11} },
      { center := 9, support := {0, 2, 10, 11} },
      { center := 10, support := {1, 2, 3, 8} },
      { center := 11, support := {1, 2, 4, 9} }
    ]
    data := {
      p := 1
      q := 2
      r := 9
      a := 10
      b := 11
      ap_aq := { first := (10, 1), steps := [.row 10 1 2], last := (10, 2) }
      ap_ar := { first := (10, 1), steps := [.row 10 1 2, .flip 10 2, .row 2 10 11, .flip 2 11, .row 11 2 9, .flip 11 9, .row 9 11 10, .flip 9 10], last := (10, 9) }
      bp_bq := { first := (11, 1), steps := [.row 11 1 2], last := (11, 2) }
      bp_br := { first := (11, 1), steps := [.row 11 1 9], last := (11, 9) } } }

/-- Journal iteration 11432; certificate 62945da7b7bf1e4524d547852c10e87954a121780ee36b29244a334ba1f75407. -/
def record70 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 0, support := {1, 3, 4, 5} },
      { center := 1, support := {0, 2, 6, 8} },
      { center := 4, support := {0, 1, 6, 7} },
      { center := 9, support := {0, 2, 4, 10} }
    ]
    data := {
      p := 0
      q := 2
      r := 4
      a := 1
      b := 9
      ap_aq := { first := (1, 0), steps := [.row 1 0 2], last := (1, 2) }
      ap_ar := { first := (1, 0), steps := [.flip 1 0, .row 0 1 4, .flip 0 4, .row 4 0 1, .flip 4 1], last := (1, 4) }
      bp_bq := { first := (9, 0), steps := [.row 9 0 2], last := (9, 2) }
      bp_br := { first := (9, 0), steps := [.row 9 0 4], last := (9, 4) } } }

/-- Journal iteration 11433; certificate 3d687a677887ad3afc7199f885b6db73cce361374895c0fc6e17833374a1316f. -/
def record71 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 0, support := {1, 3, 4, 5} },
      { center := 1, support := {0, 2, 6, 8} },
      { center := 2, support := {1, 7, 10, 11} },
      { center := 3, support := {0, 9, 10, 11} },
      { center := 9, support := {0, 2, 5, 10} },
      { center := 11, support := {0, 3, 5, 7} }
    ]
    data := {
      p := 0
      q := 2
      r := 5
      a := 9
      b := 11
      ap_aq := { first := (9, 0), steps := [.row 9 0 2], last := (9, 2) }
      ap_ar := { first := (9, 0), steps := [.row 9 0 5], last := (9, 5) }
      bp_bq := { first := (11, 0), steps := [.row 11 0 3, .flip 11 3, .row 3 11 0, .flip 3 0, .row 0 3 1, .flip 0 1, .row 1 0 2, .flip 1 2, .row 2 1 11, .flip 2 11], last := (11, 2) }
      bp_br := { first := (11, 0), steps := [.row 11 0 5], last := (11, 5) } } }

/-- Journal iteration 11434; certificate 2ec05765e2f55727ea6a55cf8aef790a9b8a2bdfe0d5375812b742f3dadaf4d8. -/
def record72 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 1, support := {0, 2, 6, 8} },
      { center := 2, support := {1, 7, 10, 11} },
      { center := 9, support := {0, 2, 5, 10} },
      { center := 10, support := {1, 2, 5, 8} }
    ]
    data := {
      p := 0
      q := 2
      r := 10
      a := 1
      b := 9
      ap_aq := { first := (1, 0), steps := [.row 1 0 2], last := (1, 2) }
      ap_ar := { first := (1, 0), steps := [.row 1 0 2, .flip 1 2, .row 2 1 10, .flip 2 10, .row 10 2 1, .flip 10 1], last := (1, 10) }
      bp_bq := { first := (9, 0), steps := [.row 9 0 2], last := (9, 2) }
      bp_br := { first := (9, 0), steps := [.row 9 0 10], last := (9, 10) } } }

/-- Journal iteration 11435; certificate 11be80f5f8c3f0f14bd3fa329c5b7fdef3e54a13efa289224dc420d8cd35d1d8. -/
def record73 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 0, support := {1, 3, 4, 5} },
      { center := 1, support := {0, 2, 6, 8} },
      { center := 2, support := {1, 7, 10, 11} },
      { center := 4, support := {0, 1, 6, 7} },
      { center := 10, support := {1, 2, 5, 8} },
      { center := 11, support := {0, 4, 7, 10} }
    ]
    data := {
      p := 0
      q := 4
      r := 10
      a := 1
      b := 11
      ap_aq := { first := (1, 0), steps := [.flip 1 0, .row 0 1 4, .flip 0 4, .row 4 0 1, .flip 4 1], last := (1, 4) }
      ap_ar := { first := (1, 0), steps := [.row 1 0 2, .flip 1 2, .row 2 1 10, .flip 2 10, .row 10 2 1, .flip 10 1], last := (1, 10) }
      bp_bq := { first := (11, 0), steps := [.row 11 0 4], last := (11, 4) }
      bp_br := { first := (11, 0), steps := [.row 11 0 10], last := (11, 10) } } }

/-- Journal iteration 11436; certificate 39f5ae86579351cd4821cf058f0f38a1c9b196028a990f911d2b05207c53d73c. -/
def record74 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 0, support := {1, 3, 4, 5} },
      { center := 1, support := {0, 2, 6, 8} },
      { center := 2, support := {1, 7, 10, 11} },
      { center := 4, support := {0, 1, 6, 7} },
      { center := 7, support := {4, 5, 6, 8} },
      { center := 10, support := {1, 2, 5, 8} },
      { center := 11, support := {0, 5, 7, 10} }
    ]
    data := {
      p := 0
      q := 7
      r := 10
      a := 5
      b := 11
      ap_aq := { first := (5, 0), steps := [.flip 5 0, .row 0 5 4, .flip 0 4, .row 4 0 7, .flip 4 7, .row 7 4 5, .flip 7 5], last := (5, 7) }
      ap_ar := { first := (5, 0), steps := [.flip 5 0, .row 0 5 1, .flip 0 1, .row 1 0 2, .flip 1 2, .row 2 1 10, .flip 2 10, .row 10 2 5, .flip 10 5], last := (5, 10) }
      bp_bq := { first := (11, 0), steps := [.row 11 0 7], last := (11, 7) }
      bp_br := { first := (11, 0), steps := [.row 11 0 10], last := (11, 10) } } }

/-- Journal iteration 11437; certificate 647a449a96b98b300d7e618ed00eb00ad155d6f7156ce7491ba431a032cd851a. -/
def record75 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 0, support := {1, 3, 4, 5} },
      { center := 1, support := {0, 2, 6, 8} },
      { center := 2, support := {1, 7, 10, 11} },
      { center := 3, support := {0, 9, 10, 11} },
      { center := 8, support := {1, 3, 6, 9} },
      { center := 10, support := {1, 2, 5, 8} }
    ]
    data := {
      p := 0
      q := 8
      r := 10
      a := 1
      b := 3
      ap_aq := { first := (1, 0), steps := [.row 1 0 8], last := (1, 8) }
      ap_ar := { first := (1, 0), steps := [.row 1 0 2, .flip 1 2, .row 2 1 10, .flip 2 10, .row 10 2 1, .flip 10 1], last := (1, 10) }
      bp_bq := { first := (3, 0), steps := [.flip 3 0, .row 0 3 1, .flip 0 1, .row 1 0 8, .flip 1 8, .row 8 1 3, .flip 8 3], last := (3, 8) }
      bp_br := { first := (3, 0), steps := [.row 3 0 10], last := (3, 10) } } }

/-- Journal iteration 11438; certificate ce67c59a22dd4b3ae051384461a36b60a63ce03a99bde20cc61f80efff87faf9. -/
def record76 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 0, support := {1, 3, 4, 5} },
      { center := 3, support := {0, 9, 10, 11} },
      { center := 4, support := {0, 1, 6, 7} },
      { center := 7, support := {4, 5, 6, 8} },
      { center := 11, support := {0, 3, 5, 7} }
    ]
    data := {
      p := 4
      q := 5
      r := 11
      a := 0
      b := 7
      ap_aq := { first := (0, 4), steps := [.row 0 4 5], last := (0, 5) }
      ap_ar := { first := (0, 4), steps := [.row 0 4 3, .flip 0 3, .row 3 0 11, .flip 3 11, .row 11 3 0, .flip 11 0], last := (0, 11) }
      bp_bq := { first := (7, 4), steps := [.row 7 4 5], last := (7, 5) }
      bp_br := { first := (7, 4), steps := [.flip 7 4, .row 4 7 0, .flip 4 0, .row 0 4 3, .flip 0 3, .row 3 0 11, .flip 3 11, .row 11 3 7, .flip 11 7], last := (7, 11) } } }

/-- Journal iteration 11444; certificate 9bf77aab053fc802286af3f53630f9f1903ca04b962ad5174a5ff7ecd02512c9. -/
def record77 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 0, support := {1, 3, 4, 5} },
      { center := 1, support := {0, 2, 6, 8} },
      { center := 2, support := {1, 7, 10, 11} },
      { center := 3, support := {0, 9, 10, 11} },
      { center := 10, support := {2, 4, 5, 8} },
      { center := 11, support := {3, 5, 7, 10} }
    ]
    data := {
      p := 0
      q := 10
      r := 11
      a := 3
      b := 5
      ap_aq := { first := (3, 0), steps := [.row 3 0 10], last := (3, 10) }
      ap_ar := { first := (3, 0), steps := [.row 3 0 11], last := (3, 11) }
      bp_bq := { first := (5, 0), steps := [.flip 5 0, .row 0 5 1, .flip 0 1, .row 1 0 2, .flip 1 2, .row 2 1 10, .flip 2 10, .row 10 2 5, .flip 10 5], last := (5, 10) }
      bp_br := { first := (5, 0), steps := [.flip 5 0, .row 0 5 3, .flip 0 3, .row 3 0 11, .flip 3 11, .row 11 3 5, .flip 11 5], last := (5, 11) } } }

/-- Journal iteration 11445; certificate 9dd5d3924a1f8a2da9f7130422f4f1e7af1e3258978cca182fb1eac1da426b09. -/
def record78 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 0, support := {1, 3, 4, 5} },
      { center := 1, support := {0, 2, 6, 8} },
      { center := 4, support := {0, 1, 6, 7} },
      { center := 7, support := {4, 6, 8, 10} },
      { center := 8, support := {1, 3, 6, 9} }
    ]
    data := {
      p := 1
      q := 6
      r := 7
      a := 4
      b := 8
      ap_aq := { first := (4, 1), steps := [.row 4 1 6], last := (4, 6) }
      ap_ar := { first := (4, 1), steps := [.row 4 1 7], last := (4, 7) }
      bp_bq := { first := (8, 1), steps := [.row 8 1 6], last := (8, 6) }
      bp_br := { first := (8, 1), steps := [.flip 8 1, .row 1 8 0, .flip 1 0, .row 0 1 4, .flip 0 4, .row 4 0 7, .flip 4 7, .row 7 4 8, .flip 7 8], last := (8, 7) } } }

/-- Journal iteration 11448; certificate 1e389724308b4629723499fa2eb39c04186ef64daa72f44e45659004a3101b88. -/
def record79 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 0, support := {1, 4, 5, 9} },
      { center := 1, support := {0, 2, 6, 8} },
      { center := 8, support := {1, 3, 6, 9} },
      { center := 9, support := {0, 2, 4, 10} }
    ]
    data := {
      p := 0
      q := 2
      r := 8
      a := 1
      b := 9
      ap_aq := { first := (1, 0), steps := [.row 1 0 2], last := (1, 2) }
      ap_ar := { first := (1, 0), steps := [.row 1 0 8], last := (1, 8) }
      bp_bq := { first := (9, 0), steps := [.row 9 0 2], last := (9, 2) }
      bp_br := { first := (9, 0), steps := [.flip 9 0, .row 0 9 1, .flip 0 1, .row 1 0 8, .flip 1 8, .row 8 1 9, .flip 8 9], last := (9, 8) } } }

/-- Journal iteration 11449; certificate 301ad3cc45112722c2fa720744ec315a4230c2b35f4242b0cfdcb0bb97ffbc86. -/
def record80 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 0, support := {1, 4, 5, 9} },
      { center := 1, support := {0, 2, 6, 9} },
      { center := 9, support := {0, 2, 4, 10} },
      { center := 10, support := {1, 2, 4, 8} }
    ]
    data := {
      p := 1
      q := 2
      r := 4
      a := 9
      b := 10
      ap_aq := { first := (9, 1), steps := [.flip 9 1, .row 1 9 0, .flip 1 0, .row 0 1 9, .flip 0 9, .row 9 0 2], last := (9, 2) }
      ap_ar := { first := (9, 1), steps := [.flip 9 1, .row 1 9 0, .flip 1 0, .row 0 1 9, .flip 0 9, .row 9 0 4], last := (9, 4) }
      bp_bq := { first := (10, 1), steps := [.row 10 1 2], last := (10, 2) }
      bp_br := { first := (10, 1), steps := [.row 10 1 4], last := (10, 4) } } }

/-- Journal iteration 11450; certificate d59278db8bcc1169e0686c8f8d896e6e6fed4e5a888d78dee0b994027a8bdce6. -/
def record81 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 1, support := {0, 2, 6, 9} },
      { center := 2, support := {3, 7, 10, 11} },
      { center := 3, support := {0, 9, 10, 11} },
      { center := 11, support := {2, 3, 4, 5} }
    ]
    data := {
      p := 0
      q := 2
      r := 9
      a := 1
      b := 3
      ap_aq := { first := (1, 0), steps := [.row 1 0 2], last := (1, 2) }
      ap_ar := { first := (1, 0), steps := [.row 1 0 9], last := (1, 9) }
      bp_bq := { first := (3, 0), steps := [.row 3 0 11, .flip 3 11, .row 11 3 2, .flip 11 2, .row 2 11 3, .flip 2 3], last := (3, 2) }
      bp_br := { first := (3, 0), steps := [.row 3 0 9], last := (3, 9) } } }

/-- Journal iteration 11451; certificate ca18dc205a43024c35dca856d1f77501e61aca783d3b7dfbcd5b1edafbff3c45. -/
def record82 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 1, support := {0, 2, 6, 9} },
      { center := 2, support := {3, 7, 10, 11} },
      { center := 3, support := {0, 9, 10, 11} },
      { center := 11, support := {2, 3, 4, 10} }
    ]
    data := {
      p := 0
      q := 2
      r := 9
      a := 1
      b := 3
      ap_aq := { first := (1, 0), steps := [.row 1 0 2], last := (1, 2) }
      ap_ar := { first := (1, 0), steps := [.row 1 0 9], last := (1, 9) }
      bp_bq := { first := (3, 0), steps := [.row 3 0 11, .flip 3 11, .row 11 3 2, .flip 11 2, .row 2 11 3, .flip 2 3], last := (3, 2) }
      bp_br := { first := (3, 0), steps := [.row 3 0 9], last := (3, 9) } } }

/-- Journal iteration 11454; certificate 46f22ec32d436d474a3017de62ba4340c02c5fe720b4925db8abbeba638f7638. -/
def record83 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 1, support := {0, 2, 6, 9} },
      { center := 2, support := {3, 7, 10, 11} },
      { center := 3, support := {0, 9, 10, 11} },
      { center := 10, support := {2, 3, 5, 8} }
    ]
    data := {
      p := 0
      q := 2
      r := 9
      a := 1
      b := 3
      ap_aq := { first := (1, 0), steps := [.row 1 0 2], last := (1, 2) }
      ap_ar := { first := (1, 0), steps := [.row 1 0 9], last := (1, 9) }
      bp_bq := { first := (3, 0), steps := [.row 3 0 10, .flip 3 10, .row 10 3 2, .flip 10 2, .row 2 10 3, .flip 2 3], last := (3, 2) }
      bp_br := { first := (3, 0), steps := [.row 3 0 9], last := (3, 9) } } }

/-- Journal iteration 11455; certificate 83c8221973480b0d4cabd8b96f489705ed1385c7d0cbfcbd84c8a8c13c893d78. -/
def record84 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 0, support := {1, 4, 5, 7} },
      { center := 1, support := {0, 2, 6, 9} },
      { center := 2, support := {1, 7, 10, 11} },
      { center := 4, support := {0, 3, 5, 7} },
      { center := 5, support := {2, 3, 4, 6} }
    ]
    data := {
      p := 0
      q := 2
      r := 4
      a := 5
      b := 7
      ap_aq := { first := (5, 0), steps := [.flip 5 0, .row 0 5 4, .flip 0 4, .row 4 0 5, .flip 4 5, .row 5 4 2], last := (5, 2) }
      ap_ar := { first := (5, 0), steps := [.flip 5 0, .row 0 5 4, .flip 0 4, .row 4 0 5, .flip 4 5], last := (5, 4) }
      bp_bq := { first := (7, 0), steps := [.flip 7 0, .row 0 7 1, .flip 0 1, .row 1 0 2, .flip 1 2, .row 2 1 7, .flip 2 7], last := (7, 2) }
      bp_br := { first := (7, 0), steps := [.flip 7 0, .row 0 7 4, .flip 0 4, .row 4 0 7, .flip 4 7], last := (7, 4) } } }

/-- Journal iteration 11456; certificate 2b1563d28e883850a8d455f530bb3580700cca1457e308a2afcc1858627e9372. -/
def record85 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 1, support := {0, 2, 8, 9} },
      { center := 2, support := {1, 6, 10, 11} },
      { center := 3, support := {0, 9, 10, 11} },
      { center := 8, support := {1, 3, 6, 9} },
      { center := 10, support := {2, 3, 7, 8} }
    ]
    data := {
      p := 0
      q := 8
      r := 9
      a := 1
      b := 3
      ap_aq := { first := (1, 0), steps := [.row 1 0 8], last := (1, 8) }
      ap_ar := { first := (1, 0), steps := [.row 1 0 9], last := (1, 9) }
      bp_bq := { first := (3, 0), steps := [.row 3 0 10, .flip 3 10, .row 10 3 2, .flip 10 2, .row 2 10 1, .flip 2 1, .row 1 2 8, .flip 1 8, .row 8 1 3, .flip 8 3], last := (3, 8) }
      bp_br := { first := (3, 0), steps := [.row 3 0 9], last := (3, 9) } } }

/-- Journal iteration 11457; certificate aebc9dd235c173bcab6534324ab1e5b624b4c4699b6ba987dada62a0c2cd6bf9. -/
def record86 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 1, support := {0, 2, 8, 9} },
      { center := 2, support := {1, 6, 10, 11} },
      { center := 8, support := {1, 3, 6, 9} },
      { center := 10, support := {2, 7, 8, 11} }
    ]
    data := {
      p := 1
      q := 6
      r := 10
      a := 2
      b := 8
      ap_aq := { first := (2, 1), steps := [.row 2 1 6], last := (2, 6) }
      ap_ar := { first := (2, 1), steps := [.row 2 1 10], last := (2, 10) }
      bp_bq := { first := (8, 1), steps := [.row 8 1 6], last := (8, 6) }
      bp_br := { first := (8, 1), steps := [.flip 8 1, .row 1 8 2, .flip 1 2, .row 2 1 10, .flip 2 10, .row 10 2 8, .flip 10 8], last := (8, 10) } } }

/-- Journal iteration 11458; certificate 3a803772fbf9cee4180ca1a1ae626ce089d9da35c8dd5599c6fa61281695d8bb. -/
def record87 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 1, support := {0, 2, 8, 9} },
      { center := 2, support := {1, 6, 10, 11} },
      { center := 3, support := {0, 9, 10, 11} },
      { center := 5, support := {0, 1, 7, 10} },
      { center := 9, support := {0, 2, 4, 5} },
      { center := 10, support := {0, 3, 5, 11} },
      { center := 11, support := {2, 3, 7, 8} }
    ]
    data := {
      p := 0
      q := 2
      r := 5
      a := 1
      b := 9
      ap_aq := { first := (1, 0), steps := [.row 1 0 2], last := (1, 2) }
      ap_ar := { first := (1, 0), steps := [.row 1 0 2, .flip 1 2, .row 2 1 11, .flip 2 11, .row 11 2 3, .flip 11 3, .row 3 11 10, .flip 3 10, .row 10 3 5, .flip 10 5, .row 5 10 1, .flip 5 1], last := (1, 5) }
      bp_bq := { first := (9, 0), steps := [.row 9 0 2], last := (9, 2) }
      bp_br := { first := (9, 0), steps := [.row 9 0 5], last := (9, 5) } } }

/-- Journal iteration 11459; certificate 5a2efcf30d51922b8eeaffa5f89e396d5b60a148cf2319442bdcbd1a8ad1ef03. -/
def record88 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 0, support := {4, 5, 7, 10} },
      { center := 5, support := {0, 1, 7, 10} },
      { center := 9, support := {0, 2, 4, 5} },
      { center := 10, support := {0, 4, 7, 11} }
    ]
    data := {
      p := 0
      q := 4
      r := 5
      a := 9
      b := 10
      ap_aq := { first := (9, 0), steps := [.row 9 0 4], last := (9, 4) }
      ap_ar := { first := (9, 0), steps := [.row 9 0 5], last := (9, 5) }
      bp_bq := { first := (10, 0), steps := [.row 10 0 4], last := (10, 4) }
      bp_br := { first := (10, 0), steps := [.flip 10 0, .row 0 10 5, .flip 0 5, .row 5 0 10, .flip 5 10], last := (10, 5) } } }

/-- Journal iteration 11460; certificate 82aa5a64b6e95d7dd6d004046969e67d3a855e325bee121c5ee429498f335ef4. -/
def record89 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 1, support := {0, 2, 8, 9} },
      { center := 2, support := {1, 6, 10, 11} },
      { center := 3, support := {0, 9, 10, 11} },
      { center := 8, support := {1, 3, 6, 9} },
      { center := 11, support := {2, 3, 7, 8} }
    ]
    data := {
      p := 0
      q := 8
      r := 9
      a := 1
      b := 3
      ap_aq := { first := (1, 0), steps := [.row 1 0 8], last := (1, 8) }
      ap_ar := { first := (1, 0), steps := [.row 1 0 9], last := (1, 9) }
      bp_bq := { first := (3, 0), steps := [.row 3 0 11, .flip 3 11, .row 11 3 2, .flip 11 2, .row 2 11 1, .flip 2 1, .row 1 2 8, .flip 1 8, .row 8 1 3, .flip 8 3], last := (3, 8) }
      bp_br := { first := (3, 0), steps := [.row 3 0 9], last := (3, 9) } } }

/-- Journal iteration 11461; certificate a7376462d0c6712d43068ce838930baaa6f6bfd0c1d4a0ad4d04f3b0d7c25f84. -/
def record90 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 1, support := {0, 2, 8, 9} },
      { center := 2, support := {1, 6, 10, 11} },
      { center := 8, support := {1, 3, 6, 9} },
      { center := 11, support := {2, 7, 8, 10} }
    ]
    data := {
      p := 1
      q := 6
      r := 11
      a := 2
      b := 8
      ap_aq := { first := (2, 1), steps := [.row 2 1 6], last := (2, 6) }
      ap_ar := { first := (2, 1), steps := [.row 2 1 11], last := (2, 11) }
      bp_bq := { first := (8, 1), steps := [.row 8 1 6], last := (8, 6) }
      bp_br := { first := (8, 1), steps := [.flip 8 1, .row 1 8 2, .flip 1 2, .row 2 1 11, .flip 2 11, .row 11 2 8, .flip 11 8], last := (8, 11) } } }

/-- Journal iteration 11462; certificate 9a535e99eeeeebff30ea46432c75c0b8bce8b275895ec9fde4edac22cb2e8066. -/
def record91 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 0, support := {2, 4, 5, 10} },
      { center := 2, support := {1, 8, 10, 11} },
      { center := 5, support := {0, 1, 7, 10} },
      { center := 10, support := {2, 3, 5, 8} }
    ]
    data := {
      p := 0
      q := 1
      r := 10
      a := 2
      b := 5
      ap_aq := { first := (2, 0), steps := [.flip 2 0, .row 0 2 5, .flip 0 5, .row 5 0 10, .flip 5 10, .row 10 5 2, .flip 10 2, .row 2 10 1], last := (2, 1) }
      ap_ar := { first := (2, 0), steps := [.flip 2 0, .row 0 2 5, .flip 0 5, .row 5 0 10, .flip 5 10, .row 10 5 2, .flip 10 2], last := (2, 10) }
      bp_bq := { first := (5, 0), steps := [.row 5 0 1], last := (5, 1) }
      bp_br := { first := (5, 0), steps := [.row 5 0 10], last := (5, 10) } } }

/-- Journal iteration 11463; certificate a1c54557aaec11912b18d18e40384a7daa92895e01f622b486535f795c5a1f18. -/
def record92 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 4, support := {1, 3, 5, 7} },
      { center := 5, support := {0, 1, 7, 10} },
      { center := 7, support := {4, 5, 6, 8} },
      { center := 11, support := {0, 1, 4, 5} }
    ]
    data := {
      p := 0
      q := 1
      r := 4
      a := 5
      b := 11
      ap_aq := { first := (5, 0), steps := [.row 5 0 1], last := (5, 1) }
      ap_ar := { first := (5, 0), steps := [.row 5 0 7, .flip 5 7, .row 7 5 4, .flip 7 4, .row 4 7 5, .flip 4 5], last := (5, 4) }
      bp_bq := { first := (11, 0), steps := [.row 11 0 1], last := (11, 1) }
      bp_br := { first := (11, 0), steps := [.row 11 0 4], last := (11, 4) } } }

/-- Journal iteration 11464; certificate 07f3a69d4c508eda64be8a9b4622864867bc990a72b5b32ec72c1866802cddac. -/
def record93 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 0, support := {3, 4, 6, 10} },
      { center := 1, support := {0, 2, 6, 9} },
      { center := 2, support := {1, 8, 10, 11} },
      { center := 3, support := {0, 9, 10, 11} },
      { center := 5, support := {0, 1, 7, 10} },
      { center := 10, support := {2, 3, 5, 8} }
    ]
    data := {
      p := 0
      q := 2
      r := 5
      a := 1
      b := 10
      ap_aq := { first := (1, 0), steps := [.row 1 0 2], last := (1, 2) }
      ap_ar := { first := (1, 0), steps := [.row 1 0 2, .flip 1 2, .row 2 1 10, .flip 2 10, .row 10 2 5, .flip 10 5, .row 5 10 1, .flip 5 1], last := (1, 5) }
      bp_bq := { first := (10, 0), steps := [.flip 10 0, .row 0 10 3, .flip 0 3, .row 3 0 10, .flip 3 10, .row 10 3 2], last := (10, 2) }
      bp_br := { first := (10, 0), steps := [.flip 10 0, .row 0 10 3, .flip 0 3, .row 3 0 10, .flip 3 10, .row 10 3 5], last := (10, 5) } } }

/-- Journal iteration 11465; certificate 891d372beae7e40e52de7d70b669d7699156033b6d9133e81814b24ff0941cb7. -/
def record94 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 0, support := {3, 4, 7, 10} },
      { center := 1, support := {0, 2, 6, 9} },
      { center := 2, support := {1, 8, 10, 11} },
      { center := 3, support := {0, 9, 10, 11} },
      { center := 5, support := {0, 1, 7, 10} },
      { center := 10, support := {2, 3, 5, 8} }
    ]
    data := {
      p := 0
      q := 2
      r := 5
      a := 1
      b := 10
      ap_aq := { first := (1, 0), steps := [.row 1 0 2], last := (1, 2) }
      ap_ar := { first := (1, 0), steps := [.row 1 0 2, .flip 1 2, .row 2 1 10, .flip 2 10, .row 10 2 5, .flip 10 5, .row 5 10 1, .flip 5 1], last := (1, 5) }
      bp_bq := { first := (10, 0), steps := [.flip 10 0, .row 0 10 3, .flip 0 3, .row 3 0 10, .flip 3 10, .row 10 3 2], last := (10, 2) }
      bp_br := { first := (10, 0), steps := [.flip 10 0, .row 0 10 3, .flip 0 3, .row 3 0 10, .flip 3 10, .row 10 3 5], last := (10, 5) } } }

/-- Journal iteration 11466; certificate 5bd87211a154d5bff0f17f8cb00a4bfeb41a56c71ff6845fd569d5fcecce8532. -/
def record95 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 0, support := {3, 4, 8, 10} },
      { center := 1, support := {0, 2, 6, 9} },
      { center := 2, support := {1, 8, 10, 11} },
      { center := 3, support := {0, 9, 10, 11} },
      { center := 5, support := {0, 1, 7, 10} },
      { center := 10, support := {2, 3, 5, 8} }
    ]
    data := {
      p := 0
      q := 2
      r := 5
      a := 1
      b := 10
      ap_aq := { first := (1, 0), steps := [.row 1 0 2], last := (1, 2) }
      ap_ar := { first := (1, 0), steps := [.row 1 0 2, .flip 1 2, .row 2 1 10, .flip 2 10, .row 10 2 5, .flip 10 5, .row 5 10 1, .flip 5 1], last := (1, 5) }
      bp_bq := { first := (10, 0), steps := [.flip 10 0, .row 0 10 3, .flip 0 3, .row 3 0 10, .flip 3 10, .row 10 3 2], last := (10, 2) }
      bp_br := { first := (10, 0), steps := [.flip 10 0, .row 0 10 3, .flip 0 3, .row 3 0 10, .flip 3 10, .row 10 3 5], last := (10, 5) } } }

/-- Journal iteration 11467; certificate 71ffeef757c362aa43919572d72464b333dad1f230c318cd944616c82c77ef99. -/
def record96 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 0, support := {4, 5, 6, 10} },
      { center := 1, support := {0, 2, 6, 9} },
      { center := 2, support := {1, 8, 10, 11} },
      { center := 5, support := {0, 1, 7, 10} },
      { center := 10, support := {2, 3, 5, 8} }
    ]
    data := {
      p := 0
      q := 2
      r := 5
      a := 1
      b := 10
      ap_aq := { first := (1, 0), steps := [.row 1 0 2], last := (1, 2) }
      ap_ar := { first := (1, 0), steps := [.row 1 0 2, .flip 1 2, .row 2 1 10, .flip 2 10, .row 10 2 5, .flip 10 5, .row 5 10 1, .flip 5 1], last := (1, 5) }
      bp_bq := { first := (10, 0), steps := [.flip 10 0, .row 0 10 5, .flip 0 5, .row 5 0 10, .flip 5 10, .row 10 5 2], last := (10, 2) }
      bp_br := { first := (10, 0), steps := [.flip 10 0, .row 0 10 5, .flip 0 5, .row 5 0 10, .flip 5 10], last := (10, 5) } } }

/-- Journal iteration 11468; certificate 53c396b8e0a8420de4ce3f49be328c3c0bb51a97d33b305a4806dd3e32393ce6. -/
def record97 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 0, support := {2, 4, 5, 10} },
      { center := 2, support := {5, 9, 10, 11} },
      { center := 3, support := {0, 1, 7, 9} },
      { center := 4, support := {1, 3, 5, 7} },
      { center := 5, support := {0, 3, 4, 7} },
      { center := 7, support := {3, 4, 6, 8} },
      { center := 9, support := {0, 2, 3, 5} },
      { center := 10, support := {1, 2, 4, 8} }
    ]
    data := {
      p := 0
      q := 1
      r := 4
      a := 3
      b := 10
      ap_aq := { first := (3, 0), steps := [.row 3 0 1], last := (3, 1) }
      ap_ar := { first := (3, 0), steps := [.row 3 0 7, .flip 3 7, .row 7 3 4, .flip 7 4, .row 4 7 3, .flip 4 3], last := (3, 4) }
      bp_bq := { first := (10, 0), steps := [.flip 10 0, .row 0 10 5, .flip 0 5, .row 5 0 4, .flip 5 4, .row 4 5 7, .flip 4 7, .row 7 4 3, .flip 7 3, .row 3 7 9, .flip 3 9, .row 9 3 2, .flip 9 2, .row 2 9 10, .flip 2 10, .row 10 2 1], last := (10, 1) }
      bp_br := { first := (10, 0), steps := [.flip 10 0, .row 0 10 5, .flip 0 5, .row 5 0 4, .flip 5 4, .row 4 5 7, .flip 4 7, .row 7 4 3, .flip 7 3, .row 3 7 9, .flip 3 9, .row 9 3 2, .flip 9 2, .row 2 9 10, .flip 2 10, .row 10 2 4], last := (10, 4) } } }

/-- Journal iteration 11469; certificate 02dda8cec32e24ca7f1e3e09f9bd5298ece8e1237e0848d917a6099753febae8. -/
def record98 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 0, support := {2, 4, 5, 10} },
      { center := 2, support := {5, 9, 10, 11} },
      { center := 3, support := {0, 1, 7, 9} },
      { center := 4, support := {1, 3, 5, 7} },
      { center := 5, support := {0, 3, 4, 7} },
      { center := 7, support := {3, 4, 6, 8} },
      { center := 9, support := {0, 2, 3, 10} },
      { center := 10, support := {1, 2, 4, 8} }
    ]
    data := {
      p := 0
      q := 1
      r := 4
      a := 3
      b := 10
      ap_aq := { first := (3, 0), steps := [.row 3 0 1], last := (3, 1) }
      ap_ar := { first := (3, 0), steps := [.row 3 0 7, .flip 3 7, .row 7 3 4, .flip 7 4, .row 4 7 3, .flip 4 3], last := (3, 4) }
      bp_bq := { first := (10, 0), steps := [.flip 10 0, .row 0 10 5, .flip 0 5, .row 5 0 4, .flip 5 4, .row 4 5 7, .flip 4 7, .row 7 4 3, .flip 7 3, .row 3 7 9, .flip 3 9, .row 9 3 2, .flip 9 2, .row 2 9 10, .flip 2 10, .row 10 2 1], last := (10, 1) }
      bp_br := { first := (10, 0), steps := [.flip 10 0, .row 0 10 5, .flip 0 5, .row 5 0 4, .flip 5 4, .row 4 5 7, .flip 4 7, .row 7 4 3, .flip 7 3, .row 3 7 9, .flip 3 9, .row 9 3 2, .flip 9 2, .row 2 9 10, .flip 2 10, .row 10 2 4], last := (10, 4) } } }

/-- Journal iteration 11470; certificate 18a0448e83e890f63018830e193d8f303b4dda51e39032cb9d7a6b7c3adf6f1c. -/
def record99 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 0, support := {2, 4, 5, 10} },
      { center := 2, support := {5, 9, 10, 11} },
      { center := 3, support := {0, 1, 7, 9} },
      { center := 4, support := {1, 3, 5, 7} },
      { center := 5, support := {0, 3, 4, 7} },
      { center := 7, support := {3, 4, 6, 8} },
      { center := 9, support := {0, 2, 3, 11} },
      { center := 10, support := {1, 2, 4, 8} }
    ]
    data := {
      p := 0
      q := 1
      r := 4
      a := 3
      b := 10
      ap_aq := { first := (3, 0), steps := [.row 3 0 1], last := (3, 1) }
      ap_ar := { first := (3, 0), steps := [.row 3 0 7, .flip 3 7, .row 7 3 4, .flip 7 4, .row 4 7 3, .flip 4 3], last := (3, 4) }
      bp_bq := { first := (10, 0), steps := [.flip 10 0, .row 0 10 5, .flip 0 5, .row 5 0 4, .flip 5 4, .row 4 5 7, .flip 4 7, .row 7 4 3, .flip 7 3, .row 3 7 9, .flip 3 9, .row 9 3 2, .flip 9 2, .row 2 9 10, .flip 2 10, .row 10 2 1], last := (10, 1) }
      bp_br := { first := (10, 0), steps := [.flip 10 0, .row 0 10 5, .flip 0 5, .row 5 0 4, .flip 5 4, .row 4 5 7, .flip 4 7, .row 7 4 3, .flip 7 3, .row 3 7 9, .flip 3 9, .row 9 3 2, .flip 9 2, .row 2 9 10, .flip 2 10, .row 10 2 4], last := (10, 4) } } }

def bankChunk0 : List (DuplicateCenterNogood Label) :=
  [record0, record1, record2, record3, record4, record5, record6, record7, record8, record9, record10, record11, record12, record13, record14, record15, record16, record17, record18, record19, record20, record21, record22, record23, record24, record25, record26, record27, record28, record29, record30, record31, record32, record33, record34, record35, record36, record37, record38, record39, record40, record41, record42, record43, record44, record45, record46, record47, record48, record49, record50, record51, record52, record53, record54, record55, record56, record57, record58, record59, record60, record61, record62, record63, record64, record65, record66, record67, record68, record69, record70, record71, record72, record73, record74, record75, record76, record77, record78, record79, record80, record81, record82, record83, record84, record85, record86, record87, record88, record89, record90, record91, record92, record93, record94, record95, record96, record97, record98, record99]

def bank : List (DuplicateCenterNogood Label) :=
  bankChunk0

def bankCheck : Bool := bank.all fun nogood => nogood.check

def bankFourSupportedCheck : Bool :=
  bank.all fun nogood => nogood.fourSupportedCheck

theorem bankCheck_true : bankCheck = true := by
  native_decide

theorem bankFourSupportedCheck_true : bankFourSupportedCheck = true := by
  native_decide

theorem bank_valid : ∀ nogood ∈ bank, nogood.check = true := by
  apply List.all_eq_true.mp
  simpa [bankCheck] using bankCheck_true

theorem bank_fourSupported : ∀ nogood ∈ bank, nogood.FourSupported := by
  intro nogood hnogood
  apply nogood.fourSupported_of_check
  have hall : bank.all (fun item => item.fourSupportedCheck) = true := by
    simpa [bankFourSupportedCheck] using bankFourSupportedCheck_true
  exact List.all_eq_true.mp hall nogood hnogood

end Problem97.ATailFrontierLiveClosure.ExactTwelveGeneratedDuplicateCenterBank
