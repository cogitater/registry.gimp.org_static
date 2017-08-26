;;; Plugin  : copy-rotate
;;; Author  : tekhertz
;;; Date    : jan 13, 2010
;;; Revision: None
;;; 					
;;; Version : 1.0
;;; Latest version at: http://registry.gimp.org
;;; Required : Gimp 2.6 or later
;;;
;;; Description: 
;;; copy active selection rotate and anchor it based on count and angle
;;; -----------------------------------------------------------------------------
;;;
;;; License:
;;; This program is free software; you can redistribute it and/or modify
;;; it under the terms of the GNU General Public License as published by
;;; the Free Software Foundation; either version 2 of the License, or
;;; (at your option) any later version.
;;; 
;;; This program is distributed in the hope that it will be useful,
;;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;;; GNU General Public License for more details.
;;; 
;;; You should have received a copy of the GNU General Public License
;;; along with this program; if not, write to the Free Software
;;; Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.

(define (script-fu-copy-rotate inImage inLayer xCenter yCenter StartAngle Objects)
	(let* (	(drawable 0)
		(rAngle 0)
		(BoxWidth 0) (BoxHeight 0)
		(xoffset 0) (yoffset 0)
		(countdown 0)
		(sel-float 0)
		(degree 0)
		(imageWidth  (car (gimp-image-width inImage)))
	      )
	(set! BoxWidth (cadr (gimp-selection-bounds inImage)))
	(set! BoxHeight (caddr (gimp-selection-bounds inImage)))
	(set! countdown 0)
	(set! xoffset BoxWidth)
	(set! yoffset BoxHeight)
	(set! drawable inLayer)
	(set! rAngle (* StartAngle (/ 3.14159 180)))
	(gimp-layer-resize-to-image-size inLayer)
  	(gimp-edit-copy drawable);copy
	(gimp-edit-clear drawable);clear selection to handle partial transparency
	
  (while (< countdown Objects) 
    (begin 
	(set! degree (* rAngle countdown))
	(set! sel-float (car (gimp-edit-paste drawable FALSE)));paste
	(gimp-layer-set-offsets sel-float xoffset yoffset);move
	(gimp-drawable-transform-rotate-default sel-float degree FALSE xCenter xCenter FALSE FALSE);rotate
;	(gimp-floating-sel-to-layer sel-float);make each transform a new layer
	(gimp-floating-sel-anchor sel-float);anchor each transform to start layer
	(set! countdown (+ countdown 1))
   );begin
 );while
	(gimp-displays-flush)
   	);let
) ;;def



(script-fu-register
 "script-fu-copy-rotate"
 _"<Image>/_Select/_script-fu-copy-rotate"
 "copy active selection rotate and anchor it "
 "*"
 "*"
 "01/13/2010" 
 "RGB* GRAY* INDEXED*"
 SF-IMAGE "The Image" 0
 SF-DRAWABLE "The Layer" 0
 SF-ADJUSTMENT "Center (x-coordinate)" '(640 0 9999 1 10 0 1)
 SF-ADJUSTMENT "Center (y-coordinate)" '(640 0 9999 1 10 0 1)
 SF-ADJUSTMENT "Angle" '(120 0 360 0.1 1 1 1) 
 SF-ADJUSTMENT "Number of Objects" '(3 -9999 9999 1 10 0 1)
)
