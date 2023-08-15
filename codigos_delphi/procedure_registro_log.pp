procedure TForm3.AddDateInLog(List_alt, List_name_fields: TStringList;
  table_name, id_collum_name, registro: String);
var
  I:Integer;
begin
  try
    with QryTableOld do
    begin
      Close;
      Sql.Clear;
      SQL.Add('SELECT * FROM '+ table_name +' WHERE ' + id_collum_name + ' = :id');
      ParamByName('id').Value := List_alt[0];
      Open;
      for I := 0 to FieldCount - 1 do
      begin
        if List_alt[I] <>  QryTableOld.Fields[I].AsString then
        begin
          with QryLogAlpha do
          begin
            QryLogAlpha.ParamByName('registro').Value := registro;
            QryLogAlpha.ParamByName('datahora').Value := FormatDateTime('yyyy/mm/dd hh:nn:ss', Now);
            QryLogAlpha.ParamByName('usuario').Value := 'José Arthur';
            QryLogAlpha.ParamByName('valor_antigo').Value := List_name_fields[I] + ': ' + QryTableOld.Fields[I].AsString;
            QryLogAlpha.ParamByName('valor_atual').Value := List_name_fields[I] + ': ' + List_alt[I];
            QryLogAlpha.ExecSQL;
          end;
        end;
      end;
    end;
  except
    ShowMessage('Erro no registro de informações.');
  end;
end;
