(set-logic QF_NRA)
; benchmark generated from python API
(set-info :status unknown)
(declare-fun v1y () Real)
(declare-fun oy () Real)
(declare-fun v1x () Real)
(declare-fun R2 () Real)
(declare-fun xy () Real)
(declare-fun xx () Real)
(declare-fun rho2 () Real)
(declare-fun y1y () Real)
(declare-fun y1x () Real)
(declare-fun y2y () Real)
(declare-fun y2x () Real)
(declare-fun b1y () Real)
(declare-fun b1x () Real)
(assert
 (let ((?x201 (* (- 1.0) v1x)))
 (let ((?x115 (* (- 1.0) R2)))
 (let ((?x479 (+ (+ (+ (+ (/ 1.0 4.0) (* oy oy)) (* v1x v1x)) (* v1y v1y)) ?x115)))
 (= (+ (+ ?x479 ?x201) (* (* (- 2.0) oy) v1y)) 0.0)))))
(assert
 (= (+ (+ (/ 1.0 4.0) (* oy oy)) (* (- 1.0) R2)) 0.0))
(assert
 (let ((?x361 (* (- 1.0) rho2)))
 (let ((?x25 (* xy xy)))
 (let ((?x65 (+ (+ (+ (+ (* v1x v1x) (* v1y v1y)) (* xx xx)) ?x25) ?x361)))
 (= (+ (+ ?x65 (* (* (- 2.0) v1x) xx)) (* (* (- 2.0) v1y) xy)) 0.0)))))
(assert
 (let ((?x361 (* (- 1.0) rho2)))
 (let ((?x106 (* y1y y1y)))
 (let ((?x271 (+ (+ (+ (+ (* xx xx) (* xy xy)) (* y1x y1x)) ?x106) ?x361)))
 (= (+ (+ ?x271 (* (* (- 2.0) xx) y1x)) (* (* (- 2.0) xy) y1y)) 0.0)))))
(assert
 (let ((?x361 (* (- 1.0) rho2)))
 (let ((?x200 (* y2y y2y)))
 (let ((?x779 (+ (+ (+ (+ (* xx xx) (* xy xy)) (* y2x y2x)) ?x200) ?x361)))
 (= (+ (+ ?x779 (* (* (- 2.0) xx) y2x)) (* (* (- 2.0) xy) y2y)) 0.0)))))
(assert
 (let ((?x361 (* (- 1.0) rho2)))
 (let ((?x25 (* xy xy)))
 (let ((?x446 (+ (+ (+ (+ (* b1x b1x) (* b1y b1y)) (* xx xx)) ?x25) ?x361)))
 (= (+ (+ ?x446 (* (* (- 2.0) b1x) xx)) (* (* (- 2.0) b1y) xy)) 0.0)))))
(assert
 (let ((?x414 (+ (+ (+ (+ (- (/ 1.0 4.0)) R2) xx) (* (- 1.0) (* oy oy))) (* (- 1.0) (* xx xx)))))
 (>= (+ (+ ?x414 (* (- 1.0) (* xy xy))) (* (* 2.0 oy) xy)) 0.0)))
(assert
 (let ((?x20 (+ (+ (+ (+ (- (/ 1.0 4.0)) R2) y1x) (* (- 1.0) (* oy oy))) (* (- 1.0) (* y1x y1x)))))
 (>= (+ (+ ?x20 (* (- 1.0) (* y1y y1y))) (* (* 2.0 oy) y1y)) 0.0)))
(assert
 (let ((?x473 (+ (+ (+ (+ (- (/ 1.0 4.0)) R2) y2x) (* (- 1.0) (* oy oy))) (* (- 1.0) (* y2x y2x)))))
 (>= (+ (+ ?x473 (* (- 1.0) (* y2y y2y))) (* (* 2.0 oy) y2y)) 0.0)))
(assert
 (let ((?x213 (* oy oy)))
 (let ((?x394 (* (- 1.0) ?x213)))
 (let ((?x405 (+ (+ (+ (+ (- (/ 1.0 4.0)) R2) b1x) (* (- 1.0) (* b1x b1x))) (* (- 1.0) (* b1y b1y)))))
 (>= (+ (+ ?x405 ?x394) (* (* 2.0 b1y) oy)) 0.0)))))
