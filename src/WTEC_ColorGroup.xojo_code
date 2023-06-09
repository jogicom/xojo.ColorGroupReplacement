#tag Class
Protected Class WTEC_ColorGroup
	#tag Method, Flags = &h0
		Sub Constructor()
		  // Init Colors to Default Black/White
		  Me.LightColor = &cFFFFFF00
		  Me.DarkColor  = &c00000000
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(lightValue as color, darkValue as Color)
		  // Init Colors
		  Me.LightColor = lightValue
		  Me.DarkColor  = darkValue
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CopyTo(destination as WTEC_ColorGroup)
		  // Copy this item to another
		  
		  If destination <> Nil Then
		    destination.LightColor = Me.LightColor
		    destination.DarkColor = Me.DarkColor
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function isValidHexColor(colorAsString as string) As Boolean
		  // Check if a String is a valid HEX Color Value
		  
		  colorAsString = colorAsString.Trim
		  
		  If colorAsString.Length <> 10 Then Return False
		  
		  If colorAsString.Left(2) <> "&h" Then Return False
		  
		  Return True
		End Function
	#tag EndMethod


	#tag Note, Name = History
		09.06.2023   V1.0.0 initial Release
		
	#tag EndNote


	#tag ComputedProperty, Flags = &h0, Description = 4475616C436F6C6F7220617320616E2048455820537472696E672077697468206120736570617261746F72
		#tag Getter
			Get
			  // Get the DualColor as a String
			  Return Me.LightColor.ToString + Me.separator + Me.DarkColor.ToString
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  Var c() As String
			  Var fEx As Boolean = False
			  
			  c = value.Split(Me.separator)
			  
			  If c.Count = 2 Then
			    If Me.isValidHexColor(c(0)) And Me.isValidHexColor(c(1)) Then
			      Me.LightColor= Color.FromString (c(0))
			      Me.DarkColor = Color.FromString(c(1))
			    Else
			      fEx = True
			    End If
			  Else
			    fEx = True
			  End If
			  
			  If fEx Then
			    Var e As New UnsupportedFormatException
			    e.Message = "WTEC_ColorGroup: String contains no valid HEX Color Value! (" + value + ")"
			    Raise e
			  end if
			  
			End Set
		#tag EndSetter
		asText As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0, Description = 41637475616C20757365642053797374656D6D6F646520436F6C6F72
		#tag Getter
			Get
			  // Rueckgabe der Color fuer den aktuell aktiven Color.isDarkMode
			  
			  
			  If Color.IsDarkMode Then
			    // System ist im DarkMode
			    Return Me.DarkColor
			  Else
			    // System ist im LightMode
			    Return me.LightColor
			  End If
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  If Color.IsDarkMode Then
			    // System ist im DarkMode
			    Me.DarkColor = value
			  Else
			    // System ist im LightMode
			    Me.LightColor = value
			  End If
			End Set
		#tag EndSetter
		currentValue As Color
	#tag EndComputedProperty

	#tag Property, Flags = &h0, Description = 54686520436F6C6F7220666F72204461726B4D6F6465
		DarkColor As Color = &c00000000
	#tag EndProperty

	#tag Property, Flags = &h0, Description = 54686520436F6C6F7220666F72204C696768744D6F6465
		#tag Note
			&c00000000
		#tag EndNote
		LightColor As color = &c00000000
	#tag EndProperty


	#tag Constant, Name = separator, Type = String, Dynamic = False, Default = \";", Scope = Public
	#tag EndConstant


	#tag ViewBehavior
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="currentValue"
			Visible=false
			Group="Behavior"
			InitialValue="&c000000"
			Type="Color"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="asText"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="DarkColor"
			Visible=false
			Group="Behavior"
			InitialValue="&c00000000"
			Type="Color"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="LightColor"
			Visible=false
			Group="Behavior"
			InitialValue="&c00000000"
			Type="color"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
