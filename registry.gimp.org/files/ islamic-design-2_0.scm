(define (intersection2 l1 l2)
	(let* (
		(x1 (vector-ref l1 0))
		(y1 (vector-ref l1 1))
		(x2 (vector-ref l1 2))
		(y2 (vector-ref l1 3))
		(x3 (vector-ref l2 0))
		(y3 (vector-ref l2 1))
		(x4 (vector-ref l2 2))
		(y4 (vector-ref l2 3))
		(m1 0)
		(m2 0)
		(tmp1 0)
		(tmp2 0)
		(x 0)
		(y 0)
		(r (make-vector 2 'double))
		)
		
		(cond ((= x1 x2)
				(set! x x1)
				(set! m2 (/ (- y4 y3) (- x4 x3)))
				(set! y (+ (* m2 x) (- y3 (* m2 x3))))
			)
			((= x3 x4)
				(set! x x3)
				(set! m1 (/ (- y2 y1) (- x2 x1)))
				(set! y (+ (* m1 x) (- y1 (* m1 x1))))
			)
			((= 1 1)
				(set! m1 (/ (- y2 y1) (- x2 x1)))
				(set! m2 (/ (- y4 y3) (- x4 x3)))
				(set! tmp1 (- (- y3 (* m2 x3)) (- y1 (* m1 x1))))
				(set! tmp2 (- m1 m2))
				(set! x (/ tmp1 tmp2))
				(set! y (+ (* m1 x) (- y1 (* m1 x1))))
			)
		)
		;(draw-line image drawable x1 y1 x y)
		(vector-set! r 0 x)
        	(vector-set! r 1 y)
		r

	)

)
(define (point x y)
	(let* (
		(p (make-vector 2 'double))
		)
		(vector-set! p 0 x)
		(vector-set! p 1 y)
		p
	)
)
(define (draw-line2 drawable from to) 
  (let* (
          (points (make-vector 4 'double))
        )

        (vector-set! points 0 (vector-ref from 0))
        (vector-set! points 1 (vector-ref from 1))
        (vector-set! points 2 (vector-ref to 0))
        (vector-set! points 3 (vector-ref to 1))
	(gimp-paintbrush-default drawable 4 points)
        ;(gimp-pencil drawable 4 points)
	; Flush output
  	;(gimp-displays-flush)
  )
)
(define (islamic-design-2 image drawable width merg) 
	; start the undo group
	(gimp-undo-push-group-start image)
  (let* (
          (x1 0)
	  (y1 0)
	  (x2 0)
	  (y2 0)
	  (x3 0)
	  (y3 0)
	  (x4 0)
	  (y4 0)
	  (from (make-vector 2 'double))
	  (to (make-vector 2 'double))
	;
	  (l11 (make-vector 4 'double))
	  (l12 (make-vector 4 'double))
	  (l13 (make-vector 4 'double))
	  (l14 (make-vector 4 'double))
	  (l15 (make-vector 4 'double))
	  (l16 (make-vector 4 'double))
	;
	  (l21 (make-vector 4 'double))
	  (l22 (make-vector 4 'double))
	  (l23 (make-vector 4 'double))
	  (l24 (make-vector 4 'double))
	  (l25 (make-vector 4 'double))
	  (l26(make-vector 4 'double))
	;
	  (l31 (make-vector 4 'double))
	  (l32 (make-vector 4 'double))
	  (l33 (make-vector 4 'double))
	  (l34 (make-vector 4 'double))
	;
	  (l41 (make-vector 4 'double))
	  (l42 (make-vector 4 'double))
	  (l43 (make-vector 4 'double))
	  (l44 (make-vector 4 'double))
	  (l45 (make-vector 4 'double))
	  (l46 (make-vector 4 'double))
	  (l47 (make-vector 4 'double))
	  (l48 (make-vector 4 'double))
	;
	  (l51 (make-vector 4 'double))
	  (l52 (make-vector 4 'double))
	  (l53 (make-vector 4 'double))
	  (l54 (make-vector 4 'double))
	;
	  (l61 (make-vector 4 'double))
	  (l62 (make-vector 4 'double))
	  (l63 (make-vector 4 'double))
	  (l64 (make-vector 4 'double))
	;
	  (l71 (make-vector 4 'double))
	  (l72 (make-vector 4 'double))
	  (l73 (make-vector 4 'double))
	  (l74 (make-vector 4 'double))
	  (l75 (make-vector 4 'double))
	  (l76 (make-vector 4 'double))
	  (l77 (make-vector 4 'double))
	  (l78 (make-vector 4 'double))
	;
	  (l81 (make-vector 4 'double))
	  (l82 (make-vector 4 'double))
	  (l83 (make-vector 4 'double))
	  (l84 (make-vector 4 'double))
	  (l85 (make-vector 4 'double))
	  (l86 (make-vector 4 'double))
	  (l87 (make-vector 4 'double))
	  (l88 (make-vector 4 'double))
	;
	  (left (make-vector 4 'double))
	  (top (make-vector 4 'double))
	  (right (make-vector 4 'double))
	  (down (make-vector 4 'double))
	;
	  (radical2 1.414213562)
	  (radical3 1.732050808)
	  (z1 0.267949192) ;(3/(6+3*√3)
	  (z2 0.288675135) ;1÷(2√3)
	  (z3 0.366025404) ;1÷(1+√3)

	  (tmp1 0)
	  (tmp2 0)
	  (tmp3 0)
	  (tmp4 0)
	  (myl2 0)
        )
	;--------------------------------stage 1------------------
	;left
	(vector-set! left 0 0)
	(vector-set! left 1 0)
	(vector-set! left 2 0)
	(vector-set! left 3 width)
	;top
	(vector-set! top 0 0)
	(vector-set! top 1 0)
	(vector-set! top 2 width)
	(vector-set! top 3 0)
	;right
	(vector-set! right 0 width)
	(vector-set! right 1 0)
	(vector-set! right 2 width)
	(vector-set! right 3 width)
	;down
	(vector-set! down 0 0)
	(vector-set! down 1 width)
	(vector-set! down 2 width)
	(vector-set! down 3 width)
	;***********************************************************
	(set! tmp1 (* (/ (- 2 radical3) 4) width))
	(set! tmp2 (/ width 2))
	(set! tmp3 (/ width 4))
	;l11
	(vector-set! l11 0 tmp1)
	(vector-set! l11 1 tmp3)
	(vector-set! l11 2 tmp2)
	(vector-set! l11 3 0)
	;l12
	(vector-set! l12 0 tmp2)
	(vector-set! l12 1 0)
	(vector-set! l12 2 (- width tmp1))
	(vector-set! l12 3 tmp3)
	;l13
	(vector-set! l13 0 (- width tmp1))
	(vector-set! l13 1 tmp3)
	(vector-set! l13 2 (- width tmp1))
	(vector-set! l13 3 (- width tmp3))
	;l14
	(vector-set! l14 0 (- width tmp1))
	(vector-set! l14 1 (- width tmp3))
	(vector-set! l14 2 tmp2)
	(vector-set! l14 3 width)
	;l15
	(vector-set! l15 0 tmp2)
	(vector-set! l15 1 width)
	(vector-set! l15 2 tmp1)
	(vector-set! l15 3 (- width tmp3))
	;l16
	(vector-set! l16 0 tmp1)
	(vector-set! l16 1 tmp3)
	(vector-set! l16 2 tmp1)
	(vector-set! l16 3 (- width tmp3))
	;***********************************************************
	;l21
	(vector-set! l21 0 0)
	(vector-set! l21 1 tmp2)
	(vector-set! l21 2 tmp3)
	(vector-set! l21 3 tmp1)
	;l22
	(vector-set! l22 0 tmp3)
	(vector-set! l22 1 tmp1)
	(vector-set! l22 2 (- width tmp3))
	(vector-set! l22 3 tmp1)
	;l23
	(vector-set! l23 0 (- width tmp3))
	(vector-set! l23 1 tmp1)
	(vector-set! l23 2 width)
	(vector-set! l23 3 tmp2)
	;l24
	(vector-set! l24 0 width)
	(vector-set! l24 1 tmp2)
	(vector-set! l24 2 (- width tmp3))
	(vector-set! l24 3 (- width tmp1))
	;l25
	(vector-set! l25 0 (- width tmp3))
	(vector-set! l25 1 (- width tmp1))
	(vector-set! l25 2 tmp3)
	(vector-set! l25 3 (- width tmp1))
	;l26
	(vector-set! l26 0 tmp3)
	(vector-set! l26 1 (- width tmp1))
	(vector-set! l26 2 0)
	(vector-set! l26 3 tmp2)
	;***********************************************************
	;l31
	(vector-set! l31 0 0)
	(vector-set! l31 1 tmp2)
	(vector-set! l31 2 tmp2)
	(vector-set! l31 3 0)
	;l32
	(vector-set! l32 0 tmp2)
	(vector-set! l32 1 0)
	(vector-set! l32 2 width)
	(vector-set! l32 3 tmp2)
	;l33
	(vector-set! l33 0 width)
	(vector-set! l33 1 tmp2)
	(vector-set! l33 2 tmp2)
	(vector-set! l33 3 width)
	;l34
	(vector-set! l34 0 tmp2)
	(vector-set! l34 1 width)
	(vector-set! l34 2 0)
	(vector-set! l34 3 tmp2)
	;***********************************************************
	(set! tmp1 (/ (* z3 width) 2))
	(set! tmp2 (* (* (/ radical3 2) z3) width))
	(set! tmp3 (* z3 width))
	(set! tmp4 (/ width 2))
	;l41
	(vector-set! l41 0 (- tmp4 tmp1))
	(vector-set! l41 1 (- tmp4 tmp2))
	(vector-set! l41 2 tmp4)
	(vector-set! l41 3 (+ tmp4 tmp3))
	;l42
	(vector-set! l42 0 tmp4)
	(vector-set! l42 1 (- tmp4 tmp3))
	(vector-set! l42 2 (+ tmp4 tmp1))
	(vector-set! l42 3 (+ tmp4 tmp2))
	;l43
	(vector-set! l43 0 (+ tmp4 tmp2))
	(vector-set! l43 1 (- tmp4 tmp1))
	(vector-set! l43 2 (- tmp4 tmp3))
	(vector-set! l43 3 tmp4)
	;l44
	(vector-set! l44 0 (- tmp4 tmp2))
	(vector-set! l44 1 (+ tmp4 tmp1))
	(vector-set! l44 2 (+ tmp4 tmp3))
	(vector-set! l44 3 tmp4)
	;l45
	(vector-set! l45 0 tmp4)
	(vector-set! l45 1 (- tmp4 tmp3))
	(vector-set! l45 2 (- tmp4 tmp1))
	(vector-set! l45 3 (+ tmp4 tmp2))
	;l46
	(vector-set! l46 0 (+ tmp4 tmp1))
	(vector-set! l46 1 (- tmp4 tmp2))
	(vector-set! l46 2 tmp4)
	(vector-set! l46 3 (+ tmp4 tmp3))
	;l47
	(vector-set! l47 0 (- tmp4 tmp2))
	(vector-set! l47 1 (- tmp4 tmp1))
	(vector-set! l47 2 (+ tmp4 tmp3))
	(vector-set! l47 3 tmp4)
	;l48
	(vector-set! l48 0 (- tmp4 tmp3))
	(vector-set! l48 1 tmp4)
	(vector-set! l48 2 (+ tmp4 tmp2))
	(vector-set! l48 3 (+ tmp4 tmp1))
	;***********************************************************
	;l51
	(vector-set! l51 0 (- tmp4 tmp2))
	(vector-set! l51 1 (+ tmp4 tmp1))
	(vector-set! l51 2 (+ tmp4 tmp1))
	(vector-set! l51 3 (- tmp4 tmp2))
	;l52
	(vector-set! l52 0 (- tmp4 tmp1))
	(vector-set! l52 1 (+ tmp4 tmp2))
	(vector-set! l52 2 (+ tmp4 tmp2))
	(vector-set! l52 3 (- tmp4 tmp1))
	;l53
	(vector-set! l53 0 (- tmp4 tmp2))
	(vector-set! l53 1 (- tmp4 tmp1))
	(vector-set! l53 2 (+ tmp4 tmp1))
	(vector-set! l53 3 (+ tmp4 tmp2))
	;l54
	(vector-set! l54 0 (- tmp4 tmp1))
	(vector-set! l54 1 (- tmp4 tmp2))
	(vector-set! l54 2 (+ tmp4 tmp2))
	(vector-set! l54 3 (+ tmp4 tmp1))
	;***********************************************************
	(set! tmp1 (* width z2))
	;l61
	(vector-set! l61 0 0)
	(vector-set! l61 1 (- tmp4 tmp1))
	(vector-set! l61 2 width)
	(vector-set! l61 3 (+ tmp4 tmp1))
	;l62
	(vector-set! l62 0 (- tmp4 tmp1))
	(vector-set! l62 1 0)
	(vector-set! l62 2 (+ tmp4 tmp1))
	(vector-set! l62 3 width)
	;l63
	(vector-set! l63 0 (+ tmp4 tmp1))
	(vector-set! l63 1 0)
	(vector-set! l63 2 (- tmp4 tmp1))
	(vector-set! l63 3 width)
	;l54
	(vector-set! l64 0 width)
	(vector-set! l64 1 (- tmp4 tmp1))
	(vector-set! l64 2 0)
	(vector-set! l64 3 (+ tmp4 tmp1))
	;***********************************************************
	;l71
	(set! from (intersection2 l53 left))
	(vector-set! l71 0 (vector-ref from 0))
	(vector-set! l71 1 (vector-ref from 1))
	(set! from (intersection2 l62 top))
	(vector-set! l71 2 (vector-ref from 0))
	(vector-set! l71 3 (vector-ref from 1))
	;l72
	(set! from (intersection2 l61 left))
	(vector-set! l72 0 (vector-ref from 0))
	(vector-set! l72 1 (vector-ref from 1))
	(set! from (intersection2 l54 top))
	(vector-set! l72 2 (vector-ref from 0))
	(vector-set! l72 3 (vector-ref from 1))
	;l73
	(set! from (intersection2 l51 top))
	(vector-set! l73 0 (vector-ref from 0))
	(vector-set! l73 1 (vector-ref from 1))
	(set! from (intersection2 l64 right))
	(vector-set! l73 2 (vector-ref from 0))
	(vector-set! l73 3 (vector-ref from 1))
	;l74
	(set! from (intersection2 l63 top))
	(vector-set! l74 0 (vector-ref from 0))
	(vector-set! l74 1 (vector-ref from 1))
	(set! from (intersection2 l52 right))
	(vector-set! l74 2 (vector-ref from 0))
	(vector-set! l74 3 (vector-ref from 1))
	;l75
	(set! from (intersection2 l61 right))
	(vector-set! l75 0 (vector-ref from 0))
	(vector-set! l75 1 (vector-ref from 1))
	(set! from (intersection2 l53 down))
	(vector-set! l75 2 (vector-ref from 0))
	(vector-set! l75 3 (vector-ref from 1))
	;l76
	(set! from (intersection2 l62 down))
	(vector-set! l76 0 (vector-ref from 0))
	(vector-set! l76 1 (vector-ref from 1))
	(set! from (intersection2 l54 right))
	(vector-set! l76 2 (vector-ref from 0))
	(vector-set! l76 3 (vector-ref from 1))
	;l77
	(set! from (intersection2 l63 down))
	(vector-set! l77 0 (vector-ref from 0))
	(vector-set! l77 1 (vector-ref from 1))
	(set! from (intersection2 l51 left))
	(vector-set! l77 2 (vector-ref from 0))
	(vector-set! l77 3 (vector-ref from 1))
	;l78
	(set! from (intersection2 l64 left))
	(vector-set! l78 0 (vector-ref from 0))
	(vector-set! l78 1 (vector-ref from 1))
	(set! from (intersection2 l52 down))
	(vector-set! l78 2 (vector-ref from 0))
	(vector-set! l78 3 (vector-ref from 1))
	;***********************************************************
	;l81
	(set! from (intersection2 l11 l16))
	(vector-set! l81 0 (vector-ref from 0))
	(vector-set! l81 1 (vector-ref from 1))
	(set! from (intersection2 l62 top))
	(vector-set! l81 2 (vector-ref from 0))
	(vector-set! l81 3 (vector-ref from 1))
	;l82
	(set! from (intersection2 l61 left))
	(vector-set! l82 0 (vector-ref from 0))
	(vector-set! l82 1 (vector-ref from 1))
	(set! from (intersection2 l21 l22))
	(vector-set! l82 2 (vector-ref from 0))
	(vector-set! l82 3 (vector-ref from 1))
	;l83
	(set! from (intersection2 l22 l23))
	(vector-set! l83 0 (vector-ref from 0))
	(vector-set! l83 1 (vector-ref from 1))
	(set! from (intersection2 l64 right))
	(vector-set! l83 2 (vector-ref from 0))
	(vector-set! l83 3 (vector-ref from 1))
	;l84
	(set! from (intersection2 l63 top))
	(vector-set! l84 0 (vector-ref from 0))
	(vector-set! l84 1 (vector-ref from 1))
	(set! from (intersection2 l12 l13))
	(vector-set! l84 2 (vector-ref from 0))
	(vector-set! l84 3 (vector-ref from 1))
	;l85
	(set! from (intersection2 l13 l14))
	(vector-set! l85 0 (vector-ref from 0))
	(vector-set! l85 1 (vector-ref from 1))
	(set! from (intersection2 l62 down))
	(vector-set! l85 2 (vector-ref from 0))
	(vector-set! l85 3 (vector-ref from 1))
	;l86
	(set! from (intersection2 l24 l25))
	(vector-set! l86 0 (vector-ref from 0))
	(vector-set! l86 1 (vector-ref from 1))
	(set! from (intersection2 l61 right))
	(vector-set! l86 2 (vector-ref from 0))
	(vector-set! l86 3 (vector-ref from 1))
	;l87
	(set! from (intersection2 l25 l26))
	(vector-set! l87 0 (vector-ref from 0))
	(vector-set! l87 1 (vector-ref from 1))
	(set! from (intersection2 l64 left))
	(vector-set! l87 2 (vector-ref from 0))
	(vector-set! l87 3 (vector-ref from 1))
	;l88
	(set! from (intersection2 l15 l16))
	(vector-set! l88 0 (vector-ref from 0))
	(vector-set! l88 1 (vector-ref from 1))
	(set! from (intersection2 l63 down))
	(vector-set! l88 2 (vector-ref from 0))
	(vector-set! l88 3 (vector-ref from 1))
	;--------------------------------stage 2------------------
	(set! myl2 
		(car 
			(gimp-layer-new image width width RGB-IMAGE "layer-1" 100 NORMAL-MODE)
		)
	)
	(gimp-image-add-layer image myl2 -1)
	(gimp-layer-add-alpha myl2)
	(gimp-drawable-fill myl2 3)
	;---
	(set! from (intersection2 l48 l16))
	(set! to (intersection2 l82 l16))
	(draw-line2 myl2 from to)
	(set! from (intersection2 l53 left))
	(draw-line2 myl2 from to)
	(set! to (intersection2 l71 l72))
	(draw-line2 myl2 from to)
	(set! from (intersection2 l54 top))
	(draw-line2 myl2 from to)
	(set! to (intersection2 l81 l22))
	(draw-line2 myl2 from to)
	(set! from (intersection2 l42 l22))
	(draw-line2 myl2 from to)
	;-)
	(set! from (intersection2 l45 l22))
	(set! to (intersection2 l84 l22))
	(draw-line2 myl2 from to)
	(set! from (intersection2 l51 top))
	(draw-line2 myl2 from to)
	(set! to (intersection2 l73 l74))
	(draw-line2 myl2 from to)
	(set! from (intersection2 l74 right))
	(draw-line2 myl2 from to)
	(set! to (intersection2 l83 l13))
	(draw-line2 myl2 from to)
	(set! from (intersection2 l44 l13))
	(draw-line2 myl2 from to)
	;-)
	(set! from (intersection2 l47 l13))
	(set! to (intersection2 l86 l13))
	(draw-line2 myl2 from to)
	(set! from (intersection2 l54 right))
	(draw-line2 myl2 from to)
	(set! to (intersection2 l75 l76))
	(draw-line2 myl2 from to)
	(set! from (intersection2 l53 down))
	(draw-line2 myl2 from to)
	(set! to (intersection2 l85 l25))
	(draw-line2 myl2 from to)
	(set! from (intersection2 l41 l25))
	(draw-line2 myl2 from to)
	;-)
	(set! from (intersection2 l46 l25))
	(set! to (intersection2 l88 l25))
	(draw-line2 myl2 from to)
	(set! from (intersection2 l52 down))
	(draw-line2 myl2 from to)
	(set! to (intersection2 l77 l78))
	(draw-line2 myl2 from to)
	(set! from (intersection2 l51 left))
	(draw-line2 myl2 from to)
	(set! to (intersection2 l87 l16))
	(draw-line2 myl2 from to)
	(set! from (intersection2 l43 l16))
	(draw-line2 myl2 from to)
	;***
	(set! myl2 
		(car 
			(gimp-layer-new image width width RGB-IMAGE "layer-2" 100 NORMAL-MODE)
		)
	)
	(gimp-image-add-layer image myl2 -1)
	(gimp-layer-add-alpha myl2)
	(gimp-drawable-fill myl2 3)
	;---
	(set! from (intersection2 l11 left))
	(set! to (intersection2 l11 l54))
	(draw-line2 myl2 from to)
	
	(set! from (intersection2 l21 top))
	(set! to (intersection2 l21 l53))
	(draw-line2 myl2 from to)
	
	(set! from (intersection2 l23 top))
	(set! to (intersection2 l23 l52))
	(draw-line2 myl2 from to)
	
	(set! from (intersection2 l12 right))
	(set! to (intersection2 l12 l51))
	(draw-line2 myl2 from to)
	
	(set! from (intersection2 l14 right))
	(set! to (intersection2 l14 l53))
	(draw-line2 myl2 from to)
	
	(set! from (intersection2 l24 down))
	(set! to (intersection2 l24 l54))
	(draw-line2 myl2 from to)
	
	(set! from (intersection2 l26 down))
	(set! to (intersection2 l26 l51))
	(draw-line2 myl2 from to)
	
	(set! from (intersection2 l15 left))
	(set! to (intersection2 l15 l52))
	(draw-line2 myl2 from to)
	
	(set! from (intersection2 l21 left))
	(set! to (intersection2 l21 l47))
	(draw-line2 myl2 from to)
	
	(set! from (intersection2 l26 left))
	(set! to (intersection2 l26 l44))
	(draw-line2 myl2 from to)
	
	(set! from (intersection2 l11 top))
	(set! to (intersection2 l11 l41))
	(draw-line2 myl2 from to)
	
	(set! from (intersection2 l12 top))
	(set! to (intersection2 l12 l46))
	(draw-line2 myl2 from to)
	
	(set! from (intersection2 l23 right))
	(set! to (intersection2 l23 l43))
	(draw-line2 myl2 from to)
	
	(set! from (intersection2 l24 right))
	(set! to (intersection2 l24 l48))
	(draw-line2 myl2 from to)
	
	(set! from (intersection2 l14 down))
	(set! to (intersection2 l14 l42))
	(draw-line2 myl2 from to)
	
	(set! from (intersection2 l15 down))
	(set! to (intersection2 l15 l45))
	(draw-line2 myl2 from to)
	;***
	(set! myl2 
		(car 
			(gimp-layer-new image width width RGB-IMAGE "layer-3" 100 NORMAL-MODE)
		)
	)
	(gimp-image-add-layer image myl2 -1)
	(gimp-layer-add-alpha myl2)
	(gimp-drawable-fill myl2 3)
	;---
	(set! from (intersection2 l42 l22))
	(set! to (intersection2 l42 l43))
	(draw-line2 myl2 from to)
	(set! from (intersection2 l43 l23))
	(draw-line2 myl2 from to)
	
	(set! from (intersection2 l46 l12))
	(set! to (intersection2 l46 l47))
	(draw-line2 myl2 from to)
	(set! from (intersection2 l47 l13))
	(draw-line2 myl2 from to)
	
	(set! from (intersection2 l52 l23))
	(set! to (intersection2 l52 l54))
	(draw-line2 myl2 from to)
	(set! from (intersection2 l54 l24))
	(draw-line2 myl2 from to)
	
	(set! from (intersection2 l44 l13))
	(set! to (intersection2 l44 l42))
	(draw-line2 myl2 from to)
	(set! from (intersection2 l42 l14))
	(draw-line2 myl2 from to)
	
	(set! from (intersection2 l48 l24))
	(set! to (intersection2 l48 l46))
	(draw-line2 myl2 from to)
	(set! from (intersection2 l46 l25))
	(draw-line2 myl2 from to)
	
	(set! from (intersection2 l53 l14))
	(set! to (intersection2 l53 l52))
	(draw-line2 myl2 from to)
	(set! from (intersection2 l52 l15))
	(draw-line2 myl2 from to)
	
	(set! from (intersection2 l41 l25))
	(set! to (intersection2 l41 l44))
	(draw-line2 myl2 from to)
	(set! from (intersection2 l44 l26))
	(draw-line2 myl2 from to)
	
	(set! from (intersection2 l45 l15))
	(set! to (intersection2 l45 l48))
	(draw-line2 myl2 from to)
	(set! from (intersection2 l48 l16))
	(draw-line2 myl2 from to)
	
	(set! from (intersection2 l51 l26))
	(set! to (intersection2 l51 l53))
	(draw-line2 myl2 from to)
	(set! from (intersection2 l53 l21))
	(draw-line2 myl2 from to)
	
	(set! from (intersection2 l43 l16))
	(set! to (intersection2 l43 l41))
	(draw-line2 myl2 from to)
	(set! from (intersection2 l41 l11))
	(draw-line2 myl2 from to)
	
	(set! from (intersection2 l47 l21))
	(set! to (intersection2 l47 l45))
	(draw-line2 myl2 from to)
	(set! from (intersection2 l45 l22))
	(draw-line2 myl2 from to)
	
	(set! from (intersection2 l54 l11))
	(set! to (intersection2 l54 l51))
	(draw-line2 myl2 from to)
	(set! from (intersection2 l51 l12))
	(draw-line2 myl2 from to)
	
	;***
	(when (= merg TRUE)
            (set! tmp1 1)
            (while (< tmp1 3)
            	(set! myl2
                    (car
                        (gimp-image-merge-down image myl2 0)
                    )
                )
                (set! tmp1 (+ tmp1 1))
            )
        )
	; Complete the undo group
  	(gimp-undo-push-group-end image)
	; Flush output
  	(gimp-displays-flush)
  )
)
(script-fu-register "islamic-design-2"
                    "design-2"
                    "This function get a value (WIDTH) from user and drow some regular lines."
                    "Alireza Shahriari <alireza.shahriari@gmail.com> AND M.Sadegh Davtalab <ms.davtalab@gmail.com>"
                    "GNU General Public License , Please use it and pass it to another !!!"
                    "2010-12-31"
                    "RGB*, GRAY*"

        SF-IMAGE "Input Image" 0
	SF-DRAWABLE "Input Drawable" 0
	SF-VALUE "Width" "400"
	SF-TOGGLE "Merge Layers?" TRUE
)
(script-fu-menu-register "islamic-design-2"
                          "<Image>/Filters/Render/islamic-design")
