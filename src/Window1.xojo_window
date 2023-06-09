#tag DesktopWindow
Begin DesktopWindow Window1
   Backdrop        =   0
   BackgroundColor =   &cFFFFFF
   Composite       =   False
   DefaultLocation =   2
   FullScreen      =   False
   HasBackgroundColor=   False
   HasCloseButton  =   True
   HasFullScreenButton=   False
   HasMaximizeButton=   True
   HasMinimizeButton=   True
   Height          =   400
   ImplicitInstance=   True
   MacProcID       =   0
   MaximumHeight   =   32000
   MaximumWidth    =   32000
   MenuBar         =   2102331391
   MenuBarVisible  =   False
   MinimumHeight   =   64
   MinimumWidth    =   64
   Resizeable      =   True
   Title           =   "Untitled"
   Type            =   0
   Visible         =   True
   Width           =   600
End
#tag EndDesktopWindow

#tag WindowCode
	#tag Event
		Sub Opening()
		  // Demo Code
		  
		  // initialize c1 with Class Default Colors
		  Var c1 As New WTEC_ColorGroup
		  
		  // initialize c2 with a LightColor=red, and DarkColor =blue
		  Var c2 As New WTEC_ColorGroup(&cFF000000,&c0080FF00)
		  
		  
		  // If the System is in DarkMode then this returns the DarkColor
		  // If the System is in LightMode, then this returns the LightColor
		  Var c As Color = c2.currentValue
		  
		  // If the System is in DarkMode then this set the DarkColor to orange
		  // If the System is in LightMode, the this set the LightColor to orange
		  c2.currentValue = &cFF800000
		  
		  // If you implicitly need access to the DarkColor
		  c = c2.DarkColor
		  
		  // If you implicitly need access to the LightColor
		  c = c2.LightColor
		  
		  
		  // If you need the Colors as a string maybe for a preference
		  Var s As String = c2.asText
		  
		  // this set the colors from a string
		  Var c3 As New WTEC_ColorGroup
		  Try
		    c3.asText = s
		  Catch UnsupportedFormatException
		    MessageBox("Something went wrong by set C3!")
		  End Try
		  
		  // Try to set a invalid ColorString 
		  Var c4 As New WTEC_ColorGroup
		  Var i As String = "&cFF000000;&c0080FF00"
		  Try
		    c4.asText = i
		  Catch UnsupportedFormatException
		    MessageBox("Something went wrong by set C4!")
		  End Try
		  
		  
		  
		End Sub
	#tag EndEvent


#tag EndWindowCode