(assert
 (>= (+ (+ (* v1x v1x) (* v1y v1y)) (* (- 1.0) v1x)) 0.0))
(assert
 (>= v1x 0.0))
(assert
 (>= (+ 1.0 (* (- 1.0) v1x)) 0.0))
(assert
 (> R2 0.0))
(assert
 (> rho2 0.0))
(assert
 (let ((?x195 (* (- 1.0) v1y)))
 (let ((?x34 (* ?x195 xy)))
 (> ?x34 0.0))))
(assert
 (let ((?x40 (+ (+ (* v1y v1y) (* (* (- 1.0) v1y) xy)) (* (* (- 1.0) xx) (* v1y v1y)))))
 (> (+ ?x40 (* (* v1x v1y) xy)) 0.0)))
(assert
 (> (+ (* xx (* v1y v1y)) (* (* (* (- 1.0) v1x) v1y) xy)) 0.0))
(assert
 (let ((?x195 (* (- 1.0) v1y)))
 (let ((?x399 (* ?x195 y1y)))
 (> ?x399 0.0))))
(assert
 (let ((?x169 (+ (+ (* v1y v1y) (* (* (- 1.0) v1y) y1y)) (* (* (- 1.0) y1x) (* v1y v1y)))))
 (> (+ ?x169 (* (* v1x v1y) y1y)) 0.0)))
(assert
 (> (+ (* y1x (* v1y v1y)) (* (* (* (- 1.0) v1x) v1y) y1y)) 0.0))
(assert
 (let ((?x195 (* (- 1.0) v1y)))
 (let ((?x174 (* ?x195 y2y)))
 (> ?x174 0.0))))
(assert
 (let ((?x120 (+ (+ (* v1y v1y) (* (* (- 1.0) v1y) y2y)) (* (* (- 1.0) y2x) (* v1y v1y)))))
 (> (+ ?x120 (* (* v1x v1y) y2y)) 0.0)))
(assert
 (> (+ (* y2x (* v1y v1y)) (* (* (* (- 1.0) v1x) v1y) y2y)) 0.0))
(assert
 (> (* b1y v1y) 0.0))
(assert
 (let ((?x278 (* b1y v1x)))
 (let ((?x255 (* ?x278 v1y)))
 (let ((?x168 (+ (+ (* v1y v1y) (* (* (- 1.0) b1x) (* v1y v1y))) (* (* (- 1.0) b1y) v1y))))
 (> (+ ?x168 ?x255) 0.0)))))
(assert
 (> (+ (* (* (- 1.0) b1x) (* v1y v1y)) (* (* b1y v1x) v1y)) 0.0))
(assert
 (> (+ (* xy y1x) (* (* (- 1.0) xx) y1y)) 0.0))
(assert
 (> (+ (* y1x y2y) (* (* (- 1.0) y1y) y2x)) 0.0))
(assert
 (let ((?x1014 (* (- 1.0) y1y)))
 (> ?x1014 0.0)))
(assert
 (> (+ (* v1y y1x) (* (* (- 1.0) v1x) y1y)) 0.0))
(assert
 (> (+ (* b1y y1x) (* (* (- 1.0) b1x) y1y)) 0.0))
(assert
 (> (+ (* xx y2y) (* (* (- 1.0) xy) y2x)) 0.0))
(assert
 (let ((?x221 (* (- 1.0) xy)))
 (> ?x221 0.0)))
(assert
 (> (+ (* v1y xx) (* (* (- 1.0) v1x) xy)) 0.0))
(assert
 (> (+ (* b1y xx) (* (* (- 1.0) b1x) xy)) 0.0))
(assert
 (let ((?x186 (* (- 1.0) y2y)))
 (> ?x186 0.0)))
(assert
 (> (+ (* v1y y2x) (* (* (- 1.0) v1x) y2y)) 0.0))
(assert
 (> (+ (* b1y y2x) (* (* (- 1.0) b1x) y2y)) 0.0))
(assert
 (> v1y 0.0))
(assert
 (> b1y 0.0))
