uses  DateUtils;
var
  data: TDateTime;
begin
  if TryStrToDate(dteDataNascimento.Text, data) then
  begin

    if rbDia.Checked then
      EdtIdade.Text := IntToStr(DaysBetween(StrToDate(dteDataNascimento.Text), Date));
    if rbMes.Checked then
      EdtIdade.Text := IntToStr(DaysBetween(StrToDate(dteDataNascimento.Text), Date) div 30);
    if rbAno.Checked then
      EdtIdade.Text := IntToStr(DaysBetween(StrToDate(dteDataNascimento.Text), Date) div 365);

  end;
end;

begin
  if Trim(edtIdade.Text) <> '' then
  begin
    if (StrToInt(edtIdade.Text) > 0) then
    begin

      if rbDia.Checked then
        dteDataNascimento.Text := DateToStr((Date - StrToIntDef(edtIdade.Text, 0)));
      if rbMes.Checked then
        dteDataNascimento.Text := DateToStr((Date - StrToIntDef(IntToStr(StrToInt(edtIdade.Text) * 30), 0)));
      if rbAno.Checked then
        dteDataNascimento.Text := DateToStr((Date - StrToIntDef(IntToStr(StrToInt(edtIdade.Text) * 365), 0)));
    end
    else
      dteDataNascimento.Text := '  /  /    ';
  end;
end;

