// Celula OnClick
if DBGrid1.DataSource.DataSet.RecordCount > 0 then
begin
    if Column.Field = QryAieenvia then
    begin
        dsAie.DataSet.Edit;
        if QryAieenvia.AsBoolean = True then
        QryAieenvia.AsBoolean := False
        else
        QryAieenvia.AsBoolean := True;
        dsAie.DataSet.Post;
    end;
    if Column.Field = QryAieemitir then
    begin
        dsAie.DataSet.Edit;
        if QryAieemitir.AsBoolean = True then
        QryAieemitir.AsBoolean := False
        else
        QryAieemitir.AsBoolean := True;
        dsAie.DataSet.Post;
    end;
end;

// DrawCollum
vLargura := 37;
if DBGrid1.DataSource.DataSet.RecordCount > 0 then
begin
    if (Column.Field = QryAieenvia) then
    begin
        DBGrid1.Canvas.FillRect(Rect);
        ImageList1.Draw(DBGrid1.Canvas, Rect.Left + vLargura, Rect.Top + 1, 0);
        if QryAieenvia.AsBoolean = True then
        ImageList1.Draw(DBGrid1.Canvas, Rect.Left + vLargura, Rect.Top + 1, 1)
        else
        ImageList1.Draw(DBGrid1.Canvas, Rect.Left + vLargura, Rect.Top + 1, 0);
    end;
    if Column.Field = QryAieemitir then
    begin
        DBGrid1.Canvas.FillRect(Rect);
        ImageList1.Draw(DBGrid1.Canvas, Rect.Left + vLargura, Rect.Top + 1, 0);
        if QryAieemitir.AsBoolean = True then
        ImageList1.Draw(DBGrid1.Canvas, Rect.Left + vLargura, Rect.Top + 1, 1)
        else
        ImageList1.Draw(DBGrid1.Canvas, Rect.Left + vLargura, Rect.Top + 1, 0);
    end;
end;