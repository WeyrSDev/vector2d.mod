
'unit tests for tvector2d

Type TVectorTest Extends TTest

	Field v:TVector2D

	Method Before() {before}
		v = New TVector2D
	End Method

	Method After() {after}
		v = Null
	End Method


	Method Constructor() {test}
		assertNotNull(v)

		v = New TVector2D.Create(10,20)
		assertNotNull(v)
	End Method


	Method SetAndGet() {test}
		v.Set(50,10)
		assertEqualsI(50, v.GetX())
		assertEqualsI(10, v.GetY())
	End Method


	Method Clone() {test}
		v.Set(50,10)
		Local v2:TVector2D = v.Clone()

		assertEqualsF(50, v2.GetX())
		assertEqualsF(10, v2.GetY())
	End Method


	Method Copy() {test}
		v.Set(50,10)
		Local v2:TVector2D = New TVector2D
		v2.Copy(v)

		assertEqualsF(50, v2.GetX())
		assertEqualsF(10, v2.GetY())
	End Method


	Method IsSame() {test}
		v.Set(50, 10)
		Local v2:TVector2D = TVector2D.Create(50, 10)
		assertTrue(v.IsSame(v2))
	End Method


	Method Add() {test}
		v.Set(50,10)
		v.Add(10,20)
		assertEqualsF(60, v.GetX())
		assertEqualsF(30, v.GetY())

		Local v2:TVector2D = New TVector2D.Create(40,70)
		v.AddV(v2)
		assertEqualsF(100, v.GetX())
		assertEqualsF(100, v.GetY())
	End Method


	Method Substract() {test}
		v.Set(100,100)
		v.Substract(10,20)
		assertEqualsF(90, v.GetX())
		assertEqualsF(80, v.GetY())

		Local v2:TVector2D = New TVector2D.Create(40,70)
		v.SubstractV(v2)
		assertEqualsF(50, v.GetX())
		assertEqualsF(10, v.GetY())
	End Method


	Method Length() {test}
		v.Set(100,0)
		assertEqualsF(100, v.GetLength())

		v.Set(0,80)
		assertEqualsF(80, v.GetLength())
	End Method


	Method Multiply() {test}
		v.Set(10,20)
		v.Multiply(2)
		assertEqualsF(20, v.GetX())
		assertEqualsF(40, v.GetY())

		v.Set(10,20)
		Local v2:TVector2D = New TVector2D.Create(2,4)
		v.MultiplyV(v2)
		assertEqualsF(20, v.GetX())
		assertEqualsF(80, v.GetY())
	End Method


	Method testMultiplyX() {test}
		v.Set(10,20)
		v.MultiplyX(2.0)
		AssertEqualsF(20, v.GetX(), 0.01, "message")
	End Method


	Method testMultiplyY() {test}
		v.Set(10,20)
		v.MultiplyY(2.0)
		AssertEqualsF(40, v.GetY(), 0.01, "message")
	End Method


	Method Normalise() {test}
		v.Set(100,50)
		v.Normalise()

		assertEqualsF(1, v.GetLength())
	End Method


	Method Swap() {test}
		v.Set(10,50)
		Local v2:TVector2D = New TVector2D.Create(20,30)
		v.Swap(v2)

		assertEqualsF(20, v.GetX())
		assertEqualsF(30, v.GetY())
		assertEqualsF(10, v2.GetX())
		assertEqualsF(50, v2.GetY())
	End Method


	Method Dot() {test}
		v.Set(1,0)
		Local v2:TVector2D = New TVector2D.Create(1,0)

		'positive cos vectors are pointing in the same direction
		assertEqualsF(1.0, v.Dot(v2))

		v2.Set(0,-1)
		'0.0 cos vectors are perpendicular (90 degree angle)
		assertEqualsF(0.0, v.Dot(v2))

		v2.Set(-1,0)
		'negative cos vectors are in opposite direction
		assertEqualsF(-1.0, v.Dot(v2))
	End Method


	Method Distance() {test}
		Local v2:TVector2D = New TVector2D.Create(90,0)
		assertEqualsF(90, v.Distance(v2))
	End Method


	Method GetRotation() {test}
		v.Set(0,-1)
		assertEqualsF(-90, v.GetRotation())

		v.Set(-1,0)
		assertEqualsF(180, v.GetRotation())
	End Method


	Method Rotate() {test}
		'0 degrees
		v.Set(1,0)

		'rotate 90 degrees clockwise
		v.Rotate(90)
		assertEqualsF(90, v.GetRotation())

		'and back
		v.Rotate(-45)
		assertEqualsF(45, v.GetRotation())
	End Method


	Method RotateV() {test}
		v.Set(0,-1)

		'rotate 90 degrees clockwise around pont
		Local v2:TVector2D = New TVector2D.Create(1,-1)
		v.RotateV(90, v2)

		'should be 1,-2
		assertEqualsF(1, v.GetX())
		assertEqualsF(-2, v.GetY())
	End Method

End Type
