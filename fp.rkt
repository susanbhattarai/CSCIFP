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
(def (min-above-min L1 L2)
 )

;Helper function to find the minimum value
(def (min-val L)
  (cond
    ((null? L) #f)
    ((null? (cdr L)) (car L))
    (#t (min-val-tail (cdr L1) (cat L1)))
  )
)