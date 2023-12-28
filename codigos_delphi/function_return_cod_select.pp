function TformResultadosCli.returnIdSelecionados(cod_perfil: string): string;
var
  valores: string;
begin
  valores := '(';
  if cod_perfil <> '' then
  begin
    with Qrycodigo do
    begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT id_exame FROM cli_tab_exames_perfis WHERE id_perfil = ' + QuotedStr(cod_perfil));
      Open;

      first;

      while not Eof do
      begin

        if Length(valores) > 1 then
           valores :=  valores + ', ' + FieldByName('id_exame').AsString
        else
           valores :=  valores + FieldByName('id_exame').AsString;
        Next;
      end;
      valores := valores + ')';

      Result := valores;
      Exit;
    end;

  end;

  formExamesPerfil.cdsExames.DisableControls;
  with formExamesPerfil.cdsExames do
  begin
    first;


    while not Eof do
    begin

      if formExamesPerfil.cdsExamesselecionado.AsBoolean then
      begin
        if Length(valores) > 1 then
           valores :=  valores + ', ' + formExamesPerfil.cdsExamesId.AsString
        else
           valores :=  valores + formExamesPerfil.cdsExamesId.AsString;

      end;

      Next;
    end;
    valores := valores + ')';

  end;
  formExamesPerfil.cdsExames.EnableControls;

  Result := valores;
end;