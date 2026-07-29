(set-logic QF_NRA)
; benchmark generated from python API
(set-info :status unknown)
(declare-fun x_0 () Real)
(declare-fun y_0 () Real)
(declare-fun x_1 () Real)
(declare-fun y_1 () Real)
(declare-fun x_2 () Real)
(declare-fun y_2 () Real)
(declare-fun x_3 () Real)
(declare-fun y_3 () Real)
(assert
 (= x_0 0.0))
(assert
 (= y_0 0.0))
(assert
 (= x_1 1.0))
(assert
 (= y_1 0.0))
(assert
 (let ((?x25 (- (* (- x_1 x_0) (- y_2 y_0)) (* (- y_1 y_0) (- x_2 x_0)))))
 (> ?x25 0.0)))
(assert
 (let ((?x31 (- (* (- x_1 x_0) (- y_3 y_0)) (* (- y_1 y_0) (- x_3 x_0)))))
 (> ?x31 0.0)))
(assert
 (let ((?x45 (- (* (- x_2 x_1) (- y_3 y_1)) (* (- y_2 y_1) (- x_3 x_1)))))
 (> ?x45 0.0)))
(assert
 (let ((?x93 (+ (* (- x_1 x_3) (- x_1 x_3)) (* (- y_1 y_3) (- y_1 y_3)))))
 (let ((?x77 (+ (* (- x_0 x_1) (- x_0 x_1)) (* (- y_0 y_1) (- y_0 y_1)))))
 (= ?x77 ?x93))))
(assert
 (let ((?x97 (+ (* (- x_2 x_3) (- x_2 x_3)) (* (- y_2 y_3) (- y_2 y_3)))))
(let ((?x81 (+ (* (- x_0 x_2) (- x_0 x_2)) (* (- y_0 y_2) (- y_0 y_2)))))
(= ?x81 ?x97))))
(check-sat)
