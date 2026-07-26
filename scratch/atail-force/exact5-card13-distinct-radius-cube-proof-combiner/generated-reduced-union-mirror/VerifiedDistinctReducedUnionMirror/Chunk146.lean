import VerifiedDistinctReducedUnionMirror.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk146Assertions : List BVLogicalExpr :=
  [ bnot (bands [bvar 1106, bvar 12]),
    exactly [bvar 1103, bvar 1104, bvar 1105, bvar 1106] 2,
    exactly [bvar 9, bvar 10, bvar 11, bvar 12] 2,
    bors [bvar 1103, bvar 9],
    bors [bvar 1104, bvar 10],
    bors [bvar 1105, bvar 11],
    bors [bvar 1106, bvar 12],
    bnot (bands [bvar 1632, bvar 1638, bvar 1047, bvar 1053]),
    bnot (bands [bvar 1633, bvar 1637, bvar 1048, bvar 1052]),
    bnot (bands [bvar 1634, bvar 1637, bvar 1049, bvar 1052]),
    bnot (bands [bvar 1632, bvar 1636, bvar 33, bvar 37]),
    bnot (bands [bvar 1632, bvar 1637, bvar 33, bvar 38]),
    bnot (bands [bvar 1632, bvar 1638, bvar 33, bvar 39]),
    bnot (bands [bvar 1632, bvar 1639, bvar 33, bvar 40]),
    bnot (bands [bvar 1633, bvar 1638, bvar 34, bvar 39]),
    bnot (bands [bvar 1634, bvar 1636, bvar 35, bvar 37]),
    bnot (bands [bvar 1634, bvar 1637, bvar 35, bvar 38]),
    bnot (bands [bvar 1634, bvar 1638, bvar 35, bvar 39]),
    bnot (bands [bvar 1634, bvar 1639, bvar 35, bvar 40]),
    bnot (bands [bvar 1632, bvar 1639, bvar 540, bvar 547]),
    bnot (bands [bvar 1633, bvar 1639, bvar 541, bvar 547]),
    bnot (bands [bvar 1628, bvar 1634, bvar 562, bvar 568]),
    bnot (bands [bvar 1628, bvar 1636, bvar 562, bvar 570]),
    bnot (bands [bvar 1633, bvar 1636, bvar 567, bvar 570]),
    bnot (bands [bvar 1627, bvar 1634, bvar 600, bvar 607]),
    bnot (bands [bvar 1627, bvar 1637, bvar 600, bvar 610]),
    bnot (bands [bvar 1630, bvar 1636, bvar 603, bvar 609]),
    bnot (bands [bvar 1630, bvar 1637, bvar 603, bvar 610]),
    bnot (bands [bvar 1630, bvar 1639, bvar 603, bvar 612]),
    bnot (bands [bvar 1634, bvar 1636, bvar 607, bvar 609]),
    bnot (bands [bvar 1634, bvar 1637, bvar 607, bvar 610]),
    bnot (bands [bvar 1634, bvar 1638, bvar 607, bvar 611]),
    bnot (bands [bvar 1634, bvar 1639, bvar 607, bvar 612]),
    bnot (bands [bvar 1635, bvar 1637, bvar 608, bvar 610]),
    bnot (bands [bvar 1635, bvar 1638, bvar 608, bvar 611]),
    bnot (bands [bvar 1636, bvar 1637, bvar 609, bvar 610]),
    bnot (bands [bvar 1636, bvar 1639, bvar 609, bvar 612]),
    bnot (bands [bvar 1637, bvar 1639, bvar 610, bvar 612]),
    bnot (bands [bvar 1638, bvar 1639, bvar 611, bvar 612]),
    bnot (bands [bvar 1634, bvar 1637, bvar 620, bvar 623]),
    bnot (bands [bvar 1627, bvar 1638, bvar 132, bvar 143]),
    bnot (bands [bvar 1630, bvar 1636, bvar 135, bvar 141]),
    bnot (bands [bvar 1630, bvar 1637, bvar 135, bvar 142]),
    bnot (bands [bvar 1630, bvar 1638, bvar 135, bvar 143]),
    bnot (bands [bvar 1630, bvar 1639, bvar 135, bvar 144]),
    bnot (bands [bvar 1636, bvar 1638, bvar 141, bvar 143]),
    bnot (bands [bvar 1627, bvar 1628, bvar 639, bvar 640]),
    bnot (bands [bvar 1637, bvar 1638, bvar 155, bvar 156]),
    bnot (bands [bvar 1637, bvar 1639, bvar 155, bvar 157]),
    bnot (bands [bvar 1628, bvar 1639, bvar 159, bvar 170]),
    bnot (bands [bvar 1628, bvar 1639, bvar 172, bvar 183]),
    bnot (bands [bvar 1633, bvar 1636, bvar 177, bvar 180]),
    bnot (bands [bvar 1635, bvar 1636, bvar 179, bvar 180]),
    bnot (bands [bvar 1641, bvar 1642, bvar 1160, bvar 1161]),
    bnot (bands [bvar 1641, bvar 1643, bvar 1160, bvar 1162]),
    bnot (bands [bvar 1642, bvar 1643, bvar 1161, bvar 1162]),
    atMost [bors [bands [bvar 1042, bvar 1044], bands [bvar 28, bvar 30], bands [bvar 535, bvar 537]], bors [bands [bvar 1055, bvar 1057], bands [bvar 41, bvar 43], bands [bvar 548, bvar 550]], bors [bands [bvar 1068, bvar 1070], bands [bvar 54, bvar 56], bands [bvar 561, bvar 563]], bors [bands [bvar 1081, bvar 1083], bands [bvar 67, bvar 69], bands [bvar 574, bvar 576]], bors [bands [bvar 1094, bvar 1096], bands [bvar 80, bvar 82], bands [bvar 587, bvar 589], bands [bvar 0, bvar 2], bands [bvar 1627, bvar 1629]], bors [bands [bvar 1107, bvar 1109], bands [bvar 93, bvar 95], bands [bvar 600, bvar 602]], bors [bands [bvar 1120, bvar 1122], bands [bvar 106, bvar 108], bands [bvar 613, bvar 615]], bors [bands [bvar 1133, bvar 1135], bands [bvar 119, bvar 121], bands [bvar 626, bvar 628]], bors [bands [bvar 1146, bvar 1148], bands [bvar 132, bvar 134], bands [bvar 639, bvar 641], bands [bvar 1640, bvar 1642]], bors [bands [bvar 1159, bvar 1161], bands [bvar 145, bvar 147], bands [bvar 652, bvar 654]], bors [bands [bvar 1172, bvar 1174], bands [bvar 158, bvar 160], bands [bvar 665, bvar 667]], bors [bands [bvar 1185, bvar 1187], bands [bvar 171, bvar 173], bands [bvar 678, bvar 680]], bors [bands [bvar 1198, bvar 1200], bands [bvar 184, bvar 186], bands [bvar 691, bvar 693]]] 2,
    atMost [bors [bands [bvar 1042, bvar 1045], bands [bvar 28, bvar 31], bands [bvar 535, bvar 538]], bors [bands [bvar 1055, bvar 1058], bands [bvar 41, bvar 44], bands [bvar 548, bvar 551]], bors [bands [bvar 1068, bvar 1071], bands [bvar 54, bvar 57], bands [bvar 561, bvar 564]], bors [bands [bvar 1081, bvar 1084], bands [bvar 67, bvar 70], bands [bvar 574, bvar 577]], bors [bands [bvar 1094, bvar 1097], bands [bvar 80, bvar 83], bands [bvar 587, bvar 590], bands [bvar 0, bvar 3], bands [bvar 1627, bvar 1630]], bors [bands [bvar 1107, bvar 1110], bands [bvar 93, bvar 96], bands [bvar 600, bvar 603]], bors [bands [bvar 1120, bvar 1123], bands [bvar 106, bvar 109], bands [bvar 613, bvar 616]], bors [bands [bvar 1133, bvar 1136], bands [bvar 119, bvar 122], bands [bvar 626, bvar 629]], bors [bands [bvar 1146, bvar 1149], bands [bvar 132, bvar 135], bands [bvar 639, bvar 642], bands [bvar 1640, bvar 1643]], bors [bands [bvar 1159, bvar 1162], bands [bvar 145, bvar 148], bands [bvar 652, bvar 655]], bors [bands [bvar 1172, bvar 1175], bands [bvar 158, bvar 161], bands [bvar 665, bvar 668]], bors [bands [bvar 1185, bvar 1188], bands [bvar 171, bvar 174], bands [bvar 678, bvar 681]], bors [bands [bvar 1198, bvar 1201], bands [bvar 184, bvar 187], bands [bvar 691, bvar 694]]] 2,
    atMost [bors [bands [bvar 1042, bvar 1046], bands [bvar 28, bvar 32], bands [bvar 535, bvar 539]], bors [bands [bvar 1055, bvar 1059], bands [bvar 41, bvar 45], bands [bvar 548, bvar 552]], bors [bands [bvar 1068, bvar 1072], bands [bvar 54, bvar 58], bands [bvar 561, bvar 565]], bors [bands [bvar 1081, bvar 1085], bands [bvar 67, bvar 71], bands [bvar 574, bvar 578]], bors [bands [bvar 1094, bvar 1098], bands [bvar 80, bvar 84], bands [bvar 587, bvar 591], bands [bvar 0, bvar 4], bands [bvar 1627, bvar 1631]], bors [bands [bvar 1107, bvar 1111], bands [bvar 93, bvar 97], bands [bvar 600, bvar 604]], bors [bands [bvar 1120, bvar 1124], bands [bvar 106, bvar 110], bands [bvar 613, bvar 617]], bors [bands [bvar 1133, bvar 1137], bands [bvar 119, bvar 123], bands [bvar 626, bvar 630]], bors [bands [bvar 1146, bvar 1150], bands [bvar 132, bvar 136], bands [bvar 639, bvar 643], bands [bvar 1640, bvar 1644]], bors [bands [bvar 1159, bvar 1163], bands [bvar 145, bvar 149], bands [bvar 652, bvar 656]], bors [bands [bvar 1172, bvar 1176], bands [bvar 158, bvar 162], bands [bvar 665, bvar 669]], bors [bands [bvar 1185, bvar 1189], bands [bvar 171, bvar 175], bands [bvar 678, bvar 682]], bors [bands [bvar 1198, bvar 1202], bands [bvar 184, bvar 188], bands [bvar 691, bvar 695]]] 2,
    atMost [bors [bands [bvar 1042, bvar 1047], bands [bvar 28, bvar 33], bands [bvar 535, bvar 540]], bors [bands [bvar 1055, bvar 1060], bands [bvar 41, bvar 46], bands [bvar 548, bvar 553]], bors [bands [bvar 1068, bvar 1073], bands [bvar 54, bvar 59], bands [bvar 561, bvar 566]], bors [bands [bvar 1081, bvar 1086], bands [bvar 67, bvar 72], bands [bvar 574, bvar 579]], bors [bands [bvar 1094, bvar 1099], bands [bvar 80, bvar 85], bands [bvar 587, bvar 592], bands [bvar 0, bvar 5], bands [bvar 1627, bvar 1632]], bors [bands [bvar 1107, bvar 1112], bands [bvar 93, bvar 98], bands [bvar 600, bvar 605]], bors [bands [bvar 1120, bvar 1125], bands [bvar 106, bvar 111], bands [bvar 613, bvar 618]], bors [bands [bvar 1133, bvar 1138], bands [bvar 119, bvar 124], bands [bvar 626, bvar 631]], bors [bands [bvar 1146, bvar 1151], bands [bvar 132, bvar 137], bands [bvar 639, bvar 644], bands [bvar 1640, bvar 1645]], bors [bands [bvar 1159, bvar 1164], bands [bvar 145, bvar 150], bands [bvar 652, bvar 657]], bors [bands [bvar 1172, bvar 1177], bands [bvar 158, bvar 163], bands [bvar 665, bvar 670]], bors [bands [bvar 1185, bvar 1190], bands [bvar 171, bvar 176], bands [bvar 678, bvar 683]], bors [bands [bvar 1198, bvar 1203], bands [bvar 184, bvar 189], bands [bvar 691, bvar 696]]] 2,
    atMost [bors [bands [bvar 1042, bvar 1048], bands [bvar 28, bvar 34], bands [bvar 535, bvar 541]], bors [bands [bvar 1055, bvar 1061], bands [bvar 41, bvar 47], bands [bvar 548, bvar 554]], bors [bands [bvar 1068, bvar 1074], bands [bvar 54, bvar 60], bands [bvar 561, bvar 567]], bors [bands [bvar 1081, bvar 1087], bands [bvar 67, bvar 73], bands [bvar 574, bvar 580]], bors [bands [bvar 1094, bvar 1100], bands [bvar 80, bvar 86], bands [bvar 587, bvar 593], bands [bvar 0, bvar 6], bands [bvar 1627, bvar 1633]], bors [bands [bvar 1107, bvar 1113], bands [bvar 93, bvar 99], bands [bvar 600, bvar 606]], bors [bands [bvar 1120, bvar 1126], bands [bvar 106, bvar 112], bands [bvar 613, bvar 619]], bors [bands [bvar 1133, bvar 1139], bands [bvar 119, bvar 125], bands [bvar 626, bvar 632]], bors [bands [bvar 1146, bvar 1152], bands [bvar 132, bvar 138], bands [bvar 639, bvar 645], bands [bvar 1640, bvar 1646]], bors [bands [bvar 1159, bvar 1165], bands [bvar 145, bvar 151], bands [bvar 652, bvar 658]], bors [bands [bvar 1172, bvar 1178], bands [bvar 158, bvar 164], bands [bvar 665, bvar 671]], bors [bands [bvar 1185, bvar 1191], bands [bvar 171, bvar 177], bands [bvar 678, bvar 684]], bors [bands [bvar 1198, bvar 1204], bands [bvar 184, bvar 190], bands [bvar 691, bvar 697]]] 2,
    atMost [bors [bands [bvar 1042, bvar 1049], bands [bvar 28, bvar 35], bands [bvar 535, bvar 542]], bors [bands [bvar 1055, bvar 1062], bands [bvar 41, bvar 48], bands [bvar 548, bvar 555]], bors [bands [bvar 1068, bvar 1075], bands [bvar 54, bvar 61], bands [bvar 561, bvar 568]], bors [bands [bvar 1081, bvar 1088], bands [bvar 67, bvar 74], bands [bvar 574, bvar 581]], bors [bands [bvar 1094, bvar 1101], bands [bvar 80, bvar 87], bands [bvar 587, bvar 594], bands [bvar 0, bvar 7], bands [bvar 1627, bvar 1634]], bors [bands [bvar 1107, bvar 1114], bands [bvar 93, bvar 100], bands [bvar 600, bvar 607]], bors [bands [bvar 1120, bvar 1127], bands [bvar 106, bvar 113], bands [bvar 613, bvar 620]], bors [bands [bvar 1133, bvar 1140], bands [bvar 119, bvar 126], bands [bvar 626, bvar 633]], bors [bands [bvar 1146, bvar 1153], bands [bvar 132, bvar 139], bands [bvar 639, bvar 646], bands [bvar 1640, bvar 1647]], bors [bands [bvar 1159, bvar 1166], bands [bvar 145, bvar 152], bands [bvar 652, bvar 659]], bors [bands [bvar 1172, bvar 1179], bands [bvar 158, bvar 165], bands [bvar 665, bvar 672]], bors [bands [bvar 1185, bvar 1192], bands [bvar 171, bvar 178], bands [bvar 678, bvar 685]], bors [bands [bvar 1198, bvar 1205], bands [bvar 184, bvar 191], bands [bvar 691, bvar 698]]] 2,
    atMost [bors [bands [bvar 1042, bvar 1050], bands [bvar 28, bvar 36], bands [bvar 535, bvar 543]], bors [bands [bvar 1055, bvar 1063], bands [bvar 41, bvar 49], bands [bvar 548, bvar 556]], bors [bands [bvar 1068, bvar 1076], bands [bvar 54, bvar 62], bands [bvar 561, bvar 569]], bors [bands [bvar 1081, bvar 1089], bands [bvar 67, bvar 75], bands [bvar 574, bvar 582]], bors [bands [bvar 1094, bvar 1102], bands [bvar 80, bvar 88], bands [bvar 587, bvar 595], bands [bvar 0, bvar 8], bands [bvar 1627, bvar 1635]], bors [bands [bvar 1107, bvar 1115], bands [bvar 93, bvar 101], bands [bvar 600, bvar 608]], bors [bands [bvar 1120, bvar 1128], bands [bvar 106, bvar 114], bands [bvar 613, bvar 621]], bors [bands [bvar 1133, bvar 1141], bands [bvar 119, bvar 127], bands [bvar 626, bvar 634]], bors [bands [bvar 1146, bvar 1154], bands [bvar 132, bvar 140], bands [bvar 639, bvar 647], bands [bvar 1640, bvar 1648]], bors [bands [bvar 1159, bvar 1167], bands [bvar 145, bvar 153], bands [bvar 652, bvar 660]], bors [bands [bvar 1172, bvar 1180], bands [bvar 158, bvar 166], bands [bvar 665, bvar 673]], bors [bands [bvar 1185, bvar 1193], bands [bvar 171, bvar 179], bands [bvar 678, bvar 686]], bors [bands [bvar 1198, bvar 1206], bands [bvar 184, bvar 192], bands [bvar 691, bvar 699]]] 2,
    atMost [bors [bands [bvar 1042, bvar 1051], bands [bvar 28, bvar 37], bands [bvar 535, bvar 544]], bors [bands [bvar 1055, bvar 1064], bands [bvar 41, bvar 50], bands [bvar 548, bvar 557]], bors [bands [bvar 1068, bvar 1077], bands [bvar 54, bvar 63], bands [bvar 561, bvar 570]], bors [bands [bvar 1081, bvar 1090], bands [bvar 67, bvar 76], bands [bvar 574, bvar 583]], bors [bands [bvar 1094, bvar 1103], bands [bvar 80, bvar 89], bands [bvar 587, bvar 596], bands [bvar 0, bvar 9], bands [bvar 1627, bvar 1636]], bors [bands [bvar 1107, bvar 1116], bands [bvar 93, bvar 102], bands [bvar 600, bvar 609]], bors [bands [bvar 1120, bvar 1129], bands [bvar 106, bvar 115], bands [bvar 613, bvar 622]], bors [bands [bvar 1133, bvar 1142], bands [bvar 119, bvar 128], bands [bvar 626, bvar 635]], bors [bands [bvar 1146, bvar 1155], bands [bvar 132, bvar 141], bands [bvar 639, bvar 648], bands [bvar 1640, bvar 1649]], bors [bands [bvar 1159, bvar 1168], bands [bvar 145, bvar 154], bands [bvar 652, bvar 661]], bors [bands [bvar 1172, bvar 1181], bands [bvar 158, bvar 167], bands [bvar 665, bvar 674]], bors [bands [bvar 1185, bvar 1194], bands [bvar 171, bvar 180], bands [bvar 678, bvar 687]], bors [bands [bvar 1198, bvar 1207], bands [bvar 184, bvar 193], bands [bvar 691, bvar 700]]] 2 ]

def reducedUnionChunk146 : BVLogicalExpr :=
  bands reducedUnionChunk146Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror
