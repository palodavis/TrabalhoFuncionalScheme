#lang scheme

(define item1 '(2 10))
(define item2 '(3 7))
(define item3 '(4 5))
(define item4 '(5 6))

;;Exemplo de Closure 
(define (selecionar-itens itens capacidade)
  (letrec ((aux (lambda (itens capacidade)
                  (cond
                    ((null? itens) '())
                    ((<= (car (car itens)) capacidade)
                     (let* ((item (car itens))
                            (resto-itens (cdr itens))
                            (valor (cadr item))
                            (peso (car item))
                            (com-item (cons item (aux resto-itens (- capacidade peso))))
                            (sem-item (aux resto-itens capacidade)))
                       (if (> (calcular-valor-total com-item) (calcular-valor-total sem-item))
                           com-item
                           sem-item)))
                    (else (aux (cdr itens) capacidade))))))
    (aux itens capacidade)))

;; Functor ou
(define (calcular-valor-total itens)
  (apply + (map cadr itens)))

;; Curry
(define (mochila capacidade)
  (lambda (itens)
    (let ((itens-selecionados (selecionar-itens itens capacidade)))
      (list "Itens selecionados:" itens-selecionados
            "; Calculo total:" (calcular-valor-total itens-selecionados)))))

(define mochila-capacidade-10 (mochila 10))

(define itens-para-escolher (list item1 item2 item3 item4))

; Imprime os resultados com textos adicionais
(display "Resultado:")
(newline)
(mochila-capacidade-10 itens-para-escolher)