/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q1_009, term block 9:1100-1199

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q1_009`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ1009TermShards

/-- Generator polynomial 9 for endpoint certificate `ep_Q1_009`. -/
def ep_Q1_009_generator_09_1100_1199 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(2, 1)]
]

/-- Coefficient term 1100 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1100 : Poly :=
[
  term ((-23320267409785460644907 : Rat) / 4676338877845046513121) [(3, 1), (7, 1), (9, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1100 for generator 9. -/
def ep_Q1_009_partial_09_1100 : Poly :=
[
  term ((-46640534819570921289814 : Rat) / 4676338877845046513121) [(2, 1), (3, 1), (7, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((23320267409785460644907 : Rat) / 4676338877845046513121) [(3, 1), (7, 1), (9, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1100 for generator 9. -/
theorem ep_Q1_009_partial_09_1100_valid :
    mulPoly ep_Q1_009_coefficient_09_1100
        ep_Q1_009_generator_09_1100_1199 =
      ep_Q1_009_partial_09_1100 := by
  native_decide

/-- Coefficient term 1101 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1101 : Poly :=
[
  term ((26633601360100110497209843905250672000 : Rat) / 2144116865330816633312319087537095051139) [(3, 1), (7, 1), (9, 1), (14, 1), (15, 3)]
]

/-- Partial product 1101 for generator 9. -/
def ep_Q1_009_partial_09_1101 : Poly :=
[
  term ((53267202720200220994419687810501344000 : Rat) / 2144116865330816633312319087537095051139) [(2, 1), (3, 1), (7, 1), (9, 1), (14, 1), (15, 3)],
  term ((-26633601360100110497209843905250672000 : Rat) / 2144116865330816633312319087537095051139) [(3, 1), (7, 1), (9, 1), (14, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1101 for generator 9. -/
theorem ep_Q1_009_partial_09_1101_valid :
    mulPoly ep_Q1_009_coefficient_09_1101
        ep_Q1_009_generator_09_1100_1199 =
      ep_Q1_009_partial_09_1101 := by
  native_decide

/-- Coefficient term 1102 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1102 : Poly :=
[
  term ((233637577096787738975350518554948011656476223853347409178090506209030323643718622928326097932541127 : Rat) / 2025317645607814821726921599437609780714587560991292730581181383668794186118491346365102069322240) [(3, 1), (7, 1), (12, 1)]
]

/-- Partial product 1102 for generator 9. -/
def ep_Q1_009_partial_09_1102 : Poly :=
[
  term ((233637577096787738975350518554948011656476223853347409178090506209030323643718622928326097932541127 : Rat) / 1012658822803907410863460799718804890357293780495646365290590691834397093059245673182551034661120) [(2, 1), (3, 1), (7, 1), (12, 1)],
  term ((-233637577096787738975350518554948011656476223853347409178090506209030323643718622928326097932541127 : Rat) / 2025317645607814821726921599437609780714587560991292730581181383668794186118491346365102069322240) [(3, 1), (7, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1102 for generator 9. -/
theorem ep_Q1_009_partial_09_1102_valid :
    mulPoly ep_Q1_009_coefficient_09_1102
        ep_Q1_009_generator_09_1100_1199 =
      ep_Q1_009_partial_09_1102 := by
  native_decide

/-- Coefficient term 1103 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1103 : Poly :=
[
  term ((-6745982505310522073976992872153600512077025150703269159418234954655211329851278040953537991751435 : Rat) / 1280290083116368655163089725358774754237435708198067190403103946104916324796332029666510950964416) [(3, 1), (7, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 1103 for generator 9. -/
def ep_Q1_009_partial_09_1103 : Poly :=
[
  term ((-6745982505310522073976992872153600512077025150703269159418234954655211329851278040953537991751435 : Rat) / 640145041558184327581544862679387377118717854099033595201551973052458162398166014833255475482208) [(2, 1), (3, 1), (7, 1), (12, 1), (13, 1), (15, 1)],
  term ((6745982505310522073976992872153600512077025150703269159418234954655211329851278040953537991751435 : Rat) / 1280290083116368655163089725358774754237435708198067190403103946104916324796332029666510950964416) [(3, 1), (7, 1), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1103 for generator 9. -/
theorem ep_Q1_009_partial_09_1103_valid :
    mulPoly ep_Q1_009_coefficient_09_1103
        ep_Q1_009_generator_09_1100_1199 =
      ep_Q1_009_partial_09_1103 := by
  native_decide

/-- Coefficient term 1104 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1104 : Poly :=
[
  term ((-2870150 : Rat) / 3536493) [(3, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1104 for generator 9. -/
def ep_Q1_009_partial_09_1104 : Poly :=
[
  term ((-5740300 : Rat) / 3536493) [(2, 1), (3, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((2870150 : Rat) / 3536493) [(3, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1104 for generator 9. -/
theorem ep_Q1_009_partial_09_1104_valid :
    mulPoly ep_Q1_009_coefficient_09_1104
        ep_Q1_009_generator_09_1100_1199 =
      ep_Q1_009_partial_09_1104 := by
  native_decide

/-- Coefficient term 1105 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1105 : Poly :=
[
  term ((20 : Rat) / 51) [(3, 1), (7, 1), (12, 1), (14, 1), (16, 1)]
]

/-- Partial product 1105 for generator 9. -/
def ep_Q1_009_partial_09_1105 : Poly :=
[
  term ((40 : Rat) / 51) [(2, 1), (3, 1), (7, 1), (12, 1), (14, 1), (16, 1)],
  term ((-20 : Rat) / 51) [(3, 1), (7, 1), (12, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1105 for generator 9. -/
theorem ep_Q1_009_partial_09_1105_valid :
    mulPoly ep_Q1_009_coefficient_09_1105
        ep_Q1_009_generator_09_1100_1199 =
      ep_Q1_009_partial_09_1105 := by
  native_decide

/-- Coefficient term 1106 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1106 : Poly :=
[
  term ((-17023240426214327834626340732636156238816997590159911640718610415840541388047978524061634010028172862468507139 : Rat) / 2501778195425894350790428758229288049412272605531317417561410509405606181076928190995367999350727438389944672) [(3, 1), (7, 1), (12, 1), (15, 2)]
]

/-- Partial product 1106 for generator 9. -/
def ep_Q1_009_partial_09_1106 : Poly :=
[
  term ((-17023240426214327834626340732636156238816997590159911640718610415840541388047978524061634010028172862468507139 : Rat) / 1250889097712947175395214379114644024706136302765658708780705254702803090538464095497683999675363719194972336) [(2, 1), (3, 1), (7, 1), (12, 1), (15, 2)],
  term ((17023240426214327834626340732636156238816997590159911640718610415840541388047978524061634010028172862468507139 : Rat) / 2501778195425894350790428758229288049412272605531317417561410509405606181076928190995367999350727438389944672) [(3, 1), (7, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1106 for generator 9. -/
theorem ep_Q1_009_partial_09_1106_valid :
    mulPoly ep_Q1_009_coefficient_09_1106
        ep_Q1_009_generator_09_1100_1199 =
      ep_Q1_009_partial_09_1106 := by
  native_decide

/-- Coefficient term 1107 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1107 : Poly :=
[
  term ((-44917673544141785001 : Rat) / 96747836051316104659) [(3, 1), (7, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 1107 for generator 9. -/
def ep_Q1_009_partial_09_1107 : Poly :=
[
  term ((-89835347088283570002 : Rat) / 96747836051316104659) [(2, 1), (3, 1), (7, 1), (12, 1), (15, 2), (16, 1)],
  term ((44917673544141785001 : Rat) / 96747836051316104659) [(3, 1), (7, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1107 for generator 9. -/
theorem ep_Q1_009_partial_09_1107_valid :
    mulPoly ep_Q1_009_coefficient_09_1107
        ep_Q1_009_generator_09_1100_1199 =
      ep_Q1_009_partial_09_1107 := by
  native_decide

/-- Coefficient term 1108 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1108 : Poly :=
[
  term ((1604303059 : Rat) / 99021804) [(3, 1), (7, 1), (12, 1), (16, 1)]
]

/-- Partial product 1108 for generator 9. -/
def ep_Q1_009_partial_09_1108 : Poly :=
[
  term ((1604303059 : Rat) / 49510902) [(2, 1), (3, 1), (7, 1), (12, 1), (16, 1)],
  term ((-1604303059 : Rat) / 99021804) [(3, 1), (7, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1108 for generator 9. -/
theorem ep_Q1_009_partial_09_1108_valid :
    mulPoly ep_Q1_009_coefficient_09_1108
        ep_Q1_009_generator_09_1100_1199 =
      ep_Q1_009_partial_09_1108 := by
  native_decide

/-- Coefficient term 1109 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1109 : Poly :=
[
  term ((-16 : Rat) / 3) [(3, 1), (7, 1), (12, 2), (16, 1)]
]

/-- Partial product 1109 for generator 9. -/
def ep_Q1_009_partial_09_1109 : Poly :=
[
  term ((-32 : Rat) / 3) [(2, 1), (3, 1), (7, 1), (12, 2), (16, 1)],
  term ((16 : Rat) / 3) [(3, 1), (7, 1), (12, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1109 for generator 9. -/
theorem ep_Q1_009_partial_09_1109_valid :
    mulPoly ep_Q1_009_coefficient_09_1109
        ep_Q1_009_generator_09_1100_1199 =
      ep_Q1_009_partial_09_1109 := by
  native_decide

/-- Coefficient term 1110 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1110 : Poly :=
[
  term ((-2532738974754285605488857028946182311470422510976941574726938641389018005029332108687106765418405 : Rat) / 365797166604676758618025635816792786924981630913733482972315413172833235656094865619003128846976) [(3, 1), (7, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 1110 for generator 9. -/
def ep_Q1_009_partial_09_1110 : Poly :=
[
  term ((-2532738974754285605488857028946182311470422510976941574726938641389018005029332108687106765418405 : Rat) / 182898583302338379309012817908396393462490815456866741486157706586416617828047432809501564423488) [(2, 1), (3, 1), (7, 1), (13, 1), (14, 1), (15, 1)],
  term ((2532738974754285605488857028946182311470422510976941574726938641389018005029332108687106765418405 : Rat) / 365797166604676758618025635816792786924981630913733482972315413172833235656094865619003128846976) [(3, 1), (7, 1), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1110 for generator 9. -/
theorem ep_Q1_009_partial_09_1110_valid :
    mulPoly ep_Q1_009_coefficient_09_1110
        ep_Q1_009_generator_09_1100_1199 =
      ep_Q1_009_partial_09_1110 := by
  native_decide

/-- Coefficient term 1111 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1111 : Poly :=
[
  term ((-3731195 : Rat) / 3536493) [(3, 1), (7, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1111 for generator 9. -/
def ep_Q1_009_partial_09_1111 : Poly :=
[
  term ((-7462390 : Rat) / 3536493) [(2, 1), (3, 1), (7, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((3731195 : Rat) / 3536493) [(3, 1), (7, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1111 for generator 9. -/
theorem ep_Q1_009_partial_09_1111_valid :
    mulPoly ep_Q1_009_coefficient_09_1111
        ep_Q1_009_generator_09_1100_1199 =
      ep_Q1_009_partial_09_1111 := by
  native_decide

/-- Coefficient term 1112 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1112 : Poly :=
[
  term ((6787203876935009431820866292810973305314566930053288987375008782398597542371278444068874639441675 : Rat) / 640145041558184327581544862679387377118717854099033595201551973052458162398166014833255475482208) [(3, 1), (7, 1), (13, 1), (14, 2), (15, 1)]
]

/-- Partial product 1112 for generator 9. -/
def ep_Q1_009_partial_09_1112 : Poly :=
[
  term ((6787203876935009431820866292810973305314566930053288987375008782398597542371278444068874639441675 : Rat) / 320072520779092163790772431339693688559358927049516797600775986526229081199083007416627737741104) [(2, 1), (3, 1), (7, 1), (13, 1), (14, 2), (15, 1)],
  term ((-6787203876935009431820866292810973305314566930053288987375008782398597542371278444068874639441675 : Rat) / 640145041558184327581544862679387377118717854099033595201551973052458162398166014833255475482208) [(3, 1), (7, 1), (13, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1112 for generator 9. -/
theorem ep_Q1_009_partial_09_1112_valid :
    mulPoly ep_Q1_009_coefficient_09_1112
        ep_Q1_009_generator_09_1100_1199 =
      ep_Q1_009_partial_09_1112 := by
  native_decide

/-- Coefficient term 1113 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1113 : Poly :=
[
  term ((5740300 : Rat) / 3536493) [(3, 1), (7, 1), (13, 1), (14, 2), (15, 1), (16, 1)]
]

/-- Partial product 1113 for generator 9. -/
def ep_Q1_009_partial_09_1113 : Poly :=
[
  term ((11480600 : Rat) / 3536493) [(2, 1), (3, 1), (7, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-5740300 : Rat) / 3536493) [(3, 1), (7, 1), (13, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1113 for generator 9. -/
theorem ep_Q1_009_partial_09_1113_valid :
    mulPoly ep_Q1_009_coefficient_09_1113
        ep_Q1_009_generator_09_1100_1199 =
      ep_Q1_009_partial_09_1113 := by
  native_decide

/-- Coefficient term 1114 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1114 : Poly :=
[
  term ((-233503541949684797042239401545271175760983947979819272652505101918914134773026426442484168192541127 : Rat) / 2025317645607814821726921599437609780714587560991292730581181383668794186118491346365102069322240) [(3, 1), (7, 1), (14, 1)]
]

/-- Partial product 1114 for generator 9. -/
def ep_Q1_009_partial_09_1114 : Poly :=
[
  term ((-233503541949684797042239401545271175760983947979819272652505101918914134773026426442484168192541127 : Rat) / 1012658822803907410863460799718804890357293780495646365290590691834397093059245673182551034661120) [(2, 1), (3, 1), (7, 1), (14, 1)],
  term ((233503541949684797042239401545271175760983947979819272652505101918914134773026426442484168192541127 : Rat) / 2025317645607814821726921599437609780714587560991292730581181383668794186118491346365102069322240) [(3, 1), (7, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1114 for generator 9. -/
theorem ep_Q1_009_partial_09_1114_valid :
    mulPoly ep_Q1_009_coefficient_09_1114
        ep_Q1_009_generator_09_1100_1199 =
      ep_Q1_009_partial_09_1114 := by
  native_decide

/-- Coefficient term 1115 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1115 : Poly :=
[
  term ((519964288709327259824940864005541294279534641614225008950703461058498433010266692195238736984995114397845562651 : Rat) / 60042676690221464418970290197502913185894542532751618021473852225734548345846276583888831984417458521358672128) [(3, 1), (7, 1), (14, 1), (15, 2)]
]

/-- Partial product 1115 for generator 9. -/
def ep_Q1_009_partial_09_1115 : Poly :=
[
  term ((519964288709327259824940864005541294279534641614225008950703461058498433010266692195238736984995114397845562651 : Rat) / 30021338345110732209485145098751456592947271266375809010736926112867274172923138291944415992208729260679336064) [(2, 1), (3, 1), (7, 1), (14, 1), (15, 2)],
  term ((-519964288709327259824940864005541294279534641614225008950703461058498433010266692195238736984995114397845562651 : Rat) / 60042676690221464418970290197502913185894542532751618021473852225734548345846276583888831984417458521358672128) [(3, 1), (7, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1115 for generator 9. -/
theorem ep_Q1_009_partial_09_1115_valid :
    mulPoly ep_Q1_009_coefficient_09_1115
        ep_Q1_009_generator_09_1100_1199 =
      ep_Q1_009_partial_09_1115 := by
  native_decide

/-- Coefficient term 1116 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1116 : Poly :=
[
  term ((434395292692646078851 : Rat) / 580487016307896627954) [(3, 1), (7, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 1116 for generator 9. -/
def ep_Q1_009_partial_09_1116 : Poly :=
[
  term ((434395292692646078851 : Rat) / 290243508153948313977) [(2, 1), (3, 1), (7, 1), (14, 1), (15, 2), (16, 1)],
  term ((-434395292692646078851 : Rat) / 580487016307896627954) [(3, 1), (7, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1116 for generator 9. -/
theorem ep_Q1_009_partial_09_1116_valid :
    mulPoly ep_Q1_009_coefficient_09_1116
        ep_Q1_009_generator_09_1100_1199 =
      ep_Q1_009_partial_09_1116 := by
  native_decide

/-- Coefficient term 1117 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1117 : Poly :=
[
  term ((-473930761 : Rat) / 33007268) [(3, 1), (7, 1), (14, 1), (16, 1)]
]

/-- Partial product 1117 for generator 9. -/
def ep_Q1_009_partial_09_1117 : Poly :=
[
  term ((-473930761 : Rat) / 16503634) [(2, 1), (3, 1), (7, 1), (14, 1), (16, 1)],
  term ((473930761 : Rat) / 33007268) [(3, 1), (7, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1117 for generator 9. -/
theorem ep_Q1_009_partial_09_1117_valid :
    mulPoly ep_Q1_009_coefficient_09_1117
        ep_Q1_009_generator_09_1100_1199 =
      ep_Q1_009_partial_09_1117 := by
  native_decide

/-- Coefficient term 1118 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1118 : Poly :=
[
  term ((16839391847020645411857945843000110748995652146235952535458311868093750 : Rat) / 445285858417741453082477510911583302063475897174314508335274303497129151) [(3, 1), (7, 1), (14, 2)]
]

/-- Partial product 1118 for generator 9. -/
def ep_Q1_009_partial_09_1118 : Poly :=
[
  term ((33678783694041290823715891686000221497991304292471905070916623736187500 : Rat) / 445285858417741453082477510911583302063475897174314508335274303497129151) [(2, 1), (3, 1), (7, 1), (14, 2)],
  term ((-16839391847020645411857945843000110748995652146235952535458311868093750 : Rat) / 445285858417741453082477510911583302063475897174314508335274303497129151) [(3, 1), (7, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1118 for generator 9. -/
theorem ep_Q1_009_partial_09_1118_valid :
    mulPoly ep_Q1_009_coefficient_09_1118
        ep_Q1_009_generator_09_1100_1199 =
      ep_Q1_009_partial_09_1118 := by
  native_decide

/-- Coefficient term 1119 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1119 : Poly :=
[
  term ((44 : Rat) / 51) [(3, 1), (7, 1), (14, 2), (16, 1)]
]

/-- Partial product 1119 for generator 9. -/
def ep_Q1_009_partial_09_1119 : Poly :=
[
  term ((88 : Rat) / 51) [(2, 1), (3, 1), (7, 1), (14, 2), (16, 1)],
  term ((-44 : Rat) / 51) [(3, 1), (7, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1119 for generator 9. -/
theorem ep_Q1_009_partial_09_1119_valid :
    mulPoly ep_Q1_009_coefficient_09_1119
        ep_Q1_009_generator_09_1100_1199 =
      ep_Q1_009_partial_09_1119 := by
  native_decide

/-- Coefficient term 1120 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1120 : Poly :=
[
  term ((7 : Rat) / 51) [(3, 1), (7, 1), (16, 1)]
]

/-- Partial product 1120 for generator 9. -/
def ep_Q1_009_partial_09_1120 : Poly :=
[
  term ((14 : Rat) / 51) [(2, 1), (3, 1), (7, 1), (16, 1)],
  term ((-7 : Rat) / 51) [(3, 1), (7, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1120 for generator 9. -/
theorem ep_Q1_009_partial_09_1120_valid :
    mulPoly ep_Q1_009_coefficient_09_1120
        ep_Q1_009_generator_09_1100_1199 =
      ep_Q1_009_partial_09_1120 := by
  native_decide

/-- Coefficient term 1121 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1121 : Poly :=
[
  term ((73103670173685598970646552621979391061509339498506216475909834971339678567002841432968724561 : Rat) / 185834061356336465952007418243014613287144620422721182897159175158604110096121852476183785536) [(3, 1), (7, 2), (8, 1), (12, 1), (15, 1)]
]

/-- Partial product 1121 for generator 9. -/
def ep_Q1_009_partial_09_1121 : Poly :=
[
  term ((73103670173685598970646552621979391061509339498506216475909834971339678567002841432968724561 : Rat) / 92917030678168232976003709121507306643572310211360591448579587579302055048060926238091892768) [(2, 1), (3, 1), (7, 2), (8, 1), (12, 1), (15, 1)],
  term ((-73103670173685598970646552621979391061509339498506216475909834971339678567002841432968724561 : Rat) / 185834061356336465952007418243014613287144620422721182897159175158604110096121852476183785536) [(3, 1), (7, 2), (8, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1121 for generator 9. -/
theorem ep_Q1_009_partial_09_1121_valid :
    mulPoly ep_Q1_009_coefficient_09_1121
        ep_Q1_009_generator_09_1100_1199 =
      ep_Q1_009_partial_09_1121 := by
  native_decide

/-- Coefficient term 1122 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1122 : Poly :=
[
  term ((-73103670173685598970646552621979391061509339498506216475909834971339678567002841432968724561 : Rat) / 185834061356336465952007418243014613287144620422721182897159175158604110096121852476183785536) [(3, 1), (7, 2), (8, 1), (14, 1), (15, 1)]
]

/-- Partial product 1122 for generator 9. -/
def ep_Q1_009_partial_09_1122 : Poly :=
[
  term ((-73103670173685598970646552621979391061509339498506216475909834971339678567002841432968724561 : Rat) / 92917030678168232976003709121507306643572310211360591448579587579302055048060926238091892768) [(2, 1), (3, 1), (7, 2), (8, 1), (14, 1), (15, 1)],
  term ((73103670173685598970646552621979391061509339498506216475909834971339678567002841432968724561 : Rat) / 185834061356336465952007418243014613287144620422721182897159175158604110096121852476183785536) [(3, 1), (7, 2), (8, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1122 for generator 9. -/
theorem ep_Q1_009_partial_09_1122_valid :
    mulPoly ep_Q1_009_coefficient_09_1122
        ep_Q1_009_generator_09_1100_1199 =
      ep_Q1_009_partial_09_1122 := by
  native_decide

/-- Coefficient term 1123 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1123 : Poly :=
[
  term ((-56509410952730211447664397618195454152469574224789589164563298109108862856480676791346561 : Rat) / 395288984469371511586188861036364960556275781439386448197092400615694536422969488488197920) [(3, 1), (7, 2), (9, 1), (12, 1)]
]

/-- Partial product 1123 for generator 9. -/
def ep_Q1_009_partial_09_1123 : Poly :=
[
  term ((-56509410952730211447664397618195454152469574224789589164563298109108862856480676791346561 : Rat) / 197644492234685755793094430518182480278137890719693224098546200307847268211484744244098960) [(2, 1), (3, 1), (7, 2), (9, 1), (12, 1)],
  term ((56509410952730211447664397618195454152469574224789589164563298109108862856480676791346561 : Rat) / 395288984469371511586188861036364960556275781439386448197092400615694536422969488488197920) [(3, 1), (7, 2), (9, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1123 for generator 9. -/
theorem ep_Q1_009_partial_09_1123_valid :
    mulPoly ep_Q1_009_coefficient_09_1123
        ep_Q1_009_generator_09_1100_1199 =
      ep_Q1_009_partial_09_1123 := by
  native_decide

/-- Coefficient term 1124 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1124 : Poly :=
[
  term ((6873187447767770450892862943290496000 : Rat) / 714705621776938877770773029179031683713) [(3, 1), (7, 2), (9, 1), (12, 1), (15, 2)]
]

/-- Partial product 1124 for generator 9. -/
def ep_Q1_009_partial_09_1124 : Poly :=
[
  term ((13746374895535540901785725886580992000 : Rat) / 714705621776938877770773029179031683713) [(2, 1), (3, 1), (7, 2), (9, 1), (12, 1), (15, 2)],
  term ((-6873187447767770450892862943290496000 : Rat) / 714705621776938877770773029179031683713) [(3, 1), (7, 2), (9, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1124 for generator 9. -/
theorem ep_Q1_009_partial_09_1124_valid :
    mulPoly ep_Q1_009_coefficient_09_1124
        ep_Q1_009_generator_09_1100_1199 =
      ep_Q1_009_partial_09_1124 := by
  native_decide

/-- Coefficient term 1125 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1125 : Poly :=
[
  term ((56509410952730211447664397618195454152469574224789589164563298109108862856480676791346561 : Rat) / 395288984469371511586188861036364960556275781439386448197092400615694536422969488488197920) [(3, 1), (7, 2), (9, 1), (14, 1)]
]

/-- Partial product 1125 for generator 9. -/
def ep_Q1_009_partial_09_1125 : Poly :=
[
  term ((56509410952730211447664397618195454152469574224789589164563298109108862856480676791346561 : Rat) / 197644492234685755793094430518182480278137890719693224098546200307847268211484744244098960) [(2, 1), (3, 1), (7, 2), (9, 1), (14, 1)],
  term ((-56509410952730211447664397618195454152469574224789589164563298109108862856480676791346561 : Rat) / 395288984469371511586188861036364960556275781439386448197092400615694536422969488488197920) [(3, 1), (7, 2), (9, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1125 for generator 9. -/
theorem ep_Q1_009_partial_09_1125_valid :
    mulPoly ep_Q1_009_coefficient_09_1125
        ep_Q1_009_generator_09_1100_1199 =
      ep_Q1_009_partial_09_1125 := by
  native_decide

/-- Coefficient term 1126 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1126 : Poly :=
[
  term ((-6873187447767770450892862943290496000 : Rat) / 714705621776938877770773029179031683713) [(3, 1), (7, 2), (9, 1), (14, 1), (15, 2)]
]

/-- Partial product 1126 for generator 9. -/
def ep_Q1_009_partial_09_1126 : Poly :=
[
  term ((-13746374895535540901785725886580992000 : Rat) / 714705621776938877770773029179031683713) [(2, 1), (3, 1), (7, 2), (9, 1), (14, 1), (15, 2)],
  term ((6873187447767770450892862943290496000 : Rat) / 714705621776938877770773029179031683713) [(3, 1), (7, 2), (9, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1126 for generator 9. -/
theorem ep_Q1_009_partial_09_1126_valid :
    mulPoly ep_Q1_009_coefficient_09_1126
        ep_Q1_009_generator_09_1100_1199 =
      ep_Q1_009_partial_09_1126 := by
  native_decide

/-- Coefficient term 1127 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1127 : Poly :=
[
  term ((1357440775387001886364173258562194661062913386010657797475001756479719508474255688813774927888335 : Rat) / 213381680519394775860514954226462459039572618033011198400517324350819387466055338277751825160736) [(3, 1), (7, 2), (12, 1), (15, 1)]
]

/-- Partial product 1127 for generator 9. -/
def ep_Q1_009_partial_09_1127 : Poly :=
[
  term ((1357440775387001886364173258562194661062913386010657797475001756479719508474255688813774927888335 : Rat) / 106690840259697387930257477113231229519786309016505599200258662175409693733027669138875912580368) [(2, 1), (3, 1), (7, 2), (12, 1), (15, 1)],
  term ((-1357440775387001886364173258562194661062913386010657797475001756479719508474255688813774927888335 : Rat) / 213381680519394775860514954226462459039572618033011198400517324350819387466055338277751825160736) [(3, 1), (7, 2), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1127 for generator 9. -/
theorem ep_Q1_009_partial_09_1127_valid :
    mulPoly ep_Q1_009_coefficient_09_1127
        ep_Q1_009_generator_09_1100_1199 =
      ep_Q1_009_partial_09_1127 := by
  native_decide

/-- Coefficient term 1128 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1128 : Poly :=
[
  term ((1148060 : Rat) / 1178831) [(3, 1), (7, 2), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1128 for generator 9. -/
def ep_Q1_009_partial_09_1128 : Poly :=
[
  term ((2296120 : Rat) / 1178831) [(2, 1), (3, 1), (7, 2), (12, 1), (15, 1), (16, 1)],
  term ((-1148060 : Rat) / 1178831) [(3, 1), (7, 2), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1128 for generator 9. -/
theorem ep_Q1_009_partial_09_1128_valid :
    mulPoly ep_Q1_009_coefficient_09_1128
        ep_Q1_009_generator_09_1100_1199 =
      ep_Q1_009_partial_09_1128 := by
  native_decide

/-- Coefficient term 1129 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1129 : Poly :=
[
  term ((-1357440775387001886364173258562194661062913386010657797475001756479719508474255688813774927888335 : Rat) / 213381680519394775860514954226462459039572618033011198400517324350819387466055338277751825160736) [(3, 1), (7, 2), (14, 1), (15, 1)]
]

/-- Partial product 1129 for generator 9. -/
def ep_Q1_009_partial_09_1129 : Poly :=
[
  term ((-1357440775387001886364173258562194661062913386010657797475001756479719508474255688813774927888335 : Rat) / 106690840259697387930257477113231229519786309016505599200258662175409693733027669138875912580368) [(2, 1), (3, 1), (7, 2), (14, 1), (15, 1)],
  term ((1357440775387001886364173258562194661062913386010657797475001756479719508474255688813774927888335 : Rat) / 213381680519394775860514954226462459039572618033011198400517324350819387466055338277751825160736) [(3, 1), (7, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1129 for generator 9. -/
theorem ep_Q1_009_partial_09_1129_valid :
    mulPoly ep_Q1_009_coefficient_09_1129
        ep_Q1_009_generator_09_1100_1199 =
      ep_Q1_009_partial_09_1129 := by
  native_decide

/-- Coefficient term 1130 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1130 : Poly :=
[
  term ((-1148060 : Rat) / 1178831) [(3, 1), (7, 2), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1130 for generator 9. -/
def ep_Q1_009_partial_09_1130 : Poly :=
[
  term ((-2296120 : Rat) / 1178831) [(2, 1), (3, 1), (7, 2), (14, 1), (15, 1), (16, 1)],
  term ((1148060 : Rat) / 1178831) [(3, 1), (7, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1130 for generator 9. -/
theorem ep_Q1_009_partial_09_1130_valid :
    mulPoly ep_Q1_009_coefficient_09_1130
        ep_Q1_009_generator_09_1100_1199 =
      ep_Q1_009_partial_09_1130 := by
  native_decide

/-- Coefficient term 1131 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1131 : Poly :=
[
  term ((102562668013533965222537165734886410229209659813040878337061321920016013897997695252494884354957 : Rat) / 15610061153932263139968623132413227516120148115508579363361370713322745248074235607999437985024) [(3, 1), (8, 1), (12, 1), (13, 1)]
]

/-- Partial product 1131 for generator 9. -/
def ep_Q1_009_partial_09_1131 : Poly :=
[
  term ((102562668013533965222537165734886410229209659813040878337061321920016013897997695252494884354957 : Rat) / 7805030576966131569984311566206613758060074057754289681680685356661372624037117803999718992512) [(2, 1), (3, 1), (8, 1), (12, 1), (13, 1)],
  term ((-102562668013533965222537165734886410229209659813040878337061321920016013897997695252494884354957 : Rat) / 15610061153932263139968623132413227516120148115508579363361370713322745248074235607999437985024) [(3, 1), (8, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1131 for generator 9. -/
theorem ep_Q1_009_partial_09_1131_valid :
    mulPoly ep_Q1_009_coefficient_09_1131
        ep_Q1_009_generator_09_1100_1199 =
      ep_Q1_009_partial_09_1131 := by
  native_decide

/-- Coefficient term 1132 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1132 : Poly :=
[
  term ((40928848604860122640326673804152 : Rat) / 3435605717361227895008739306438197) [(3, 1), (8, 1), (12, 1), (13, 1), (15, 2)]
]

/-- Partial product 1132 for generator 9. -/
def ep_Q1_009_partial_09_1132 : Poly :=
[
  term ((81857697209720245280653347608304 : Rat) / 3435605717361227895008739306438197) [(2, 1), (3, 1), (8, 1), (12, 1), (13, 1), (15, 2)],
  term ((-40928848604860122640326673804152 : Rat) / 3435605717361227895008739306438197) [(3, 1), (8, 1), (12, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1132 for generator 9. -/
theorem ep_Q1_009_partial_09_1132_valid :
    mulPoly ep_Q1_009_coefficient_09_1132
        ep_Q1_009_generator_09_1100_1199 =
      ep_Q1_009_partial_09_1132 := by
  native_decide

/-- Coefficient term 1133 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1133 : Poly :=
[
  term ((-260977179991292077498186291393336293397032443727603070059955992436236528590629800309501385020443 : Rat) / 62440244615729052559874492529652910064480592462034317453445482853290980992296942431997751940096) [(3, 1), (8, 1), (12, 1), (14, 1), (15, 1)]
]

/-- Partial product 1133 for generator 9. -/
def ep_Q1_009_partial_09_1133 : Poly :=
[
  term ((-260977179991292077498186291393336293397032443727603070059955992436236528590629800309501385020443 : Rat) / 31220122307864526279937246264826455032240296231017158726722741426645490496148471215998875970048) [(2, 1), (3, 1), (8, 1), (12, 1), (14, 1), (15, 1)],
  term ((260977179991292077498186291393336293397032443727603070059955992436236528590629800309501385020443 : Rat) / 62440244615729052559874492529652910064480592462034317453445482853290980992296942431997751940096) [(3, 1), (8, 1), (12, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1133 for generator 9. -/
theorem ep_Q1_009_partial_09_1133_valid :
    mulPoly ep_Q1_009_coefficient_09_1133
        ep_Q1_009_generator_09_1100_1199 =
      ep_Q1_009_partial_09_1133 := by
  native_decide

/-- Coefficient term 1134 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1134 : Poly :=
[
  term ((744389850429706518485097316380428 : Rat) / 30920451456251051055078653757943773) [(3, 1), (8, 1), (12, 1), (14, 2), (15, 1)]
]

/-- Partial product 1134 for generator 9. -/
def ep_Q1_009_partial_09_1134 : Poly :=
[
  term ((1488779700859413036970194632760856 : Rat) / 30920451456251051055078653757943773) [(2, 1), (3, 1), (8, 1), (12, 1), (14, 2), (15, 1)],
  term ((-744389850429706518485097316380428 : Rat) / 30920451456251051055078653757943773) [(3, 1), (8, 1), (12, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1134 for generator 9. -/
theorem ep_Q1_009_partial_09_1134_valid :
    mulPoly ep_Q1_009_coefficient_09_1134
        ep_Q1_009_generator_09_1100_1199 =
      ep_Q1_009_partial_09_1134 := by
  native_decide

/-- Coefficient term 1135 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1135 : Poly :=
[
  term ((-2946068109464270278267399161042193040862497295714983440211152148595842529100822369640249978720377 : Rat) / 62440244615729052559874492529652910064480592462034317453445482853290980992296942431997751940096) [(3, 1), (8, 1), (12, 1), (15, 1)]
]

/-- Partial product 1135 for generator 9. -/
def ep_Q1_009_partial_09_1135 : Poly :=
[
  term ((-2946068109464270278267399161042193040862497295714983440211152148595842529100822369640249978720377 : Rat) / 31220122307864526279937246264826455032240296231017158726722741426645490496148471215998875970048) [(2, 1), (3, 1), (8, 1), (12, 1), (15, 1)],
  term ((2946068109464270278267399161042193040862497295714983440211152148595842529100822369640249978720377 : Rat) / 62440244615729052559874492529652910064480592462034317453445482853290980992296942431997751940096) [(3, 1), (8, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1135 for generator 9. -/
theorem ep_Q1_009_partial_09_1135_valid :
    mulPoly ep_Q1_009_coefficient_09_1135
        ep_Q1_009_generator_09_1100_1199 =
      ep_Q1_009_partial_09_1135 := by
  native_decide

/-- Coefficient term 1136 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1136 : Poly :=
[
  term ((1390763352535893547532472496251764 : Rat) / 30920451456251051055078653757943773) [(3, 1), (8, 1), (12, 1), (15, 3)]
]

/-- Partial product 1136 for generator 9. -/
def ep_Q1_009_partial_09_1136 : Poly :=
[
  term ((2781526705071787095064944992503528 : Rat) / 30920451456251051055078653757943773) [(2, 1), (3, 1), (8, 1), (12, 1), (15, 3)],
  term ((-1390763352535893547532472496251764 : Rat) / 30920451456251051055078653757943773) [(3, 1), (8, 1), (12, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1136 for generator 9. -/
theorem ep_Q1_009_partial_09_1136_valid :
    mulPoly ep_Q1_009_coefficient_09_1136
        ep_Q1_009_generator_09_1100_1199 =
      ep_Q1_009_partial_09_1136 := by
  native_decide

/-- Coefficient term 1137 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1137 : Poly :=
[
  term ((91524983026208635541476368533097145651328059138270217922200583744574684696167114810092845805905 : Rat) / 8920034945104150365696356075664701437782941780290616779063640407612997284613848918856821705728) [(3, 1), (8, 1), (13, 1), (14, 1)]
]

/-- Partial product 1137 for generator 9. -/
def ep_Q1_009_partial_09_1137 : Poly :=
[
  term ((91524983026208635541476368533097145651328059138270217922200583744574684696167114810092845805905 : Rat) / 4460017472552075182848178037832350718891470890145308389531820203806498642306924459428410852864) [(2, 1), (3, 1), (8, 1), (13, 1), (14, 1)],
  term ((-91524983026208635541476368533097145651328059138270217922200583744574684696167114810092845805905 : Rat) / 8920034945104150365696356075664701437782941780290616779063640407612997284613848918856821705728) [(3, 1), (8, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1137 for generator 9. -/
theorem ep_Q1_009_partial_09_1137_valid :
    mulPoly ep_Q1_009_coefficient_09_1137
        ep_Q1_009_generator_09_1100_1199 =
      ep_Q1_009_partial_09_1137 := by
  native_decide

/-- Coefficient term 1138 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1138 : Poly :=
[
  term ((-219117238996540527248498353181864 : Rat) / 30920451456251051055078653757943773) [(3, 1), (8, 1), (13, 1), (14, 1), (15, 2)]
]

/-- Partial product 1138 for generator 9. -/
def ep_Q1_009_partial_09_1138 : Poly :=
[
  term ((-438234477993081054496996706363728 : Rat) / 30920451456251051055078653757943773) [(2, 1), (3, 1), (8, 1), (13, 1), (14, 1), (15, 2)],
  term ((219117238996540527248498353181864 : Rat) / 30920451456251051055078653757943773) [(3, 1), (8, 1), (13, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1138 for generator 9. -/
theorem ep_Q1_009_partial_09_1138_valid :
    mulPoly ep_Q1_009_coefficient_09_1138
        ep_Q1_009_generator_09_1100_1199 =
      ep_Q1_009_partial_09_1138 := by
  native_decide

/-- Coefficient term 1139 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1139 : Poly :=
[
  term ((-100816104547952700413776285887583076235189706108655157632423004628489098971576725124856448151437 : Rat) / 15610061153932263139968623132413227516120148115508579363361370713322745248074235607999437985024) [(3, 1), (8, 1), (13, 1), (14, 2)]
]

/-- Partial product 1139 for generator 9. -/
def ep_Q1_009_partial_09_1139 : Poly :=
[
  term ((-100816104547952700413776285887583076235189706108655157632423004628489098971576725124856448151437 : Rat) / 7805030576966131569984311566206613758060074057754289681680685356661372624037117803999718992512) [(2, 1), (3, 1), (8, 1), (13, 1), (14, 2)],
  term ((100816104547952700413776285887583076235189706108655157632423004628489098971576725124856448151437 : Rat) / 15610061153932263139968623132413227516120148115508579363361370713322745248074235607999437985024) [(3, 1), (8, 1), (13, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1139 for generator 9. -/
theorem ep_Q1_009_partial_09_1139_valid :
    mulPoly ep_Q1_009_coefficient_09_1139
        ep_Q1_009_generator_09_1100_1199 =
      ep_Q1_009_partial_09_1139 := by
  native_decide

/-- Coefficient term 1140 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1140 : Poly :=
[
  term ((-81857697209720245280653347608304 : Rat) / 3435605717361227895008739306438197) [(3, 1), (8, 1), (13, 1), (14, 2), (15, 2)]
]

/-- Partial product 1140 for generator 9. -/
def ep_Q1_009_partial_09_1140 : Poly :=
[
  term ((-163715394419440490561306695216608 : Rat) / 3435605717361227895008739306438197) [(2, 1), (3, 1), (8, 1), (13, 1), (14, 2), (15, 2)],
  term ((81857697209720245280653347608304 : Rat) / 3435605717361227895008739306438197) [(3, 1), (8, 1), (13, 1), (14, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1140 for generator 9. -/
theorem ep_Q1_009_partial_09_1140_valid :
    mulPoly ep_Q1_009_coefficient_09_1140
        ep_Q1_009_generator_09_1100_1199 =
      ep_Q1_009_partial_09_1140 := by
  native_decide

/-- Coefficient term 1141 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1141 : Poly :=
[
  term ((-898138605626116414566048979730722152638468229952061449522246749195134409918404236923046945918933 : Rat) / 15610061153932263139968623132413227516120148115508579363361370713322745248074235607999437985024) [(3, 1), (8, 1), (14, 1), (15, 1)]
]

/-- Partial product 1141 for generator 9. -/
def ep_Q1_009_partial_09_1141 : Poly :=
[
  term ((-898138605626116414566048979730722152638468229952061449522246749195134409918404236923046945918933 : Rat) / 7805030576966131569984311566206613758060074057754289681680685356661372624037117803999718992512) [(2, 1), (3, 1), (8, 1), (14, 1), (15, 1)],
  term ((898138605626116414566048979730722152638468229952061449522246749195134409918404236923046945918933 : Rat) / 15610061153932263139968623132413227516120148115508579363361370713322745248074235607999437985024) [(3, 1), (8, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1141 for generator 9. -/
theorem ep_Q1_009_partial_09_1141_valid :
    mulPoly ep_Q1_009_coefficient_09_1141
        ep_Q1_009_generator_09_1100_1199 =
      ep_Q1_009_partial_09_1141 := by
  native_decide

/-- Coefficient term 1142 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1142 : Poly :=
[
  term ((1561007256427656232513105224094658 : Rat) / 30920451456251051055078653757943773) [(3, 1), (8, 1), (14, 1), (15, 3)]
]

/-- Partial product 1142 for generator 9. -/
def ep_Q1_009_partial_09_1142 : Poly :=
[
  term ((3122014512855312465026210448189316 : Rat) / 30920451456251051055078653757943773) [(2, 1), (3, 1), (8, 1), (14, 1), (15, 3)],
  term ((-1561007256427656232513105224094658 : Rat) / 30920451456251051055078653757943773) [(3, 1), (8, 1), (14, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1142 for generator 9. -/
theorem ep_Q1_009_partial_09_1142_valid :
    mulPoly ep_Q1_009_coefficient_09_1142
        ep_Q1_009_generator_09_1100_1199 =
      ep_Q1_009_partial_09_1142 := by
  native_decide

/-- Coefficient term 1143 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1143 : Poly :=
[
  term ((-1689955286429154808357176259480353112837064408067270592572763385427498074744910236420631843355937 : Rat) / 62440244615729052559874492529652910064480592462034317453445482853290980992296942431997751940096) [(3, 1), (8, 1), (14, 2), (15, 1)]
]

/-- Partial product 1143 for generator 9. -/
def ep_Q1_009_partial_09_1143 : Poly :=
[
  term ((-1689955286429154808357176259480353112837064408067270592572763385427498074744910236420631843355937 : Rat) / 31220122307864526279937246264826455032240296231017158726722741426645490496148471215998875970048) [(2, 1), (3, 1), (8, 1), (14, 2), (15, 1)],
  term ((1689955286429154808357176259480353112837064408067270592572763385427498074744910236420631843355937 : Rat) / 62440244615729052559874492529652910064480592462034317453445482853290980992296942431997751940096) [(3, 1), (8, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1143 for generator 9. -/
theorem ep_Q1_009_partial_09_1143_valid :
    mulPoly ep_Q1_009_coefficient_09_1143
        ep_Q1_009_generator_09_1100_1199 =
      ep_Q1_009_partial_09_1143 := by
  native_decide

/-- Coefficient term 1144 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1144 : Poly :=
[
  term ((1896800045209902536291197479906608 : Rat) / 30920451456251051055078653757943773) [(3, 1), (8, 1), (14, 3), (15, 1)]
]

/-- Partial product 1144 for generator 9. -/
def ep_Q1_009_partial_09_1144 : Poly :=
[
  term ((3793600090419805072582394959813216 : Rat) / 30920451456251051055078653757943773) [(2, 1), (3, 1), (8, 1), (14, 3), (15, 1)],
  term ((-1896800045209902536291197479906608 : Rat) / 30920451456251051055078653757943773) [(3, 1), (8, 1), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1144 for generator 9. -/
theorem ep_Q1_009_partial_09_1144_valid :
    mulPoly ep_Q1_009_coefficient_09_1144
        ep_Q1_009_generator_09_1100_1199 =
      ep_Q1_009_partial_09_1144 := by
  native_decide

/-- Coefficient term 1145 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1145 : Poly :=
[
  term ((15437819253072545935317127199612334409481833798877700711594985690043099514472992827540497037752707191998360724011 : Rat) / 9278771431193142178573725743269375621973507068874899658440898559111554144086159743267362069213166140521034833920) [(3, 1), (9, 1), (12, 1)]
]

/-- Partial product 1145 for generator 9. -/
def ep_Q1_009_partial_09_1145 : Poly :=
[
  term ((15437819253072545935317127199612334409481833798877700711594985690043099514472992827540497037752707191998360724011 : Rat) / 4639385715596571089286862871634687810986753534437449829220449279555777072043079871633681034606583070260517416960) [(2, 1), (3, 1), (9, 1), (12, 1)],
  term ((-15437819253072545935317127199612334409481833798877700711594985690043099514472992827540497037752707191998360724011 : Rat) / 9278771431193142178573725743269375621973507068874899658440898559111554144086159743267362069213166140521034833920) [(3, 1), (9, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1145 for generator 9. -/
theorem ep_Q1_009_partial_09_1145_valid :
    mulPoly ep_Q1_009_coefficient_09_1145
        ep_Q1_009_generator_09_1100_1199 =
      ep_Q1_009_partial_09_1145 := by
  native_decide

/-- Coefficient term 1146 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1146 : Poly :=
[
  term ((918368353622181273455649220163108596131049206097710998769877688657829331428249789806403689830002918049557669428023 : Rat) / 337929541677114526307162743810676635375267279767327818810539510916214547801137907078460445360004506135583045424640) [(3, 1), (9, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 1146 for generator 9. -/
def ep_Q1_009_partial_09_1146 : Poly :=
[
  term ((918368353622181273455649220163108596131049206097710998769877688657829331428249789806403689830002918049557669428023 : Rat) / 168964770838557263153581371905338317687633639883663909405269755458107273900568953539230222680002253067791522712320) [(2, 1), (3, 1), (9, 1), (12, 1), (13, 1), (15, 1)],
  term ((-918368353622181273455649220163108596131049206097710998769877688657829331428249789806403689830002918049557669428023 : Rat) / 337929541677114526307162743810676635375267279767327818810539510916214547801137907078460445360004506135583045424640) [(3, 1), (9, 1), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1146 for generator 9. -/
theorem ep_Q1_009_partial_09_1146_valid :
    mulPoly ep_Q1_009_coefficient_09_1146
        ep_Q1_009_generator_09_1100_1199 =
      ep_Q1_009_partial_09_1146 := by
  native_decide

/-- Coefficient term 1147 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1147 : Poly :=
[
  term ((-2222571080448390025354 : Rat) / 1558779625948348837707) [(3, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1147 for generator 9. -/
def ep_Q1_009_partial_09_1147 : Poly :=
[
  term ((-4445142160896780050708 : Rat) / 1558779625948348837707) [(2, 1), (3, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((2222571080448390025354 : Rat) / 1558779625948348837707) [(3, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1147 for generator 9. -/
theorem ep_Q1_009_partial_09_1147_valid :
    mulPoly ep_Q1_009_coefficient_09_1147
        ep_Q1_009_generator_09_1100_1199 =
      ep_Q1_009_partial_09_1147 := by
  native_decide

/-- Coefficient term 1148 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1148 : Poly :=
[
  term ((-46612087985141416890391203579496827787663629111689436879019590744290589056857113863497716786034754976613832155993 : Rat) / 2319692857798285544643431435817343905493376767218724914610224639777888536021539935816840517303291535130258708480) [(3, 1), (9, 1), (12, 1), (14, 1)]
]

/-- Partial product 1148 for generator 9. -/
def ep_Q1_009_partial_09_1148 : Poly :=
[
  term ((-46612087985141416890391203579496827787663629111689436879019590744290589056857113863497716786034754976613832155993 : Rat) / 1159846428899142772321715717908671952746688383609362457305112319888944268010769967908420258651645767565129354240) [(2, 1), (3, 1), (9, 1), (12, 1), (14, 1)],
  term ((46612087985141416890391203579496827787663629111689436879019590744290589056857113863497716786034754976613832155993 : Rat) / 2319692857798285544643431435817343905493376767218724914610224639777888536021539935816840517303291535130258708480) [(3, 1), (9, 1), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1148 for generator 9. -/
theorem ep_Q1_009_partial_09_1148_valid :
    mulPoly ep_Q1_009_coefficient_09_1148
        ep_Q1_009_generator_09_1100_1199 =
      ep_Q1_009_partial_09_1148 := by
  native_decide

/-- Coefficient term 1149 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1149 : Poly :=
[
  term ((-784960102346453607868293840658276888000 : Rat) / 15008818057315716433186233612759665357973) [(3, 1), (9, 1), (12, 1), (14, 1), (15, 2)]
]

/-- Partial product 1149 for generator 9. -/
def ep_Q1_009_partial_09_1149 : Poly :=
[
  term ((-1569920204692907215736587681316553776000 : Rat) / 15008818057315716433186233612759665357973) [(2, 1), (3, 1), (9, 1), (12, 1), (14, 1), (15, 2)],
  term ((784960102346453607868293840658276888000 : Rat) / 15008818057315716433186233612759665357973) [(3, 1), (9, 1), (12, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1149 for generator 9. -/
theorem ep_Q1_009_partial_09_1149_valid :
    mulPoly ep_Q1_009_coefficient_09_1149
        ep_Q1_009_generator_09_1100_1199 =
      ep_Q1_009_partial_09_1149 := by
  native_decide

/-- Coefficient term 1150 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1150 : Poly :=
[
  term ((30700875818474194984781 : Rat) / 3117559251896697675414) [(3, 1), (9, 1), (12, 1), (14, 1), (16, 1)]
]

/-- Partial product 1150 for generator 9. -/
def ep_Q1_009_partial_09_1150 : Poly :=
[
  term ((30700875818474194984781 : Rat) / 1558779625948348837707) [(2, 1), (3, 1), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((-30700875818474194984781 : Rat) / 3117559251896697675414) [(3, 1), (9, 1), (12, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1150 for generator 9. -/
theorem ep_Q1_009_partial_09_1150_valid :
    mulPoly ep_Q1_009_coefficient_09_1150
        ep_Q1_009_generator_09_1100_1199 =
      ep_Q1_009_partial_09_1150 := by
  native_decide

/-- Coefficient term 1151 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1151 : Poly :=
[
  term ((10962630933198898498294677259744861740769320600812812333394029197160903250345949668367382347577927161818687169251 : Rat) / 2319692857798285544643431435817343905493376767218724914610224639777888536021539935816840517303291535130258708480) [(3, 1), (9, 1), (12, 1), (14, 2)]
]

/-- Partial product 1151 for generator 9. -/
def ep_Q1_009_partial_09_1151 : Poly :=
[
  term ((10962630933198898498294677259744861740769320600812812333394029197160903250345949668367382347577927161818687169251 : Rat) / 1159846428899142772321715717908671952746688383609362457305112319888944268010769967908420258651645767565129354240) [(2, 1), (3, 1), (9, 1), (12, 1), (14, 2)],
  term ((-10962630933198898498294677259744861740769320600812812333394029197160903250345949668367382347577927161818687169251 : Rat) / 2319692857798285544643431435817343905493376767218724914610224639777888536021539935816840517303291535130258708480) [(3, 1), (9, 1), (12, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1151 for generator 9. -/
theorem ep_Q1_009_partial_09_1151_valid :
    mulPoly ep_Q1_009_coefficient_09_1151
        ep_Q1_009_generator_09_1100_1199 =
      ep_Q1_009_partial_09_1151 := by
  native_decide

/-- Coefficient term 1152 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1152 : Poly :=
[
  term ((-24880280697155794952639 : Rat) / 9352677755690093026242) [(3, 1), (9, 1), (12, 1), (14, 2), (16, 1)]
]

/-- Partial product 1152 for generator 9. -/
def ep_Q1_009_partial_09_1152 : Poly :=
[
  term ((-24880280697155794952639 : Rat) / 4676338877845046513121) [(2, 1), (3, 1), (9, 1), (12, 1), (14, 2), (16, 1)],
  term ((24880280697155794952639 : Rat) / 9352677755690093026242) [(3, 1), (9, 1), (12, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1152 for generator 9. -/
theorem ep_Q1_009_partial_09_1152_valid :
    mulPoly ep_Q1_009_coefficient_09_1152
        ep_Q1_009_generator_09_1100_1199 =
      ep_Q1_009_partial_09_1152 := by
  native_decide

/-- Coefficient term 1153 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1153 : Poly :=
[
  term ((5738322027419210951078809167674918629435002318718012944687775179549407184151996617151088444176820122569854261191229 : Rat) / 525668175942178152033364268149941432805971324082509940371950350314111518801770077677605137226673676210906959549440) [(3, 1), (9, 1), (12, 1), (15, 2)]
]

/-- Partial product 1153 for generator 9. -/
def ep_Q1_009_partial_09_1153 : Poly :=
[
  term ((5738322027419210951078809167674918629435002318718012944687775179549407184151996617151088444176820122569854261191229 : Rat) / 262834087971089076016682134074970716402985662041254970185975175157055759400885038838802568613336838105453479774720) [(2, 1), (3, 1), (9, 1), (12, 1), (15, 2)],
  term ((-5738322027419210951078809167674918629435002318718012944687775179549407184151996617151088444176820122569854261191229 : Rat) / 525668175942178152033364268149941432805971324082509940371950350314111518801770077677605137226673676210906959549440) [(3, 1), (9, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1153 for generator 9. -/
theorem ep_Q1_009_partial_09_1153_valid :
    mulPoly ep_Q1_009_coefficient_09_1153
        ep_Q1_009_generator_09_1100_1199 =
      ep_Q1_009_partial_09_1153 := by
  native_decide

/-- Coefficient term 1154 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1154 : Poly :=
[
  term ((-27719693669188840965659 : Rat) / 4676338877845046513121) [(3, 1), (9, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 1154 for generator 9. -/
def ep_Q1_009_partial_09_1154 : Poly :=
[
  term ((-55439387338377681931318 : Rat) / 4676338877845046513121) [(2, 1), (3, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((27719693669188840965659 : Rat) / 4676338877845046513121) [(3, 1), (9, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1154 for generator 9. -/
theorem ep_Q1_009_partial_09_1154_valid :
    mulPoly ep_Q1_009_coefficient_09_1154
        ep_Q1_009_generator_09_1100_1199 =
      ep_Q1_009_partial_09_1154 := by
  native_decide

/-- Coefficient term 1155 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1155 : Poly :=
[
  term ((224323462444982293315 : Rat) / 140115022557154951704) [(3, 1), (9, 1), (12, 1), (16, 1)]
]

/-- Partial product 1155 for generator 9. -/
def ep_Q1_009_partial_09_1155 : Poly :=
[
  term ((224323462444982293315 : Rat) / 70057511278577475852) [(2, 1), (3, 1), (9, 1), (12, 1), (16, 1)],
  term ((-224323462444982293315 : Rat) / 140115022557154951704) [(3, 1), (9, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1155 for generator 9. -/
theorem ep_Q1_009_partial_09_1155_valid :
    mulPoly ep_Q1_009_coefficient_09_1155
        ep_Q1_009_generator_09_1100_1199 =
      ep_Q1_009_partial_09_1155 := by
  native_decide

/-- Coefficient term 1156 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1156 : Poly :=
[
  term ((-944396359536756991267538293299705458448725566931743942898685827831381376654444251738452110551672342012118922400921 : Rat) / 295688348967475210518767400834342055953358869796411841459222072051687729325995668693652889690003942868635164746560) [(3, 1), (9, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 1156 for generator 9. -/
def ep_Q1_009_partial_09_1156 : Poly :=
[
  term ((-944396359536756991267538293299705458448725566931743942898685827831381376654444251738452110551672342012118922400921 : Rat) / 147844174483737605259383700417171027976679434898205920729611036025843864662997834346826444845001971434317582373280) [(2, 1), (3, 1), (9, 1), (13, 1), (14, 1), (15, 1)],
  term ((944396359536756991267538293299705458448725566931743942898685827831381376654444251738452110551672342012118922400921 : Rat) / 295688348967475210518767400834342055953358869796411841459222072051687729325995668693652889690003942868635164746560) [(3, 1), (9, 1), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1156 for generator 9. -/
theorem ep_Q1_009_partial_09_1156_valid :
    mulPoly ep_Q1_009_coefficient_09_1156
        ep_Q1_009_generator_09_1100_1199 =
      ep_Q1_009_partial_09_1156 := by
  native_decide

/-- Coefficient term 1157 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1157 : Poly :=
[
  term ((6650984306422535454752 : Rat) / 4676338877845046513121) [(3, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1157 for generator 9. -/
def ep_Q1_009_partial_09_1157 : Poly :=
[
  term ((13301968612845070909504 : Rat) / 4676338877845046513121) [(2, 1), (3, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-6650984306422535454752 : Rat) / 4676338877845046513121) [(3, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1157 for generator 9. -/
theorem ep_Q1_009_partial_09_1157_valid :
    mulPoly ep_Q1_009_coefficient_09_1157
        ep_Q1_009_generator_09_1100_1199 =
      ep_Q1_009_partial_09_1157 := by
  native_decide

/-- Coefficient term 1158 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1158 : Poly :=
[
  term ((-6324881719539831263689574105615130198168411430588637660637587426068506160606897024808106001830438986629531380588161 : Rat) / 1182753395869900842075069603337368223813435479185647365836888288206750917303982674774611558760015771474540658986240) [(3, 1), (9, 1), (13, 1), (14, 2), (15, 1)]
]

/-- Partial product 1158 for generator 9. -/
def ep_Q1_009_partial_09_1158 : Poly :=
[
  term ((-6324881719539831263689574105615130198168411430588637660637587426068506160606897024808106001830438986629531380588161 : Rat) / 591376697934950421037534801668684111906717739592823682918444144103375458651991337387305779380007885737270329493120) [(2, 1), (3, 1), (9, 1), (13, 1), (14, 2), (15, 1)],
  term ((6324881719539831263689574105615130198168411430588637660637587426068506160606897024808106001830438986629531380588161 : Rat) / 1182753395869900842075069603337368223813435479185647365836888288206750917303982674774611558760015771474540658986240) [(3, 1), (9, 1), (13, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1158 for generator 9. -/
theorem ep_Q1_009_partial_09_1158_valid :
    mulPoly ep_Q1_009_coefficient_09_1158
        ep_Q1_009_generator_09_1100_1199 =
      ep_Q1_009_partial_09_1158 := by
  native_decide

/-- Coefficient term 1159 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1159 : Poly :=
[
  term ((4445142160896780050708 : Rat) / 1558779625948348837707) [(3, 1), (9, 1), (13, 1), (14, 2), (15, 1), (16, 1)]
]

/-- Partial product 1159 for generator 9. -/
def ep_Q1_009_partial_09_1159 : Poly :=
[
  term ((8890284321793560101416 : Rat) / 1558779625948348837707) [(2, 1), (3, 1), (9, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-4445142160896780050708 : Rat) / 1558779625948348837707) [(3, 1), (9, 1), (13, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1159 for generator 9. -/
theorem ep_Q1_009_partial_09_1159_valid :
    mulPoly ep_Q1_009_coefficient_09_1159
        ep_Q1_009_generator_09_1100_1199 =
      ep_Q1_009_partial_09_1159 := by
  native_decide

/-- Coefficient term 1160 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1160 : Poly :=
[
  term ((-84005195031744452342919308390097662308722158399374858384466575903509570313912546316172913900413832885341800939239 : Rat) / 3092923810397714059524575247756458540657835689624966552813632853037184714695386581089120689737722046840344944640) [(3, 1), (9, 1), (14, 1)]
]

/-- Partial product 1160 for generator 9. -/
def ep_Q1_009_partial_09_1160 : Poly :=
[
  term ((-84005195031744452342919308390097662308722158399374858384466575903509570313912546316172913900413832885341800939239 : Rat) / 1546461905198857029762287623878229270328917844812483276406816426518592357347693290544560344868861023420172472320) [(2, 1), (3, 1), (9, 1), (14, 1)],
  term ((84005195031744452342919308390097662308722158399374858384466575903509570313912546316172913900413832885341800939239 : Rat) / 3092923810397714059524575247756458540657835689624966552813632853037184714695386581089120689737722046840344944640) [(3, 1), (9, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1160 for generator 9. -/
theorem ep_Q1_009_partial_09_1160_valid :
    mulPoly ep_Q1_009_coefficient_09_1160
        ep_Q1_009_generator_09_1100_1199 =
      ep_Q1_009_partial_09_1160 := by
  native_decide

/-- Coefficient term 1161 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1161 : Poly :=
[
  term ((50180512013390589787781888003680760478867851083284344764514287774702191198500160595702319686346640265361346070539533 : Rat) / 3154009055653068912200185608899648596835827944495059642231702101884669112810620466065630823360042057265441757296640) [(3, 1), (9, 1), (14, 1), (15, 2)]
]

/-- Partial product 1161 for generator 9. -/
def ep_Q1_009_partial_09_1161 : Poly :=
[
  term ((50180512013390589787781888003680760478867851083284344764514287774702191198500160595702319686346640265361346070539533 : Rat) / 1577004527826534456100092804449824298417913972247529821115851050942334556405310233032815411680021028632720878648320) [(2, 1), (3, 1), (9, 1), (14, 1), (15, 2)],
  term ((-50180512013390589787781888003680760478867851083284344764514287774702191198500160595702319686346640265361346070539533 : Rat) / 3154009055653068912200185608899648596835827944495059642231702101884669112810620466065630823360042057265441757296640) [(3, 1), (9, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1161 for generator 9. -/
theorem ep_Q1_009_partial_09_1161_valid :
    mulPoly ep_Q1_009_coefficient_09_1161
        ep_Q1_009_generator_09_1100_1199 =
      ep_Q1_009_partial_09_1161 := by
  native_decide

/-- Coefficient term 1162 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1162 : Poly :=
[
  term ((-1439581085926459737235 : Rat) / 183385838346864569142) [(3, 1), (9, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 1162 for generator 9. -/
def ep_Q1_009_partial_09_1162 : Poly :=
[
  term ((-1439581085926459737235 : Rat) / 91692919173432284571) [(2, 1), (3, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((1439581085926459737235 : Rat) / 183385838346864569142) [(3, 1), (9, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1162 for generator 9. -/
theorem ep_Q1_009_partial_09_1162_valid :
    mulPoly ep_Q1_009_coefficient_09_1162
        ep_Q1_009_generator_09_1100_1199 =
      ep_Q1_009_partial_09_1162 := by
  native_decide

/-- Coefficient term 1163 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1163 : Poly :=
[
  term ((68153023977990758125865 : Rat) / 4156745669195596900552) [(3, 1), (9, 1), (14, 1), (16, 1)]
]

/-- Partial product 1163 for generator 9. -/
def ep_Q1_009_partial_09_1163 : Poly :=
[
  term ((68153023977990758125865 : Rat) / 2078372834597798450276) [(2, 1), (3, 1), (9, 1), (14, 1), (16, 1)],
  term ((-68153023977990758125865 : Rat) / 4156745669195596900552) [(3, 1), (9, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1163 for generator 9. -/
theorem ep_Q1_009_partial_09_1163_valid :
    mulPoly ep_Q1_009_coefficient_09_1163
        ep_Q1_009_generator_09_1100_1199 =
      ep_Q1_009_partial_09_1163 := by
  native_decide

/-- Coefficient term 1164 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1164 : Poly :=
[
  term ((-73319148777347750654527160021577177500929151639615439242309973038515527867594459638656329495160401392750439346457 : Rat) / 4639385715596571089286862871634687810986753534437449829220449279555777072043079871633681034606583070260517416960) [(3, 1), (9, 1), (14, 2)]
]

/-- Partial product 1164 for generator 9. -/
def ep_Q1_009_partial_09_1164 : Poly :=
[
  term ((-73319148777347750654527160021577177500929151639615439242309973038515527867594459638656329495160401392750439346457 : Rat) / 2319692857798285544643431435817343905493376767218724914610224639777888536021539935816840517303291535130258708480) [(2, 1), (3, 1), (9, 1), (14, 2)],
  term ((73319148777347750654527160021577177500929151639615439242309973038515527867594459638656329495160401392750439346457 : Rat) / 4639385715596571089286862871634687810986753534437449829220449279555777072043079871633681034606583070260517416960) [(3, 1), (9, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1164 for generator 9. -/
theorem ep_Q1_009_partial_09_1164_valid :
    mulPoly ep_Q1_009_coefficient_09_1164
        ep_Q1_009_generator_09_1100_1199 =
      ep_Q1_009_partial_09_1164 := by
  native_decide

/-- Coefficient term 1165 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1165 : Poly :=
[
  term ((-5785522520187671779050568514590100475200 : Rat) / 15008818057315716433186233612759665357973) [(3, 1), (9, 1), (14, 2), (15, 2)]
]

/-- Partial product 1165 for generator 9. -/
def ep_Q1_009_partial_09_1165 : Poly :=
[
  term ((-11571045040375343558101137029180200950400 : Rat) / 15008818057315716433186233612759665357973) [(2, 1), (3, 1), (9, 1), (14, 2), (15, 2)],
  term ((5785522520187671779050568514590100475200 : Rat) / 15008818057315716433186233612759665357973) [(3, 1), (9, 1), (14, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1165 for generator 9. -/
theorem ep_Q1_009_partial_09_1165_valid :
    mulPoly ep_Q1_009_coefficient_09_1165
        ep_Q1_009_generator_09_1100_1199 =
      ep_Q1_009_partial_09_1165 := by
  native_decide

/-- Coefficient term 1166 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1166 : Poly :=
[
  term ((102728788670161713371741 : Rat) / 18705355511380186052484) [(3, 1), (9, 1), (14, 2), (16, 1)]
]

/-- Partial product 1166 for generator 9. -/
def ep_Q1_009_partial_09_1166 : Poly :=
[
  term ((102728788670161713371741 : Rat) / 9352677755690093026242) [(2, 1), (3, 1), (9, 1), (14, 2), (16, 1)],
  term ((-102728788670161713371741 : Rat) / 18705355511380186052484) [(3, 1), (9, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1166 for generator 9. -/
theorem ep_Q1_009_partial_09_1166_valid :
    mulPoly ep_Q1_009_coefficient_09_1166
        ep_Q1_009_generator_09_1100_1199 =
      ep_Q1_009_partial_09_1166 := by
  native_decide

/-- Coefficient term 1167 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1167 : Poly :=
[
  term ((28600812019466321779336467177131686915621411910354153875468698061528502955131660571914996385691178970702637922527 : Rat) / 773230952599428514881143811939114635164458922406241638203408213259296178673846645272280172434430511710086236160) [(3, 1), (9, 1), (14, 3)]
]

/-- Partial product 1167 for generator 9. -/
def ep_Q1_009_partial_09_1167 : Poly :=
[
  term ((28600812019466321779336467177131686915621411910354153875468698061528502955131660571914996385691178970702637922527 : Rat) / 386615476299714257440571905969557317582229461203120819101704106629648089336923322636140086217215255855043118080) [(2, 1), (3, 1), (9, 1), (14, 3)],
  term ((-28600812019466321779336467177131686915621411910354153875468698061528502955131660571914996385691178970702637922527 : Rat) / 773230952599428514881143811939114635164458922406241638203408213259296178673846645272280172434430511710086236160) [(3, 1), (9, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1167 for generator 9. -/
theorem ep_Q1_009_partial_09_1167_valid :
    mulPoly ep_Q1_009_coefficient_09_1167
        ep_Q1_009_generator_09_1100_1199 =
      ep_Q1_009_partial_09_1167 := by
  native_decide

/-- Coefficient term 1168 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1168 : Poly :=
[
  term ((-10036905263071661528281 : Rat) / 550157515040593707426) [(3, 1), (9, 1), (14, 3), (16, 1)]
]

/-- Partial product 1168 for generator 9. -/
def ep_Q1_009_partial_09_1168 : Poly :=
[
  term ((-10036905263071661528281 : Rat) / 275078757520296853713) [(2, 1), (3, 1), (9, 1), (14, 3), (16, 1)],
  term ((10036905263071661528281 : Rat) / 550157515040593707426) [(3, 1), (9, 1), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1168 for generator 9. -/
theorem ep_Q1_009_partial_09_1168_valid :
    mulPoly ep_Q1_009_coefficient_09_1168
        ep_Q1_009_generator_09_1100_1199 =
      ep_Q1_009_partial_09_1168 := by
  native_decide

/-- Coefficient term 1169 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1169 : Poly :=
[
  term ((-28 : Rat) / 17) [(3, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 1169 for generator 9. -/
def ep_Q1_009_partial_09_1169 : Poly :=
[
  term ((-56 : Rat) / 17) [(2, 1), (3, 1), (11, 1), (12, 1), (16, 1)],
  term ((28 : Rat) / 17) [(3, 1), (11, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1169 for generator 9. -/
theorem ep_Q1_009_partial_09_1169_valid :
    mulPoly ep_Q1_009_coefficient_09_1169
        ep_Q1_009_generator_09_1100_1199 =
      ep_Q1_009_partial_09_1169 := by
  native_decide

/-- Coefficient term 1170 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1170 : Poly :=
[
  term ((-28 : Rat) / 17) [(3, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 1170 for generator 9. -/
def ep_Q1_009_partial_09_1170 : Poly :=
[
  term ((-56 : Rat) / 17) [(2, 1), (3, 1), (11, 1), (14, 1), (16, 1)],
  term ((28 : Rat) / 17) [(3, 1), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1170 for generator 9. -/
theorem ep_Q1_009_partial_09_1170_valid :
    mulPoly ep_Q1_009_coefficient_09_1170
        ep_Q1_009_generator_09_1100_1199 =
      ep_Q1_009_partial_09_1170 := by
  native_decide

/-- Coefficient term 1171 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1171 : Poly :=
[
  term ((3685582840166127284304518116365892628997734761795661665774422660335429288705739567739593421449069 : Rat) / 33755294093463580362115359990626829678576459349854878843019689727813236435308189106085034488704) [(3, 1), (12, 1), (13, 1)]
]

/-- Partial product 1171 for generator 9. -/
def ep_Q1_009_partial_09_1171 : Poly :=
[
  term ((3685582840166127284304518116365892628997734761795661665774422660335429288705739567739593421449069 : Rat) / 16877647046731790181057679995313414839288229674927439421509844863906618217654094553042517244352) [(2, 1), (3, 1), (12, 1), (13, 1)],
  term ((-3685582840166127284304518116365892628997734761795661665774422660335429288705739567739593421449069 : Rat) / 33755294093463580362115359990626829678576459349854878843019689727813236435308189106085034488704) [(3, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1171 for generator 9. -/
theorem ep_Q1_009_partial_09_1171_valid :
    mulPoly ep_Q1_009_coefficient_09_1171
        ep_Q1_009_generator_09_1100_1199 =
      ep_Q1_009_partial_09_1171 := by
  native_decide

/-- Coefficient term 1172 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1172 : Poly :=
[
  term ((662993486393098066241781954416324529220254799783649727278894270346409 : Rat) / 838185145256925088155251785245333274472425218210474368631104571288713696) [(3, 1), (12, 1), (13, 1), (14, 1)]
]

/-- Partial product 1172 for generator 9. -/
def ep_Q1_009_partial_09_1172 : Poly :=
[
  term ((662993486393098066241781954416324529220254799783649727278894270346409 : Rat) / 419092572628462544077625892622666637236212609105237184315552285644356848) [(2, 1), (3, 1), (12, 1), (13, 1), (14, 1)],
  term ((-662993486393098066241781954416324529220254799783649727278894270346409 : Rat) / 838185145256925088155251785245333274472425218210474368631104571288713696) [(3, 1), (12, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1172 for generator 9. -/
theorem ep_Q1_009_partial_09_1172_valid :
    mulPoly ep_Q1_009_coefficient_09_1172
        ep_Q1_009_generator_09_1100_1199 =
      ep_Q1_009_partial_09_1172 := by
  native_decide

/-- Coefficient term 1173 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1173 : Poly :=
[
  term ((-16 : Rat) / 3) [(3, 1), (12, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 1173 for generator 9. -/
def ep_Q1_009_partial_09_1173 : Poly :=
[
  term ((-32 : Rat) / 3) [(2, 1), (3, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((16 : Rat) / 3) [(3, 1), (12, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1173 for generator 9. -/
theorem ep_Q1_009_partial_09_1173_valid :
    mulPoly ep_Q1_009_coefficient_09_1173
        ep_Q1_009_generator_09_1100_1199 =
      ep_Q1_009_partial_09_1173 := by
  native_decide

/-- Coefficient term 1174 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1174 : Poly :=
[
  term ((5748702427075248298878270388160063402167221443563588934559140489369328563233937183212239063214241 : Rat) / 72657860778673648556115436771208516962508617907323363869958779484083398399996553533738782756506456) [(3, 1), (12, 1), (13, 1), (15, 2)]
]

/-- Partial product 1174 for generator 9. -/
def ep_Q1_009_partial_09_1174 : Poly :=
[
  term ((5748702427075248298878270388160063402167221443563588934559140489369328563233937183212239063214241 : Rat) / 36328930389336824278057718385604258481254308953661681934979389742041699199998276766869391378253228) [(2, 1), (3, 1), (12, 1), (13, 1), (15, 2)],
  term ((-5748702427075248298878270388160063402167221443563588934559140489369328563233937183212239063214241 : Rat) / 72657860778673648556115436771208516962508617907323363869958779484083398399996553533738782756506456) [(3, 1), (12, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1174 for generator 9. -/
theorem ep_Q1_009_partial_09_1174_valid :
    mulPoly ep_Q1_009_coefficient_09_1174
        ep_Q1_009_generator_09_1100_1199 =
      ep_Q1_009_partial_09_1174 := by
  native_decide

/-- Coefficient term 1175 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1175 : Poly :=
[
  term ((-187125879140226 : Rat) / 1395206957462413) [(3, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 1175 for generator 9. -/
def ep_Q1_009_partial_09_1175 : Poly :=
[
  term ((-374251758280452 : Rat) / 1395206957462413) [(2, 1), (3, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((187125879140226 : Rat) / 1395206957462413) [(3, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1175 for generator 9. -/
theorem ep_Q1_009_partial_09_1175_valid :
    mulPoly ep_Q1_009_coefficient_09_1175
        ep_Q1_009_generator_09_1100_1199 =
      ep_Q1_009_partial_09_1175 := by
  native_decide

/-- Coefficient term 1176 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1176 : Poly :=
[
  term ((331705940 : Rat) / 24755451) [(3, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 1176 for generator 9. -/
def ep_Q1_009_partial_09_1176 : Poly :=
[
  term ((663411880 : Rat) / 24755451) [(2, 1), (3, 1), (12, 1), (13, 1), (16, 1)],
  term ((-331705940 : Rat) / 24755451) [(3, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1176 for generator 9. -/
theorem ep_Q1_009_partial_09_1176_valid :
    mulPoly ep_Q1_009_coefficient_09_1176
        ep_Q1_009_generator_09_1100_1199 =
      ep_Q1_009_partial_09_1176 := by
  native_decide

/-- Coefficient term 1177 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1177 : Poly :=
[
  term ((-29809854597984399180634284921600 : Rat) / 3435605717361227895008739306438197) [(3, 1), (12, 1), (13, 2), (15, 1)]
]

/-- Partial product 1177 for generator 9. -/
def ep_Q1_009_partial_09_1177 : Poly :=
[
  term ((-59619709195968798361268569843200 : Rat) / 3435605717361227895008739306438197) [(2, 1), (3, 1), (12, 1), (13, 2), (15, 1)],
  term ((29809854597984399180634284921600 : Rat) / 3435605717361227895008739306438197) [(3, 1), (12, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1177 for generator 9. -/
theorem ep_Q1_009_partial_09_1177_valid :
    mulPoly ep_Q1_009_coefficient_09_1177
        ep_Q1_009_generator_09_1100_1199 =
      ep_Q1_009_partial_09_1177 := by
  native_decide

/-- Coefficient term 1178 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1178 : Poly :=
[
  term ((-241317369116513323881179948400916083600680556387803777953075482379562961034802083395538140993128976710794577485867 : Rat) / 3268990175356501951699493577419603051232036204560921425613576398956658743273852836233947519151617186162861038080) [(3, 1), (12, 1), (14, 1), (15, 1)]
]

/-- Partial product 1178 for generator 9. -/
def ep_Q1_009_partial_09_1178 : Poly :=
[
  term ((-241317369116513323881179948400916083600680556387803777953075482379562961034802083395538140993128976710794577485867 : Rat) / 1634495087678250975849746788709801525616018102280460712806788199478329371636926418116973759575808593081430519040) [(2, 1), (3, 1), (12, 1), (14, 1), (15, 1)],
  term ((241317369116513323881179948400916083600680556387803777953075482379562961034802083395538140993128976710794577485867 : Rat) / 3268990175356501951699493577419603051232036204560921425613576398956658743273852836233947519151617186162861038080) [(3, 1), (12, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1178 for generator 9. -/
theorem ep_Q1_009_partial_09_1178_valid :
    mulPoly ep_Q1_009_coefficient_09_1178
        ep_Q1_009_generator_09_1100_1199 =
      ep_Q1_009_partial_09_1178 := by
  native_decide

/-- Coefficient term 1179 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1179 : Poly :=
[
  term ((-54739535387983090593941 : Rat) / 8126818228310552791356) [(3, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1179 for generator 9. -/
def ep_Q1_009_partial_09_1179 : Poly :=
[
  term ((-54739535387983090593941 : Rat) / 4063409114155276395678) [(2, 1), (3, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((54739535387983090593941 : Rat) / 8126818228310552791356) [(3, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1179 for generator 9. -/
theorem ep_Q1_009_partial_09_1179_valid :
    mulPoly ep_Q1_009_coefficient_09_1179
        ep_Q1_009_generator_09_1100_1199 =
      ep_Q1_009_partial_09_1179 := by
  native_decide

/-- Coefficient term 1180 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1180 : Poly :=
[
  term ((81273192491475592624744306117067112718519949209838179 : Rat) / 570143909659245759286622513856713448350724369774554784) [(3, 1), (12, 1), (14, 2), (15, 1)]
]

/-- Partial product 1180 for generator 9. -/
def ep_Q1_009_partial_09_1180 : Poly :=
[
  term ((81273192491475592624744306117067112718519949209838179 : Rat) / 285071954829622879643311256928356724175362184887277392) [(2, 1), (3, 1), (12, 1), (14, 2), (15, 1)],
  term ((-81273192491475592624744306117067112718519949209838179 : Rat) / 570143909659245759286622513856713448350724369774554784) [(3, 1), (12, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1180 for generator 9. -/
theorem ep_Q1_009_partial_09_1180_valid :
    mulPoly ep_Q1_009_coefficient_09_1180
        ep_Q1_009_generator_09_1100_1199 =
      ep_Q1_009_partial_09_1180 := by
  native_decide

/-- Coefficient term 1181 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1181 : Poly :=
[
  term ((-662786495307469 : Rat) / 2790413914924826) [(3, 1), (12, 1), (14, 2), (15, 1), (16, 1)]
]

/-- Partial product 1181 for generator 9. -/
def ep_Q1_009_partial_09_1181 : Poly :=
[
  term ((-662786495307469 : Rat) / 1395206957462413) [(2, 1), (3, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((662786495307469 : Rat) / 2790413914924826) [(3, 1), (12, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1181 for generator 9. -/
theorem ep_Q1_009_partial_09_1181_valid :
    mulPoly ep_Q1_009_coefficient_09_1181
        ep_Q1_009_generator_09_1100_1199 =
      ep_Q1_009_partial_09_1181 := by
  native_decide

/-- Coefficient term 1182 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1182 : Poly :=
[
  term ((-24029701616441833137210527765575466552539923804467449888674853501625967608974253499183627197418153505690818760134083 : Rat) / 29420911578208517565295442196776427461088325841048292830522187590609928689464675526105527672364554675465749342720) [(3, 1), (12, 1), (15, 1)]
]

/-- Partial product 1182 for generator 9. -/
def ep_Q1_009_partial_09_1182 : Poly :=
[
  term ((-24029701616441833137210527765575466552539923804467449888674853501625967608974253499183627197418153505690818760134083 : Rat) / 14710455789104258782647721098388213730544162920524146415261093795304964344732337763052763836182277337732874671360) [(2, 1), (3, 1), (12, 1), (15, 1)],
  term ((24029701616441833137210527765575466552539923804467449888674853501625967608974253499183627197418153505690818760134083 : Rat) / 29420911578208517565295442196776427461088325841048292830522187590609928689464675526105527672364554675465749342720) [(3, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1182 for generator 9. -/
theorem ep_Q1_009_partial_09_1182_valid :
    mulPoly ep_Q1_009_coefficient_09_1182
        ep_Q1_009_generator_09_1100_1199 =
      ep_Q1_009_partial_09_1182 := by
  native_decide

/-- Coefficient term 1183 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1183 : Poly :=
[
  term ((-15063356414753136433621 : Rat) / 182625128726079838008) [(3, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1183 for generator 9. -/
def ep_Q1_009_partial_09_1183 : Poly :=
[
  term ((-15063356414753136433621 : Rat) / 91312564363039919004) [(2, 1), (3, 1), (12, 1), (15, 1), (16, 1)],
  term ((15063356414753136433621 : Rat) / 182625128726079838008) [(3, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1183 for generator 9. -/
theorem ep_Q1_009_partial_09_1183_valid :
    mulPoly ep_Q1_009_coefficient_09_1183
        ep_Q1_009_generator_09_1100_1199 =
      ep_Q1_009_partial_09_1183 := by
  native_decide

/-- Coefficient term 1184 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1184 : Poly :=
[
  term ((175685042892657528003718456215921798641323272635586041105099073299834952436131943051299528011932475 : Rat) / 339070016967143693261872038265639745825040216900842364726474304259055859199983916490780986197030128) [(3, 1), (12, 1), (15, 3)]
]

/-- Partial product 1184 for generator 9. -/
def ep_Q1_009_partial_09_1184 : Poly :=
[
  term ((175685042892657528003718456215921798641323272635586041105099073299834952436131943051299528011932475 : Rat) / 169535008483571846630936019132819872912520108450421182363237152129527929599991958245390493098515064) [(2, 1), (3, 1), (12, 1), (15, 3)],
  term ((-175685042892657528003718456215921798641323272635586041105099073299834952436131943051299528011932475 : Rat) / 339070016967143693261872038265639745825040216900842364726474304259055859199983916490780986197030128) [(3, 1), (12, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1184 for generator 9. -/
theorem ep_Q1_009_partial_09_1184_valid :
    mulPoly ep_Q1_009_coefficient_09_1184
        ep_Q1_009_generator_09_1100_1199 =
      ep_Q1_009_partial_09_1184 := by
  native_decide

/-- Coefficient term 1185 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1185 : Poly :=
[
  term ((-831560886146029 : Rat) / 1395206957462413) [(3, 1), (12, 1), (15, 3), (16, 1)]
]

/-- Partial product 1185 for generator 9. -/
def ep_Q1_009_partial_09_1185 : Poly :=
[
  term ((-1663121772292058 : Rat) / 1395206957462413) [(2, 1), (3, 1), (12, 1), (15, 3), (16, 1)],
  term ((831560886146029 : Rat) / 1395206957462413) [(3, 1), (12, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1185 for generator 9. -/
theorem ep_Q1_009_partial_09_1185_valid :
    mulPoly ep_Q1_009_coefficient_09_1185
        ep_Q1_009_generator_09_1100_1199 =
      ep_Q1_009_partial_09_1185 := by
  native_decide

/-- Coefficient term 1186 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1186 : Poly :=
[
  term ((16 : Rat) / 3) [(3, 1), (12, 2), (15, 1), (16, 1)]
]

/-- Partial product 1186 for generator 9. -/
def ep_Q1_009_partial_09_1186 : Poly :=
[
  term ((32 : Rat) / 3) [(2, 1), (3, 1), (12, 2), (15, 1), (16, 1)],
  term ((-16 : Rat) / 3) [(3, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1186 for generator 9. -/
theorem ep_Q1_009_partial_09_1186_valid :
    mulPoly ep_Q1_009_coefficient_09_1186
        ep_Q1_009_generator_09_1100_1199 =
      ep_Q1_009_partial_09_1186 := by
  native_decide

/-- Coefficient term 1187 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1187 : Poly :=
[
  term ((16609772997780587601773584986659037789183736063627448889570053196666701758654790444584623534153019 : Rat) / 96443697409895943891758171401790941938789883856728225265770542079466389815166254588814384253440) [(3, 1), (13, 1), (14, 1)]
]

/-- Partial product 1187 for generator 9. -/
def ep_Q1_009_partial_09_1187 : Poly :=
[
  term ((16609772997780587601773584986659037789183736063627448889570053196666701758654790444584623534153019 : Rat) / 48221848704947971945879085700895470969394941928364112632885271039733194907583127294407192126720) [(2, 1), (3, 1), (13, 1), (14, 1)],
  term ((-16609772997780587601773584986659037789183736063627448889570053196666701758654790444584623534153019 : Rat) / 96443697409895943891758171401790941938789883856728225265770542079466389815166254588814384253440) [(3, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1187 for generator 9. -/
theorem ep_Q1_009_partial_09_1187_valid :
    mulPoly ep_Q1_009_coefficient_09_1187
        ep_Q1_009_generator_09_1100_1199 =
      ep_Q1_009_partial_09_1187 := by
  native_decide

/-- Coefficient term 1188 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1188 : Poly :=
[
  term ((-112179345357105291792490791175446272926382805543669489209899986265128379250227596374306101769898559 : Rat) / 508605025450715539892808057398459618737560325351263547089711456388583788799975874736171479295545192) [(3, 1), (13, 1), (14, 1), (15, 2)]
]

/-- Partial product 1188 for generator 9. -/
def ep_Q1_009_partial_09_1188 : Poly :=
[
  term ((-112179345357105291792490791175446272926382805543669489209899986265128379250227596374306101769898559 : Rat) / 254302512725357769946404028699229809368780162675631773544855728194291894399987937368085739647772596) [(2, 1), (3, 1), (13, 1), (14, 1), (15, 2)],
  term ((112179345357105291792490791175446272926382805543669489209899986265128379250227596374306101769898559 : Rat) / 508605025450715539892808057398459618737560325351263547089711456388583788799975874736171479295545192) [(3, 1), (13, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1188 for generator 9. -/
theorem ep_Q1_009_partial_09_1188_valid :
    mulPoly ep_Q1_009_coefficient_09_1188
        ep_Q1_009_generator_09_1100_1199 =
      ep_Q1_009_partial_09_1188 := by
  native_decide

/-- Coefficient term 1189 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1189 : Poly :=
[
  term ((14306614985624 : Rat) / 82070997497789) [(3, 1), (13, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 1189 for generator 9. -/
def ep_Q1_009_partial_09_1189 : Poly :=
[
  term ((28613229971248 : Rat) / 82070997497789) [(2, 1), (3, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-14306614985624 : Rat) / 82070997497789) [(3, 1), (13, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1189 for generator 9. -/
theorem ep_Q1_009_partial_09_1189_valid :
    mulPoly ep_Q1_009_coefficient_09_1189
        ep_Q1_009_generator_09_1100_1199 =
      ep_Q1_009_partial_09_1189 := by
  native_decide

/-- Coefficient term 1190 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1190 : Poly :=
[
  term ((295667333 : Rat) / 14145972) [(3, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 1190 for generator 9. -/
def ep_Q1_009_partial_09_1190 : Poly :=
[
  term ((295667333 : Rat) / 7072986) [(2, 1), (3, 1), (13, 1), (14, 1), (16, 1)],
  term ((-295667333 : Rat) / 14145972) [(3, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1190 for generator 9. -/
theorem ep_Q1_009_partial_09_1190_valid :
    mulPoly ep_Q1_009_coefficient_09_1190
        ep_Q1_009_generator_09_1100_1199 =
      ep_Q1_009_partial_09_1190 := by
  native_decide

/-- Coefficient term 1191 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1191 : Poly :=
[
  term ((-4650135033176724558435623387334661048014635764328427214780017458588488418726898577189237135019187 : Rat) / 42194117616829475452644199988283537098220574187318598553774612159766545544135236382606293110880) [(3, 1), (13, 1), (14, 2)]
]

/-- Partial product 1191 for generator 9. -/
def ep_Q1_009_partial_09_1191 : Poly :=
[
  term ((-4650135033176724558435623387334661048014635764328427214780017458588488418726898577189237135019187 : Rat) / 21097058808414737726322099994141768549110287093659299276887306079883272772067618191303146555440) [(2, 1), (3, 1), (13, 1), (14, 2)],
  term ((4650135033176724558435623387334661048014635764328427214780017458588488418726898577189237135019187 : Rat) / 42194117616829475452644199988283537098220574187318598553774612159766545544135236382606293110880) [(3, 1), (13, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1191 for generator 9. -/
theorem ep_Q1_009_partial_09_1191_valid :
    mulPoly ep_Q1_009_coefficient_09_1191
        ep_Q1_009_generator_09_1100_1199 =
      ep_Q1_009_partial_09_1191 := by
  native_decide

/-- Coefficient term 1192 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1192 : Poly :=
[
  term ((-56616422072838549163216503030117400313342491889212310120407638703811088408020686838612285605790567 : Rat) / 254302512725357769946404028699229809368780162675631773544855728194291894399987937368085739647772596) [(3, 1), (13, 1), (14, 2), (15, 2)]
]

/-- Partial product 1192 for generator 9. -/
def ep_Q1_009_partial_09_1192 : Poly :=
[
  term ((-56616422072838549163216503030117400313342491889212310120407638703811088408020686838612285605790567 : Rat) / 127151256362678884973202014349614904684390081337815886772427864097145947199993968684042869823886298) [(2, 1), (3, 1), (13, 1), (14, 2), (15, 2)],
  term ((56616422072838549163216503030117400313342491889212310120407638703811088408020686838612285605790567 : Rat) / 254302512725357769946404028699229809368780162675631773544855728194291894399987937368085739647772596) [(3, 1), (13, 1), (14, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1192 for generator 9. -/
theorem ep_Q1_009_partial_09_1192_valid :
    mulPoly ep_Q1_009_coefficient_09_1192
        ep_Q1_009_generator_09_1100_1199 =
      ep_Q1_009_partial_09_1192 := by
  native_decide

/-- Coefficient term 1193 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1193 : Poly :=
[
  term ((374251758280452 : Rat) / 1395206957462413) [(3, 1), (13, 1), (14, 2), (15, 2), (16, 1)]
]

/-- Partial product 1193 for generator 9. -/
def ep_Q1_009_partial_09_1193 : Poly :=
[
  term ((748503516560904 : Rat) / 1395206957462413) [(2, 1), (3, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((-374251758280452 : Rat) / 1395206957462413) [(3, 1), (13, 1), (14, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1193 for generator 9. -/
theorem ep_Q1_009_partial_09_1193_valid :
    mulPoly ep_Q1_009_coefficient_09_1193
        ep_Q1_009_generator_09_1100_1199 =
      ep_Q1_009_partial_09_1193 := by
  native_decide

/-- Coefficient term 1194 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1194 : Poly :=
[
  term ((-256954186 : Rat) / 24755451) [(3, 1), (13, 1), (14, 2), (16, 1)]
]

/-- Partial product 1194 for generator 9. -/
def ep_Q1_009_partial_09_1194 : Poly :=
[
  term ((-513908372 : Rat) / 24755451) [(2, 1), (3, 1), (13, 1), (14, 2), (16, 1)],
  term ((256954186 : Rat) / 24755451) [(3, 1), (13, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1194 for generator 9. -/
theorem ep_Q1_009_partial_09_1194_valid :
    mulPoly ep_Q1_009_coefficient_09_1194
        ep_Q1_009_generator_09_1100_1199 =
      ep_Q1_009_partial_09_1194 := by
  native_decide

/-- Coefficient term 1195 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1195 : Poly :=
[
  term ((-89 : Rat) / 102) [(3, 1), (13, 1), (16, 1)]
]

/-- Partial product 1195 for generator 9. -/
def ep_Q1_009_partial_09_1195 : Poly :=
[
  term ((-89 : Rat) / 51) [(2, 1), (3, 1), (13, 1), (16, 1)],
  term ((89 : Rat) / 102) [(3, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1195 for generator 9. -/
theorem ep_Q1_009_partial_09_1195_valid :
    mulPoly ep_Q1_009_coefficient_09_1195
        ep_Q1_009_generator_09_1100_1199 =
      ep_Q1_009_partial_09_1195 := by
  native_decide

/-- Coefficient term 1196 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1196 : Poly :=
[
  term ((126878193632671099012574675197560 : Rat) / 24049240021528595265061175145067379) [(3, 1), (13, 2), (14, 1), (15, 1)]
]

/-- Partial product 1196 for generator 9. -/
def ep_Q1_009_partial_09_1196 : Poly :=
[
  term ((253756387265342198025149350395120 : Rat) / 24049240021528595265061175145067379) [(2, 1), (3, 1), (13, 2), (14, 1), (15, 1)],
  term ((-126878193632671099012574675197560 : Rat) / 24049240021528595265061175145067379) [(3, 1), (13, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1196 for generator 9. -/
theorem ep_Q1_009_partial_09_1196_valid :
    mulPoly ep_Q1_009_coefficient_09_1196
        ep_Q1_009_generator_09_1100_1199 =
      ep_Q1_009_partial_09_1196 := by
  native_decide

/-- Coefficient term 1197 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1197 : Poly :=
[
  term ((465778978093506237197410701900000 : Rat) / 24049240021528595265061175145067379) [(3, 1), (13, 2), (14, 2), (15, 1)]
]

/-- Partial product 1197 for generator 9. -/
def ep_Q1_009_partial_09_1197 : Poly :=
[
  term ((931557956187012474394821403800000 : Rat) / 24049240021528595265061175145067379) [(2, 1), (3, 1), (13, 2), (14, 2), (15, 1)],
  term ((-465778978093506237197410701900000 : Rat) / 24049240021528595265061175145067379) [(3, 1), (13, 2), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1197 for generator 9. -/
theorem ep_Q1_009_partial_09_1197_valid :
    mulPoly ep_Q1_009_coefficient_09_1197
        ep_Q1_009_generator_09_1100_1199 =
      ep_Q1_009_partial_09_1197 := by
  native_decide

/-- Coefficient term 1198 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1198 : Poly :=
[
  term ((-102841199371104303704884284850160734690031431798873382814390473758384178731157029275468117178637765161576649572251 : Rat) / 102155942979890685990609174294362595351001131392528794550424262467395585727307901132310859973488037067589407440) [(3, 1), (14, 1), (15, 1)]
]

/-- Partial product 1198 for generator 9. -/
def ep_Q1_009_partial_09_1198 : Poly :=
[
  term ((-102841199371104303704884284850160734690031431798873382814390473758384178731157029275468117178637765161576649572251 : Rat) / 51077971489945342995304587147181297675500565696264397275212131233697792863653950566155429986744018533794703720) [(2, 1), (3, 1), (14, 1), (15, 1)],
  term ((102841199371104303704884284850160734690031431798873382814390473758384178731157029275468117178637765161576649572251 : Rat) / 102155942979890685990609174294362595351001131392528794550424262467395585727307901132310859973488037067589407440) [(3, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1198 for generator 9. -/
theorem ep_Q1_009_partial_09_1198_valid :
    mulPoly ep_Q1_009_coefficient_09_1198
        ep_Q1_009_generator_09_1100_1199 =
      ep_Q1_009_partial_09_1198 := by
  native_decide

/-- Coefficient term 1199 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1199 : Poly :=
[
  term ((-1575930217503158040515767 : Rat) / 16253636456621105582712) [(3, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1199 for generator 9. -/
def ep_Q1_009_partial_09_1199 : Poly :=
[
  term ((-1575930217503158040515767 : Rat) / 8126818228310552791356) [(2, 1), (3, 1), (14, 1), (15, 1), (16, 1)],
  term ((1575930217503158040515767 : Rat) / 16253636456621105582712) [(3, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1199 for generator 9. -/
theorem ep_Q1_009_partial_09_1199_valid :
    mulPoly ep_Q1_009_coefficient_09_1199
        ep_Q1_009_generator_09_1100_1199 =
      ep_Q1_009_partial_09_1199 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q1_009_partials_09_1100_1199 : List Poly :=
[
  ep_Q1_009_partial_09_1100,
  ep_Q1_009_partial_09_1101,
  ep_Q1_009_partial_09_1102,
  ep_Q1_009_partial_09_1103,
  ep_Q1_009_partial_09_1104,
  ep_Q1_009_partial_09_1105,
  ep_Q1_009_partial_09_1106,
  ep_Q1_009_partial_09_1107,
  ep_Q1_009_partial_09_1108,
  ep_Q1_009_partial_09_1109,
  ep_Q1_009_partial_09_1110,
  ep_Q1_009_partial_09_1111,
  ep_Q1_009_partial_09_1112,
  ep_Q1_009_partial_09_1113,
  ep_Q1_009_partial_09_1114,
  ep_Q1_009_partial_09_1115,
  ep_Q1_009_partial_09_1116,
  ep_Q1_009_partial_09_1117,
  ep_Q1_009_partial_09_1118,
  ep_Q1_009_partial_09_1119,
  ep_Q1_009_partial_09_1120,
  ep_Q1_009_partial_09_1121,
  ep_Q1_009_partial_09_1122,
  ep_Q1_009_partial_09_1123,
  ep_Q1_009_partial_09_1124,
  ep_Q1_009_partial_09_1125,
  ep_Q1_009_partial_09_1126,
  ep_Q1_009_partial_09_1127,
  ep_Q1_009_partial_09_1128,
  ep_Q1_009_partial_09_1129,
  ep_Q1_009_partial_09_1130,
  ep_Q1_009_partial_09_1131,
  ep_Q1_009_partial_09_1132,
  ep_Q1_009_partial_09_1133,
  ep_Q1_009_partial_09_1134,
  ep_Q1_009_partial_09_1135,
  ep_Q1_009_partial_09_1136,
  ep_Q1_009_partial_09_1137,
  ep_Q1_009_partial_09_1138,
  ep_Q1_009_partial_09_1139,
  ep_Q1_009_partial_09_1140,
  ep_Q1_009_partial_09_1141,
  ep_Q1_009_partial_09_1142,
  ep_Q1_009_partial_09_1143,
  ep_Q1_009_partial_09_1144,
  ep_Q1_009_partial_09_1145,
  ep_Q1_009_partial_09_1146,
  ep_Q1_009_partial_09_1147,
  ep_Q1_009_partial_09_1148,
  ep_Q1_009_partial_09_1149,
  ep_Q1_009_partial_09_1150,
  ep_Q1_009_partial_09_1151,
  ep_Q1_009_partial_09_1152,
  ep_Q1_009_partial_09_1153,
  ep_Q1_009_partial_09_1154,
  ep_Q1_009_partial_09_1155,
  ep_Q1_009_partial_09_1156,
  ep_Q1_009_partial_09_1157,
  ep_Q1_009_partial_09_1158,
  ep_Q1_009_partial_09_1159,
  ep_Q1_009_partial_09_1160,
  ep_Q1_009_partial_09_1161,
  ep_Q1_009_partial_09_1162,
  ep_Q1_009_partial_09_1163,
  ep_Q1_009_partial_09_1164,
  ep_Q1_009_partial_09_1165,
  ep_Q1_009_partial_09_1166,
  ep_Q1_009_partial_09_1167,
  ep_Q1_009_partial_09_1168,
  ep_Q1_009_partial_09_1169,
  ep_Q1_009_partial_09_1170,
  ep_Q1_009_partial_09_1171,
  ep_Q1_009_partial_09_1172,
  ep_Q1_009_partial_09_1173,
  ep_Q1_009_partial_09_1174,
  ep_Q1_009_partial_09_1175,
  ep_Q1_009_partial_09_1176,
  ep_Q1_009_partial_09_1177,
  ep_Q1_009_partial_09_1178,
  ep_Q1_009_partial_09_1179,
  ep_Q1_009_partial_09_1180,
  ep_Q1_009_partial_09_1181,
  ep_Q1_009_partial_09_1182,
  ep_Q1_009_partial_09_1183,
  ep_Q1_009_partial_09_1184,
  ep_Q1_009_partial_09_1185,
  ep_Q1_009_partial_09_1186,
  ep_Q1_009_partial_09_1187,
  ep_Q1_009_partial_09_1188,
  ep_Q1_009_partial_09_1189,
  ep_Q1_009_partial_09_1190,
  ep_Q1_009_partial_09_1191,
  ep_Q1_009_partial_09_1192,
  ep_Q1_009_partial_09_1193,
  ep_Q1_009_partial_09_1194,
  ep_Q1_009_partial_09_1195,
  ep_Q1_009_partial_09_1196,
  ep_Q1_009_partial_09_1197,
  ep_Q1_009_partial_09_1198,
  ep_Q1_009_partial_09_1199
]

/-- Sum of partial products in this block. -/
def ep_Q1_009_block_09_1100_1199 : Poly :=
[
  term ((-46640534819570921289814 : Rat) / 4676338877845046513121) [(2, 1), (3, 1), (7, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((53267202720200220994419687810501344000 : Rat) / 2144116865330816633312319087537095051139) [(2, 1), (3, 1), (7, 1), (9, 1), (14, 1), (15, 3)],
  term ((233637577096787738975350518554948011656476223853347409178090506209030323643718622928326097932541127 : Rat) / 1012658822803907410863460799718804890357293780495646365290590691834397093059245673182551034661120) [(2, 1), (3, 1), (7, 1), (12, 1)],
  term ((-6745982505310522073976992872153600512077025150703269159418234954655211329851278040953537991751435 : Rat) / 640145041558184327581544862679387377118717854099033595201551973052458162398166014833255475482208) [(2, 1), (3, 1), (7, 1), (12, 1), (13, 1), (15, 1)],
  term ((-5740300 : Rat) / 3536493) [(2, 1), (3, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((40 : Rat) / 51) [(2, 1), (3, 1), (7, 1), (12, 1), (14, 1), (16, 1)],
  term ((-17023240426214327834626340732636156238816997590159911640718610415840541388047978524061634010028172862468507139 : Rat) / 1250889097712947175395214379114644024706136302765658708780705254702803090538464095497683999675363719194972336) [(2, 1), (3, 1), (7, 1), (12, 1), (15, 2)],
  term ((-89835347088283570002 : Rat) / 96747836051316104659) [(2, 1), (3, 1), (7, 1), (12, 1), (15, 2), (16, 1)],
  term ((1604303059 : Rat) / 49510902) [(2, 1), (3, 1), (7, 1), (12, 1), (16, 1)],
  term ((-32 : Rat) / 3) [(2, 1), (3, 1), (7, 1), (12, 2), (16, 1)],
  term ((-2532738974754285605488857028946182311470422510976941574726938641389018005029332108687106765418405 : Rat) / 182898583302338379309012817908396393462490815456866741486157706586416617828047432809501564423488) [(2, 1), (3, 1), (7, 1), (13, 1), (14, 1), (15, 1)],
  term ((-7462390 : Rat) / 3536493) [(2, 1), (3, 1), (7, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((6787203876935009431820866292810973305314566930053288987375008782398597542371278444068874639441675 : Rat) / 320072520779092163790772431339693688559358927049516797600775986526229081199083007416627737741104) [(2, 1), (3, 1), (7, 1), (13, 1), (14, 2), (15, 1)],
  term ((11480600 : Rat) / 3536493) [(2, 1), (3, 1), (7, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-233503541949684797042239401545271175760983947979819272652505101918914134773026426442484168192541127 : Rat) / 1012658822803907410863460799718804890357293780495646365290590691834397093059245673182551034661120) [(2, 1), (3, 1), (7, 1), (14, 1)],
  term ((519964288709327259824940864005541294279534641614225008950703461058498433010266692195238736984995114397845562651 : Rat) / 30021338345110732209485145098751456592947271266375809010736926112867274172923138291944415992208729260679336064) [(2, 1), (3, 1), (7, 1), (14, 1), (15, 2)],
  term ((434395292692646078851 : Rat) / 290243508153948313977) [(2, 1), (3, 1), (7, 1), (14, 1), (15, 2), (16, 1)],
  term ((-473930761 : Rat) / 16503634) [(2, 1), (3, 1), (7, 1), (14, 1), (16, 1)],
  term ((33678783694041290823715891686000221497991304292471905070916623736187500 : Rat) / 445285858417741453082477510911583302063475897174314508335274303497129151) [(2, 1), (3, 1), (7, 1), (14, 2)],
  term ((88 : Rat) / 51) [(2, 1), (3, 1), (7, 1), (14, 2), (16, 1)],
  term ((14 : Rat) / 51) [(2, 1), (3, 1), (7, 1), (16, 1)],
  term ((73103670173685598970646552621979391061509339498506216475909834971339678567002841432968724561 : Rat) / 92917030678168232976003709121507306643572310211360591448579587579302055048060926238091892768) [(2, 1), (3, 1), (7, 2), (8, 1), (12, 1), (15, 1)],
  term ((-73103670173685598970646552621979391061509339498506216475909834971339678567002841432968724561 : Rat) / 92917030678168232976003709121507306643572310211360591448579587579302055048060926238091892768) [(2, 1), (3, 1), (7, 2), (8, 1), (14, 1), (15, 1)],
  term ((-56509410952730211447664397618195454152469574224789589164563298109108862856480676791346561 : Rat) / 197644492234685755793094430518182480278137890719693224098546200307847268211484744244098960) [(2, 1), (3, 1), (7, 2), (9, 1), (12, 1)],
  term ((13746374895535540901785725886580992000 : Rat) / 714705621776938877770773029179031683713) [(2, 1), (3, 1), (7, 2), (9, 1), (12, 1), (15, 2)],
  term ((56509410952730211447664397618195454152469574224789589164563298109108862856480676791346561 : Rat) / 197644492234685755793094430518182480278137890719693224098546200307847268211484744244098960) [(2, 1), (3, 1), (7, 2), (9, 1), (14, 1)],
  term ((-13746374895535540901785725886580992000 : Rat) / 714705621776938877770773029179031683713) [(2, 1), (3, 1), (7, 2), (9, 1), (14, 1), (15, 2)],
  term ((1357440775387001886364173258562194661062913386010657797475001756479719508474255688813774927888335 : Rat) / 106690840259697387930257477113231229519786309016505599200258662175409693733027669138875912580368) [(2, 1), (3, 1), (7, 2), (12, 1), (15, 1)],
  term ((2296120 : Rat) / 1178831) [(2, 1), (3, 1), (7, 2), (12, 1), (15, 1), (16, 1)],
  term ((-1357440775387001886364173258562194661062913386010657797475001756479719508474255688813774927888335 : Rat) / 106690840259697387930257477113231229519786309016505599200258662175409693733027669138875912580368) [(2, 1), (3, 1), (7, 2), (14, 1), (15, 1)],
  term ((-2296120 : Rat) / 1178831) [(2, 1), (3, 1), (7, 2), (14, 1), (15, 1), (16, 1)],
  term ((102562668013533965222537165734886410229209659813040878337061321920016013897997695252494884354957 : Rat) / 7805030576966131569984311566206613758060074057754289681680685356661372624037117803999718992512) [(2, 1), (3, 1), (8, 1), (12, 1), (13, 1)],
  term ((81857697209720245280653347608304 : Rat) / 3435605717361227895008739306438197) [(2, 1), (3, 1), (8, 1), (12, 1), (13, 1), (15, 2)],
  term ((-260977179991292077498186291393336293397032443727603070059955992436236528590629800309501385020443 : Rat) / 31220122307864526279937246264826455032240296231017158726722741426645490496148471215998875970048) [(2, 1), (3, 1), (8, 1), (12, 1), (14, 1), (15, 1)],
  term ((1488779700859413036970194632760856 : Rat) / 30920451456251051055078653757943773) [(2, 1), (3, 1), (8, 1), (12, 1), (14, 2), (15, 1)],
  term ((-2946068109464270278267399161042193040862497295714983440211152148595842529100822369640249978720377 : Rat) / 31220122307864526279937246264826455032240296231017158726722741426645490496148471215998875970048) [(2, 1), (3, 1), (8, 1), (12, 1), (15, 1)],
  term ((2781526705071787095064944992503528 : Rat) / 30920451456251051055078653757943773) [(2, 1), (3, 1), (8, 1), (12, 1), (15, 3)],
  term ((91524983026208635541476368533097145651328059138270217922200583744574684696167114810092845805905 : Rat) / 4460017472552075182848178037832350718891470890145308389531820203806498642306924459428410852864) [(2, 1), (3, 1), (8, 1), (13, 1), (14, 1)],
  term ((-438234477993081054496996706363728 : Rat) / 30920451456251051055078653757943773) [(2, 1), (3, 1), (8, 1), (13, 1), (14, 1), (15, 2)],
  term ((-100816104547952700413776285887583076235189706108655157632423004628489098971576725124856448151437 : Rat) / 7805030576966131569984311566206613758060074057754289681680685356661372624037117803999718992512) [(2, 1), (3, 1), (8, 1), (13, 1), (14, 2)],
  term ((-163715394419440490561306695216608 : Rat) / 3435605717361227895008739306438197) [(2, 1), (3, 1), (8, 1), (13, 1), (14, 2), (15, 2)],
  term ((-898138605626116414566048979730722152638468229952061449522246749195134409918404236923046945918933 : Rat) / 7805030576966131569984311566206613758060074057754289681680685356661372624037117803999718992512) [(2, 1), (3, 1), (8, 1), (14, 1), (15, 1)],
  term ((3122014512855312465026210448189316 : Rat) / 30920451456251051055078653757943773) [(2, 1), (3, 1), (8, 1), (14, 1), (15, 3)],
  term ((-1689955286429154808357176259480353112837064408067270592572763385427498074744910236420631843355937 : Rat) / 31220122307864526279937246264826455032240296231017158726722741426645490496148471215998875970048) [(2, 1), (3, 1), (8, 1), (14, 2), (15, 1)],
  term ((3793600090419805072582394959813216 : Rat) / 30920451456251051055078653757943773) [(2, 1), (3, 1), (8, 1), (14, 3), (15, 1)],
  term ((15437819253072545935317127199612334409481833798877700711594985690043099514472992827540497037752707191998360724011 : Rat) / 4639385715596571089286862871634687810986753534437449829220449279555777072043079871633681034606583070260517416960) [(2, 1), (3, 1), (9, 1), (12, 1)],
  term ((918368353622181273455649220163108596131049206097710998769877688657829331428249789806403689830002918049557669428023 : Rat) / 168964770838557263153581371905338317687633639883663909405269755458107273900568953539230222680002253067791522712320) [(2, 1), (3, 1), (9, 1), (12, 1), (13, 1), (15, 1)],
  term ((-4445142160896780050708 : Rat) / 1558779625948348837707) [(2, 1), (3, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-46612087985141416890391203579496827787663629111689436879019590744290589056857113863497716786034754976613832155993 : Rat) / 1159846428899142772321715717908671952746688383609362457305112319888944268010769967908420258651645767565129354240) [(2, 1), (3, 1), (9, 1), (12, 1), (14, 1)],
  term ((-1569920204692907215736587681316553776000 : Rat) / 15008818057315716433186233612759665357973) [(2, 1), (3, 1), (9, 1), (12, 1), (14, 1), (15, 2)],
  term ((30700875818474194984781 : Rat) / 1558779625948348837707) [(2, 1), (3, 1), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((10962630933198898498294677259744861740769320600812812333394029197160903250345949668367382347577927161818687169251 : Rat) / 1159846428899142772321715717908671952746688383609362457305112319888944268010769967908420258651645767565129354240) [(2, 1), (3, 1), (9, 1), (12, 1), (14, 2)],
  term ((-24880280697155794952639 : Rat) / 4676338877845046513121) [(2, 1), (3, 1), (9, 1), (12, 1), (14, 2), (16, 1)],
  term ((5738322027419210951078809167674918629435002318718012944687775179549407184151996617151088444176820122569854261191229 : Rat) / 262834087971089076016682134074970716402985662041254970185975175157055759400885038838802568613336838105453479774720) [(2, 1), (3, 1), (9, 1), (12, 1), (15, 2)],
  term ((-55439387338377681931318 : Rat) / 4676338877845046513121) [(2, 1), (3, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((224323462444982293315 : Rat) / 70057511278577475852) [(2, 1), (3, 1), (9, 1), (12, 1), (16, 1)],
  term ((-944396359536756991267538293299705458448725566931743942898685827831381376654444251738452110551672342012118922400921 : Rat) / 147844174483737605259383700417171027976679434898205920729611036025843864662997834346826444845001971434317582373280) [(2, 1), (3, 1), (9, 1), (13, 1), (14, 1), (15, 1)],
  term ((13301968612845070909504 : Rat) / 4676338877845046513121) [(2, 1), (3, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-6324881719539831263689574105615130198168411430588637660637587426068506160606897024808106001830438986629531380588161 : Rat) / 591376697934950421037534801668684111906717739592823682918444144103375458651991337387305779380007885737270329493120) [(2, 1), (3, 1), (9, 1), (13, 1), (14, 2), (15, 1)],
  term ((8890284321793560101416 : Rat) / 1558779625948348837707) [(2, 1), (3, 1), (9, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-84005195031744452342919308390097662308722158399374858384466575903509570313912546316172913900413832885341800939239 : Rat) / 1546461905198857029762287623878229270328917844812483276406816426518592357347693290544560344868861023420172472320) [(2, 1), (3, 1), (9, 1), (14, 1)],
  term ((50180512013390589787781888003680760478867851083284344764514287774702191198500160595702319686346640265361346070539533 : Rat) / 1577004527826534456100092804449824298417913972247529821115851050942334556405310233032815411680021028632720878648320) [(2, 1), (3, 1), (9, 1), (14, 1), (15, 2)],
  term ((-1439581085926459737235 : Rat) / 91692919173432284571) [(2, 1), (3, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((68153023977990758125865 : Rat) / 2078372834597798450276) [(2, 1), (3, 1), (9, 1), (14, 1), (16, 1)],
  term ((-73319148777347750654527160021577177500929151639615439242309973038515527867594459638656329495160401392750439346457 : Rat) / 2319692857798285544643431435817343905493376767218724914610224639777888536021539935816840517303291535130258708480) [(2, 1), (3, 1), (9, 1), (14, 2)],
  term ((-11571045040375343558101137029180200950400 : Rat) / 15008818057315716433186233612759665357973) [(2, 1), (3, 1), (9, 1), (14, 2), (15, 2)],
  term ((102728788670161713371741 : Rat) / 9352677755690093026242) [(2, 1), (3, 1), (9, 1), (14, 2), (16, 1)],
  term ((28600812019466321779336467177131686915621411910354153875468698061528502955131660571914996385691178970702637922527 : Rat) / 386615476299714257440571905969557317582229461203120819101704106629648089336923322636140086217215255855043118080) [(2, 1), (3, 1), (9, 1), (14, 3)],
  term ((-10036905263071661528281 : Rat) / 275078757520296853713) [(2, 1), (3, 1), (9, 1), (14, 3), (16, 1)],
  term ((-56 : Rat) / 17) [(2, 1), (3, 1), (11, 1), (12, 1), (16, 1)],
  term ((-56 : Rat) / 17) [(2, 1), (3, 1), (11, 1), (14, 1), (16, 1)],
  term ((3685582840166127284304518116365892628997734761795661665774422660335429288705739567739593421449069 : Rat) / 16877647046731790181057679995313414839288229674927439421509844863906618217654094553042517244352) [(2, 1), (3, 1), (12, 1), (13, 1)],
  term ((662993486393098066241781954416324529220254799783649727278894270346409 : Rat) / 419092572628462544077625892622666637236212609105237184315552285644356848) [(2, 1), (3, 1), (12, 1), (13, 1), (14, 1)],
  term ((-32 : Rat) / 3) [(2, 1), (3, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((5748702427075248298878270388160063402167221443563588934559140489369328563233937183212239063214241 : Rat) / 36328930389336824278057718385604258481254308953661681934979389742041699199998276766869391378253228) [(2, 1), (3, 1), (12, 1), (13, 1), (15, 2)],
  term ((-374251758280452 : Rat) / 1395206957462413) [(2, 1), (3, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((663411880 : Rat) / 24755451) [(2, 1), (3, 1), (12, 1), (13, 1), (16, 1)],
  term ((-59619709195968798361268569843200 : Rat) / 3435605717361227895008739306438197) [(2, 1), (3, 1), (12, 1), (13, 2), (15, 1)],
  term ((-241317369116513323881179948400916083600680556387803777953075482379562961034802083395538140993128976710794577485867 : Rat) / 1634495087678250975849746788709801525616018102280460712806788199478329371636926418116973759575808593081430519040) [(2, 1), (3, 1), (12, 1), (14, 1), (15, 1)],
  term ((-54739535387983090593941 : Rat) / 4063409114155276395678) [(2, 1), (3, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((81273192491475592624744306117067112718519949209838179 : Rat) / 285071954829622879643311256928356724175362184887277392) [(2, 1), (3, 1), (12, 1), (14, 2), (15, 1)],
  term ((-662786495307469 : Rat) / 1395206957462413) [(2, 1), (3, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-24029701616441833137210527765575466552539923804467449888674853501625967608974253499183627197418153505690818760134083 : Rat) / 14710455789104258782647721098388213730544162920524146415261093795304964344732337763052763836182277337732874671360) [(2, 1), (3, 1), (12, 1), (15, 1)],
  term ((-15063356414753136433621 : Rat) / 91312564363039919004) [(2, 1), (3, 1), (12, 1), (15, 1), (16, 1)],
  term ((175685042892657528003718456215921798641323272635586041105099073299834952436131943051299528011932475 : Rat) / 169535008483571846630936019132819872912520108450421182363237152129527929599991958245390493098515064) [(2, 1), (3, 1), (12, 1), (15, 3)],
  term ((-1663121772292058 : Rat) / 1395206957462413) [(2, 1), (3, 1), (12, 1), (15, 3), (16, 1)],
  term ((32 : Rat) / 3) [(2, 1), (3, 1), (12, 2), (15, 1), (16, 1)],
  term ((16609772997780587601773584986659037789183736063627448889570053196666701758654790444584623534153019 : Rat) / 48221848704947971945879085700895470969394941928364112632885271039733194907583127294407192126720) [(2, 1), (3, 1), (13, 1), (14, 1)],
  term ((-112179345357105291792490791175446272926382805543669489209899986265128379250227596374306101769898559 : Rat) / 254302512725357769946404028699229809368780162675631773544855728194291894399987937368085739647772596) [(2, 1), (3, 1), (13, 1), (14, 1), (15, 2)],
  term ((28613229971248 : Rat) / 82070997497789) [(2, 1), (3, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((295667333 : Rat) / 7072986) [(2, 1), (3, 1), (13, 1), (14, 1), (16, 1)],
  term ((-4650135033176724558435623387334661048014635764328427214780017458588488418726898577189237135019187 : Rat) / 21097058808414737726322099994141768549110287093659299276887306079883272772067618191303146555440) [(2, 1), (3, 1), (13, 1), (14, 2)],
  term ((-56616422072838549163216503030117400313342491889212310120407638703811088408020686838612285605790567 : Rat) / 127151256362678884973202014349614904684390081337815886772427864097145947199993968684042869823886298) [(2, 1), (3, 1), (13, 1), (14, 2), (15, 2)],
  term ((748503516560904 : Rat) / 1395206957462413) [(2, 1), (3, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((-513908372 : Rat) / 24755451) [(2, 1), (3, 1), (13, 1), (14, 2), (16, 1)],
  term ((-89 : Rat) / 51) [(2, 1), (3, 1), (13, 1), (16, 1)],
  term ((253756387265342198025149350395120 : Rat) / 24049240021528595265061175145067379) [(2, 1), (3, 1), (13, 2), (14, 1), (15, 1)],
  term ((931557956187012474394821403800000 : Rat) / 24049240021528595265061175145067379) [(2, 1), (3, 1), (13, 2), (14, 2), (15, 1)],
  term ((-102841199371104303704884284850160734690031431798873382814390473758384178731157029275468117178637765161576649572251 : Rat) / 51077971489945342995304587147181297675500565696264397275212131233697792863653950566155429986744018533794703720) [(2, 1), (3, 1), (14, 1), (15, 1)],
  term ((-1575930217503158040515767 : Rat) / 8126818228310552791356) [(2, 1), (3, 1), (14, 1), (15, 1), (16, 1)],
  term ((23320267409785460644907 : Rat) / 4676338877845046513121) [(3, 1), (7, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-26633601360100110497209843905250672000 : Rat) / 2144116865330816633312319087537095051139) [(3, 1), (7, 1), (9, 1), (14, 1), (15, 3)],
  term ((-233637577096787738975350518554948011656476223853347409178090506209030323643718622928326097932541127 : Rat) / 2025317645607814821726921599437609780714587560991292730581181383668794186118491346365102069322240) [(3, 1), (7, 1), (12, 1)],
  term ((6745982505310522073976992872153600512077025150703269159418234954655211329851278040953537991751435 : Rat) / 1280290083116368655163089725358774754237435708198067190403103946104916324796332029666510950964416) [(3, 1), (7, 1), (12, 1), (13, 1), (15, 1)],
  term ((2870150 : Rat) / 3536493) [(3, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-20 : Rat) / 51) [(3, 1), (7, 1), (12, 1), (14, 1), (16, 1)],
  term ((17023240426214327834626340732636156238816997590159911640718610415840541388047978524061634010028172862468507139 : Rat) / 2501778195425894350790428758229288049412272605531317417561410509405606181076928190995367999350727438389944672) [(3, 1), (7, 1), (12, 1), (15, 2)],
  term ((44917673544141785001 : Rat) / 96747836051316104659) [(3, 1), (7, 1), (12, 1), (15, 2), (16, 1)],
  term ((-1604303059 : Rat) / 99021804) [(3, 1), (7, 1), (12, 1), (16, 1)],
  term ((16 : Rat) / 3) [(3, 1), (7, 1), (12, 2), (16, 1)],
  term ((2532738974754285605488857028946182311470422510976941574726938641389018005029332108687106765418405 : Rat) / 365797166604676758618025635816792786924981630913733482972315413172833235656094865619003128846976) [(3, 1), (7, 1), (13, 1), (14, 1), (15, 1)],
  term ((3731195 : Rat) / 3536493) [(3, 1), (7, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-6787203876935009431820866292810973305314566930053288987375008782398597542371278444068874639441675 : Rat) / 640145041558184327581544862679387377118717854099033595201551973052458162398166014833255475482208) [(3, 1), (7, 1), (13, 1), (14, 2), (15, 1)],
  term ((-5740300 : Rat) / 3536493) [(3, 1), (7, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((233503541949684797042239401545271175760983947979819272652505101918914134773026426442484168192541127 : Rat) / 2025317645607814821726921599437609780714587560991292730581181383668794186118491346365102069322240) [(3, 1), (7, 1), (14, 1)],
  term ((-519964288709327259824940864005541294279534641614225008950703461058498433010266692195238736984995114397845562651 : Rat) / 60042676690221464418970290197502913185894542532751618021473852225734548345846276583888831984417458521358672128) [(3, 1), (7, 1), (14, 1), (15, 2)],
  term ((-434395292692646078851 : Rat) / 580487016307896627954) [(3, 1), (7, 1), (14, 1), (15, 2), (16, 1)],
  term ((473930761 : Rat) / 33007268) [(3, 1), (7, 1), (14, 1), (16, 1)],
  term ((-16839391847020645411857945843000110748995652146235952535458311868093750 : Rat) / 445285858417741453082477510911583302063475897174314508335274303497129151) [(3, 1), (7, 1), (14, 2)],
  term ((-44 : Rat) / 51) [(3, 1), (7, 1), (14, 2), (16, 1)],
  term ((-7 : Rat) / 51) [(3, 1), (7, 1), (16, 1)],
  term ((-73103670173685598970646552621979391061509339498506216475909834971339678567002841432968724561 : Rat) / 185834061356336465952007418243014613287144620422721182897159175158604110096121852476183785536) [(3, 1), (7, 2), (8, 1), (12, 1), (15, 1)],
  term ((73103670173685598970646552621979391061509339498506216475909834971339678567002841432968724561 : Rat) / 185834061356336465952007418243014613287144620422721182897159175158604110096121852476183785536) [(3, 1), (7, 2), (8, 1), (14, 1), (15, 1)],
  term ((56509410952730211447664397618195454152469574224789589164563298109108862856480676791346561 : Rat) / 395288984469371511586188861036364960556275781439386448197092400615694536422969488488197920) [(3, 1), (7, 2), (9, 1), (12, 1)],
  term ((-6873187447767770450892862943290496000 : Rat) / 714705621776938877770773029179031683713) [(3, 1), (7, 2), (9, 1), (12, 1), (15, 2)],
  term ((-56509410952730211447664397618195454152469574224789589164563298109108862856480676791346561 : Rat) / 395288984469371511586188861036364960556275781439386448197092400615694536422969488488197920) [(3, 1), (7, 2), (9, 1), (14, 1)],
  term ((6873187447767770450892862943290496000 : Rat) / 714705621776938877770773029179031683713) [(3, 1), (7, 2), (9, 1), (14, 1), (15, 2)],
  term ((-1357440775387001886364173258562194661062913386010657797475001756479719508474255688813774927888335 : Rat) / 213381680519394775860514954226462459039572618033011198400517324350819387466055338277751825160736) [(3, 1), (7, 2), (12, 1), (15, 1)],
  term ((-1148060 : Rat) / 1178831) [(3, 1), (7, 2), (12, 1), (15, 1), (16, 1)],
  term ((1357440775387001886364173258562194661062913386010657797475001756479719508474255688813774927888335 : Rat) / 213381680519394775860514954226462459039572618033011198400517324350819387466055338277751825160736) [(3, 1), (7, 2), (14, 1), (15, 1)],
  term ((1148060 : Rat) / 1178831) [(3, 1), (7, 2), (14, 1), (15, 1), (16, 1)],
  term ((-102562668013533965222537165734886410229209659813040878337061321920016013897997695252494884354957 : Rat) / 15610061153932263139968623132413227516120148115508579363361370713322745248074235607999437985024) [(3, 1), (8, 1), (12, 1), (13, 1)],
  term ((-40928848604860122640326673804152 : Rat) / 3435605717361227895008739306438197) [(3, 1), (8, 1), (12, 1), (13, 1), (15, 2)],
  term ((260977179991292077498186291393336293397032443727603070059955992436236528590629800309501385020443 : Rat) / 62440244615729052559874492529652910064480592462034317453445482853290980992296942431997751940096) [(3, 1), (8, 1), (12, 1), (14, 1), (15, 1)],
  term ((-744389850429706518485097316380428 : Rat) / 30920451456251051055078653757943773) [(3, 1), (8, 1), (12, 1), (14, 2), (15, 1)],
  term ((2946068109464270278267399161042193040862497295714983440211152148595842529100822369640249978720377 : Rat) / 62440244615729052559874492529652910064480592462034317453445482853290980992296942431997751940096) [(3, 1), (8, 1), (12, 1), (15, 1)],
  term ((-1390763352535893547532472496251764 : Rat) / 30920451456251051055078653757943773) [(3, 1), (8, 1), (12, 1), (15, 3)],
  term ((-91524983026208635541476368533097145651328059138270217922200583744574684696167114810092845805905 : Rat) / 8920034945104150365696356075664701437782941780290616779063640407612997284613848918856821705728) [(3, 1), (8, 1), (13, 1), (14, 1)],
  term ((219117238996540527248498353181864 : Rat) / 30920451456251051055078653757943773) [(3, 1), (8, 1), (13, 1), (14, 1), (15, 2)],
  term ((100816104547952700413776285887583076235189706108655157632423004628489098971576725124856448151437 : Rat) / 15610061153932263139968623132413227516120148115508579363361370713322745248074235607999437985024) [(3, 1), (8, 1), (13, 1), (14, 2)],
  term ((81857697209720245280653347608304 : Rat) / 3435605717361227895008739306438197) [(3, 1), (8, 1), (13, 1), (14, 2), (15, 2)],
  term ((898138605626116414566048979730722152638468229952061449522246749195134409918404236923046945918933 : Rat) / 15610061153932263139968623132413227516120148115508579363361370713322745248074235607999437985024) [(3, 1), (8, 1), (14, 1), (15, 1)],
  term ((-1561007256427656232513105224094658 : Rat) / 30920451456251051055078653757943773) [(3, 1), (8, 1), (14, 1), (15, 3)],
  term ((1689955286429154808357176259480353112837064408067270592572763385427498074744910236420631843355937 : Rat) / 62440244615729052559874492529652910064480592462034317453445482853290980992296942431997751940096) [(3, 1), (8, 1), (14, 2), (15, 1)],
  term ((-1896800045209902536291197479906608 : Rat) / 30920451456251051055078653757943773) [(3, 1), (8, 1), (14, 3), (15, 1)],
  term ((-15437819253072545935317127199612334409481833798877700711594985690043099514472992827540497037752707191998360724011 : Rat) / 9278771431193142178573725743269375621973507068874899658440898559111554144086159743267362069213166140521034833920) [(3, 1), (9, 1), (12, 1)],
  term ((-918368353622181273455649220163108596131049206097710998769877688657829331428249789806403689830002918049557669428023 : Rat) / 337929541677114526307162743810676635375267279767327818810539510916214547801137907078460445360004506135583045424640) [(3, 1), (9, 1), (12, 1), (13, 1), (15, 1)],
  term ((2222571080448390025354 : Rat) / 1558779625948348837707) [(3, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((46612087985141416890391203579496827787663629111689436879019590744290589056857113863497716786034754976613832155993 : Rat) / 2319692857798285544643431435817343905493376767218724914610224639777888536021539935816840517303291535130258708480) [(3, 1), (9, 1), (12, 1), (14, 1)],
  term ((784960102346453607868293840658276888000 : Rat) / 15008818057315716433186233612759665357973) [(3, 1), (9, 1), (12, 1), (14, 1), (15, 2)],
  term ((-30700875818474194984781 : Rat) / 3117559251896697675414) [(3, 1), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((-10962630933198898498294677259744861740769320600812812333394029197160903250345949668367382347577927161818687169251 : Rat) / 2319692857798285544643431435817343905493376767218724914610224639777888536021539935816840517303291535130258708480) [(3, 1), (9, 1), (12, 1), (14, 2)],
  term ((24880280697155794952639 : Rat) / 9352677755690093026242) [(3, 1), (9, 1), (12, 1), (14, 2), (16, 1)],
  term ((-5738322027419210951078809167674918629435002318718012944687775179549407184151996617151088444176820122569854261191229 : Rat) / 525668175942178152033364268149941432805971324082509940371950350314111518801770077677605137226673676210906959549440) [(3, 1), (9, 1), (12, 1), (15, 2)],
  term ((27719693669188840965659 : Rat) / 4676338877845046513121) [(3, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((-224323462444982293315 : Rat) / 140115022557154951704) [(3, 1), (9, 1), (12, 1), (16, 1)],
  term ((944396359536756991267538293299705458448725566931743942898685827831381376654444251738452110551672342012118922400921 : Rat) / 295688348967475210518767400834342055953358869796411841459222072051687729325995668693652889690003942868635164746560) [(3, 1), (9, 1), (13, 1), (14, 1), (15, 1)],
  term ((-6650984306422535454752 : Rat) / 4676338877845046513121) [(3, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((6324881719539831263689574105615130198168411430588637660637587426068506160606897024808106001830438986629531380588161 : Rat) / 1182753395869900842075069603337368223813435479185647365836888288206750917303982674774611558760015771474540658986240) [(3, 1), (9, 1), (13, 1), (14, 2), (15, 1)],
  term ((-4445142160896780050708 : Rat) / 1558779625948348837707) [(3, 1), (9, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((84005195031744452342919308390097662308722158399374858384466575903509570313912546316172913900413832885341800939239 : Rat) / 3092923810397714059524575247756458540657835689624966552813632853037184714695386581089120689737722046840344944640) [(3, 1), (9, 1), (14, 1)],
  term ((-50180512013390589787781888003680760478867851083284344764514287774702191198500160595702319686346640265361346070539533 : Rat) / 3154009055653068912200185608899648596835827944495059642231702101884669112810620466065630823360042057265441757296640) [(3, 1), (9, 1), (14, 1), (15, 2)],
  term ((1439581085926459737235 : Rat) / 183385838346864569142) [(3, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((-68153023977990758125865 : Rat) / 4156745669195596900552) [(3, 1), (9, 1), (14, 1), (16, 1)],
  term ((73319148777347750654527160021577177500929151639615439242309973038515527867594459638656329495160401392750439346457 : Rat) / 4639385715596571089286862871634687810986753534437449829220449279555777072043079871633681034606583070260517416960) [(3, 1), (9, 1), (14, 2)],
  term ((5785522520187671779050568514590100475200 : Rat) / 15008818057315716433186233612759665357973) [(3, 1), (9, 1), (14, 2), (15, 2)],
  term ((-102728788670161713371741 : Rat) / 18705355511380186052484) [(3, 1), (9, 1), (14, 2), (16, 1)],
  term ((-28600812019466321779336467177131686915621411910354153875468698061528502955131660571914996385691178970702637922527 : Rat) / 773230952599428514881143811939114635164458922406241638203408213259296178673846645272280172434430511710086236160) [(3, 1), (9, 1), (14, 3)],
  term ((10036905263071661528281 : Rat) / 550157515040593707426) [(3, 1), (9, 1), (14, 3), (16, 1)],
  term ((28 : Rat) / 17) [(3, 1), (11, 1), (12, 1), (16, 1)],
  term ((28 : Rat) / 17) [(3, 1), (11, 1), (14, 1), (16, 1)],
  term ((-3685582840166127284304518116365892628997734761795661665774422660335429288705739567739593421449069 : Rat) / 33755294093463580362115359990626829678576459349854878843019689727813236435308189106085034488704) [(3, 1), (12, 1), (13, 1)],
  term ((-662993486393098066241781954416324529220254799783649727278894270346409 : Rat) / 838185145256925088155251785245333274472425218210474368631104571288713696) [(3, 1), (12, 1), (13, 1), (14, 1)],
  term ((16 : Rat) / 3) [(3, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-5748702427075248298878270388160063402167221443563588934559140489369328563233937183212239063214241 : Rat) / 72657860778673648556115436771208516962508617907323363869958779484083398399996553533738782756506456) [(3, 1), (12, 1), (13, 1), (15, 2)],
  term ((187125879140226 : Rat) / 1395206957462413) [(3, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-331705940 : Rat) / 24755451) [(3, 1), (12, 1), (13, 1), (16, 1)],
  term ((29809854597984399180634284921600 : Rat) / 3435605717361227895008739306438197) [(3, 1), (12, 1), (13, 2), (15, 1)],
  term ((241317369116513323881179948400916083600680556387803777953075482379562961034802083395538140993128976710794577485867 : Rat) / 3268990175356501951699493577419603051232036204560921425613576398956658743273852836233947519151617186162861038080) [(3, 1), (12, 1), (14, 1), (15, 1)],
  term ((54739535387983090593941 : Rat) / 8126818228310552791356) [(3, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-81273192491475592624744306117067112718519949209838179 : Rat) / 570143909659245759286622513856713448350724369774554784) [(3, 1), (12, 1), (14, 2), (15, 1)],
  term ((662786495307469 : Rat) / 2790413914924826) [(3, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((24029701616441833137210527765575466552539923804467449888674853501625967608974253499183627197418153505690818760134083 : Rat) / 29420911578208517565295442196776427461088325841048292830522187590609928689464675526105527672364554675465749342720) [(3, 1), (12, 1), (15, 1)],
  term ((15063356414753136433621 : Rat) / 182625128726079838008) [(3, 1), (12, 1), (15, 1), (16, 1)],
  term ((-175685042892657528003718456215921798641323272635586041105099073299834952436131943051299528011932475 : Rat) / 339070016967143693261872038265639745825040216900842364726474304259055859199983916490780986197030128) [(3, 1), (12, 1), (15, 3)],
  term ((831560886146029 : Rat) / 1395206957462413) [(3, 1), (12, 1), (15, 3), (16, 1)],
  term ((-16 : Rat) / 3) [(3, 1), (12, 2), (15, 1), (16, 1)],
  term ((-16609772997780587601773584986659037789183736063627448889570053196666701758654790444584623534153019 : Rat) / 96443697409895943891758171401790941938789883856728225265770542079466389815166254588814384253440) [(3, 1), (13, 1), (14, 1)],
  term ((112179345357105291792490791175446272926382805543669489209899986265128379250227596374306101769898559 : Rat) / 508605025450715539892808057398459618737560325351263547089711456388583788799975874736171479295545192) [(3, 1), (13, 1), (14, 1), (15, 2)],
  term ((-14306614985624 : Rat) / 82070997497789) [(3, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-295667333 : Rat) / 14145972) [(3, 1), (13, 1), (14, 1), (16, 1)],
  term ((4650135033176724558435623387334661048014635764328427214780017458588488418726898577189237135019187 : Rat) / 42194117616829475452644199988283537098220574187318598553774612159766545544135236382606293110880) [(3, 1), (13, 1), (14, 2)],
  term ((56616422072838549163216503030117400313342491889212310120407638703811088408020686838612285605790567 : Rat) / 254302512725357769946404028699229809368780162675631773544855728194291894399987937368085739647772596) [(3, 1), (13, 1), (14, 2), (15, 2)],
  term ((-374251758280452 : Rat) / 1395206957462413) [(3, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((256954186 : Rat) / 24755451) [(3, 1), (13, 1), (14, 2), (16, 1)],
  term ((89 : Rat) / 102) [(3, 1), (13, 1), (16, 1)],
  term ((-126878193632671099012574675197560 : Rat) / 24049240021528595265061175145067379) [(3, 1), (13, 2), (14, 1), (15, 1)],
  term ((-465778978093506237197410701900000 : Rat) / 24049240021528595265061175145067379) [(3, 1), (13, 2), (14, 2), (15, 1)],
  term ((102841199371104303704884284850160734690031431798873382814390473758384178731157029275468117178637765161576649572251 : Rat) / 102155942979890685990609174294362595351001131392528794550424262467395585727307901132310859973488037067589407440) [(3, 1), (14, 1), (15, 1)],
  term ((1575930217503158040515767 : Rat) / 16253636456621105582712) [(3, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 9, terms 1100 through 1199. -/
theorem ep_Q1_009_block_09_1100_1199_valid :
    checkProductSumEq ep_Q1_009_partials_09_1100_1199
      ep_Q1_009_block_09_1100_1199 = true := by
  native_decide

end EpQ1009TermShards

end Patterns

end EndpointCertificate

end Problem97
