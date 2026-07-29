(set-logic QF_NRA)
; benchmark generated from python API
(set-info :status unknown)
(declare-fun x_0 () Real)
(declare-fun y_0 () Real)
(declare-fun x_1 () Real)
(declare-fun y_1 () Real)
(declare-fun y_2 () Real)
(declare-fun x_2 () Real)
(declare-fun x_4 () Real)
(declare-fun y_3 () Real)
(declare-fun y_4 () Real)
(declare-fun x_3 () Real)
(assert
 (= x_0 0.0))
(assert
 (= y_0 0.0))
(assert
 (= x_1 1.0))
(assert
 (= y_1 0.0))
(assert
 (let ((?x39 (- (* (- x_2 x_1) (- y_0 y_1)) (* (- y_2 y_1) (- x_0 x_1)))))
 (> ?x39 0.0)))
(assert
 (let ((?x267 (- (* (- x_3 x_2) (- y_4 y_2)) (* (- y_3 y_2) (- x_4 x_2)))))
 (> ?x267 0.0)))
(assert
 (let ((?x590 (- (* (- x_0 x_4) (- y_1 y_4)) (* (- y_0 y_4) (- x_1 x_4)))))
 (> ?x590 0.0)))
(assert
 (let ((?x472 (- (* (- x_0 x_4) (- y_2 y_4)) (* (- y_0 y_4) (- x_2 x_4)))))
 (> ?x472 0.0)))
(assert
 (let ((?x97 (+ (* (- x_2 x_3) (- x_2 x_3)) (* (- y_2 y_3) (- y_2 y_3)))))
 (let ((?x85 (+ (* (- x_0 x_3) (- x_0 x_3)) (* (- y_0 y_3) (- y_0 y_3)))))
 (= ?x85 ?x97))))
(assert
 (let ((?x107 (+ (* (- x_1 x_4) (- x_1 x_4)) (* (- y_1 y_4) (- y_1 y_4)))))
 (let ((?x518 (+ (* (- x_0 x_4) (- x_0 x_4)) (* (- y_0 y_4) (- y_0 y_4)))))
 (= ?x518 ?x107))))
(assert
 (let ((?x598 (+ (* (- x_3 x_4) (- x_3 x_4)) (* (- y_3 y_4) (- y_3 y_4)))))
(let ((?x97 (+ (* (- x_2 x_3) (- x_2 x_3)) (* (- y_2 y_3) (- y_2 y_3)))))
(= ?x97 ?x598))))
(check-sat)