(assert
 (> (+ (* b1y v1x) (* (* (- 1.0) b1x) v1y)) 0.0))
(assert
 (let ((?x221 (* (- 1.0) xy)))
 (let ((?x386 (* ?x221 y2x)))
 (let ((?x389 (* (- 1.0) xx)))
 (let ((?x451 (* ?x389 y1y)))
 (let ((?x392 (+ (+ (+ (+ (* xx y2y) (* xy y1x)) (* y1y y2x)) ?x451) ?x386)))
 (> (+ ?x392 (* (* (- 1.0) y1x) y2y)) 0.0)))))))
(assert
 (let ((?x389 (* (- 1.0) xx)))
 (let ((?x451 (* ?x389 y1y)))
 (> (+ (+ (+ y1y (* (- 1.0) xy)) (* xy y1x)) ?x451) 0.0))))
(assert
 (let ((?x389 (* (- 1.0) xx)))
 (let ((?x451 (* ?x389 y1y)))
 (let ((?x195 (* (- 1.0) v1y)))
 (let ((?x269 (* ?x195 y1x)))
 (let ((?x201 (* (- 1.0) v1x)))
 (let ((?x329 (* ?x201 xy)))
 (let ((?x272 (+ (+ (+ (+ (* v1x y1y) (* v1y xx)) (* xy y1x)) ?x329) ?x269)))
 (> (+ ?x272 ?x451) 0.0)))))))))
(assert
 (let ((?x389 (* (- 1.0) xx)))
 (let ((?x451 (* ?x389 y1y)))
 (let ((?x412 (* (- 1.0) b1y)))
 (let ((?x256 (* ?x412 y1x)))
 (let ((?x340 (* (- 1.0) b1x)))
 (let ((?x380 (* ?x340 xy)))
 (let ((?x166 (+ (+ (+ (+ (* b1x y1y) (* b1y xx)) (* xy y1x)) ?x380) ?x256)))
 (> (+ ?x166 ?x451) 0.0)))))))))
(assert
 (let ((?x1014 (* (- 1.0) y1y)))
 (let ((?x122 (* ?x1014 y2x)))
 (> (+ (+ (+ y1y (* (- 1.0) y2y)) (* y1x y2y)) ?x122) 0.0))))
(assert
 (let ((?x1014 (* (- 1.0) y1y)))
 (let ((?x122 (* ?x1014 y2x)))
 (let ((?x195 (* (- 1.0) v1y)))
 (let ((?x269 (* ?x195 y1x)))
 (let ((?x201 (* (- 1.0) v1x)))
 (let ((?x478 (* ?x201 y2y)))
 (let ((?x301 (+ (+ (+ (+ (* v1x y1y) (* v1y y2x)) (* y1x y2y)) ?x478) ?x269)))
 (> (+ ?x301 ?x122) 0.0)))))))))
(assert
 (let ((?x1014 (* (- 1.0) y1y)))
 (let ((?x122 (* ?x1014 y2x)))
 (let ((?x412 (* (- 1.0) b1y)))
 (let ((?x256 (* ?x412 y1x)))
 (let ((?x340 (* (- 1.0) b1x)))
 (let ((?x571 (* ?x340 y2y)))
 (let ((?x917 (+ (+ (+ (+ (* b1x y1y) (* b1y y2x)) (* y1x y2y)) ?x571) ?x256)))
 (> (+ ?x917 ?x122) 0.0)))))))))
(assert
 (let ((?x195 (* (- 1.0) v1y)))
 (let ((?x269 (* ?x195 y1x)))
 (> (+ (+ (+ v1y (* (- 1.0) y1y)) (* v1x y1y)) ?x269) 0.0))))
(assert
 (let ((?x412 (* (- 1.0) b1y)))
 (let ((?x256 (* ?x412 y1x)))
 (> (+ (+ (+ b1y (* (- 1.0) y1y)) (* b1x y1y)) ?x256) 0.0))))
