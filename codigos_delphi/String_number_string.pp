// entrada(vindo do banco), saida(indo para o banco)
function TformResultadoExameCli.retornarValorFormatadoBanco(
  valor, tipo: string): string;
var
  number: boolean;
  i: Integer;
  Caractere, CaracteresPermitidos: string;
begin
  CaracteresPermitidos := '0123456789.,';
  number := true;

  // verificar se é um número válido
  for i := 1 to Length(valor) do
  begin
    caractere := valor[i];
    if Pos(caractere, CaracteresPermitidos) = 0 then
    begin
      number := False;
      Exit;
    end;
  end;

  // Tenta converter a string para um número
  if number and (tipo = 'saida') then
  begin
    //Result := StringReplace(valor, '.', '', [rfReplaceAll]);
    Result := retornarValorFormatadoVisual(valor);
  end
  else
  if number and (tipo = 'entrada') then
  begin
    Result := StringReplace(valor, '.', '', [rfReplaceAll]);
  end
  else
  begin
    Result := valor;
  end;
end;

function TformResultadoExameCli.retornarValorFormatadoVisual(
  valor: string): string;
var
  number, virgula: boolean;
  i : Integer;
  Caractere, CaracteresPermitidos, pontos: string;
begin
  CaracteresPermitidos := '0123456789.,';
  pontos  := '';
  virgula := false;

  for i := 1 to Length(valor) do
  begin
    caractere := valor[i];

    if virgula then
    begin

      pontos  := pontos + '0';

    end;

    if (Pos(caractere, ',') = 1) and ( i < Length(valor)) then
    begin

      virgula := true;

    end;


  end;

  if true then
  begin
    //valor := StringReplace(valor, '.', '', [rfReplaceAll]);
   // valor := StringReplace(valor, ',', '.', [rfReplaceAll]);

    if virgula then
    begin

      Result :=  FormatCurr('#,##0.' + pontos, StrToFloat(valor));

    end
    else
    begin

      Result := FormatCurr('#,##0', StrToFloat(valor));

    end;


  end;
end;