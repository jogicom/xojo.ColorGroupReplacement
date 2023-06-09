# XOJO WTEC_ColorGroup

**Ein unkomplizierter Ersatz für die XOJO ColorGroup Class**

Möchtest du auch den DarkMode in deiner Applikation unterstützen?  

Die ColorGroup Class ist Dir zu kompliziert oder erzeugt manchmal undurchsichtige Ergebnisse in manchen Situationen?

Dann könnte diese simple Klasse eine Lösung für dich sein!

Dies ist allerdings kein Klon der originalen ColorGroup!

------

**A no-hassle replacement for the XOJO ColorGroup Class**

Would you also like to support DarkMode in your application?

The ColorGroup Class is too complicated for you or sometimes creates opaque results in some situations?

Then this simple class could be a solution for you!

However, this is not a clone of the original ColorGroup!

------

## Functions

| Name/property | Function                                                     |
| ------------- | ------------------------------------------------------------ |
| CopyTo        | Copy the colorset into another WTEC_ColorGroup               |
| asText        | Set/get the ColorGroup values by a String (with separator between the values). A invalid Hex String can raise a UnsupportedFormatException. This string can saved/load to preferences. |
| currentValue  | The currently used Color Value. If System is in DarkMode, the this is the DarkMode Color. If System in LightMode, this is the LightMode Color |
| DarkColor     | DarkColor of this Class                                      |
| LightColor    | LightColor of this Class                                     |

## Example

```
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

// If you need explizit the DarkColor
c = c2.DarkColor

// if you need explizit the LightColor
c = c2.LightColor


// If you need the Colors as a string mayby for a preference
Var s As String = c2.asText

// this set the colors from a string
Var c3 As New WTEC_ColorGroup
Try
  c3.asText = s
Catch UnsupportedFormatException
  MessageBox("Somethimg went wrong by set C3!")
End Try

// Try to set a invalid ColorString 
Var c4 As New WTEC_ColorGroup
Var i As String = "&cFF000000;&c0080FF00"
Try
  c4.asText = i
Catch UnsupportedFormatException
  MessageBox("Somethimg went wrong by set C4!")
End Try
```

## History

| Date       | Version | Remarks       |
| ---------- | ------- | ------------- |
| 2023-06-10 | V1.0.0  | First Release |
|            |         |               |
|            |         |               |

