;Question1
#|
Algorithm:
If the list is empty, return
Else: append the function call with cdr of list
plus the head of list
|#
(define (reverse-general L)
  (cond
    ((null? L) '()) ;Return empty list
    ((list? (car L)) ;If head is list
      (append (reverse-general (cdr l)) (list (reverse-general (car L))))) ;If head is list, append the function call on tail with function call on head
    (else (append (reverse-general (cdr L)) (list (car L)))) ;Append the head at the end
   )
)


;Question 4
(define (min-above-min L1 L2)
  (cond
    ((null? L1) #f)
    ((null? L2) (min-val L1))
    ((< (min-val L1) (min-val L2)) #f)
   )
)
;Helper function to find the minimum value
(define (min-val L)
  (cond
    ((null? L) #f)
    ((null? (cdr L)) (car L))
    (#t (min-val-tail (cdr L) (car L)))
  )
)

;Tail recursive min-val-tail
(define (min-val-tail L1 L2)
  (cond
    ((null? L1) L2)
    ((not (number? (car L1))) (min-val-tail (cdr L1) L2))
    ((< (car L1) L2) (min-val-tail (cdr L1) (car L1)))
    (#t (min-val-tail (cdr L1) L2))
  )
)