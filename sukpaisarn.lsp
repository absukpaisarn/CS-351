;Author: Amy Sukpaisarn
;Class: CS 351
;Purpose: Write a program using Common Lisp that encrypts and decrypts a phrase using the Caesar cipher.

;gets the alphabet and puts it into a list
(defun getChar ()
	'(A B C D E F G H I J K L M N O P Q R S T U V W X Y Z))

;gets the position in the list
(defun alphabetPosition (list spot)
	(if (eq spot (car list)) 0
		(+ 1 (alphabetPosition (cdr list) spot))))

;gets the element number of an atom in the list
(defun getCharSpot (element)
	(alphabetPosition (getChar) element))

;finds the character in the list in a certain spot
(defun findChar (list spot)
	(if (= spot 0) (car list)
		(findChar (cdr list) (- spot 1))))

;gets the character that is in the element's spot
(defun getSpaceNum (element)
	(findChar (getChar) element))

;gets the spot of the atom after encrypting
(defun encrypting (element key)
	(getSpaceNum (mod (+ (getCharSpot element) key) 26)))

;gets the encrypted word
(defun encryptWord (word key)
	(if (null word) nil
		(cons (encrypting (car word) key) 
			(encryptWord (cdr word) key))))

;gets the encrypted words
(defun encryptedWord (words key)
	(if (null words) nil
		(cons (encryptWord (car words) key)
			(encryptedWord (cdr words) key))))

;prints the word from a sublist
(defun printWord (list)
	(cond ((not (eq nil list))
		(format t "~s" (car list))
		(printWord (cdr list)))
	))

;prints many words from a list
(defun printWords (lists)
	(cond ((not (eq nil lists))
		(printWord (car lists))
		(format t " ")
		(printWords (cdr lists)))
	))

;gets the encrypted words and prints them out as a string
(defun encryptedString (lists)
	(printWords (encryptedWord lists 5)))

;gets the decrypted words and prints them out as a string
(defun decrypt (lists)
	(printWords (encryptedWord lists -5)))
