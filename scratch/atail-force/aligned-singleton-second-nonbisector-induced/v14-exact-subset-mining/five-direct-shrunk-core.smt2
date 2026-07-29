(set-logic QF_NRA)
; benchmark generated from python API
(set-info :status unknown)
(declare-fun x_0 () Real)
(declare-fun y_0 () Real)
(declare-fun y_1 () Real)
(declare-fun x_1 () Real)
(declare-fun y_2 () Real)
(declare-fun x_2 () Real)
(declare-fun x_3 () Real)
(declare-fun y_3 () Real)
(declare-fun y_4 () Real)
(declare-fun x_4 () Real)
(assert
 (= x_0 0.0))
(assert
 (= y_0 0.0))
(assert
 (= y_1 0.0))
(assert
 (= x_1 1.0))
(assert
 (let ((?x47 (- (* (- x_2 x_1) (- y_0 y_1)) (* (- y_2 y_1) (- x_0 x_1)))))
 (> ?x47 0.0)))
(assert
 (let ((?x99 (- (* (- x_4 x_3) (- y_2 y_3)) (* (- y_4 y_3) (- x_2 x_3)))))
 (> ?x99 0.0)))
(assert
 (let ((?x113 (- (* (- x_0 x_4) (- y_2 y_4)) (* (- y_0 y_4) (- x_2 x_4)))))
 (> ?x113 0.0)))
(assert
 (let ((?x119 (- (* (- x_0 x_4) (- y_3 y_4)) (* (- y_0 y_4) (- x_3 x_4)))))
 (> ?x119 0.0)))
(assert
 (let ((?x139 (+ (* (- x_1 x_2) (- x_1 x_2)) (* (- y_1 y_2) (- y_1 y_2)))))
 (let ((?x123 (+ (* (- x_0 x_1) (- x_0 x_1)) (* (- y_0 y_1) (- y_0 y_1)))))
 (= ?x123 ?x139))))
(assert
 (let ((?x135 (+ (* (- x_0 x_4) (- x_0 x_4)) (* (- y_0 y_4) (- y_0 y_4)))))
 (let ((?x131 (+ (* (- x_0 x_3) (- x_0 x_3)) (* (- y_0 y_3) (- y_0 y_3)))))
 (= ?x131 ?x135))))
(assert
 (let ((?x147 (+ (* (- x_1 x_4) (- x_1 x_4)) (* (- y_1 y_4) (- y_1 y_4)))))
(let ((?x139 (+ (* (- x_1 x_2) (- x_1 x_2)) (* (- y_1 y_2) (- y_1 y_2)))))
(= ?x139 ?x147))))
(check-sat)
