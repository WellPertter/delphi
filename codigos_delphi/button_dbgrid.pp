// DrawCollum
var
  button: integer;
  R: TRect;
  bcolor :TColor;
begin
  DBGrid1.Canvas.FillRect(Rect);
  BUTTON := 0;
  R := Rect;
  InflateRect(R, -1, -1);

  if (Column.Field = cdsAtributoValorbtn) and (cdsAtributoValorAtributoPai.AsString = '1') then
  begin
    DrawFrameControl(DBGrid1.Canvas.Handle, R, BUTTON, BUTTON or BUTTON);
    bcolor := DBGrid1.Brush.Color;
    DBGrid1.Canvas.Brush.Color := clBtnFace;

    if (cdsAtributoValorObsTexto.IsNull)then
      DrawText(DBGrid1.Canvas.Handle, '  ADD  ', 7, R, DT_VCENTER OR DT_CENTER)
    else
      DrawText(DBGrid1.Canvas.Handle, '  EDIT  ', 7, R, DT_VCENTER OR DT_CENTER);

    DBGrid1.Canvas.Brush.Color := bcolor;
  end;
end;