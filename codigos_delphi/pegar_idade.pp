
// data 
procedure TfrmCadAnimal.dteDataNascimentoChange(Sender: TObject);
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

// idade inteiro
procedure TfrmCadAnimal.edtIdadeExit(Sender: TObject);
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

// checks dia, mes e ano
procedure TfrmCadAnimal.rbAnoClick(Sender: TObject);
begin
  if dteDataNascimento.Text <> '  /  /    '  then
    dteDataNascimentoChange(nil)
  else
    edtIdadeExit(nil);
end;

procedure TfrmCadAnimal.rbDiaClick(Sender: TObject);
begin
  if dteDataNascimento.Text <> '  /  /    '  then
    dteDataNascimentoChange(nil)
  else
    edtIdadeExit(nil);
end;

procedure TfrmCadAnimal.rbMesClick(Sender: TObject);
begin
  if dteDataNascimento.Text <> '  /  /    '  then
    dteDataNascimentoChange(nil)
  else
    edtIdadeExit(nil);
end;