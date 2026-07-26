import VerifiedDistinctReducedUnionMirror.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk022Assertions : List BVLogicalExpr :=
  [ bnot (bands [bvar 1073, bvar 1077, bvar 1086, bvar 1090]),
    bnot (bands [bvar 1086, bvar 1090, bvar 1099, bvar 1103]),
    bnot (bands [bvar 1086, bvar 1091, bvar 1099, bvar 1104]),
    bnot (bands [bvar 1086, bvar 1092, bvar 1099, bvar 1105]),
    bnot (bands [bvar 1086, bvar 1093, bvar 1099, bvar 1106]),
    bnot (bands [bvar 1087, bvar 1090, bvar 1100, bvar 1103]),
    bnot (bands [bvar 1087, bvar 1091, bvar 1100, bvar 1104]),
    bnot (bands [bvar 1087, bvar 1092, bvar 1100, bvar 1105]),
    bnot (bands [bvar 1087, bvar 1093, bvar 1100, bvar 1106]),
    bnot (bands [bvar 1088, bvar 1090, bvar 1101, bvar 1103]),
    bnot (bands [bvar 1088, bvar 1091, bvar 1101, bvar 1104]),
    bnot (bands [bvar 1088, bvar 1092, bvar 1101, bvar 1105]),
    bnot (bands [bvar 1089, bvar 1090, bvar 1102, bvar 1103]),
    bnot (bands [bvar 1089, bvar 1091, bvar 1102, bvar 1104]),
    bnot (bands [bvar 1089, bvar 1092, bvar 1102, bvar 1105]),
    bnot (bands [bvar 1089, bvar 1093, bvar 1102, bvar 1106]),
    bnot (bands [bvar 1090, bvar 1091, bvar 1103, bvar 1104]),
    bnot (bands [bvar 1090, bvar 1092, bvar 1103, bvar 1105]),
    bnot (bands [bvar 1090, bvar 1093, bvar 1103, bvar 1106]),
    bnot (bands [bvar 1091, bvar 1092, bvar 1104, bvar 1105]),
    bnot (bands [bvar 1091, bvar 1093, bvar 1104, bvar 1106]),
    bnot (bands [bvar 1092, bvar 1093, bvar 1105, bvar 1106]),
    bnot (bvar 28),
    exactly [bvar 28, bvar 29, bvar 30, bvar 31, bvar 32, bvar 33, bvar 34, bvar 35, bvar 36, bvar 37, bvar 38, bvar 39, bvar 40] 4,
    bnot (bvar 42),
    exactly [bvar 41, bvar 42, bvar 43, bvar 44, bvar 45, bvar 46, bvar 47, bvar 48, bvar 49, bvar 50, bvar 51, bvar 52, bvar 53] 4,
    bnot (bvar 56),
    bnot (bvar 70),
    exactly [bvar 67, bvar 68, bvar 69, bvar 70, bvar 71, bvar 72, bvar 73, bvar 74, bvar 75, bvar 76, bvar 77, bvar 78, bvar 79] 4,
    bnot (bvar 84),
    bnot (bvar 98),
    exactly [bvar 93, bvar 94, bvar 95, bvar 96, bvar 97, bvar 98, bvar 99, bvar 100, bvar 101, bvar 102, bvar 103, bvar 104, bvar 105] 4,
    bnot (bvar 112),
    exactly [bvar 106, bvar 107, bvar 108, bvar 109, bvar 110, bvar 111, bvar 112, bvar 113, bvar 114, bvar 115, bvar 116, bvar 117, bvar 118] 4,
    bnot (bvar 126),
    exactly [bvar 119, bvar 120, bvar 121, bvar 122, bvar 123, bvar 124, bvar 125, bvar 126, bvar 127, bvar 128, bvar 129, bvar 130, bvar 131] 4,
    bnot (bvar 140),
    exactly [bvar 132, bvar 133, bvar 134, bvar 135, bvar 136, bvar 137, bvar 138, bvar 139, bvar 140, bvar 141, bvar 142, bvar 143, bvar 144] 4,
    bnot (bvar 154),
    exactly [bvar 145, bvar 146, bvar 147, bvar 148, bvar 149, bvar 150, bvar 151, bvar 152, bvar 153, bvar 154, bvar 155, bvar 156, bvar 157] 4,
    bnot (bvar 168),
    exactly [bvar 158, bvar 159, bvar 160, bvar 161, bvar 162, bvar 163, bvar 164, bvar 165, bvar 166, bvar 167, bvar 168, bvar 169, bvar 170] 4,
    bnot (bvar 182),
    exactly [bvar 171, bvar 172, bvar 173, bvar 174, bvar 175, bvar 176, bvar 177, bvar 178, bvar 179, bvar 180, bvar 181, bvar 182, bvar 183] 4,
    bnot (bvar 196),
    exactly [bvar 184, bvar 185, bvar 186, bvar 187, bvar 188, bvar 189, bvar 190, bvar 191, bvar 192, bvar 193, bvar 194, bvar 195, bvar 196] 4,
    atMost [bands [bvar 28, bvar 106], bands [bvar 29, bvar 107], bands [bvar 30, bvar 108], bands [bvar 31, bvar 109], bands [bvar 32, bvar 110], bands [bvar 33, bvar 111], bands [bvar 34, bvar 112], bands [bvar 35, bvar 113], bands [bvar 36, bvar 114], bands [bvar 37, bvar 115], bands [bvar 38, bvar 116], bands [bvar 39, bvar 117], bands [bvar 40, bvar 118]] 2,
    atMost [bands [bvar 93, bvar 171], bands [bvar 94, bvar 172], bands [bvar 95, bvar 173], bands [bvar 96, bvar 174], bands [bvar 97, bvar 175], bands [bvar 98, bvar 176], bands [bvar 99, bvar 177], bands [bvar 100, bvar 178], bands [bvar 101, bvar 179], bands [bvar 102, bvar 180], bands [bvar 103, bvar 181], bands [bvar 104, bvar 182], bands [bvar 105, bvar 183]] 2,
    atMost [bands [bvar 29, bvar 33], bands [bvar 42, bvar 46], bands [bvar 55, bvar 59], bands [bvar 68, bvar 72], bands [bvar 81, bvar 85], bands [bvar 94, bvar 98], bands [bvar 107, bvar 111], bands [bvar 120, bvar 124], bands [bvar 133, bvar 137], bands [bvar 146, bvar 150], bands [bvar 159, bvar 163], bands [bvar 172, bvar 176], bands [bvar 185, bvar 189]] 2,
    atMost [bands [bvar 29, bvar 34], bands [bvar 42, bvar 47], bands [bvar 55, bvar 60], bands [bvar 68, bvar 73], bands [bvar 81, bvar 86], bands [bvar 94, bvar 99], bands [bvar 107, bvar 112], bands [bvar 120, bvar 125], bands [bvar 133, bvar 138], bands [bvar 146, bvar 151], bands [bvar 159, bvar 164], bands [bvar 172, bvar 177], bands [bvar 185, bvar 190]] 2,
    atMost [bands [bvar 29, bvar 35], bands [bvar 42, bvar 48], bands [bvar 55, bvar 61], bands [bvar 68, bvar 74], bands [bvar 81, bvar 87], bands [bvar 94, bvar 100], bands [bvar 107, bvar 113], bands [bvar 120, bvar 126], bands [bvar 133, bvar 139], bands [bvar 146, bvar 152], bands [bvar 159, bvar 165], bands [bvar 172, bvar 178], bands [bvar 185, bvar 191]] 2,
    atMost [bands [bvar 29, bvar 36], bands [bvar 42, bvar 49], bands [bvar 55, bvar 62], bands [bvar 68, bvar 75], bands [bvar 81, bvar 88], bands [bvar 94, bvar 101], bands [bvar 107, bvar 114], bands [bvar 120, bvar 127], bands [bvar 133, bvar 140], bands [bvar 146, bvar 153], bands [bvar 159, bvar 166], bands [bvar 172, bvar 179], bands [bvar 185, bvar 192]] 2,
    atMost [bands [bvar 29, bvar 37], bands [bvar 42, bvar 50], bands [bvar 55, bvar 63], bands [bvar 68, bvar 76], bands [bvar 81, bvar 89], bands [bvar 94, bvar 102], bands [bvar 107, bvar 115], bands [bvar 120, bvar 128], bands [bvar 133, bvar 141], bands [bvar 146, bvar 154], bands [bvar 159, bvar 167], bands [bvar 172, bvar 180], bands [bvar 185, bvar 193]] 2,
    atMost [bands [bvar 29, bvar 38], bands [bvar 42, bvar 51], bands [bvar 55, bvar 64], bands [bvar 68, bvar 77], bands [bvar 81, bvar 90], bands [bvar 94, bvar 103], bands [bvar 107, bvar 116], bands [bvar 120, bvar 129], bands [bvar 133, bvar 142], bands [bvar 146, bvar 155], bands [bvar 159, bvar 168], bands [bvar 172, bvar 181], bands [bvar 185, bvar 194]] 2,
    atMost [bands [bvar 29, bvar 39], bands [bvar 42, bvar 52], bands [bvar 55, bvar 65], bands [bvar 68, bvar 78], bands [bvar 81, bvar 91], bands [bvar 94, bvar 104], bands [bvar 107, bvar 117], bands [bvar 120, bvar 130], bands [bvar 133, bvar 143], bands [bvar 146, bvar 156], bands [bvar 159, bvar 169], bands [bvar 172, bvar 182], bands [bvar 185, bvar 195]] 2,
    atMost [bands [bvar 31, bvar 35], bands [bvar 44, bvar 48], bands [bvar 57, bvar 61], bands [bvar 70, bvar 74], bands [bvar 83, bvar 87], bands [bvar 96, bvar 100], bands [bvar 109, bvar 113], bands [bvar 122, bvar 126], bands [bvar 135, bvar 139], bands [bvar 148, bvar 152], bands [bvar 161, bvar 165], bands [bvar 174, bvar 178], bands [bvar 187, bvar 191]] 2,
    atMost [bands [bvar 31, bvar 39], bands [bvar 44, bvar 52], bands [bvar 57, bvar 65], bands [bvar 70, bvar 78], bands [bvar 83, bvar 91], bands [bvar 96, bvar 104], bands [bvar 109, bvar 117], bands [bvar 122, bvar 130], bands [bvar 135, bvar 143], bands [bvar 148, bvar 156], bands [bvar 161, bvar 169], bands [bvar 174, bvar 182], bands [bvar 187, bvar 195]] 2,
    atMost [bands [bvar 34, bvar 38], bands [bvar 47, bvar 51], bands [bvar 60, bvar 64], bands [bvar 73, bvar 77], bands [bvar 86, bvar 90], bands [bvar 99, bvar 103], bands [bvar 112, bvar 116], bands [bvar 125, bvar 129], bands [bvar 138, bvar 142], bands [bvar 151, bvar 155], bands [bvar 164, bvar 168], bands [bvar 177, bvar 181], bands [bvar 190, bvar 194]] 2,
    bnot (bands [bvar 31, bvar 33, bvar 57, bvar 59]),
    bnot (bands [bvar 31, bvar 34, bvar 57, bvar 60]),
    bnot (bands [bvar 31, bvar 35, bvar 57, bvar 61]),
    bnot (bands [bvar 31, bvar 36, bvar 57, bvar 62]),
    bnot (bands [bvar 31, bvar 37, bvar 57, bvar 63]),
    bnot (bands [bvar 31, bvar 38, bvar 57, bvar 64]) ]

def reducedUnionChunk022 : BVLogicalExpr :=
  bands reducedUnionChunk022Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror
