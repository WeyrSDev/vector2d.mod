
rem
bbdoc: A 2d vector class.
endrem
Type TVector2D

	Field _x:Float
	Field _y:Float


	Method New()
		_x = 0
		_y = 0
	End Method


	Rem
	bbdoc: Creates a new vector with passed values.
	endrem
	Function Create:TVector2D(x:Float, y:Float)
		Local v:TVector2D =  New TVector2D
		v.SetX(x)
		v.SetY(y)
		Return v
	End Function


	rem
	bbdoc: Returns a clone of this vector.
	end rem
	Method Clone:TVector2D()
		Local v:TVector2D = New TVector2D
		v.SetX(_x)
		v.SetY(_y)
		Return v
	End Method


	Rem
	bbdoc: Returns X component.
	endrem
	Method GetX:Float()
		Return _x
	End Method


	Rem
	bbdoc: Returns Y component.
	endrem
	Method GetY:Float()
		Return _y
	End Method


	Rem
	bbdoc: Set X component.
	endrem
	Method SetX(x:Float)
		_x = x
	End Method


	Rem
	bbdoc: Set Y component.
	endrem
	Method SetY(y:Float)
		_y = y
	End Method


	rem
	bbdoc: Returns true if the values in both vectors are the same.
	endrem
	Method IsSame:Int(v2:TVector2D)
		Return _x = v2.GetX() And _y = v2.GetY()
	End Method


	Rem
	bbdoc: Copies the values from passed vector to this vector.
	endrem
	Method Copy(v:TVector2D)
		_x = v.GetX()
		_y = v.GetY()
	End	Method


	rem
	bbdoc: Sets this vector to passed values.
	endrem
	Method Set(x:Float, y:Float)
		_x = x
		_y = y
	End	Method
	
	
	rem
	bbdoc: Sets this vector to passed vector.
	endrem
	Method SetV(v:TVector2D)
		_x = v.GetX()
		_y = v.GetY()
	End Method	


	rem
	bbdoc: Adds passed values to this vector.
	endrem
	Method Add(x:Float, y:Float)
		_x :+ x
		_y :+ y
	End	Method


	rem
	bbdoc: Adds passed vector to this vector.
	endrem
	Method AddV(v:TVector2D)
		_x :+ v.GetX()
		_y :+ v.GetY()
	End Method


	Rem
	bbdoc: Add X component.
	endrem
	Method AddX(x:Float)
		_x:+x
	End Method


	Rem
	bbdoc: Add Y component.
	endrem
	Method AddY(y:Float)
		_y:+y
	End Method


	rem
	bbdoc: Substracts passed values from this vector.
	endrem
	Method Substract(x:Float, y:Float)
		_x :- x
		_y :- y
	End	Method


	rem
	bbdoc: Substracts passed vector from this vector.
	endrem
	Method SubstractV(v:TVector2D)
		_x :- v.GetX()
		_y :- v.GetY()
	End Method


	rem
	bbdoc: Returns the length of this vector.
	endrem
	Method GetLength:Float()
		Return Sqr(_x*_x + _y*_y)
	End Method


	rem
	bbdoc: Divides this vector by passed value.
	endrem
	Method Divide(f:Float)
		If f = 0.0 Then RuntimeError( "Divide by 0!" )
		_x :/ f
		_y :/ f
	End Method


	rem
	bbdoc: Divides this vector by passed vector.
	endrem
	Method DivideV(v:TVector2D)
		If v.GetX() = 0.0 Or v.GetY() = 0.0 Then RuntimeError( "Divide by 0!" )
		_x :/ v.GetX()
		_y :/ v.GetY()
	End Method


	rem
	bbdoc: Multiplies this vector by passed value.
	endrem
	Method Multiply(f:Float)
		_x :* f
		_y :* f
	End Method



	Rem
	bbdoc: Multiplies X component by passed value.
	EndRem
	Method MultiplyX(f:float)
		_x :* f
	EndMethod



	Rem
	bbdoc: Multiplies Y component by passed value.
	EndRem
	Method MultiplyY(f:Float)
		_y :* f
	EndMethod



	rem
	bbdoc: Multiplies this vector by passed vector.
	endrem
	Method MultiplyV(v:TVector2D)
		_x :* v.GetX()
		_y :* v.GetY()
	End	Method


	rem
	bbdoc: Make this vector length = 1.0
	endrem
	Method Normalise()
		Divide( GetLength() )
	End Method


	rem
	bbdoc: Swaps values between this and passed vector.
	endrem
	Method Swap(v:TVector2D)
		Local temp:Float = _x
		_x = v.GetX()
		v.SetX(temp)

		temp = _y
		_y = v.GetY()
		v.SetY(temp)
	End Method


	rem
	bbdoc: Returns the dot product of this and passed vector.
	endrem
	Method Dot:Float(v:TVector2D)
		Return ( _x*v.GetX() + _y*v.GetY() )
	End Method


	rem
	bbdoc: Returns the distance between this and passed vector.
	endrem
	Method Distance:Float(v:TVector2D)
		Local dx:Float = _x - v.GetX()
		Local dy:Float = _y - v.GetY()
		Return Sqr(dx*dx + dy*dy )
	End Method


	rem
	bbdoc: Returns angle of vector rotation.
	Angle range is 0 to 180:
	-135 -90 -45
	    \ | /
	+180 -+-  0
	    / | \
	+135 +90 +45
	endrem
	Method GetRotation:Float()
		Return ATan2( _y, _x )
	End Method


	rem
	bbdoc: Rotates this vector with passed amount, origin = 0,0
	endrem
	Method Rotate(theta:Float)
		Local cos_rot:Float = Cos(theta)
		Local sin_rot:Float = Sin(theta)
		Local qx:Float = _x * cos_rot - _y * sin_rot
		Local qy:Float = _y * cos_rot + _x * sin_rot
		_x = qx
		_y = qy
	End Method


	rem
	bbdoc: Rotates this vector with passed amount around passed vector.
	endrem
	Method RotateV( theta:Float, v:TVector2D )
		Local cos_rot:Float = Cos(theta)
		Local sin_rot:Float = Sin(theta)
		_x :- v.GetX()
		_y :- v.GetY()
		Local qx:Float = _x * cos_rot - _y * sin_rot
		Local qy:Float = _y * cos_rot + _x * sin_rot
		_x = qx + v.GetX()
		_y = qy + v.GetY()
	End Method

End Type