(assert
 (let ((?x201 (* (- 1.0) v1x)))
 (let ((?x365 (* ?x201 y1y)))
 (let ((?x412 (* (- 1.0) b1y)))
 (let ((?x256 (* ?x412 y1x)))
 (let ((?x340 (* (- 1.0) b1x)))
 (let ((?x283 (* ?x340 v1y)))
 (let ((?x488 (+ (+ (+ (+ (* b1x y1y) (* b1y v1x)) (* v1y y1x)) ?x283) ?x256)))
 (> (+ ?x488 ?x365) 0.0)))))))))
(assert
 (let ((?x221 (* (- 1.0) xy)))
 (let ((?x386 (* ?x221 y2x)))
 (> (+ (+ (+ xy (* (- 1.0) y2y)) (* xx y2y)) ?x386) 0.0))))
(assert
 (let ((?x221 (* (- 1.0) xy)))
 (let ((?x386 (* ?x221 y2x)))
 (let ((?x195 (* (- 1.0) v1y)))
 (let ((?x376 (* ?x195 xx)))
 (let ((?x201 (* (- 1.0) v1x)))
 (let ((?x478 (* ?x201 y2y)))
 (let ((?x459 (+ (+ (+ (+ (* v1x xy) (* v1y y2x)) (* xx y2y)) ?x478) ?x376)))
 (> (+ ?x459 ?x386) 0.0)))))))))
(assert
 (let ((?x221 (* (- 1.0) xy)))
 (let ((?x386 (* ?x221 y2x)))
 (let ((?x412 (* (- 1.0) b1y)))
 (let ((?x265 (* ?x412 xx)))
 (let ((?x340 (* (- 1.0) b1x)))
 (let ((?x571 (* ?x340 y2y)))
 (let ((?x323 (+ (+ (+ (+ (* b1x xy) (* b1y y2x)) (* xx y2y)) ?x571) ?x265)))
 (> (+ ?x323 ?x386) 0.0)))))))))
(assert
 (let ((?x195 (* (- 1.0) v1y)))
 (let ((?x376 (* ?x195 xx)))
 (> (+ (+ (+ v1y (* (- 1.0) xy)) (* v1x xy)) ?x376) 0.0))))
(assert
 (let ((?x412 (* (- 1.0) b1y)))
 (let ((?x265 (* ?x412 xx)))
 (> (+ (+ (+ b1y (* (- 1.0) xy)) (* b1x xy)) ?x265) 0.0))))
(assert
 (let ((?x201 (* (- 1.0) v1x)))
 (let ((?x329 (* ?x201 xy)))
 (let ((?x412 (* (- 1.0) b1y)))
 (let ((?x265 (* ?x412 xx)))
 (let ((?x340 (* (- 1.0) b1x)))
 (let ((?x283 (* ?x340 v1y)))
 (let ((?x483 (+ (+ (+ (+ (* b1x xy) (* b1y v1x)) (* v1y xx)) ?x283) ?x265)))
 (> (+ ?x483 ?x329) 0.0)))))))))
(assert
 (let ((?x457 (+ (+ (+ v1y (* (- 1.0) y2y)) (* v1x y2y)) (* (* (- 1.0) v1y) y2x))))
 (> ?x457 0.0)))
(assert
 (let ((?x412 (* (- 1.0) b1y)))
 (let ((?x291 (* ?x412 y2x)))
 (> (+ (+ (+ b1y (* (- 1.0) y2y)) (* b1x y2y)) ?x291) 0.0))))
(assert
 (let ((?x201 (* (- 1.0) v1x)))
 (let ((?x478 (* ?x201 y2y)))
 (let ((?x412 (* (- 1.0) b1y)))
 (let ((?x291 (* ?x412 y2x)))
 (let ((?x340 (* (- 1.0) b1x)))
 (let ((?x283 (* ?x340 v1y)))
 (let ((?x415 (+ (+ (+ (+ (* b1x y2y) (* b1y v1x)) (* v1y y2x)) ?x283) ?x291)))
 (> (+ ?x415 ?x478) 0.0)))))))))
(assert
 (let ((?x340 (* (- 1.0) b1x)))
(let ((?x283 (* ?x340 v1y)))
(> (+ (+ (+ v1y (* (- 1.0) b1y)) (* b1y v1x)) ?x283) 0.0))))
(check-sat)
